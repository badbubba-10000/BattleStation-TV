import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:iptvmac/bstv/feature_models.dart';
import 'package:iptvmac/bstv/feature_store.dart';
import 'package:iptvmac/bstv/guide_service.dart';
import 'package:iptvmac/core/models.dart';

import '../app/harness.dart';

void main() {
  String stamp(DateTime time) => time
      .toUtc()
      .toIso8601String()
      .split('.')
      .first
      .replaceAll(RegExp('[-T:]'), '');
  test('discovers provider XMLTV gzip and matches tvg-id without manual mapping', () async {
    final h = await Harness.createPlain(withAccount: true, sync: true);
    final store = FeatureStore(':memory:');
    final calls = <Uri>[];
    final now = DateTime.now().toUtc();
    final guide = GuideService(
      store,
      h.model,
      MemoryGuideSecrets(),
      client: MockClient((request) async {
        calls.add(request.url);
        expect(request.url.path, '/xmltv.php');
        expect(request.url.queryParameters['username'], 'u');
        return http.Response.bytes(
          gzip.encode(
            utf8.encode(
              '<tv><channel id="n24"><display-name>News</display-name></channel><programme channel="n24" start="${stamp(now.subtract(const Duration(minutes: 5)))}" stop="${stamp(now.add(const Duration(hours: 1)))}"><title>Provider bulletin</title></programme></tv>',
            ),
          ),
          200,
        );
      }),
    );
    addTearDown(() {
      guide.dispose();
      store.close();
      h.model.dispose();
      h.db.close();
    });
    final channel = h.db
        .read(
          (db) => Item.fromRows(
            db.select('SELECT * FROM item WHERE epgChannelId=?', ['n24']),
          ),
        )
        .single;
    await guide.ensureChannel(channel);
    expect(calls, hasLength(1));
    expect(
      guide
          .programmes(channel, now, now.add(const Duration(hours: 2)))
          .single
          .title,
      'Provider bulletin',
    );
    expect(store.manualMapping(channelKey(channel)), isFalse);
    expect(
      guide.stats('provider-xmltv-${channel.accountId}')['importedProgrammes'],
      1,
    );
  });
  test(
    'short API fallback accepts end_timestamp and sync-deferred channels retry',
    () async {
      final h = await Harness.createPlain(withAccount: true, sync: true);
      final store = FeatureStore(':memory:');
      final calls = <String>[];
      final now = DateTime.now().toUtc();
      final guide = GuideService(
        store,
        h.model,
        MemoryGuideSecrets(),
        client: MockClient((request) async {
          calls.add(
            request.url.path.endsWith('xmltv.php')
                ? 'xmltv'
                : request.url.queryParameters['action'] ?? '',
          );
          if (request.url.path.endsWith('xmltv.php')) {
            return http.Response('', 404);
          }
          if (request.url.queryParameters['action'] == 'get_simple_data_table') {
            return http.Response('', 404);
          }
          return http.Response(
            jsonEncode({
              'epg_listings': [
                {
                  'title': 'Short provider programme',
                  'start_timestamp': now.millisecondsSinceEpoch ~/ 1000,
                  'end_timestamp':
                      now
                          .add(const Duration(hours: 1))
                          .millisecondsSinceEpoch ~/
                      1000,
                },
              ],
            }),
            200,
          );
        }),
      );
      addTearDown(() {
        guide.dispose();
        store.close();
        h.model.dispose();
        h.db.close();
      });
      final channel = h.db
          .read(
            (db) => Item.fromRows(
              db.select('SELECT * FROM item WHERE epgChannelId=?', ['n24']),
            ),
          )
          .single;
      guide.start();
      h.model.syncing = true;
      await guide.ensureChannel(channel);
      expect(calls, isEmpty);
      h.model.syncing = false;
      h.model.setTab(ItemType.movie);
      for (
        var i = 0;
        i < 200 && store.programmeCount('xtream-${channel.accountId}') == 0;
        i++
      ) {
        await Future<void>.delayed(const Duration(milliseconds: 5));
      }
      expect(
        guide
            .programmes(channel, now, now.add(const Duration(hours: 2)))
            .single
            .title,
        'Short provider programme',
      );
      expect(calls, ['xmltv', 'get_simple_data_table', 'get_short_epg']);
    },
  );
  test('manual mappings override XMLTV; automatic API fallback does not lock them out', () async {
    final h = await Harness.createPlain(withAccount: true, sync: true);
    final store = FeatureStore(':memory:');
    final guide = GuideService(store, h.model, MemoryGuideSecrets());
    addTearDown(() {
      guide.dispose();
      store.close();
      h.model.dispose();
      h.db.close();
    });
    final channel = h.db
        .read(
          (db) => Item.fromRows(
            db.select('SELECT * FROM item WHERE epgChannelId=?', ['n24']),
          ),
        )
        .single;
    store.saveSource(
      const GuideSource(id: 'xml', name: 'XML', kind: GuideSourceKind.xmltv),
    );
    store.saveSource(
      GuideSource(
        id: 'xtream-${channel.accountId}',
        name: 'API',
        kind: GuideSourceKind.xtream,
        accountId: channel.accountId,
      ),
    );
    const xmlChannel = GuideChannel(sourceId: 'xml', id: 'n24', name: 'News');
    final apiChannel = GuideChannel(
      sourceId: 'xtream-${channel.accountId}',
      id: channelKey(channel),
      name: channel.name,
    );
    store.putChannel(xmlChannel);
    store.putChannel(apiChannel);
    store.mapChannel(channelKey(channel), apiChannel, manual: false);
    expect(guide.mapping(channel)?.sourceId, 'xml');
    guide.map(channel, apiChannel);
    expect(guide.mapping(channel)?.sourceId, apiChannel.sourceId);
    guide.map(channel, null);
    expect(guide.mapping(channel)?.sourceId, 'xml');
  });
}
