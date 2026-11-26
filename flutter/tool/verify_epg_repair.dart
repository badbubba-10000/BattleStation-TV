// Socket-free checks of production EPG parsers. No provider or user data.
import 'dart:convert';
import 'dart:io';

import 'package:iptvmac/bstv/xmltv.dart';
import 'package:iptvmac/bstv/xtream_epg.dart';
import 'package:iptvmac/core/xtream_urls.dart';

Future<void> main() async {
  var checks = 0;
  void check(bool passed, String description) {
    if (!passed) throw StateError(description);
    checks++;
  }

  final urls = XtreamURLs.parse(
    server: 'https://fixture.invalid/prefix/player_api.php',
    username: ' user& ',
    password: ' pass+ ',
  )!;
  check(
    urls.xmltv().path == '/prefix/xmltv.php',
    'XMLTV preserves provider base path',
  );
  check(
    urls.xmltv().queryParameters['username'] == ' user& ' &&
        urls.xmltv().queryParameters['password'] == ' pass+ ',
    'XMLTV preserves opaque credentials',
  );
  final start = DateTime.utc(2026, 11, 22, 12);
  var authenticationRejected = false;
  try {
    parseXtreamEpg(
      {
        'user_info': {'auth': 0},
      },
      'source',
      'channel',
    );
  } on StateError {
    authenticationRejected = true;
  }
  check(
    authenticationRejected,
    'Explicit API authentication failure is distinguished from missing programmes',
  );
  for (final endKey in ['stop_timestamp', 'end_timestamp']) {
    final parsed = parseXtreamEpg(
      {
        'epg_listings': [
          {
            'title': 'Plain bulletin',
            'start_timestamp': start.millisecondsSinceEpoch ~/ 1000,
            endKey:
                '${start.add(const Duration(hours: 1)).millisecondsSinceEpoch ~/ 1000}',
          },
        ],
      },
      'source',
      'channel',
    );
    check(
      parsed.programmes.single.title == 'Plain bulletin' &&
          parsed.programmes.single.start == start,
      'Supports $endKey and plain text',
    );
  }
  final milliseconds = parseXtreamEpg(
    {
      'epg_listings': [
        {
          'title': base64.encode(utf8.encode('Encoded bulletin')),
          'description': base64.encode(utf8.encode('Description')),
          'start_timestamp': start.millisecondsSinceEpoch,
          'end_timestamp': start
              .add(const Duration(hours: 1))
              .millisecondsSinceEpoch,
        },
      ],
    },
    'source',
    'channel',
  );
  check(
    milliseconds.programmes.single.description == 'Description' &&
        milliseconds.programmes.single.start == start,
    'Milliseconds and base64 metadata',
  );
  check(
    xmltvTime('20261122120000') == start,
    'XMLTV omitted timezone means UTC',
  );
  check(
    xmltvTime('202611221200 Z') == start,
    'XMLTV UTC suffix and minute precision',
  );
  check(xmltvTime('20261122170000 +05:00') == start, 'Explicit colon offset');
  check(
    xmltvTime('20261101013000 -0500')
            .difference(xmltvTime('20261101013000 -0600')) ==
        const Duration(hours: -1),
    'DST fall-back offsets stay distinct',
  );
  const xml =
      '<tv><channel id="news"><display-name>News HD</display-name></channel><programme channel="news" start="20261122120000" stop="20261122130000"><title>News &amp; weather</title></programme></tv>';
  final chunks = Stream.fromIterable(utf8.encode(xml).map((b) => [b]));
  final guide = await parseXmltv(chunks, 'fixture');
  check(
    guide.programmes.single.title == 'News & weather',
    'Chunk boundary entity decoding',
  );
  final zipped = gzip.encode(utf8.encode(xml));
  final compressed = await parseXmltv(
    Stream.value(zipped).transform(gzip.decoder),
    'fixture',
  );
  check(
    compressed.programmes.single.start == start,
    'Gzip stream and timezone-default parsing',
  );
  const optionalStop =
      '<tv><programme channel="news" start="20261122130000" stop="20261122140000"><title>Later</title></programme><programme channel="news" start="20261122120000"><title>Earlier</title></programme></tv>';
  final inferred = await parseXmltv(
    Stream.value(utf8.encode(optionalStop)),
    'fixture',
  );
  check(
    inferred.programmes.length == 2 &&
        inferred.programmes.firstWhere((p) => p.title == 'Earlier').end ==
            start.add(const Duration(hours: 1)),
    'Optional stop inferred from next programme despite unsorted feed',
  );
  check(
    matchGuideChannel(guide.channels, tvgId: 'news', name: 'Other')?.id ==
        'news',
    'Exact EPG ID mapping',
  );
  check(
    matchGuideChannel(guide.channels, name: 'News SD') == null,
    'HD and SD are not conflated',
  );
  final large =
      '<tv>${List.generate(5000, (n) => '<channel id="c$n"><display-name>Channel $n</display-name></channel>').join()}</tv>';
  check(
    (await parseXmltv(
          Stream.value(utf8.encode(large)),
          'large',
        )).channels.length ==
        5000,
    'Large synthetic channel import',
  );
  stdout.writeln(
    'PASS: $checks socket-free production EPG checks; no real account used',
  );
}
