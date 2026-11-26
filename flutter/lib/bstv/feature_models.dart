// BattleStation TV, 2026. GPLv3; see BSTV-NOTICE.md.
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:iptvmac/core/models.dart';

String stableKey(String value) => sha256.convert(utf8.encode(value)).toString();
String channelKey(Item item) => stableKey('${item.accountId}|${item.streamId}');
String featureId() {
  final random = Random.secure();
  return List.generate(
    16,
    (_) => random.nextInt(256),
  ).map((n) => n.toRadixString(16).padLeft(2, '0')).join();
}

enum GuideSourceKind { xtream, xmltv }

class GuideSource {
  const GuideSource({
    required this.id,
    required this.name,
    required this.kind,
    this.accountId,
    this.enabled = true,
    this.intervalMinutes = 60,
    this.lastFetch,
    this.etag,
    this.modified,
    this.error,
  });
  final String id, name;
  final GuideSourceKind kind;
  final int? accountId;
  final bool enabled;
  final int intervalMinutes;
  final DateTime? lastFetch;
  final String? etag, modified, error;
  Map<String, Object?> toJson() => {
    'id': id,
    'name': name,
    'kind': kind.name,
    'accountId': accountId,
    'enabled': enabled,
    'interval': intervalMinutes,
    'lastFetch': lastFetch?.toUtc().millisecondsSinceEpoch,
    'etag': etag,
    'modified': modified,
    'error': error,
  };
  factory GuideSource.fromJson(Map<String, dynamic> j) => GuideSource(
    id: j['id'],
    name: j['name'],
    kind: GuideSourceKind.values.byName(j['kind']),
    accountId: j['accountId'],
    enabled: j['enabled'] ?? true,
    intervalMinutes: j['interval'] ?? 60,
    lastFetch: j['lastFetch'] == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(j['lastFetch'], isUtc: true),
    etag: j['etag'],
    modified: j['modified'],
    error: j['error'],
  );
  GuideSource refreshed(
    DateTime now, {
    String? etag,
    String? modified,
    String? error,
  }) => GuideSource(
    id: id,
    name: name,
    kind: kind,
    accountId: accountId,
    enabled: enabled,
    intervalMinutes: intervalMinutes,
    lastFetch: now,
    etag: etag ?? this.etag,
    modified: modified ?? this.modified,
    error: error,
  );
}

class GuideChannel {
  const GuideChannel({
    required this.sourceId,
    required this.id,
    required this.name,
  });
  final String sourceId, id, name;
}

class GuideProgramme {
  GuideProgramme({
    required this.sourceId,
    required this.channelId,
    required this.title,
    required DateTime start,
    required DateTime end,
    this.description = '',
    this.category = '',
    this.artwork,
    this.episode,
    this.seriesId,
  }) : start = start.toUtc(),
       end = end.toUtc() {
    if (!this.end.isAfter(this.start) ||
        this.end.difference(this.start) > const Duration(days: 7)) {
      throw const FormatException('Invalid guide interval');
    }
  }
  final String sourceId, channelId, title, description, category;
  final String? artwork, episode, seriesId;
  final DateTime start, end;
  String get id => stableKey(
    '$sourceId|$channelId|${start.millisecondsSinceEpoch}|${end.millisecondsSinceEpoch}|$title',
  );
  bool current(DateTime now) =>
      !now.toUtc().isBefore(start) && now.toUtc().isBefore(end);
  double progress(DateTime now) =>
      (now.toUtc().difference(start).inMilliseconds /
              end.difference(start).inMilliseconds)
          .clamp(0, 1);
  Map<String, Object?> toJson() => {
    'source': sourceId,
    'channel': channelId,
    'title': title,
    'description': description,
    'category': category,
    'artwork': artwork,
    'episode': episode,
    'seriesId': seriesId,
    'start': start.millisecondsSinceEpoch,
    'end': end.millisecondsSinceEpoch,
  };
  factory GuideProgramme.fromJson(Map<String, dynamic> j) => GuideProgramme(
    sourceId: j['source'],
    channelId: j['channel'],
    title: j['title'],
    description: j['description'] ?? '',
    category: j['category'] ?? '',
    artwork: j['artwork'],
    episode: j['episode'],
    seriesId: j['seriesId'],
    start: DateTime.fromMillisecondsSinceEpoch(j['start'], isUtc: true),
    end: DateTime.fromMillisecondsSinceEpoch(j['end'], isUtc: true),
  );
}

class ParsedGuide {
  const ParsedGuide(
    this.channels,
    this.programmes, {
    this.skipped = 0,
    this.outsideWindow = 0,
  });
  final List<GuideChannel> channels;
  final List<GuideProgramme> programmes;
  final int skipped;
  final int outsideWindow;
}

enum RecordingState {
  scheduled,
  recording,
  completed,
  stopped,
  cancelled,
  failed,
  missed,
}

enum RecordingRepeat { none, daily, weekly }

class RecordingJob {
  RecordingJob({
    required this.id,
    required this.accountId,
    required this.channelKey,
    required this.channelName,
    required this.title,
    required DateTime start,
    required DateTime end,
    required this.directory,
    this.programmeId,
    this.state = RecordingState.scheduled,
    this.repeat = RecordingRepeat.none,
    this.paddingBefore = 0,
    this.paddingAfter = 0,
    this.path,
    this.bytes = 0,
    this.error,
    this.createdByRule,
  }) : start = start.toUtc(),
       end = end.toUtc() {
    if (!this.end.isAfter(this.start) ||
        this.end.difference(this.start) > const Duration(days: 1) ||
        paddingBefore < 0 ||
        paddingBefore > 120 ||
        paddingAfter < 0 ||
        paddingAfter > 120) {
      throw const FormatException('Invalid recording interval');
    }
  }
  final String id, channelKey, channelName, title, directory;
  final int accountId, paddingBefore, paddingAfter;
  final DateTime start, end;
  final String? programmeId, createdByRule;
  final RecordingRepeat repeat;
  RecordingState state;
  String? path, error;
  int bytes;
  DateTime get captureStart => start.subtract(Duration(minutes: paddingBefore));
  DateTime get captureEnd => end.add(Duration(minutes: paddingAfter));
  bool get terminal =>
      ![RecordingState.scheduled, RecordingState.recording].contains(state);
  Map<String, Object?> toJson() => {
    'id': id,
    'accountId': accountId,
    'channelKey': channelKey,
    'channelName': channelName,
    'title': title,
    'directory': directory,
    'programmeId': programmeId,
    'state': state.name,
    'repeat': repeat.name,
    'before': paddingBefore,
    'after': paddingAfter,
    'path': path,
    'bytes': bytes,
    'error': error,
    'rule': createdByRule,
    'start': start.millisecondsSinceEpoch,
    'end': end.millisecondsSinceEpoch,
  };
  factory RecordingJob.fromJson(Map<String, dynamic> j) => RecordingJob(
    id: j['id'],
    accountId: j['accountId'],
    channelKey: j['channelKey'],
    channelName: j['channelName'],
    title: j['title'],
    directory: j['directory'],
    programmeId: j['programmeId'],
    state: RecordingState.values.byName(j['state']),
    repeat: RecordingRepeat.values.byName(j['repeat'] ?? 'none'),
    paddingBefore: j['before'] ?? 0,
    paddingAfter: j['after'] ?? 0,
    path: j['path'],
    bytes: j['bytes'] ?? 0,
    error: j['error'],
    createdByRule: j['rule'],
    start: DateTime.fromMillisecondsSinceEpoch(j['start'], isUtc: true),
    end: DateTime.fromMillisecondsSinceEpoch(j['end'], isUtc: true),
  );
}
