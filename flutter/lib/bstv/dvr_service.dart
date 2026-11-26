// BattleStation TV, 2026. GPLv3; see BSTV-NOTICE.md.
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/core/models.dart';

import 'feature_models.dart';
import 'feature_store.dart';
import 'recorder.dart';

Future<int> nativeFreeSpace(String directory) async {
  final bytes = await const MethodChannel('tv.battlestation.bstv/storage')
      .invokeMethod<int>('freeBytes', directory);
  if (bytes == null || bytes < 0) {
    throw const RecordingFailure('Unable to measure available storage');
  }
  return bytes;
}

class DvrService extends ChangeNotifier {
  DvrService(
    this.store,
    this.library,
    this.defaultDirectory, {
    this.freeSpace = nativeFreeSpace,
  });
  final FeatureStore store;
  final LibraryModel library;
  final String defaultDirectory;
  final Future<int> Function(String) freeSpace;
  String get filenamePattern =>
      store.setting('filenamePattern') as String? ?? '{title}-{date}';
  set filenamePattern(String value) {
    if (value.trim().isEmpty ||
        value.length > 120 ||
        RegExp(r'[{}]').hasMatch(
          value
              .replaceAll('{title}', '')
              .replaceAll('{date}', '')
              .replaceAll('{channel}', ''),
        )) {
      throw const FormatException(
        'Use {title}, {channel} and {date} placeholders',
      );
    }
    store.setSetting('filenamePattern', value);
  }

  List<Map<String, dynamic>> get seriesRules =>
      (store.setting('seriesRules') as List? ?? [])
          .map((r) => Map<String, dynamic>.from(r as Map))
          .toList();
  void addSeriesRule(Item channel, GuideProgramme programme) {
    if (programme.seriesId == null) {
      throw const RecordingFailure('No reliable series identifier supplied');
    }
    final rules = seriesRules;
    if (rules.any(
      (r) =>
          r['key'] == channelKey(channel) && r['series'] == programme.seriesId,
    )) {
      return;
    }
    rules.add({
      'id': featureId(),
      'account': channel.accountId,
      'key': channelKey(channel),
      'channel': channel.name,
      'source': programme.sourceId,
      'guideChannel': programme.channelId,
      'series': programme.seriesId,
      'title': programme.title,
      'directory': directory,
    });
    store.setSetting('seriesRules', rules);
    applySeriesRules();
    notifyListeners();
  }

  void removeSeriesRule(String id) {
    store.setSetting(
      'seriesRules',
      seriesRules.where((r) => r['id'] != id).toList(),
    );
    for (final job in jobs.where(
      (j) => j.createdByRule == id && j.state == RecordingState.scheduled,
    )) {
      job.state = RecordingState.cancelled;
      store.saveJob(job);
    }
    notifyListeners();
  }

  void applySeriesRules() {
    final existing = jobs;
    final now = DateTime.now();
    for (final rule in seriesRules) {
      for (final p in store.window(
        rule['source'],
        rule['guideChannel'],
        now,
        now.add(const Duration(days: 14)),
      )) {
        if (p.seriesId != rule['series'] ||
            !p.start.isAfter(now) ||
            existing.any(
              (j) => j.programmeId == p.id && j.channelKey == rule['key'],
            )) {
          continue;
        }
        final job = RecordingJob(
          id: featureId(),
          accountId: rule['account'],
          channelKey: rule['key'],
          channelName: rule['channel'],
          title: p.title,
          start: p.start,
          end: p.end,
          directory: rule['directory'],
          programmeId: p.id,
          createdByRule: rule['id'],
        );
        try {
          schedule(job);
        } on RecordingFailure {
          job.state = RecordingState.failed;
          job.error =
              'Series schedule conflicts with provider connection limit';
          store.saveJob(job);
        }
      }
    }
  }

  final _active = <String, StreamRecorder>{};
  final playbackAccounts = <int, int>{};
  int Function(int accountId)? activeDownloads;
  Timer? _timer;
  bool schedulingEnabled = true;
  bool _ticking = false, _closed = false;
  List<RecordingJob> get jobs => store.jobs;
  String get directory =>
      store.setting('recordingDirectory') as String? ?? defaultDirectory;
  set directory(String value) {
    store.setSetting('recordingDirectory', value);
    notifyListeners();
  }

  int get minimumFreeBytes =>
      store.setting('minimumFreeBytes') as int? ?? 512 * 1024 * 1024;
  set minimumFreeBytes(int value) {
    if (value < 64 * 1024 * 1024) {
      throw const FormatException('Reserve at least 64 MB');
    }
    store.setSetting('minimumFreeBytes', value);
  }

  void start() {
    for (final job in jobs.where((j) => j.state == RecordingState.recording)) {
      job.state = RecordingState.failed;
      job.error = 'Interrupted: app stopped or device restarted. Partial file retained.';
      store.saveJob(job);
    }
    _timer ??= Timer.periodic(const Duration(seconds: 2), (_) => tick());
    unawaited(tick());
  }

  int limit(int accountId) =>
      library.prefs.subscriptions[accountId]?.maxConnections ?? 1;
  int connections(int accountId) =>
      jobs
          .where((j) => _active.containsKey(j.id) && j.accountId == accountId)
          .length +
      (playbackAccounts[accountId] ?? 0) +
      (activeDownloads?.call(accountId) ?? 0);
  bool acquirePlayback(int accountId) {
    if (connections(accountId) >= limit(accountId)) return false;
    playbackAccounts[accountId] = (playbackAccounts[accountId] ?? 0) + 1;
    return true;
  }

  void releasePlayback(int accountId) {
    playbackAccounts[accountId] = ((playbackAccounts[accountId] ?? 1) - 1)
        .clamp(0, 100);
  }

  void schedule(RecordingJob job) {
    if (!schedulingEnabled) {
      throw const RecordingFailure(
        'Persistent DVR storage is unavailable; scheduling is disabled',
      );
    }
    if (!job.end.isAfter(DateTime.now())) {
      throw const RecordingFailure('Choose a recording time in the future');
    }
    final overlaps = jobs
        .where(
          (j) =>
              j.id != job.id &&
              j.accountId == job.accountId &&
              !j.terminal &&
              j.captureStart.isBefore(job.captureEnd) &&
              j.captureEnd.isAfter(job.captureStart),
        )
        .toList();
    // Sweep actual endpoints; count simultaneous jobs rather than all overlaps.
    final points = <(DateTime, int)>[
      (job.captureStart, 1),
      (job.captureEnd, -1),
      for (final j in overlaps) ...[(j.captureStart, 1), (j.captureEnd, -1)],
    ];
    points.sort((a, b) {
      final time = a.$1.compareTo(b.$1);
      return time == 0 ? a.$2.compareTo(b.$2) : time;
    });
    var concurrent = 0;
    for (final point in points) {
      concurrent += point.$2;
      if (concurrent > limit(job.accountId)) {
        throw const RecordingFailure(
          'Schedule conflicts with the provider connection limit',
        );
      }
    }
    store.saveJob(job);
    notifyListeners();
    unawaited(tick());
  }

  RecordingJob forProgramme(
    Item channel,
    GuideProgramme programme, {
    int before = 0,
    int after = 0,
    RecordingRepeat repeat = RecordingRepeat.none,
  }) => RecordingJob(
    id: featureId(),
    accountId: channel.accountId,
    channelKey: channelKey(channel),
    channelName: channel.name,
    title: programme.title,
    start: programme.start.isBefore(DateTime.now())
        ? DateTime.now()
        : programme.start,
    end: programme.end,
    directory: directory,
    programmeId: programme.id,
    paddingBefore: before,
    paddingAfter: after,
    repeat: repeat,
  );
  Future<void> tick() async {
    if (_closed || _ticking) return;
    _ticking = true;
    try {
      final now = DateTime.now();
      for (final job in jobs.where(
        (j) => j.state == RecordingState.scheduled,
      )) {
        if (!job.captureEnd.isAfter(now)) {
          job.state = RecordingState.missed;
          job.error = 'Scheduled time passed while app was unavailable';
          store.saveJob(job);
          _next(job);
          notifyListeners();
        } else if (!job.captureStart.isAfter(now)) {
          if (now.difference(job.captureStart) > const Duration(minutes: 2)) {
            job.error = 'Started late; earlier programme content was missed';
          }
          unawaited(_run(job));
        }
      }
    } finally {
      _ticking = false;
    }
  }

  Future<void> _run(RecordingJob job) async {
    if (_active.containsKey(job.id)) return;
    if (connections(job.accountId) >= limit(job.accountId)) {
      job.state = RecordingState.failed;
      job.error = 'Provider connection limit reached by playback, downloads or recordings';
      store.saveJob(job);
      _next(job);
      notifyListeners();
      return;
    }
    final recorder = StreamRecorder(
      checkSpace: freeSpace,
      minimumFreeBytes: minimumFreeBytes,
    );
    _active[job.id] = recorder;
    job.state = RecordingState.recording;
    store.saveJob(job);
    notifyListeners();
    try {
      final channel = library.db
          .read(
            (db) => Item.fromRows(
              db.select('SELECT * FROM item WHERE accountId=? AND type=?', [
                job.accountId,
                'live',
              ]),
            ),
          )
          .where((i) => channelKey(i) == job.channelKey)
          .firstOrNull;
      final uri = channel == null ? null : library.streamUrl(channel);
      if (uri == null) {
        throw const RecordingFailure(
          'Channel or saved credentials are unavailable',
        );
      }
      final folder = await Directory(job.directory).create(recursive: true);
      final stamp = job.start
          .toLocal()
          .toIso8601String()
          .replaceAll(':', '-')
          .split('.')
          .first;
      final name = filenamePattern
          .replaceAll('{title}', job.title)
          .replaceAll('{channel}', job.channelName)
          .replaceAll('{date}', stamp)
          .replaceAll(RegExp(r'[<>:"/\\|?*\x00-\x1f]'), '_')
          .replaceAll(RegExp(r'[. ]+$'), '');
      final safe = name.isEmpty
          ? 'Recording'
          : name.substring(0, name.length.clamp(0, 80));
      final part = File('${folder.path}/$safe-${job.id}.ts.part');
      job.path = part.path;
      store.saveJob(job);
      var saved = DateTime.now();
      await recorder.record(
        uri,
        part,
        job.captureEnd,
        onProgress: (count) {
          job.bytes = count;
          if (DateTime.now().difference(saved) >= const Duration(seconds: 1)) {
            saved = DateTime.now();
            store.saveJob(job);
            if (!_closed) notifyListeners();
          }
        },
      );
      job.bytes = recorder.bytes;
      if (job.bytes == 0) throw const RecordingFailure('No media was captured');
      final finished = part.path.substring(0, part.path.length - 5);
      if (await File(finished).exists()) {
        throw const RecordingFailure(
          'Destination already exists; partial recording retained',
        );
      }
      await part.rename(finished);
      job.path = finished;
      job.state = recorder.finishedPlaylist
          ? RecordingState.completed
          : DateTime.now().isBefore(
              job.captureEnd.subtract(const Duration(seconds: 2)),
            )
          ? RecordingState.stopped
          : RecordingState.completed;
    } catch (e) {
      job.state = RecordingState.failed;
      job.error = e is RecordingFailure
          ? e.message
          : 'Recording failed: check stream compatibility and folder access';
      job.bytes = recorder.bytes;
    } finally {
      _active.remove(job.id);
      store.saveJob(job);
      _next(job);
      if (!_closed) notifyListeners();
    }
  }

  void _next(RecordingJob previous) {
    if (previous.repeat == RecordingRepeat.none ||
        previous.state == RecordingState.cancelled) {
      return;
    }
    // Rebuild local wall time so daily/weekly repeats follow DST changes.
    final days = previous.repeat == RecordingRepeat.daily ? 1 : 7;
    var local = previous.start.toLocal();
    do {
      local = DateTime(
        local.year,
        local.month,
        local.day + days,
        local.hour,
        local.minute,
        local.second,
      );
    } while (!local.isAfter(DateTime.now()));
    if (jobs.any((j) => j.createdByRule == previous.id)) return;
    final next = RecordingJob(
      id: featureId(),
      accountId: previous.accountId,
      channelKey: previous.channelKey,
      channelName: previous.channelName,
      title: previous.title,
      start: local,
      end: local.add(previous.end.difference(previous.start)),
      directory: previous.directory,
      repeat: previous.repeat,
      paddingBefore: previous.paddingBefore,
      paddingAfter: previous.paddingAfter,
      createdByRule: previous.id,
    );
    try {
      schedule(next);
    } on RecordingFailure {
      next.state = RecordingState.failed;
      next.error =
          'Recurring schedule conflicts with provider connection limit';
      store.saveJob(next);
    }
  }

  Future<void> prepareForUpdate() async {
    for(final recorder in _active.values.toList()) { recorder.stop(); }
    for(var i=0;i<100 && _active.isNotEmpty;i++) { await Future<void>.delayed(const Duration(milliseconds:100)); }
    if(_active.isNotEmpty) throw StateError('Wait for recording files to finish closing before updating.');
  }
  void stop(String id) => _active[id]?.stop();
  void cancel(RecordingJob job) {
    if (_active.containsKey(job.id)) {
      stop(job.id);
      return;
    }
    job.state = RecordingState.cancelled;
    store.saveJob(job);
    notifyListeners();
  }

  Future<void> delete(RecordingJob job, {required bool deleteFile}) async {
    if (!job.terminal) {
      throw const RecordingFailure('Stop or cancel this recording first');
    }
    if (deleteFile && job.path != null && await File(job.path!).exists()) {
      await File(job.path!).delete();
    }
    store.removeJob(job.id);
    notifyListeners();
  }

  Future<void> move(RecordingJob job, String path) async {
    if (!job.terminal || job.path == null) {
      throw const RecordingFailure('Only finished recordings can be moved');
    }
    final destination = File(path);
    if (await destination.exists()) {
      throw const RecordingFailure('Destination already exists');
    }
    final source = File(job.path!);
    await destination.create(exclusive: true);
    final sink = destination.openWrite(mode: FileMode.append);
    try {
      await sink.addStream(source.openRead());
      await sink.flush();
    } finally {
      await sink.close();
    }
    if (await source.length() != await destination.length()) {
      throw const RecordingFailure(
        'Copy verification failed; original retained',
      );
    }
    // Update history before deleting original, retaining a recoverable copy on errors.
    job.path = destination.path;
    store.saveJob(job);
    await source.delete();
    notifyListeners();
  }

  @override
  void dispose() {
    _closed = true;
    _timer?.cancel();
    for (final recorder in _active.values) {
      recorder.stop();
    }
    super.dispose();
  }
}
