import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/bstv/feature_models.dart';
import 'package:iptvmac/bstv/feature_store.dart';
import 'package:iptvmac/bstv/xmltv.dart';
import 'package:sqlite3/sqlite3.dart';

void main() {
  test('v1 migration keeps manual mappings and makes provider fallback replaceable', () async {
    final directory = await Directory.systemTemp.createTemp(
      'bstv-mapping-migration-',
    );
    final path = '${directory.path}/features.sqlite';
    final old = sqlite3.open(path);
    old.execute(
      'CREATE TABLE mappings (channel_key TEXT PRIMARY KEY, source TEXT NOT NULL, guide_channel TEXT NOT NULL); PRAGMA user_version=1;',
    );
    old.execute('INSERT INTO mappings VALUES (?,?,?)', [
      'manual-key',
      'custom-source',
      'guide-id',
    ]);
    old.execute('INSERT INTO mappings VALUES (?,?,?)', [
      'auto-key',
      'xtream-1',
      'auto-key',
    ]);
    old.close();
    final store = FeatureStore(path);
    try {
      expect(store.manualMapping('manual-key'), isTrue);
      expect(store.manualMapping('auto-key'), isFalse);
      store.clearAutomaticMappings();
      expect(store.mapping('manual-key'), ('custom-source', 'guide-id'));
      expect(store.mapping('auto-key'), isNull);
    } finally {
      store.close();
      await directory.delete(recursive: true);
    }
  });
  const xml = '''<?xml version="1.0"?><tv>
<channel id="news"><display-name>News HD</display-name></channel>
<programme channel="news" start="20261101013000 -0500" stop="20261101013000 -0600"><title>News &amp; Weather</title><desc>Forecast</desc><category>News</category><episode-num>1.2.</episode-num></programme>
<programme channel="news" start="invalid" stop="20261101080000 +0000"><title>Bad</title></programme>
</tv>''';
  Future<ParsedGuide> parse(String value, {int limit = 100000}) => parseXmltv(
    Stream.fromIterable(utf8.encode(value).map((b) => [b])),
    'source',
    maxBytes: limit,
  );
  test(
    'streaming XMLTV preserves DST offsets, descriptions and metadata',
    () async {
      final result = await parse(xml);
      expect(result.channels.single.name, 'News HD');
      expect(result.programmes.single.title, 'News & Weather');
      expect(result.programmes.single.description, 'Forecast');
      expect(
        result.programmes.single.end.difference(result.programmes.single.start),
        const Duration(hours: 1),
      );
      expect(result.programmes.single.episode, '1.2.');
      expect(result.skipped, 1);
    },
  );
  test('series identifiers require explicit episode metadata', () async {
    final result = await parse(
      xml.replaceFirst(
        '<episode-num>1.2.</episode-num>',
        '<episode-num system="dd_progid">EP00123456.0001</episode-num>',
      ),
    );
    expect(result.programmes.single.seriesId, 'EP00123456');
    expect((await parse(xml)).programmes.single.seriesId, isNull);
  });
  test(
    'rejects malformed XML, oversized imports and ambiguous timestamps',
    () async {
      await expectLater(
        parse('<tv><channel id="x"></tv>'),
        throwsA(isA<Exception>()),
      );
      await expectLater(parse(xml, limit: 32), throwsFormatException);
      expect(xmltvTime('20261101013000'), DateTime.utc(2026, 11, 1, 1, 30));
      expect(() => xmltvTime('20260230013000 +0000'), throwsFormatException);
    },
  );
  test('duplicate programmes collapse; HD/SD and ambiguous sources stay separate', () async {
    final result = await parse(
      xml.replaceFirst(
        '</tv>',
        '${xml.substring(xml.indexOf('<programme'), xml.indexOf('<programme channel="news" start="invalid"'))}</tv>',
      ),
    );
    expect(result.programmes, hasLength(1));
    const channels = [
      GuideChannel(sourceId: 'a', id: '1', name: 'News HD'),
      GuideChannel(sourceId: 'b', id: '2', name: 'News SD'),
    ];
    expect(matchGuideChannel(channels, name: 'News'), isNull);
    expect(matchGuideChannel(channels, name: 'News-HD')?.id, '1');
    expect(
      matchGuideChannel(
        [
          ...channels,
          const GuideChannel(sourceId: 'c', id: '1', name: 'News HD'),
        ],
        tvgId: '1',
        name: 'News HD',
      ),
      isNull,
    );
  });
  test(
    'file-backed isolated import, window queries and mappings survive reopen',
    () async {
      final directory = await Directory.systemTemp.createTemp(
        'bstv-store-test-',
      );
      final path = '${directory.path}/guide.sqlite';
      var store = FeatureStore(path);
      try {
        final parsed = await parse(xml);
        await store.importGuide('source', parsed);
        store.setSetting('interval', 30);
        store.mapChannel('hashed-key', parsed.channels.single);
        store.close();
        store = FeatureStore(path);
        expect(store.setting('interval'), 30);
        expect(store.mapping('hashed-key'), ('source', 'news'));
        expect(
          store.window(
            'source',
            'news',
            DateTime.utc(2026, 11),
            DateTime.utc(2026, 11, 2),
          ),
          hasLength(1),
        );
        expect(
          store.window(
            'source',
            'news',
            DateTime.utc(2026, 11),
            DateTime.utc(2026, 11, 2),
            search: 'forecast',
          ),
          hasLength(1),
        );
        store.clearMappings();
        expect(store.mapping('hashed-key'), isNull);
        expect(store.channels(), hasLength(1));
      } finally {
        store.close();
        await directory.delete(recursive: true);
      }
    },
  );
  test('jobs persist without credential-bearing stream URLs; reminders deliver once', () async {
    final store = FeatureStore(':memory:');
    addTearDown(store.close);
    final now = DateTime.utc(2026, 11, 22, 12);
    final job = RecordingJob(
      id: 'job',
      accountId: 1,
      channelKey: stableKey('private stream URL'),
      channelName: 'News',
      title: 'Bulletin',
      directory: 'recordings',
      start: now,
      end: now.add(const Duration(hours: 1)),
    );
    store.saveJob(job);
    expect(
      jsonEncode(store.jobs.single.toJson()),
      isNot(contains('private stream URL')),
    );
    expect(store.jobs.single.captureEnd, now.add(const Duration(hours: 1)));
    final programme = GuideProgramme(
      sourceId: 'source',
      channelId: 'news',
      title: 'News',
      start: now,
      end: now.add(const Duration(hours: 1)),
    );
    store.addReminder(programme);
    expect(store.dueReminders(now), hasLength(1));
    expect(store.dueReminders(now), isEmpty);
  });
}
