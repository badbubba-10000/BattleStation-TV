import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:iptvmac/bstv/feature_models.dart';
import 'package:iptvmac/bstv/feature_store.dart';
import 'package:iptvmac/bstv/guide_service.dart';
import 'package:iptvmac/bstv/dvr_service.dart';
import 'package:iptvmac/bstv/recorder.dart';
import 'package:iptvmac/core/subscription_info.dart';
import 'package:iptvmac/core/models.dart';

import '../app/harness.dart';

void main() {
  test('series rules persist, match explicit identifiers and deduplicate schedules', () async {
    final h = await Harness.createPlain(withAccount: true, sync: true);
    final store = FeatureStore(':memory:');
    final dvr = DvrService(store, h.model, 'recordings');
    addTearDown(() {
      dvr.dispose();
      store.close();
      h.model.dispose();
      h.db.close();
    });
    final channel = h.db
        .read(
          (db) => Item.fromRows(
            db.select('SELECT * FROM item WHERE type=?', ['live']),
          ),
        )
        .first;
    final now = DateTime.now().add(const Duration(days: 1));
    GuideProgramme episode(int offset, String series) => GuideProgramme(
      sourceId: 'xmltv',
      channelId: 'news',
      title: 'Programme',
      seriesId: series,
      start: now.add(Duration(hours: offset)),
      end: now.add(Duration(hours: offset + 1)),
    );
    final first = episode(0, 'EP123');
    store.replacePrograms('xmltv', [
      first,
      episode(1, 'EP123'),
      episode(2, 'EP999'),
    ]);
    dvr.addSeriesRule(channel, first);
    dvr.applySeriesRules();
    expect(store.jobs, hasLength(2));
    expect(dvr.seriesRules, hasLength(1));
    expect(() => dvr.filenamePattern = '{password}', throwsFormatException);
    expect(() => dvr.minimumFreeBytes = 1, throwsFormatException);
    dvr.filenamePattern = '{channel}-{title}-{date}';
    expect(store.setting('filenamePattern'), '{channel}-{title}-{date}');
    dvr.removeSeriesRule(dvr.seriesRules.single['id']);
    expect(dvr.seriesRules, isEmpty);
    expect(
      store.jobs.every((j) => j.state == RecordingState.cancelled),
      isTrue,
    );
  });
  test('XMLTV conditional 304 preserves cache; failed update never replaces it', () async {
    final h = await Harness.createPlain(withAccount: true);
    h.model.accounts.single.kind = AccountKind
        .m3u; // This test isolates custom-feed caching, not provider discovery.
    final store = FeatureStore(':memory:');
    final secrets = MemoryGuideSecrets();
    var requests = 0, invalid = false;
    final now = DateTime.now().toUtc();
    String stamp(DateTime d) =>
        '${d.year}${d.month.toString().padLeft(2, '0')}${d.day.toString().padLeft(2, '0')}${d.hour.toString().padLeft(2, '0')}${d.minute.toString().padLeft(2, '0')}00 +0000';
    final client = MockClient((request) async {
      requests++;
      if (invalid) return http.Response('<html>Not a guide</html>', 200);
      if (requests == 2) {
        expect(request.headers['If-None-Match'], 'version-1');
        return http.Response('', 304);
      }
      return http.Response(
        '<tv><channel id="n24"><display-name>News</display-name></channel><programme channel="n24" start="${stamp(now)}" stop="${stamp(now.add(const Duration(hours: 1)))}"><title>Real fixture</title></programme></tv>',
        200,
        headers: {'etag': 'version-1'},
      );
    });
    final guide = GuideService(store, h.model, secrets, client: client);
    addTearDown(() {
      guide.dispose();
      store.close();
      h.model.dispose();
      h.db.close();
    });
    await guide.addXmltv('Fixture', 'https://guide.invalid/data?token=secret');
    final source = guide.sources.single;
    expect(guide.errors, isEmpty);
    expect(store.channels(), hasLength(1));
    expect(jsonEncode(source.toJson()), isNot(contains('token')));
    expect(await secrets.read(source.id), contains('token=secret'));
    await guide.refresh(source.id);
    expect(store.channels(), hasLength(1));
    invalid = true;
    await guide.refresh(source.id);
    expect(guide.errors[source.id], isNotNull);
    expect(
      store.window(
        source.id,
        'n24',
        now.subtract(const Duration(days: 1)),
        now.add(const Duration(days: 1)),
      ),
      hasLength(1),
    );
    await guide.refreshDue(); // TTL prevents repeated downloading after a successful refresh.
    expect(requests, 3);
  });
  test('persistent scheduler detects simultaneous conflicts, not merely overlapping jobs', () async {
    final h = await Harness.createPlain(withAccount: true);
    h.model.prefs.subscriptions = {
      h.model.account!.id!: const SubscriptionInfo(maxConnections: 2),
    };
    final store = FeatureStore(':memory:');
    final dvr = DvrService(store, h.model, 'recordings');
    addTearDown(() {
      dvr.dispose();
      store.close();
      h.model.dispose();
      h.db.close();
    });
    final base = DateTime.now().add(const Duration(days: 1));
    RecordingJob job(String id, int start, int end) => RecordingJob(
      id: id,
      accountId: h.model.account!.id!,
      channelKey: 'hashed',
      channelName: 'News',
      title: id,
      directory: 'recordings',
      start: base.add(Duration(minutes: start)),
      end: base.add(Duration(minutes: end)),
    );
    dvr.schedule(job('a', 0, 30));
    dvr.schedule(job('b', 30, 60));
    dvr.schedule(
      job('c', 0, 60),
    ); // a and b are sequential; only two simultaneous.
    expect(
      () => dvr.schedule(job('conflict', 15, 45)),
      throwsA(isA<RecordingFailure>()),
    );
    expect(store.jobs, hasLength(3));
    dvr.cancel(store.jobs.where((j) => j.id == 'c').single);
    dvr.schedule(job('replacement', 15, 45));
    expect(dvr.acquirePlayback(h.model.account!.id!), isTrue);
    expect(dvr.acquirePlayback(h.model.account!.id!), isTrue);
    expect(dvr.acquirePlayback(h.model.account!.id!), isFalse);
    dvr.releasePlayback(h.model.account!.id!);
    expect(dvr.acquirePlayback(h.model.account!.id!), isTrue);
  });
  test('startup reports interrupted and missed jobs, preserving partial file paths', () async {
    final h = await Harness.createPlain(withAccount: true);
    final store = FeatureStore(':memory:');
    final dvr = DvrService(store, h.model, 'recordings');
    addTearDown(() {
      dvr.dispose();
      store.close();
      h.model.dispose();
      h.db.close();
    });
    final now = DateTime.now();
    store.saveJob(
      RecordingJob(
        id: 'interrupted',
        accountId: 1,
        channelKey: 'hashed',
        channelName: 'News',
        title: 'News',
        directory: 'recordings',
        start: now.subtract(const Duration(hours: 1)),
        end: now,
        state: RecordingState.recording,
        path: 'original.ts.part',
        bytes: 1504,
      ),
    );
    store.saveJob(
      RecordingJob(
        id: 'missed',
        accountId: 1,
        channelKey: 'hashed',
        channelName: 'News',
        title: 'News',
        directory: 'recordings',
        start: now.subtract(const Duration(hours: 2)),
        end: now.subtract(const Duration(hours: 1)),
      ),
    );
    dvr.start();
    await dvr.tick();
    expect(
      store.jobs.where((j) => j.id == 'interrupted').single.state,
      RecordingState.failed,
    );
    expect(
      store.jobs.where((j) => j.id == 'interrupted').single.path,
      'original.ts.part',
    );
    expect(
      store.jobs.where((j) => j.id == 'missed').single.state,
      RecordingState.missed,
    );
  });
}
