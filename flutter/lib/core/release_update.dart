// Shared release protocol. No IPTV state or authenticated provider client is used.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:iptvmac/bstv/identity.dart';

class UpdateFailure implements Exception {
  const UpdateFailure(this.message, {this.retryAfter});
  final String message;
  final DateTime? retryAfter;
  @override
  String toString() => message;
}

class UpdateCancelled extends UpdateFailure {
  const UpdateCancelled() : super('Download cancelled.');
}

class UpdateIdentity {
  const UpdateIdentity(this.repo, this.prefix, this.packageId, this.executable);
  final String repo, prefix, packageId, executable;
  static const bstv = UpdateIdentity(
    'badbubba-10000/BattleStation-TV',
    'BattleStation-TV',
    'tv.battlestation.bstv',
    'BattleStationTV.exe',
  );
  static const getEtv = UpdateIdentity(
    'badbubba-10000/GET-ETV-Releases',
    'GET-ETV',
    'com.getetv.player',
    'GetETV.exe',
  );
  static UpdateIdentity get current =>
      BstvIdentity.applicationId == getEtv.packageId ? getEtv : bstv;
  Uri endpoint(bool beta) => Uri.https(
    'api.github.com',
    '/repos/$repo/releases${beta ? '' : '/latest'}',
    beta ? {'per_page': '30'} : null,
  );
  Uri get releases => Uri.https('github.com', '/$repo/releases');
  bool trustedAsset(Uri uri) =>
      uri.scheme == 'https' &&
      uri.userInfo.isEmpty &&
      !uri.hasPort &&
      uri.host == 'github.com' &&
      uri.path.startsWith('/$repo/releases/download/');
}

class UpdateVersion implements Comparable<UpdateVersion> {
  const UpdateVersion(
    this.major,
    this.minor,
    this.patch,
    this.build, [
    this.pre = '',
  ]);
  final int major, minor, patch, build;
  final String pre;
  String get core => '$major.$minor.$patch';
  String get semantic => '$core${pre.isEmpty ? '' : '-$pre'}';
  String get key => '$semantic+$build';
  static UpdateVersion parse(String value, {int? build}) {
    final m = RegExp(
      r'^v?(\d{1,6})\.(\d{1,6})\.(\d{1,6})(?:-([0-9A-Za-z.-]+))?(?:\+(\d{1,9}))?$',
    ).firstMatch(value);
    if (m == null) throw const FormatException('Invalid release version');
    return UpdateVersion(
      int.parse(m[1]!),
      int.parse(m[2]!),
      int.parse(m[3]!),
      build ?? int.parse(m[5] ?? '0'),
      m[4] ?? '',
    );
  }

  @override
  int compareTo(UpdateVersion other) {
    for (final p in [
      (major, other.major),
      (minor, other.minor),
      (patch, other.patch),
    ]) {
      final c = p.$1.compareTo(p.$2);
      if (c != 0) return c;
    }
    if (pre != other.pre) {
      if (pre.isEmpty) return 1;
      if (other.pre.isEmpty) return -1;
      final a = pre.split('.'), b = other.pre.split('.');
      for (var i = 0; i < a.length && i < b.length; i++) {
        if (a[i] == b[i]) continue;
        final x = int.tryParse(a[i]), y = int.tryParse(b[i]);
        if (x != null && y != null) return x.compareTo(y);
        if (x != null) return -1;
        if (y != null) return 1;
        return a[i].compareTo(b[i]);
      }
      final c = a.length.compareTo(b.length);
      if (c != 0) return c;
    }
    return build.compareTo(other.build);
  }
}

class ReleaseAsset {
  const ReleaseAsset(this.name, this.url, this.size, this.digest);
  final String name;
  final Uri url;
  final int size;
  final String? digest;
  static ReleaseAsset fromJson(Map data, UpdateIdentity identity) {
    final url = Uri.tryParse('${data['browser_download_url']}');
    if (url == null || !identity.trustedAsset(url)) {
      throw const UpdateFailure(
        'Release asset is not hosted by the expected application repository.',
      );
    }
    final name = data['name'];
    final size = data['size'];
    if (name is! String ||
        size is! int ||
        size < 0 ||
        size > 700 * 1024 * 1024 ||
        url.pathSegments.last != name) {
      throw const UpdateFailure('Invalid release asset metadata.');
    }
    return ReleaseAsset(
      name,
      url,
      size,
      data['digest'] is String ? data['digest'] as String : null,
    );
  }
}

class AppRelease {
  const AppRelease(
    this.version,
    this.name,
    this.notes,
    this.published,
    this.package,
    this.checksum,
    this.url,
    this.beta,
  );
  final UpdateVersion version;
  final String name, notes;
  final DateTime published;
  final ReleaseAsset package, checksum;
  final Uri url;
  final bool beta;
  static AppRelease? fromJson(
    Map data,
    UpdateIdentity identity,
    String platform,
  ) {
    if (data['draft'] != false) return null;
    final tag = UpdateVersion.parse('${data['tag_name']}');
    final assets = (data['assets'] as List? ?? []).whereType<Map>().toList();
    final extension = platform == 'windows' ? '-Setup.exe' : '.apk';
    final pattern = RegExp(
      '^${RegExp.escape(identity.prefix)}-${RegExp.escape(tag.core)}-Build-([0-9]{1,9})${RegExp.escape(extension)}\$',
    );
    final candidates = assets
        .where(
          (a) => a['name'] is String && pattern.hasMatch(a['name'] as String),
        )
        .toList();
    if (candidates.isEmpty) {
      throw const UpdateFailure(
        'This release has no compatible package for this application/platform.',
      );
    }
    if (candidates.length != 1) {
      throw const UpdateFailure('Ambiguous release packages.');
    }
    final asset = ReleaseAsset.fromJson(candidates.single, identity);
    if (asset.size == 0) throw const UpdateFailure('Empty update package.');
    final checks = assets
        .where((a) => a['name'] == '${asset.name}.sha256')
        .toList();
    if (checks.length != 1) {
      throw const UpdateFailure(
        'Required SHA256 file is missing or ambiguous.',
      );
    }
    final checksum = ReleaseAsset.fromJson(checks.single, identity);
    for (final item in [asset, checksum]) {
      if (item.url.pathSegments.length != 6 ||
          item.url.pathSegments[4] != data['tag_name']) {
        throw const UpdateFailure(
          'Release asset points to a different version.',
        );
      }
    }
    if (checksum.size > 4096) {
      throw const UpdateFailure('Invalid checksum file size.');
    }
    final page = Uri.tryParse('${data['html_url']}');
    final expectedPage = [
      ...identity.repo.split('/'),
      'releases',
      'tag',
      '${data['tag_name']}',
    ];
    if (page == null ||
        page.scheme != 'https' ||
        page.host != 'github.com' ||
        page.userInfo.isNotEmpty ||
        page.hasPort ||
        page.pathSegments.join('/') != expectedPage.join('/')) {
      throw const UpdateFailure('Invalid release page.');
    }
    final published = DateTime.tryParse('${data['published_at']}');
    if (published == null) throw const UpdateFailure('Invalid release date.');
    final build = int.parse(pattern.firstMatch(asset.name)![1]!);
    if (tag.build != 0 && tag.build != build) {
      throw const UpdateFailure(
        'Release tag build and package build disagree.',
      );
    }
    return AppRelease(
      UpdateVersion(tag.major, tag.minor, tag.patch, build, tag.pre),
      '${data['name'] ?? tag.semantic}',
      '${data['body'] ?? ''}',
      published,
      asset,
      checksum,
      page,
      data['prerelease'] == true,
    );
  }
}

class ReleaseResponse {
  const ReleaseResponse(this.release, this.etag, this.json);
  final AppRelease? release;
  final String? etag;
  final String json;
}

class DownloadCancellation {
  bool cancelled = false;
  final _signal = Completer<void>();
  void cancel() {
    if (!cancelled) {
      cancelled = true;
      _signal.complete();
    }
  }

  void check() {
    if (cancelled) throw const UpdateCancelled();
  }

  Future<T> race<T>(Future<T> future) => Future.any([
    future,
    _signal.future.then<T>((_) => throw const UpdateCancelled()),
  ]);
}

class DownloadMetrics {
  DownloadMetrics(this.bytes, this.total, this.elapsed);
  final int bytes, total;
  final Duration elapsed;
  double get fraction => total == 0 ? 0 : (bytes / total).clamp(0, 1);
  double get bytesPerSecond =>
      elapsed.inMilliseconds == 0 ? 0 : bytes * 1000 / elapsed.inMilliseconds;
  Duration? get remaining => bytesPerSecond <= 0
      ? null
      : Duration(seconds: ((total - bytes) / bytesPerSecond).ceil());
}

class ReleaseClient {
  ReleaseClient({http.Client? client, UpdateIdentity? identity})
    : client = client ?? http.Client(),
      identity = identity ?? UpdateIdentity.current;
  final http.Client client;
  final UpdateIdentity identity;
  String? _verifiedDigest;
  String? get verifiedDigest => _verifiedDigest;
  Future<ReleaseResponse> discover({
    required String platform,
    bool beta = false,
    String? etag,
    String? cachedJson,
  }) async {
    final endpoint = identity.endpoint(beta);
    final request = http.Request('GET', endpoint)
      ..followRedirects = false
      ..headers.addAll({
        'Accept': 'application/vnd.github+json',
        'X-GitHub-Api-Version': '2022-11-28',
        'User-Agent': '${identity.prefix}-Updater',
        'if-none-match': etag ?? '',
      });
    late http.StreamedResponse response;
    try {
      response = await client
          .send(request)
          .timeout(const Duration(seconds: 25));
    } catch (_) {
      throw const UpdateFailure(
        'Update check could not connect. Try again when online.',
      );
    }
    if (response.statusCode == 404) {
      await response.stream.drain<void>();
      return const ReleaseResponse(null, null, '');
    }
    if (response.statusCode == 403 || response.statusCode == 429) {
      await response.stream.drain<void>();
      final reset = int.tryParse(response.headers['x-ratelimit-reset'] ?? '');
      throw UpdateFailure(
        'GitHub rate limit reached. Updates will be checked later.',
        retryAfter: reset == null
            ? DateTime.now().add(const Duration(hours: 1))
            : DateTime.fromMillisecondsSinceEpoch(reset * 1000),
      );
    }
    if (response.statusCode == 304) {
      await response.stream.drain<void>();
      if (cachedJson == null) {
        throw const UpdateFailure('Cached release metadata is unavailable.');
      }
    } else if (response.statusCode != 200) {
      await response.stream.drain<void>();
      throw const UpdateFailure(
        'GitHub is temporarily unavailable. Try again later.',
      );
    }
    final json = response.statusCode == 304
        ? cachedJson!
        : utf8.decode(await _readLimited(response.stream, 2 * 1024 * 1024));
    try {
      final value = jsonDecode(json);
      final list = beta ? (value as List) : [value];
      final found = <AppRelease>[];
      UpdateFailure? incompatible;
      for (final entry in list.whereType<Map>()) {
        if (entry['draft'] == true || (!beta && entry['prerelease'] == true)) {
          continue;
        }
        try {
          final release = AppRelease.fromJson(entry, identity, platform);
          if (release != null) found.add(release);
        } on UpdateFailure catch (e) {
          incompatible = e;
        }
      }
      found.sort((a, b) => b.version.compareTo(a.version));
      if (found.isEmpty && incompatible != null) throw incompatible;
      return ReleaseResponse(
        found.firstOrNull,
        response.headers['etag'] ?? etag,
        json,
      );
    } on UpdateFailure {
      rethrow;
    } catch (_) {
      throw const UpdateFailure(
        'Release information is malformed or incompatible.',
      );
    }
  }

  Future<List<int>> _readLimited(Stream<List<int>> stream, int limit) async {
    final output = <int>[];
    await for (final chunk in stream.timeout(const Duration(seconds: 25))) {
      if (output.length + chunk.length > limit) {
        throw const UpdateFailure('Update response exceeded its size limit.');
      }
      output.addAll(chunk);
    }
    return output;
  }

  Future<http.StreamedResponse> _asset(
    ReleaseAsset asset,
    DownloadCancellation token,
  ) async {
    var uri = asset.url;
    for (var hop = 0; hop < 6; hop++) {
      token.check();
      final response = await token.race(
        client
            .send(
              http.Request('GET', uri)
                ..followRedirects = false
                ..headers['User-Agent'] = '${identity.prefix}-Updater',
            )
            .timeout(const Duration(seconds: 25)),
      );
      if ([301, 302, 303, 307, 308].contains(response.statusCode)) {
        final location = response.headers['location'];
        await response.stream.drain<void>();
        final next = location == null ? null : uri.resolve(location);
        if (next == null ||
            next.scheme != 'https' ||
            next.userInfo.isNotEmpty ||
            next.hasPort ||
            !({
                  'release-assets.githubusercontent.com',
                  'objects.githubusercontent.com',
                }.contains(next.host) ||
                identity.trustedAsset(next))) {
          throw const UpdateFailure('Unsafe update download redirect blocked.');
        }
        uri = next;
        continue;
      }
      if (response.statusCode != 200) {
        await response.stream.drain<void>();
        throw const UpdateFailure('Update download failed. Retry later.');
      }
      return response;
    }
    throw const UpdateFailure('Too many update redirects.');
  }

  Future<File> download(
    AppRelease release,
    Directory directory, {
    required DownloadCancellation cancellation,
    void Function(DownloadMetrics)? onProgress,
  }) async {
    cancellation.check();
    final checksumResponse = await _asset(release.checksum, cancellation);
    final checksumText = utf8
        .decode(
          await cancellation.race(_readLimited(checksumResponse.stream, 4096)),
        )
        .trim();
    final match = RegExp(r'^([a-fA-F0-9]{64})(?:[ \t]+\*?([^\r\n]+))?$')
        .firstMatch(checksumText);
    if (match == null ||
        (match[2] != null && match[2] != release.package.name)) {
      throw const UpdateFailure('Invalid SHA256 checksum file.');
    }
    final expected = match[1]!.toLowerCase();
    if (release.package.digest != null &&
        release.package.digest != 'sha256:$expected') {
      throw const UpdateFailure('GitHub asset digest and checksum disagree.');
    }
    await directory.create(recursive: true);
    final temporary = File('${directory.path}/${release.package.name}.part');
    final result = File('${directory.path}/${release.package.name}');
    for (final entity in [temporary.path, result.path, directory.path]) {
      if (await FileSystemEntity.type(entity, followLinks: false) ==
          FileSystemEntityType.link) {
        throw const UpdateFailure('Linked update paths are not supported.');
      }
    }
    IOSink? sink;
    try {
      final response = await _asset(release.package, cancellation);
      if (response.contentLength != null &&
          response.contentLength != release.package.size) {
        throw const UpdateFailure(
          'Download size differs from release metadata.',
        );
      }
      sink = temporary.openWrite();
      var bytes = 0;
      final watch = Stopwatch()..start();
      final iterator = StreamIterator(
        response.stream.timeout(const Duration(seconds: 25)),
      );
      try {
        while (await cancellation.race(iterator.moveNext())) {
          cancellation.check();
          bytes += iterator.current.length;
          if (bytes > release.package.size) {
            throw const UpdateFailure(
              'Downloaded package exceeds declared size.',
            );
          }
          sink.add(iterator.current);
          onProgress?.call(
            DownloadMetrics(bytes, release.package.size, watch.elapsed),
          );
        }
      } finally {
        await iterator.cancel();
      }
      await sink.flush();
      await sink.close();
      sink = null;
      cancellation.check();
      if (bytes != release.package.size) {
        throw const UpdateFailure(
          'Download interrupted: file size is incomplete.',
        );
      }
      final digest = await sha256.bind(temporary.openRead()).first;
      cancellation.check();
      if (digest.toString() != expected) {
        throw const UpdateFailure(
          'SHA256 verification failed. The package was discarded.',
        );
      }
      // No unverified executable is ever exposed through the installable path.
      if (await result.exists()) await result.delete();
      _verifiedDigest = expected;
      return await temporary.rename(result.path);
    } finally {
      if (sink != null) await sink.close();
      if (await temporary.exists()) await temporary.delete();
    }
  }

  void close() => client.close();
}
