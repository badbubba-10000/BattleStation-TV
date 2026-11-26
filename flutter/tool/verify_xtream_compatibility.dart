import 'dart:io';
// Socket-free smoke verification for restricted development environments.
// Does not connect to any provider or replace the Flutter regression suite.
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:iptvmac/app/source_draft.dart';
import 'package:iptvmac/app/sync_worker.dart';
import 'package:iptvmac/core/app_database.dart';
import 'package:iptvmac/core/errors.dart';
import 'package:iptvmac/core/models.dart';
import 'package:iptvmac/core/sync_service.dart';
import 'package:iptvmac/core/xtream_client.dart';
import 'package:iptvmac/core/xtream_urls.dart';

void check(bool condition, String safeLabel) {
  if (!condition) throw StateError('Verification failed: $safeLabel');
}

Future<void> main() async {
  var checks = 0;
  final draft = SourceDraft()
    ..applyPasted(
      'https://[2001:db8::1]:8443/panel/get.php?username=u%2Bv&password=%20p%2B%26%20',
    );
  final urls = XtreamURLs.parse(
    server: draft.server,
    username: draft.username,
    password: draft.password,
  )!;
  check(urls.api(null).path == '/panel/player_api.php', 'base path');
  check(
    urls.api(null).queryParameters['password'] == ' p+& ',
    'opaque password',
  );
  check(
    urls.api(null).queryParameters['username'] == 'u+v',
    'encoded username',
  );
  checks += 3;

  for (final code in [511, 512, 503]) {
    var calls = 0;
    final c = MockClient((_) async {
      calls++;
      return http.Response('not retained', code);
    });
    try {
      await XtreamClient(urls, client: c).authenticate();
      throw StateError('Expected HTTP failure');
    } on XtreamRequestFailure catch (e) {
      check(
        e.stage == XtreamStage.authentication && e.statusCode == code,
        'HTTP stage/code',
      );
      check(
        !e.description.contains(draft.password) &&
            !e.description.contains('2001:db8'),
        'safe error',
      );
      check(calls == 1, 'bounded HTTP failure');
      checks += 3;
    }
  }

  final unauthorized = MockClient(
    (_) async => http.Response('{"user_info":{"auth":0}}', 200),
  );
  try {
    await XtreamClient(urls, client: unauthorized).authenticate();
    throw StateError('Expected denied JSON');
  } on IPTVError catch (e) {
    check(e == IPTVError.badCredentials, 'JSON authorization');
    checks++;
  }
  final bom = MockClient(
    (_) async => http.Response.bytes(
      utf8.encode('\uFEFF{"user_info":{"auth":true}}'),
      200,
    ),
  );
  await XtreamClient(urls, client: bom).authenticate();
  checks++;

  final db = AppDatabase.memory();
  try {
    final account = db.write(
      (d) => Account(
        name: 'Fixture',
        kind: AccountKind.xtream,
        server: 'https://provider.test',
        username: 'u',
      ).insert(d),
    );
    var active = 0, peak = 0;
    final c = MockClient((request) async {
      active++;
      if (active > peak) peak = active;
      await Future<void>.delayed(const Duration(milliseconds: 2));
      final action = request.url.queryParameters['action'];
      active--;
      return http.Response(
        action == null
            ? '{"user_info":{"auth":1}}'
            : action == 'get_live_streams'
            ? '[{"stream_id":1,"name":"Fixture"}]'
            : '[]',
        200,
      );
    });
    await SyncService(db, client: c).sync(account, password: 'p');
    check(peak == 1 && db.read(Item.all).length == 1, 'serialized catalog');
    checks++;
    final failing = MockClient((request) async {
      final action = request.url.queryParameters['action'];
      return http.Response(
        action == null ? '{"user_info":{"auth":1}}' : '[]',
        action == 'get_vod_streams' ? 512 : 200,
      );
    });
    try {
      await SyncService(db, client: failing).sync(account, password: 'p');
      throw StateError('Expected secondary failure');
    } on XtreamRequestFailure catch (e) {
      check(
        e.stage == XtreamStage.movies && e.authenticationConfirmed,
        'secondary stage',
      );
      check(db.read(Item.all).length == 1, 'preserved cache');
      checks += 2;
    }
    final m3u = db.write(
      (d) => Account(
        name: 'M3U fixture',
        kind: AccountKind.m3u,
        url: 'https://playlist.test/list.m3u',
      ).insert(d),
    );
    final playlistClient = MockClient(
      (_) async => http.Response(
        '#EXTM3U\n#EXTINF:-1,Fixture\nhttps://media.test/live.ts\n',
        200,
      ),
    );
    await SyncService(db, client: playlistClient).sync(m3u);
    check(db.read(Item.all).length == 2, 'M3U import preserved');
    checks++;
  } finally {
    db.close();
  }
  check(
    !describeError(Exception('SYNTHETIC_SECRET')).contains('SYNTHETIC_SECRET'),
    'untrusted error text',
  );
  checks++;
  stdout.writeln(
    'PASS: $checks socket-free compatibility checks (synthetic data only).',
  );
}
