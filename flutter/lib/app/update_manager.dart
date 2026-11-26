import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:iptvmac/core/release_update.dart';
import 'package:iptvmac/app/device.dart';

/// Production hooks are wired at startup; tests replace the installer host.
abstract class UpdateInstallHost {
  Future<Directory> folder();
  Future<void> validate(File file, AppRelease release);
  Future<void> install(File file, AppRelease release, {required bool restart});
}

class UpdateLifecycle {
  static Future<void> Function()? prepare;
}

enum UpdatePhase {
  idle,
  checking,
  available,
  downloading,
  ready,
  handingOff,
  failed,
  cancelled,
}

class UpdateManager extends ChangeNotifier {
  UpdateManager({
    required this.storage,
    required this.client,
    required this.platform,
    required String? installedVersion,
    required this.host,
    DateTime Function()? clock,
  }) : installed = installedVersion == null
           ? null
           : UpdateVersion.parse(installedVersion),
       clock = clock ?? DateTime.now {
    try {
      final key = '$_prefix$platform.${beta ? 'beta' : 'stable'}.json';
      final cached = storage.getString(key);
      if (cached != null) {
        final value = jsonDecode(cached);
        final entries = beta ? (value as List) : [value];
        final candidates = <AppRelease>[];
        for (final data in entries.whereType<Map>()) {
          if (data['draft'] == true || (!beta && data['prerelease'] == true)) {
            continue;
          }
          final candidate = AppRelease.fromJson(
            data,
            client.identity,
            platform,
          );
          if (candidate != null) candidates.add(candidate);
        }
        candidates.sort((a, b) => b.version.compareTo(a.version));
        release = candidates.firstOrNull;
        if (newer) {
          phase = UpdatePhase.available;
          status = 'Cached update available; check for the latest release when online.';
        }
      }
    } catch (_) {
      release = null;
    }
  }
  final SharedPreferences storage;
  final ReleaseClient client;
  final String platform;
  final UpdateVersion? installed;
  final UpdateInstallHost host;
  final DateTime Function() clock;
  AppRelease? release;
  File? verifiedFile;
  UpdatePhase phase = UpdatePhase.idle;
  String status = 'Not checked yet.';
  DownloadMetrics? metrics;
  DateTime? get lastSuccess {
    final value = storage.getInt('${_prefix}success');
    return value == null ? null : DateTime.fromMillisecondsSinceEpoch(value);
  }

  Timer? _timer;
  DownloadCancellation? _cancellation;
  bool _closed = false;
  static const _prefix = 'updates.v2.';
  bool get automatic =>
      storage.getBool('${_prefix}automatic') ??
      storage.getBool('autoCheckUpdates') ??
      true;
  bool get scheduled => storage.getBool('${_prefix}scheduled') ?? false;
  bool get notifications => storage.getBool('${_prefix}notifications') ?? true;
  bool get autoDownload =>
      false; // Downloads always require an explicit user action.
  bool get restart => storage.getBool('${_prefix}restart') ?? true;
  bool get beta => storage.getBool('${_prefix}beta') ?? false;
  int get frequency => (storage.getInt('${_prefix}hours') ?? 6).clamp(1, 24);
  bool get supported =>
      !storeBuild && (platform == 'windows' || platform == 'android');
  bool get newer =>
      release != null &&
      installed != null &&
      release!.version.compareTo(installed!) > 0;
  bool get showNotification =>
      notificationScheduleAllows &&
      newer &&
      storage.getString('${_prefix}skip') != release!.version.key &&
      clock().millisecondsSinceEpoch >=
          (storage.getInt('${_prefix}remind') ?? 0);
  // Local update scheduling preferences.
  // All times are interpreted in the device's local time zone.
  String get scheduleMode =>
      storage.getString('${_prefix}scheduleMode') ?? 'interval';

  String get notificationMode =>
      storage.getString('${_prefix}notificationMode') ?? 'available';

  String get timeFormat =>
      storage.getString('${_prefix}timeFormat') ?? 'device';

  int get checkHour =>
      (storage.getInt('${_prefix}checkHour') ?? 9).clamp(0, 23);

  int get checkMinute =>
      (storage.getInt('${_prefix}checkMinute') ?? 0).clamp(0, 59);

  int get notificationHour =>
      (storage.getInt('${_prefix}notificationHour') ?? 9).clamp(0, 23);

  int get notificationMinute =>
      (storage.getInt('${_prefix}notificationMinute') ?? 0).clamp(0, 59);

  int get checkDays => storage.getInt('${_prefix}checkDays') ?? 127;

  int get notificationDays =>
      storage.getInt('${_prefix}notificationDays') ?? 127;

  bool _startupNotificationWindow = false;

  Future<void> schedulePreference(String key, Object value) async {
    const strings = {
      'scheduleMode': ['interval', 'daily', 'weekly', 'monthly', 'date'],
      'notificationRecurrence': [
        'interval',
        'daily',
        'weekly',
        'monthly',
        'date',
      ],
      'notificationMode': ['available', 'startup', 'scheduled', 'never'],
      'timeFormat': ['device', '12', '24'],
    };

    const integers = {
      'checkMonthDay': 31,
      'notificationMonthDay': 31,
      'notificationHours': 24,
      'checkHour': 23,
      'checkMinute': 59,
      'notificationHour': 23,
      'notificationMinute': 59,
      'checkDays': 127,
      'notificationDays': 127,
    };

    if (value is String &&
        strings.containsKey(key) &&
        strings[key]!.contains(value)) {
      await storage.setString('$_prefix$key', value);
    } else if (value is int &&
        integers.containsKey(key) &&
        value >= 0 &&
        value <= integers[key]!) {
      await storage.setInt('$_prefix$key', value);
    } else if ((key == 'checkDate' || key == 'notificationDate') &&
        value is String) {
      if (DateTime.tryParse(value) == null) {
        throw ArgumentError('Invalid scheduled date');
      }
      await storage.setString('$_prefix$key', value);
    } else {
      throw ArgumentError('Invalid schedule preference');
    }

    if (key == 'notificationRecurrence') {
      await storage.setInt(
        '${_prefix}notification.anchor',
        clock().millisecondsSinceEpoch,
      );
    }
    _queuedNotification = null;
    _notify();
  }

  String? get checkDate => storage.getString('${_prefix}checkDate');

  bool get catchUp => storage.getBool('${_prefix}catchUp') ?? true;
  DateTime? get lastAttempt {
    final value = storage.getInt('${_prefix}attempt');
    return value == null ? null : DateTime.fromMillisecondsSinceEpoch(value);
  }

  String get checkingMode => automatic
      ? (scheduled ? 'Startup and schedule' : 'Startup only (Recommended)')
      : (scheduled
            ? 'Schedule only'
            : 'Never automatically check (Not recommended)');
  String get notificationRecurrence =>
      storage.getString('${_prefix}notificationRecurrence') ?? 'daily';
  int get notificationHours =>
      (storage.getInt('${_prefix}notificationHours') ?? 6).clamp(1, 24);
  int monthDay(bool notification) =>
      (storage.getInt(
                '$_prefix${notification ? 'notification' : 'check'}MonthDay',
              ) ??
              1)
          .clamp(1, 31);
  String? get notificationDate =>
      storage.getString('${_prefix}notificationDate');

  // Reconstruct local calendar dates on every poll. Never add 24 hours to a
  // calendar occurrence: that would move the wall-clock time across DST.
  DateTime? occurrence({bool notification = false, bool next = false}) {
    final now = clock().toLocal();
    final mode = notification ? notificationRecurrence : scheduleMode;
    final stem = notification ? 'notification' : 'check';
    if (mode == 'interval') {
      final anchor =
          storage.getInt('$_prefix$stem.anchor') ?? now.millisecondsSinceEpoch;
      final step = (notification ? notificationHours : frequency) * 3600000;
      final elapsed = now.millisecondsSinceEpoch - anchor;
      final index = next
          ? (elapsed ~/ step + 1).clamp(1, 100000000)
          : elapsed ~/ step;
      if (!next && (elapsed < step || index < 1)) return null;
      return DateTime.fromMillisecondsSinceEpoch(anchor + index * step);
    }
    final hour = notification ? notificationHour : checkHour;
    final minute = notification ? notificationMinute : checkMinute;
    if (mode == 'date') {
      final date = DateTime.tryParse(
        (notification ? notificationDate : checkDate) ?? '',
      );
      if (date == null) return null;
      final target = DateTime(date.year, date.month, date.day, hour, minute);
      return next
          ? (target.isAfter(now) ? target : null)
          : (!target.isAfter(now) ? target : null);
    }
    for (var offset = 0; offset <= 370; offset++) {
      final day = DateTime(
        now.year,
        now.month,
        now.day + (next ? offset : -offset),
      );
      final mask = notification ? notificationDays : checkDays;
      if (mode == 'weekly' && (mask & (1 << (day.weekday - 1))) == 0) continue;
      if (mode == 'monthly') {
        final last = DateTime(day.year, day.month + 1, 0).day;
        if (day.day != monthDay(notification).clamp(1, last)) continue;
      }
      final target = DateTime(day.year, day.month, day.day, hour, minute);
      if (next ? target.isAfter(now) : !target.isAfter(now)) return target;
    }
    return null;
  }

  DateTime? get nextScheduledCheck => scheduled ? occurrence(next: true) : null;
  bool get scheduledCheckDue {
    if (!scheduled) return false;
    final target = occurrence();
    if (target == null) return false;
    final consumed = storage.getInt('${_prefix}check.consumed') ?? 0;
    return occurrenceId(target, scheduleMode) !=
            storage.getString('${_prefix}check.occurrence') &&
        target.millisecondsSinceEpoch > consumed &&
        (catchUp || clock().difference(target).inSeconds < 60);
  }

  String occurrenceId(DateTime target, String mode) => mode == 'interval'
      ? target.millisecondsSinceEpoch.toString()
      : '$mode:${target.year}-${target.month}-${target.day}:$checkHour:$checkMinute';

  String? get _notificationOccurrence {
    if (notificationMode == 'scheduled') {
      final target = occurrence(notification: true);
      if (target == null) return null;
      if (notificationRecurrence != 'interval' &&
          storage.getString(
                '${_prefix}notification.calendar.${release?.version.key}',
              ) ==
              '$notificationRecurrence:${target.toIso8601String()}') {
        return null;
      }
      final watermark =
          storage.getInt(
            '${_prefix}notification.watermark.${release?.version.key}',
          ) ??
          0;
      if (target.millisecondsSinceEpoch <= watermark) return null;
      return '${target.millisecondsSinceEpoch}';
    }
    if (notificationMode == 'startup') {
      return _startupNotificationWindow ? _session : null;
    }
    return 'available';
  }

  final String _session = DateTime.now().microsecondsSinceEpoch.toString();
  String? _queuedNotification;
  bool _playbackActive = false;
  bool get notificationScheduleAllows {
    if (!notifications || notificationMode == 'never') return false;
    final occurrence = _notificationOccurrence;
    final key = occurrence == null || release == null
        ? null
        : '${release!.version.key}:$notificationMode:$occurrence';
    if (key != null &&
        storage.getString('${_prefix}notification.consumed') != key) {
      _queuedNotification = key;
    }
    return !_playbackActive &&
        _queuedNotification != null &&
        storage.getString('${_prefix}notification.consumed') !=
            _queuedNotification;
  }

  void setPlaybackActive(bool active) {
    // Capture eligibility before the startup window closes, even under playback.
    notificationScheduleAllows;
    _playbackActive = active;
    _notify();
  }

  Future<void> markNotificationShown() async {
    final key = _queuedNotification;
    if (key != null) {
      await storage.setString('${_prefix}notification.consumed', key);
      if (notificationMode == 'scheduled' && release != null) {
        final target = occurrence(notification: true);
        if (target != null) {
          await storage.setString(
            '${_prefix}notification.calendar.${release!.version.key}',
            '$notificationRecurrence:${target.toIso8601String()}',
          );
          await storage.setInt(
            '${_prefix}notification.watermark.${release!.version.key}',
            target.millisecondsSinceEpoch,
          );
        }
      }
    }
  }

  Future<void> restoreRecommendedUpdateSettings() async {
    await preference('automatic', true);
    await preference('scheduled', false);
    await preference('notifications', true);
    await preference('download', false);
    await preference('catchUp', true);
    await schedulePreference('scheduleMode', 'interval');
    await schedulePreference('notificationMode', 'available');
    await schedulePreference('timeFormat', 'device');
    _notify();
  }

  bool get busy =>
      phase == UpdatePhase.checking ||
      phase == UpdatePhase.downloading ||
      phase == UpdatePhase.handingOff;
  Future<void> preference(String key, Object value) async {
    if (!{
      'automatic',
      'catchUp',
      'scheduled',
      'notifications',
      'download',
      'restart',
      'beta',
      'hours',
    }.contains(key)) {
      throw ArgumentError('Unknown update preference');
    }
    if (value is bool) {
      await storage.setBool('$_prefix$key', value);
    } else if (value is int && key == 'hours' && value >= 1 && value <= 24) {
      await storage.setInt('$_prefix$key', value);
    } else {
      throw ArgumentError('Invalid preference');
    }
    if (key == 'scheduled' && value == true) {
      await storage.setInt(
        '${_prefix}check.anchor',
        clock().millisecondsSinceEpoch,
      );
    }
    if (key == 'beta') {
      release = null;
      verifiedFile = null;
      phase = UpdatePhase.idle;
      status = 'Channel changed; check for updates.';
    }
    _notify();
  }

  void start() {
    final pending = storage.getString('${_prefix}pending');
    if (pending != null && installed != null) {
      try {
        status = installed!.compareTo(UpdateVersion.parse(pending)) >= 0
            ? 'The requested update is installed.'
            : 'The previous update did not complete. Your existing application remains available.';
      } catch (_) {
        status = 'Update status could not be restored.';
      }
      unawaited(storage.remove('${_prefix}pending'));
    }
    if (installed == null) return;
    unawaited(
      storage.setInt(
        '${_prefix}check.anchor',
        storage.getInt('${_prefix}check.anchor') ??
            clock().millisecondsSinceEpoch,
      ),
    );
    _startupNotificationWindow = true;
    unawaited(
      storage.setInt(
        '${_prefix}notification.anchor',
        storage.getInt('${_prefix}notification.anchor') ??
            clock().millisecondsSinceEpoch,
      ),
    );
    if (scheduledCheckDue && !automatic) unawaited(check(scheduledCheck: true));
    if (automatic) {
      unawaited(
        check(startup: true).then((_) async {
          if (!_closed && scheduledCheckDue) await check(scheduledCheck: true);
        }),
      );
    }
    _timer ??= Timer.periodic(const Duration(minutes: 1), (_) {
      _startupNotificationWindow = false;
      if (scheduledCheckDue) {
        unawaited(check(scheduledCheck: true));
      }
      // Refresh local-time labels and queued notification eligibility even if
      // the device clock or time zone changed without a preference change.
      _notify();
    });
  }

  Future<void> check({
    bool manual = false,
    bool startup = false,
    bool scheduledCheck = false,
  }) async {
    if (installed == null || busy || !supported) return;
    final now = clock().millisecondsSinceEpoch;
    if (now < (storage.getInt('${_prefix}retryAfter') ?? 0)) {
      status = 'GitHub requested a pause. Try again later.';
      _notify();
      return;
    }
    if (!manual) {
      if (startup) {
        if (!automatic) return;
      } else {
        if (scheduledCheck) {
          if (!scheduledCheckDue) return;
        } else {
          return;
        }
      }
    }
    phase = UpdatePhase.checking;
    status = 'Checking GitHub releases…';
    _notify();
    if (scheduledCheck) {
      final target = occurrence();
      if (target != null) {
        await storage.setString(
          '${_prefix}check.occurrence',
          occurrenceId(target, scheduleMode),
        );
        await storage.setInt(
          '${_prefix}check.consumed',
          target.millisecondsSinceEpoch,
        );
      }
    }
    await storage.setInt('${_prefix}attempt', now);
    final cacheKey = '$_prefix$platform.${beta ? 'beta' : 'stable'}';
    try {
      final result = await client.discover(
        platform: platform,
        beta: beta,
        etag: storage.getString('$cacheKey.etag'),
        cachedJson: storage.getString('$cacheKey.json'),
      );
      if (_closed) return;
      release = result.release;
      verifiedFile = null;
      if (result.etag != null) {
        await storage.setString('$cacheKey.etag', result.etag!);
      }
      if (result.json.isNotEmpty) {
        await storage.setString('$cacheKey.json', result.json);
      } else {
        await storage.remove('$cacheKey.etag');
        await storage.remove('$cacheKey.json');
      }
      final checkedAt = clock();
      await storage.setInt(
        '${_prefix}success',
        checkedAt.millisecondsSinceEpoch,
      );
      phase = newer ? UpdatePhase.available : UpdatePhase.idle;
      status = release == null
          ? 'No published compatible release is available.'
          : newer
          ? 'Update available.'
          : 'You have the latest compatible version.';
    } catch (e) {
      if (_closed) return;
      phase = UpdatePhase.failed;
      status = e is UpdateFailure
          ? e.message
          : 'Unable to check updates. Your application remains usable.';
      if (e is UpdateFailure && e.retryAfter != null) {
        await storage.setInt(
          '${_prefix}retryAfter',
          e.retryAfter!.millisecondsSinceEpoch,
        );
      }
    }
    _notify();
  }

  Future<void> remindLater() async {
    await storage.remove('${_prefix}notification.consumed');
    await storage.setInt(
      '${_prefix}remind',
      clock().add(const Duration(hours: 6)).millisecondsSinceEpoch,
    );
    _notify();
  }

  Future<void> skip() async {
    if (release != null) {
      await storage.setString('${_prefix}skip', release!.version.key);
    }
    _notify();
  }

  Future<void> download() async {
    if (!newer ||
        phase == UpdatePhase.downloading ||
        phase == UpdatePhase.handingOff ||
        !supported) {
      return;
    }
    final selected = release!;
    final token = DownloadCancellation();
    _cancellation = token;
    metrics = null;
    verifiedFile = null;
    phase = UpdatePhase.downloading;
    status = 'Downloading verified update…';
    _notify();
    try {
      final file = await client.download(
        selected,
        await host.folder(),
        cancellation: token,
        onProgress: (value) {
          metrics = value;
          _notify();
        },
      );
      token.check();
      await host.validate(file, selected);
      token.check();
      _verifiedDigest = client.verifiedDigest;
      await verifyUnchanged(file);
      verifiedFile = file;
      phase = UpdatePhase.ready;
      status = 'SHA256 verified. Ready for your installation approval.';
    } catch (e) {
      phase = e is UpdateCancelled ? UpdatePhase.cancelled : UpdatePhase.failed;
      status = e is UpdateFailure
          ? e.message
          : 'Download failed. Retry when online.';
    } finally {
      _cancellation = null;
      _notify();
    }
  }

  void cancel() {
    _cancellation?.cancel();
  }

  Future<void> install({required bool approved}) async {
    if (!approved || !supported || phase == UpdatePhase.handingOff) return;
    if (verifiedFile == null) {
      await download();
    }
    final file = verifiedFile;
    final selected = release;
    if (file == null || selected == null || phase != UpdatePhase.ready) return;
    phase = UpdatePhase.handingOff;
    status =
        'Preparing the system installer. Installation is not yet complete.';
    _notify();
    try {
      // Re-download/integrity-check if a local file was altered after verification.
      await verifyUnchanged(file);
      await host.validate(file, selected);
      await storage.setString('${_prefix}pending', selected.version.key);
      await UpdateLifecycle.prepare?.call();
      await host.install(file, selected, restart: restart);
      status = 'System installer opened. Approve installation; choose Open afterwards if required.';
      phase = UpdatePhase.ready;
    } catch (e) {
      phase = UpdatePhase.failed;
      status = e is UpdateFailure ? e.message : 'Installer could not start. Your existing installation is still available.';
    }
    _notify();
  }

  String? _verifiedDigest;
  Future<void> verifyUnchanged(File file) async {
    final hash = await updateFileDigest(file);
    if (_verifiedDigest == null || hash != _verifiedDigest) {
      throw const UpdateFailure(
        'Verified file changed. Download it again before installing.',
      );
    }
  }

  void _notify() {
    if (!_closed) notifyListeners();
  }

  @override
  void dispose() {
    _closed = true;
    _timer?.cancel();
    _cancellation?.cancel();
    client.close();
    super.dispose();
  }
}

Future<String> updateFileDigest(File file) async =>
    (await sha256.bind(file.openRead()).first).toString();
