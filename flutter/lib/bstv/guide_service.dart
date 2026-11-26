// BattleStation TV, 2026. GPLv3; see BSTV-NOTICE.md.
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/core/models.dart';
import 'package:iptvmac/core/xtream_client.dart';
import 'package:iptvmac/core/errors.dart';

import 'feature_models.dart';
import 'feature_store.dart';
import 'xmltv.dart';
import 'xtream_epg.dart';

abstract interface class GuideSecrets {
  Future<String?> read(String id);
  Future<void> write(String id, String? value);
}

class SecureGuideSecrets implements GuideSecrets {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  @override
  Future<String?> read(String id) => storage.read(key: 'bstv.guide.$id');
  @override
  Future<void> write(String id, String? value) => value == null
      ? storage.delete(key: 'bstv.guide.$id')
      : storage.write(key: 'bstv.guide.$id', value: value);
}

class MemoryGuideSecrets implements GuideSecrets {
  final values = <String, String>{};
  @override
  Future<String?> read(String id) async => values[id];
  @override
  Future<void> write(String id, String? value) async {
    if (value == null) {
      values.remove(id);
    } else {
      values[id] = value;
    }
  }
}

class GuideService extends ChangeNotifier {
  GuideService(this.store, this.library, this.secrets, {http.Client? client})
    : client = client ?? http.Client();
  final FeatureStore store;
  final LibraryModel library;
  final GuideSecrets secrets;
  final http.Client client;
  final busy = <String>{};
  final errors = <String, String>{};
  Future<void> _tail = Future.value();
  bool _closed = false;
  Timer? _timer;
  final _deferredChannels = <String, Item>{};
  bool _started = false;
  void _libraryChanged() {
    if (_closed || library.syncing) return;
    final deferred = _deferredChannels.values.toList();
    _deferredChannels.clear();
    for (final item in deferred) {
      unawaited(ensureChannel(item));
    }
    unawaited(refreshDue());
  }

  List<GuideChannel>? _channels;
  List<GuideSource>? _sources;
  Map<String, GuideChannel>? _byKey;
  final _byId = <String, List<GuideChannel>>{},
      _byName = <String, List<GuideChannel>>{};
  void _index() {
    if (_byKey != null) return;
    _byKey = {};
    _byId.clear();
    _byName.clear();
    for (final c in channels) {
      _byKey!['${c.sourceId}|${c.id}'] = c;
      (_byId[c.id] ??= []).add(c);
      (_byName[normalizedGuideName(c.name)] ??= []).add(c);
    }
  }

  List<GuideChannel> get channels => _channels ??= store.channels();
  @override
  void notifyListeners() {
    _channels = null;
    _sources = null;
    _byKey = null;
    super.notifyListeners();
  }

  void start() {
    if (!_started) {
      library.addListener(_libraryChanged);
      _started = true;
    }
    _timer ??= Timer.periodic(const Duration(minutes: 1), (_) => refreshDue());
  }

  List<GuideSource> get sources => _sources ??= store.sources;
  Future<T> _serial<T>(Future<T> Function() work) {
    final result = _tail.then((_) => work());
    _tail = result.then<void>((_) {}, onError: (Object _, StackTrace _) {});
    return result;
  }

  Future<void> addXmltv(String name, String url, {int? accountId}) async {
    final uri = Uri.tryParse(url.trim());
    if (name.trim().isEmpty ||
        uri == null ||
        !['https', 'http'].contains(uri.scheme) ||
        uri.host.isEmpty ||
        uri.userInfo.isNotEmpty) {
      throw const FormatException('Enter a name and a valid HTTP(S) guide URL');
    }
    final source = GuideSource(
      id: featureId(),
      name: name.trim(),
      kind: GuideSourceKind.xmltv,
      accountId: accountId,
    );
    await secrets.write(source.id, uri.toString());
    store.saveSource(source);
    notifyListeners();
    await refresh(source.id);
  }

  Future<void> remove(String id) async {
    if (busy.contains(id)) throw StateError('Wait for the update to finish');
    await secrets.write(id, null);
    store.setSetting('removed.$id', true);
    store.removeSource(id);
    notifyListeners();
  }

  Future<void> refreshDue() async {
    if (_closed || library.syncing) return;
    for (final account in library.accounts.where(
      (a) => a.kind == AccountKind.xtream && a.id != null,
    )) {
      _providerSource(account.id!);
    }
    for (final source in sources.where(
      (s) => s.enabled && s.kind == GuideSourceKind.xmltv,
    )) {
      if (_due(source)) {
        await refresh(source.id);
      }
    }
    store.prune(DateTime.now().subtract(const Duration(days: 2)));
  }

  Map<String, dynamic> stats(String id) =>
      Map<String, dynamic>.from(store.setting('sourceStats.$id') as Map? ?? {});
  void _stats(String id, Map<String, Object?> values) =>
      store.setSetting('sourceStats.$id', {...stats(id), ...values});
  bool isProviderSource(GuideSource source) =>
      source.id == 'provider-xmltv-${source.accountId}';
  String? _providerSource(int accountId) {
    final id = 'provider-xmltv-$accountId';
    if (store.setting('removed.$id') == true) return null;
    if (!sources.any((s) => s.id == id)) {
      store.saveSource(
        GuideSource(
          id: id,
          name: '${library.accountById(accountId)?.name ?? 'Provider'} XMLTV',
          kind: GuideSourceKind.xmltv,
          accountId: accountId,
        ),
      );
      _sources = null;
    }
    return id;
  }

  bool _due(GuideSource source) {
    final retry = stats(source.id)['retryAt'] as int?;
    return source.enabled &&
        (retry == null || DateTime.now().millisecondsSinceEpoch >= retry) &&
        (source.lastFetch == null ||
            DateTime.now().difference(source.lastFetch!) >=
                Duration(minutes: source.intervalMinutes));
  }

  Future<void> refresh(String id) async {
    if (_closed || busy.contains(id)) return;
    busy.add(id);
    errors.remove(id);
    _stats(id, {'attempt': DateTime.now().millisecondsSinceEpoch});
    notifyListeners();
    try {
      await _serial(() async {
        final source = sources.where((s) => s.id == id).firstOrNull;
        if (_closed || source == null || !source.enabled) return;
        if (library.syncing) {
          throw StateError(
            'Playlist refresh is running; guide update will retry after it finishes',
          );
        }
        final provider = isProviderSource(source);
        final local = store.setting('localFile.$id') == true;
        final address = provider
            ? library.xtreamUrls(source.accountId)?.xmltv().toString()
            : await secrets.read(id);
        if (address == null) {
          throw StateError(
            provider
                ? 'Saved provider credentials are unavailable'
                : 'Select the guide file or re-enter its URL in Sources',
          );
        }
        if (local) {
          final file = File(address);
          if (await file.length() > 64 * 1024 * 1024) {
            throw const FormatException('Guide exceeds size limit');
          }
          final parsed = await Isolate.run(
            _GuideParseTask(file.path, id, DateTime.now().toUtc()).call,
          );
          await _import(source, parsed, await file.length());
          return;
        }
        final request = http.Request('GET', Uri.parse(address));
        request.headers.addAll({
          'User-Agent': 'BattleStationTV',
          'Accept': 'application/xml,text/xml,*/*',
          if (source.etag != null) 'If-None-Match': source.etag!,
          if (source.modified != null) 'If-Modified-Since': source.modified!,
        });
        final response = await client
            .send(request)
            .timeout(const Duration(seconds: 25));
        if (response.statusCode == 304) {
          await response.stream.drain<void>().timeout(
            const Duration(seconds: 15),
          );
          store.saveSource(source.refreshed(DateTime.now()));
          _stats(id, {'error': null, 'retryAt': null, 'status': 'unchanged'});
          return;
        }
        if (response.statusCode != 200) {
          await response.stream
              .take(1)
              .drain<void>()
              .timeout(const Duration(seconds: 5));
          if ([401, 403, 511].contains(response.statusCode)) {
            throw StateError(
              'EPG authentication/access rejected (HTTP ${response.statusCode}); check provider access',
            );
          }
          throw StateError(
            'EPG source unavailable (HTTP ${response.statusCode}); cached guide retained',
          );
        }
        final directory = await Directory.systemTemp.createTemp('bstv-guide-');
        final file = File('${directory.path}/guide.xml');
        try {
          var bytes = 0;
          final sink = file.openWrite();
          final deadline = DateTime.now().add(const Duration(minutes: 3));
          try {
            await for (final chunk in response.stream.timeout(
              const Duration(seconds: 30),
            )) {
              bytes += chunk.length;
              if (bytes > 64 * 1024 * 1024 ||
                  DateTime.now().isAfter(deadline)) {
                throw const FormatException('Guide exceeds download limits');
              }
              sink.add(chunk);
              await sink.flush();
            }
          } finally {
            await sink.close();
          }
          final parsed = await Isolate.run(
            _GuideParseTask(file.path, id, DateTime.now().toUtc()).call,
          );
          await _import(
            source,
            parsed,
            bytes,
            etag: response.headers['etag'],
            modified: response.headers['last-modified'],
          );
        } finally {
          await directory.delete(recursive: true);
        }
      });
    } catch (e) {
      final message = e is StateError
          ? e.message
          : e is FormatException
          ? 'EPG parsing failed or size limit exceeded; cached guide retained'
          : e is TimeoutException
          ? 'EPG source timed out; cached guide retained'
          : 'EPG source unavailable; cached guide retained';
      errors[id] = message;
      _stats(id, {
        'error': message,
        'retryAt': DateTime.now()
            .add(const Duration(minutes: 5))
            .millisecondsSinceEpoch,
        'status': 'failed',
      });
    } finally {
      busy.remove(id);
      if (!_closed) notifyListeners();
    }
  }

  Future<void> _import(
    GuideSource source,
    ParsedGuide parsed,
    int bytes, {
    String? etag,
    String? modified,
  }) async {
    if (_closed) return;
    final empty = parsed.programmes.isEmpty;
    // A valid but empty feed must not destroy an already useful cache.
    if (!empty || store.programmeCount(source.id) == 0) {
      await store.importGuide(source.id, parsed);
    }
    store.saveSource(
      source.refreshed(DateTime.now(), etag: etag, modified: modified),
    );
    _stats(source.id, {
      'bytes': bytes,
      'importedChannels': parsed.channels.length,
      'importedProgrammes': parsed.programmes.length,
      'skipped': parsed.skipped,
      'outsideRetention': parsed.outsideWindow,
      'error': null,
      'retryAt': null,
      'status': empty
          ? (parsed.outsideWindow > 0
                ? 'outsideRetention'
                : parsed.skipped > 0
                ? 'invalidEntries'
                : 'empty')
          : 'ready',
    });
  }

  Future<void> addLocalFile(String name, String path) async {
    if (name.trim().isEmpty) throw const FormatException('Enter a source name');
    final id = featureId();
    await secrets.write(id, path);
    store.setSetting('localFile.$id', true);
    store.saveSource(
      GuideSource(id: id, name: name.trim(), kind: GuideSourceKind.xmltv),
    );
    notifyListeners();
    await refresh(id);
  }

  Future<void> updateSource(
    GuideSource source, {
    required String name,
    required bool enabled,
    required int interval,
    String? url,
  }) async {
    if (name.trim().isEmpty ||
        interval < 15 ||
        interval > 10080 ||
        busy.contains(source.id)) {
      throw const FormatException(
        'Invalid source settings or update still running',
      );
    }
    var addressChanged = false;
    if (url != null &&
        url.isNotEmpty &&
        !isProviderSource(source) &&
        store.setting('localFile.${source.id}') != true) {
      final parsed = Uri.tryParse(url.trim());
      if (parsed == null ||
          !['http', 'https'].contains(parsed.scheme) ||
          parsed.host.isEmpty ||
          parsed.userInfo.isNotEmpty) {
        throw const FormatException('Enter an HTTP(S) URL');
      }
      await secrets.write(source.id, parsed.toString());
      addressChanged = true;
    }
    store.saveSource(
      GuideSource(
        id: source.id,
        name: name.trim(),
        kind: source.kind,
        accountId: source.accountId,
        enabled: enabled,
        intervalMinutes: interval,
        lastFetch: addressChanged ? null : source.lastFetch,
        etag: addressChanged ? null : source.etag,
        modified: addressChanged ? null : source.modified,
      ),
    );
    if (addressChanged) {
      _stats(source.id, {'status': 'changed', 'error': null, 'retryAt': null});
    }
    notifyListeners();
  }

  GuideChannel? mapping(Item item) {
    _index();
    final key = channelKey(item), saved = store.mapping(channelKey(item));
    final allowed = sources
        .where(
          (s) =>
              s.enabled &&
              (s.accountId == null || s.accountId == item.accountId),
        )
        .map((s) => s.id)
        .toSet();
    GuideChannel? stored() {
      if (saved == null || !allowed.contains(saved.$1)) return null;
      return _byKey!['${saved.$1}|${saved.$2}'];
    }

    if (saved != null && store.manualMapping(key)) return stored();
    final xmlSources = sources
        .where((s) => s.kind == GuideSourceKind.xmltv && allowed.contains(s.id))
        .map((s) => s.id)
        .toSet();
    GuideChannel? automatic() {
      for (final id in [
        item.epgChannelId,
        library.accountById(item.accountId)?.kind == AccountKind.xtream
            ? item.streamId
            : null,
      ]) {
        if (id == null || id.isEmpty) continue;
        final exact = (_byId[id] ?? [])
            .where((c) => xmlSources.contains(c.sourceId))
            .toList();
        if (exact.length == 1) return exact.single;
        if (exact.isNotEmpty) {
          // A global XMLTV import can duplicate the playlist's own feed. Prefer
          // the single account-scoped match; genuinely ambiguous matches still
          // require an explicit mapping instead of guessing across providers.
          final scopedSources = sources
              .where(
                (s) =>
                    s.accountId == item.accountId && xmlSources.contains(s.id),
              )
              .map((s) => s.id)
              .toSet();
          final scoped = exact
              .where((c) => scopedSources.contains(c.sourceId))
              .toList();
          return scoped.length == 1 ? scoped.single : null;
        }
      }
      final names = (_byName[normalizedGuideName(item.name)] ?? [])
          .where((c) => xmlSources.contains(c.sourceId))
          .toList();
      return names.length == 1 ? names.single : null;
    }

    return automatic() ?? stored();
  }

  ({int matched, int unmatched}) matchingSummary(String id) {
    final source = sources.where((s) => s.id == id).firstOrNull;
    var matched = 0, unmatched = 0;
    final items = library.db.read(
      (db) => Item.fromRows(
        db.select(
          'SELECT * FROM item WHERE type=? AND (? IS NULL OR accountId=?)',
          ['live', source?.accountId, source?.accountId],
        ),
      ),
    );
    for (final item in items) {
      if (mapping(item)?.sourceId == id) {
        matched++;
      } else {
        unmatched++;
      }
    }
    return (matched: matched, unmatched: unmatched);
  }

  String emptyState(Item item, DateTime from, DateTime to) {
    final key = channelKey(item);
    if (library.syncing || _deferredChannels.containsKey(key)) {
      return 'Waiting for playlist refresh; guide retrieval will resume automatically';
    }
    if (busy.contains(key)) return 'Retrieving provider programmes…';
    final mapped = mapping(item);
    if (mapped == null) {
      if (sources.every((s) => !s.enabled)) {
        return 'No EPG source or mapping. Open Sources to add or enable one.';
      }
      if (errors[key] != null) return errors[key]!;
      if (sources.any((s) => busy.contains(s.id))) {
        return 'Importing guide data…';
      }
      return 'No EPG mapping for this channel. Open Map channel to select one.';
    }
    if (store.programmeCount(mapped.sourceId, mapped.id) > 0) {
      if (programmes(item, from, to).isNotEmpty) {
        return 'No programmes match Program Search in this time range.';
      }
      final source = sources.where((s) => s.id == mapped.sourceId).firstOrNull;
      if (source?.lastFetch != null &&
          DateTime.now().difference(source!.lastFetch!) >
              const Duration(days: 2)) {
        return 'Cached guide expired. Refresh Sources.';
      }
      return 'No EPG in selected time range. Cached programmes exist on other dates.';
    }
    final error =
        errors[key] ??
        errors[mapped.sourceId] ??
        stats(mapped.sourceId)['error'];
    if (error is String) return error;
    if (stats(mapped.sourceId)['status'] == 'invalidEntries') {
      return 'Guide entries could not be parsed. Check source diagnostics.';
    }
    if (stats(mapped.sourceId)['status'] == 'outsideRetention') {
      return 'Feed programmes fall outside the retained date range.';
    }
    return 'No EPG in selected time range. This mapped channel has no usable schedules.';
  }

  void map(Item item, GuideChannel? channel) {
    store.mapChannel(channelKey(item), channel);
    notifyListeners();
  }

  void clearMappings() {
    store.clearMappings();
    notifyListeners();
  }

  void clearAutomaticMappings() {
    store.clearAutomaticMappings();
    notifyListeners();
  }

  List<GuideProgramme> programmes(
    Item item,
    DateTime from,
    DateTime to, {
    String search = '',
  }) {
    final mapped = mapping(item);
    return mapped == null
        ? []
        : store.window(mapped.sourceId, mapped.id, from, to, search: search);
  }

  /// One indexed window query; no network calls or full programme decoding.
  Set<String> availableChannelKeys(
    List<Item> items,
    DateTime from,
    DateTime to, {
    String search = '',
  }) {
    final pairs = <(String, String)>{};
    final query = search.trim().toLowerCase();
    final columns = query.isEmpty
        ? 'DISTINCT source,channel'
        : 'source,channel,json';
    for (final row in store.db.select(
      "SELECT $columns FROM programmes WHERE end>? AND start<? AND end>start AND length(trim(json_extract(json,'\$.title')))>0",
      [from.toUtc().millisecondsSinceEpoch, to.toUtc().millisecondsSinceEpoch],
    )) {
      if (query.isNotEmpty) {
        final data = jsonDecode(row['json'] as String) as Map;
        if (!'${data['title']} ${data['description']}'.toLowerCase().contains(
          query,
        )) {
          continue;
        }
      }
      pairs.add((row['source'] as String, row['channel'] as String));
    }
    return {
      for (final item in items)
        if (mapping(item) case final GuideChannel mapped
            when pairs.contains((mapped.sourceId, mapped.id)))
          channelKey(item),
    };
  }

  Future<void> ensureChannel(Item item, {bool force = false}) async {
    if (_closed ||
        library.accountById(item.accountId)?.kind != AccountKind.xtream) {
      return;
    }
    final key = channelKey(item);
    if (library.syncing) {
      _deferredChannels[key] = item;
      return;
    }
    final xmlId = _providerSource(item.accountId);
    if (xmlId != null) {
      final source = sources.where((s) => s.id == xmlId).firstOrNull;
      if (source != null && _due(source)) await refresh(xmlId);
    }
    if (_closed) return;
    final mapped = mapping(item);
    if (mapped != null &&
        !mapped.sourceId.startsWith('xtream-') &&
        store.programmeCount(mapped.sourceId, mapped.id) > 0) {
      return;
    }
    final id = 'xtream-${item.accountId}';
    final configured = sources.where((s) => s.id == id).firstOrNull;
    if (configured?.enabled == false) return;
    final fetched = store.setting('fetched.$key') as int?;
    final retry = store.setting('retry.$key') as int?;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (!force &&
        ((fetched != null &&
                now - fetched <
                    (configured?.intervalMinutes ?? 30) * 60 * 1000) ||
            (retry != null && now < retry))) {
      return;
    }
    if (!busy.add(key)) return;
    notifyListeners();
    try {
      await _serial(() async {
        if (_closed) return;
        if (library.syncing) {
          _deferredChannels[key] = item;
          return;
        }
        final urls = library.xtreamUrls(item.accountId);
        if (urls == null) {
          throw StateError('Saved provider credentials are unavailable');
        }
        final api = XtreamClient(
          urls,
          client: client,
          requestTimeout: const Duration(seconds: 30),
        );
        Object? response;
        try {
          response = await api.json(
            urls.api('get_simple_data_table', {'stream_id': item.streamId}),
          );
        } on XtreamRequestFailure catch (e) {
          if (![404, 405, 501].contains(e.statusCode) &&
              e.kind != XtreamFailureKind.invalidResponse) {
            rethrow;
          }
        }
        ParsedGuide? parsed;
        try {
          parsed = parseXtreamEpg(response, id, key);
        } on FormatException {
          /* Try documented short endpoint. */
        }
        if (parsed == null || parsed.programmes.isEmpty) {
          response = await api.json(
            urls.api('get_short_epg', {
              'stream_id': item.streamId,
              'limit': '100',
            }),
          );
          parsed = parseXtreamEpg(response, id, key);
        }
        if (_closed) return;
        store.saveSource(
          GuideSource(
            id: id,
            name:
                configured?.name ??
                '${library.accountById(item.accountId)?.name ?? 'Playlist'} API guide',
            kind: GuideSourceKind.xtream,
            accountId: item.accountId,
            enabled: configured?.enabled ?? true,
            intervalMinutes: configured?.intervalMinutes ?? 30,
            lastFetch: DateTime.now(),
          ),
        );
        final channel = GuideChannel(sourceId: id, id: key, name: item.name);
        store.putChannel(channel);
        if (parsed.programmes.isNotEmpty ||
            store.programmeCount(id, key) == 0) {
          store.replacePrograms(id, parsed.programmes, channel: key);
        }
        if (!store.manualMapping(key)) {
          store.mapChannel(key, channel, manual: false);
        }
        store.setSetting('fetched.$key', DateTime.now().millisecondsSinceEpoch);
        store.setSetting('retry.$key', null);
        _stats(id, {
          'attempt': DateTime.now().millisecondsSinceEpoch,
          'status': parsed.programmes.isNotEmpty
              ? 'ready'
              : parsed.skipped > 0
              ? 'invalidEntries'
              : 'empty',
          'skipped': parsed.skipped,
          'error': null,
        });
        errors.remove(key);
      });
    } catch (e) {
      // An in-flight request can fail after the guide/store has been disposed.
      if (_closed) return;
      errors[key] = e is XtreamRequestFailure
          ? e.description
          : e is StateError
          ? e.message
          : 'Provider EPG response could not be parsed; cached programmes retained';
      store.setSetting(
        'retry.$key',
        DateTime.now().add(const Duration(minutes: 5)).millisecondsSinceEpoch,
      );
    } finally {
      busy.remove(key);
      if (!_closed) notifyListeners();
    }
  }

  @override
  void dispose() {
    _closed = true;
    if (_started) library.removeListener(_libraryChanged);
    _timer?.cancel();
    client.close();
    super.dispose();
  }
}

// A method tear-off carries only these sendable fields. A nested closure in
// refresh can accidentally capture the HTTP response/client's isolate context.
class _GuideParseTask {
  const _GuideParseTask(this.path, this.source, this.now);
  final String path, source;
  final DateTime now;
  Future<ParsedGuide> call() async {
    final file = File(path);
    final header = await file
        .openRead(0, 2)
        .fold<List<int>>([], (bytes, chunk) => bytes..addAll(chunk));
    final stream = header.length == 2 && header[0] == 0x1f && header[1] == 0x8b
        ? file.openRead().transform(gzip.decoder)
        : file.openRead();
    return parseXmltv(
      stream,
      source,
      retainFrom: now.subtract(const Duration(days: 2)),
      retainUntil: now.add(const Duration(days: 14)),
    );
  }
}
