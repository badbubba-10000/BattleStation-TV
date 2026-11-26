import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:iptvmac/core/release_update.dart';
import 'package:iptvmac/app/update_manager.dart';

final bytes = utf8.encode('synthetic update package only');
Map<String, dynamic> fixture({
  UpdateIdentity identity = UpdateIdentity.bstv,
  String version = '2.5.0',
  int build = 8,
  bool beta = false,
  bool checksum = true,
  String platform = 'windows',
}) {
  final name =
      '${identity.prefix}-$version-Build-$build${platform == 'windows' ? '-Setup.exe' : '.apk'}';
  Map<String, dynamic> asset(String file, int size) => {
    'name': file,
    'size': size,
    'browser_download_url':
        'https://github.com/${identity.repo}/releases/download/v$version/$file',
  };
  return {
    'tag_name': 'v$version',
    'name': 'Automatic Update System',
    'body': 'Plain release notes. No executable commands are interpreted.',
    'published_at': '2026-11-25T12:00:00Z',
    'html_url': 'https://github.com/${identity.repo}/releases/tag/v$version',
    'draft': false,
    'prerelease': beta,
    'assets': [
      asset(name, bytes.length),
      if (checksum) asset('$name.sha256', 130),
    ],
  };
}

class FakeInstallHost extends UpdateInstallHost {
  FakeInstallHost(this.directory);
  final Directory directory;
  int installs = 0, validations = 0;
  bool reject = false;
  @override
  Future<Directory> folder() async => directory;
  @override
  Future<void> validate(File file, AppRelease release) async {
    validations++;
    if (reject) throw const UpdateFailure('Wrong package identity.');
  }

  @override
  Future<void> install(
    File file,
    AppRelease release, {
    required bool restart,
  }) async {
    installs++;
  }
}

void main() {
  test('independent permanent repositories and app identities', () {
    expect(
      UpdateIdentity.bstv.endpoint(false).toString(),
      'https://api.github.com/repos/badbubba-10000/BattleStation-TV/releases/latest',
    );
    expect(
      UpdateIdentity.getEtv.endpoint(false).toString(),
      'https://api.github.com/repos/badbubba-10000/GET-ETV-Releases/releases/latest',
    );
    expect(
      UpdateIdentity.bstv.packageId,
      isNot(UpdateIdentity.getEtv.packageId),
    );
  });
  for (final pair in [
    ('2.5.0+8', '2.4.0+7', 1),
    ('2.5.0+9', '2.5.0+8', 1),
    ('2.5.0+8', '2.5.0+8', 0),
    ('2.5.0-beta.10+8', '2.5.0-beta.2+7', 1),
    ('2.5.0-beta.1+9', '2.5.0+8', -1),
    ('2.4.0+99', '2.5.0+1', -1),
  ]) {
    test(
      'version comparison ${pair.$1} / ${pair.$2}',
      () => expect(
        UpdateVersion.parse(pair.$1)
            .compareTo(UpdateVersion.parse(pair.$2))
            .sign,
        pair.$3,
      ),
    );
  }
  for (final identity in [UpdateIdentity.bstv, UpdateIdentity.getEtv]) {
    for (final platform in ['windows', 'android']) {
      test(
        '${identity.prefix} selects $platform metadata and requires checksum',
        () {
          final data = fixture(identity: identity, platform: platform);
          final release = AppRelease.fromJson(data, identity, platform)!;
          expect(release.version.key, '2.5.0+8');
          expect(release.package.url.host, 'github.com');
          expect(
            () => AppRelease.fromJson(
              fixture(identity: identity, checksum: false, platform: platform),
              identity,
              platform,
            ),
            throwsA(isA<UpdateFailure>()),
          );
          final other = identity == UpdateIdentity.bstv
              ? UpdateIdentity.getEtv
              : UpdateIdentity.bstv;
          expect(
            () => AppRelease.fromJson(data, other, platform),
            throwsA(isA<UpdateFailure>()),
          );
          expect(
            () => AppRelease.fromJson(
              data,
              identity,
              platform == 'windows' ? 'android' : 'windows',
            ),
            throwsA(isA<UpdateFailure>()),
          );
        },
      );
    }
  }
  test('untrusted URLs, tag mismatch, ambiguous assets and malformed metadata fail closed', () {
    for (final url in [
      'http://github.com/badbubba-10000/BattleStation-TV/releases/download/v2.5.0/x',
      'https://evil.invalid/pkg.exe',
      'https://github.com/badbubba-10000/GET-ETV-Releases/releases/download/v2.5.0/x',
    ]) {
      final data = fixture();
      (data['assets'] as List).first['browser_download_url'] = url;
      expect(
        () => AppRelease.fromJson(data, UpdateIdentity.bstv, 'windows'),
        throwsA(isA<UpdateFailure>()),
      );
    }
    final wrongTag = fixture();
    (wrongTag['assets'] as List).first['browser_download_url'] =
        ((wrongTag['assets'] as List).first['browser_download_url'] as String)
            .replaceAll('/v2.5.0/', '/v1.0.0/');
    expect(
      () => AppRelease.fromJson(wrongTag, UpdateIdentity.bstv, 'windows'),
      throwsA(isA<UpdateFailure>()),
    );
    final duplicate = fixture();
    (duplicate['assets'] as List).add((duplicate['assets'] as List).first);
    expect(
      () => AppRelease.fromJson(duplicate, UpdateIdentity.bstv, 'windows'),
      throwsA(isA<UpdateFailure>()),
    );
  });
  test(
    'empty repositories, ETags, rate limits, offline and GitHub outages',
    () async {
      var code = 200;
      final requests = <http.Request>[];
      final client = ReleaseClient(
        identity: UpdateIdentity.bstv,
        client: MockClient((r) async {
          requests.add(r);
          return http.Response(
            code == 200 ? jsonEncode(fixture()) : '',
            code,
            headers: {'etag': 'public-etag', 'x-ratelimit-reset': '2000000000'},
          );
        }),
      );
      final first = await client.discover(platform: 'windows');
      expect(first.release, isNotNull);
      code = 304;
      final cached = await client.discover(
        platform: 'windows',
        etag: first.etag,
        cachedJson: first.json,
      );
      expect(cached.release!.version.key, '2.5.0+8');
      expect(requests.last.headers['if-none-match'], 'public-etag');
      expect(
        requests.every((r) => !r.headers.containsKey('Authorization')),
        isTrue,
      );
      code = 404;
      expect((await client.discover(platform: 'windows')).release, isNull);
      for (final value in [403, 429, 500]) {
        code = value;
        await expectLater(
          client.discover(platform: 'windows'),
          throwsA(isA<UpdateFailure>()),
        );
      }
      client.close();
      final offline = ReleaseClient(
        identity: UpdateIdentity.bstv,
        client: MockClient(
          (_) async => throw const SocketException('synthetic offline'),
        ),
      );
      await expectLater(
        offline.discover(platform: 'windows'),
        throwsA(isA<UpdateFailure>()),
      );
      offline.close();
    },
  );
  test(
    'beta discovery filters drafts and compares stable/build releases',
    () async {
      final entries = [
        fixture(version: '2.5.0', build: 8),
        fixture(version: '2.6.0', build: 9, beta: true),
        {...fixture(version: '9.0.0'), 'draft': true},
      ];
      final client = ReleaseClient(
        identity: UpdateIdentity.bstv,
        client: MockClient((request) async {
          expect(request.url.path.endsWith('/releases'), isTrue);
          return http.Response(jsonEncode(entries), 200);
        }),
      );
      expect(
        (await client.discover(
          platform: 'windows',
          beta: true,
        )).release!.version.key,
        '2.6.0+9',
      );
      client.close();
    },
  );
  for (final corruption in [
    'none',
    'corrupt',
    'invalid-checksum',
    'unsafe-redirect',
    'truncated',
  ]) {
    test('verified streaming download: $corruption', () async {
      final directory = await Directory.systemTemp.createTemp('update-test-');
      addTearDown(() => directory.delete(recursive: true));
      final release = AppRelease.fromJson(
        fixture(),
        UpdateIdentity.bstv,
        'windows',
      )!;
      final hash = sha256.convert(bytes).toString();
      final client = ReleaseClient(
        identity: UpdateIdentity.bstv,
        client: MockClient((request) async {
          if (corruption == 'unsafe-redirect') {
            return http.Response(
              '',
              302,
              headers: {'location': 'https://evil.invalid/file'},
            );
          }
          if (request.url.path.endsWith('.sha256')) {
            return http.Response(
              corruption == 'invalid-checksum'
                  ? 'not-a-checksum'
                  : '$hash  ${release.package.name}',
              200,
            );
          }
          return http.Response.bytes(
            corruption == 'corrupt'
                ? List.filled(bytes.length, 0)
                : corruption == 'truncated'
                ? bytes.sublist(1)
                : bytes,
            200,
          );
        }),
      );
      if (corruption == 'none') {
        final file = await client.download(
          release,
          directory,
          cancellation: DownloadCancellation(),
        );
        expect(await file.readAsBytes(), bytes);
      } else {
        await expectLater(
          client.download(
            release,
            directory,
            cancellation: DownloadCancellation(),
          ),
          throwsA(isA<UpdateFailure>()),
        );
        expect(await directory.list().toList(), isEmpty);
      }
      client.close();
    });
  }
  test(
    'cancel interrupts a blocked stream and removes partial files',
    () async {
      final directory = await Directory.systemTemp.createTemp('update-cancel-');
      addTearDown(() => directory.delete(recursive: true));
      final release = AppRelease.fromJson(
        fixture(),
        UpdateIdentity.bstv,
        'windows',
      )!;
      final token = DownloadCancellation();
      final stream = StreamController<List<int>>();
      final mock = MockClient.streaming((request, _) async {
        if (request.url.path.endsWith('.sha256')) {
          return http.StreamedResponse(
            Stream.value(utf8.encode('${sha256.convert(bytes)}')),
            200,
          );
        }
        scheduleMicrotask(() => stream.add([1]));
        return http.StreamedResponse(
          stream.stream,
          200,
          contentLength: bytes.length,
        );
      });
      final client = ReleaseClient(identity: UpdateIdentity.bstv, client: mock);
      await expectLater(
        client.download(
          release,
          directory,
          cancellation: token,
          onProgress: (_) => token.cancel(),
        ),
        throwsA(isA<UpdateCancelled>()),
      );
      expect(await directory.list().toList(), isEmpty);
      await stream.close();
      client.close();
    },
  );
  test('manager persists preferences, separates remind/skip, retries and requires install approval', () async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    var calls = 0;
    var build = 8;
    final directory = await Directory.systemTemp.createTemp('update-manager-');
    addTearDown(() => directory.delete(recursive: true));
    final host = FakeInstallHost(directory);
    var now = DateTime.utc(2026, 11, 25);
    final client = ReleaseClient(
      identity: UpdateIdentity.bstv,
      client: MockClient((request) async {
        calls++;
        final data = fixture(build: build);
        final name = (data['assets'] as List).first['name'];
        if (request.url.host == 'api.github.com') {
          return http.Response(jsonEncode(data), 200);
        }
        if (request.url.path.endsWith('.sha256')) {
          return http.Response('${sha256.convert(bytes)}  $name', 200);
        }
        return http.Response.bytes(bytes, 200);
      }),
    );
    final m = UpdateManager(
      storage: prefs,
      client: client,
      platform: 'windows',
      installedVersion: '2.4.0+7',
      host: host,
      clock: () => now,
    );
    expect(m.automatic, isTrue);
    expect(m.autoDownload, isFalse);
    await m.check(startup: true);
    expect(calls, 1);
    expect(m.showNotification, isTrue);
    await m.check();
    expect(calls, 1);
    await m.remindLater();
    expect(m.showNotification, isFalse);
    expect(prefs.getString('updates.v2.skip'), isNull);
    now = now.add(const Duration(hours: 7));
    expect(m.showNotification, isTrue);
    await m.skip();
    expect(m.showNotification, isFalse);
    build = 9;
    await m.check(manual: true);
    expect(m.showNotification, isTrue);
    await m.preference('automatic', false);
    await m.check(manual: true);
    expect(calls, 3);
    await m.install(approved: false);
    expect(host.installs, 0);
    await m.download();
    expect(m.phase, UpdatePhase.ready);
    expect(host.installs, 0);
    await m.install(approved: true);
    expect(host.installs, 1);
    await m.verifiedFile!.writeAsString('tampered');
    await m.install(approved: true);
    expect(host.installs, 1);
    expect(m.phase, UpdatePhase.failed);
    expect(prefs.getBool('updates.v2.automatic'), isFalse);
    expect(m.lastSuccess, isNotNull);
    m.dispose();
  });
}
