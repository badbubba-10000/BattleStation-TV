import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
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

// Invented fixtures only. No real provider addresses or account data.
XtreamURLs fixtureUrls() => XtreamURLs.parse(
  server: 'https://provider.test:8443/panel',
  username: 'fixture+user',
  password: ' fixture&secret+ ',
)!;

void main() {
  test('authentication is a single standard authenticated GET with honest app headers', () async {
    var calls = 0;
    final client = XtreamClient(
      fixtureUrls(),
      client: MockClient((request) async {
        calls++;
        expect(request.method, 'GET');
        expect(request.url.path, '/panel/player_api.php');
        expect(request.url.port, 8443);
        expect(request.url.queryParameters, {
          'username': 'fixture+user',
          'password': ' fixture&secret+ ',
        });
        expect(request.headers['Accept'], 'application/json');
        expect(request.headers['User-Agent'], 'BattleStationTV');
        expect(request.headers.containsKey('Authorization'), isFalse);
        return http.Response(
          '{"user_info":{"auth":"1","status":"Active"}}',
          200,
        );
      }),
    );
    await client.authenticate();
    expect(calls, 1);
  });

  for (final status in [511, 512, 503]) {
    test(
      'authentication HTTP $status is stage-specific, bounded and sanitized',
      () async {
        var calls = 0;
        final client = XtreamClient(
          fixtureUrls(),
          client: MockClient((_) async {
            calls++;
            return http.Response('Do not retain this response body', status);
          }),
        );
        try {
          await client.authenticate();
          fail('Expected a transport failure');
        } on XtreamRequestFailure catch (error) {
          expect(error.stage, XtreamStage.authentication);
          expect(error.statusCode, status);
          expect(error.authenticationConfirmed, isFalse);
          final text = describeError(error);
          expect(text, contains('HTTP $status'));
          for (final secret in [
            'provider.test',
            'fixture',
            'password=',
            'response body',
          ]) {
            expect(text, isNot(contains(secret)));
          }
          expect(text, isNot(contains('Authentication succeeded')));
        }
        expect(calls, 1, reason: 'No blind retry or secondary catalogue calls');
      },
    );
  }

  test(
    'HTTP 200 does not imply authorization; inactive statuses are rejected',
    () async {
      final c = MockClient(
        (_) async => http.Response('{"user_info":{"auth":0}}', 200),
      );
      await expectLater(
        XtreamClient(fixtureUrls(), client: c).authenticate(),
        throwsA(IPTVError.badCredentials),
      );
      final inactive = MockClient(
        (_) async => http.Response(
          '{"user_info":{"auth":1,"status":" Inactive "}}',
          200,
        ),
      );
      await expectLater(
        XtreamClient(fixtureUrls(), client: inactive).authenticate(),
        throwsA(IPTVError.accountInactive),
      );
    },
  );

  test(
    'JSON with UTF8 BOM is accepted; HTML is an invalid API response',
    () async {
      final bom = MockClient(
        (_) async => http.Response.bytes(
          utf8.encode('\uFEFF{"user_info":{"auth":true}}'),
          200,
        ),
      );
      await XtreamClient(fixtureUrls(), client: bom).authenticate();
      final html = MockClient(
        (_) async => http.Response('<html>login</html>', 200),
      );
      await expectLater(
        XtreamClient(fixtureUrls(), client: html).authenticate(),
        throwsA(IPTVError.badResponse),
      );
    },
  );

  test(
    'authentication timeout is classified without exposing request data',
    () async {
      final c = MockClient((_) async {
        await Future<void>.delayed(const Duration(milliseconds: 50));
        return http.Response('{}', 200);
      });
      await expectLater(
        XtreamClient(
          fixtureUrls(),
          client: c,
          authenticationTimeout: const Duration(milliseconds: 5),
        ).authenticate(),
        throwsA(
          isA<XtreamRequestFailure>().having(
            (e) => e.kind,
            'kind',
            XtreamFailureKind.timeout,
          ),
        ),
      );
    },
  );

  test(
    'pasted API links preserve base path, IPv6, port and credential bytes',
    () {
      final draft = SourceDraft()
        ..applyPasted(
          'https://[2001:db8::1]:8443/prefix/player_api.php?username=u%2Bv&password=%20p%2B%26%20',
        );
      expect(draft.server, 'https://[2001:db8::1]:8443/prefix');
      final account = draft.makeAccount();
      final url = XtreamURLs.parse(
        server: account.account.server!,
        username: account.account.username!,
        password: account.password!,
      )!.api(null);
      expect(url.path, '/prefix/player_api.php');
      expect(url.queryParameters['password'], ' p+& ');
      expect(url.queryParameters['username'], 'u+v');
      expect(
        XtreamURLs.parse(
          server: 'ftp://provider.test',
          username: 'u',
          password: 'p',
        ),
        isNull,
      );
    },
  );

  test('catalogue API calls are sequential and stay authenticated', () async {
    final db = AppDatabase.memory();
    addTearDown(db.close);
    final account = db.write(
      (d) => Account(
        name: 'Fixture',
        kind: AccountKind.xtream,
        server: 'https://provider.test/prefix',
        username: 'u',
      ).insert(d),
    );
    var active = 0, peak = 0;
    final actions = <String?>[];
    final c = MockClient((request) async {
      active++;
      if (active > peak) peak = active;
      try {
        await Future<void>.delayed(const Duration(milliseconds: 2));
        expect(request.url.queryParameters['password'], ' p ');
        final action = request.url.queryParameters['action'];
        actions.add(action);
        return http.Response(
          action == null
              ? '{"user_info":{"auth":1}}'
              : action == 'get_live_streams'
              ? '[{"stream_id":1,"name":"Fixture channel"}]'
              : '[]',
          200,
        );
      } finally {
        active--;
      }
    });
    await SyncService(db, client: c).sync(account, password: ' p ');
    expect(peak, 1);
    expect(actions, [
      null,
      'get_live_categories',
      'get_live_streams',
      'get_vod_categories',
      'get_vod_streams',
      'get_series_categories',
      'get_series',
    ]);
    expect(db.read(Item.all), hasLength(1));
  });

  test('secondary HTTP512 identifies the exact catalogue stage and preserves saved data', () async {
    final db = AppDatabase.memory();
    addTearDown(db.close);
    final account = db.write(
      (d) => Account(
        name: 'Fixture',
        kind: AccountKind.xtream,
        server: 'https://provider.test',
        username: 'u',
      ).insert(d),
    );
    db.write(
      (d) => Item(
        accountId: account.id!,
        type: ItemType.live,
        name: 'Saved fixture',
        streamId: 'saved',
      ).insert(d),
    );
    final c = MockClient((request) async {
      final action = request.url.queryParameters['action'];
      return http.Response(
        action == null ? '{"user_info":{"auth":1}}' : '[]',
        action == 'get_vod_streams' ? 512 : 200,
      );
    });
    await expectLater(
      SyncService(db, client: c).sync(account, password: 'p'),
      throwsA(
        isA<XtreamRequestFailure>()
            .having((e) => e.stage, 'stage', XtreamStage.movies)
            .having(
              (e) => e.description,
              'message',
              contains('Authentication succeeded'),
            ),
      ),
    );
    expect(db.read(Item.all).single.name, 'Saved fixture');
  });

  test(
    'untrusted transport errors never expose arbitrary payloads or addresses',
    () async {
      const secret = 'SYNTHETIC_SECRET';
      final c = MockClient(
        (_) async => throw http.ClientException(
          'password=$secret Authorization: $secret http://provider.test/secret',
        ),
      );
      try {
        await XtreamClient(fixtureUrls(), client: c).authenticate();
      } on XtreamRequestFailure catch (e) {
        expect(describeError(e), isNot(contains(secret)));
        expect(e.kind, XtreamFailureKind.network);
      }
      expect(
        describeError(Exception('password=$secret')),
        isNot(contains(secret)),
      );
    },
  );
}
