// BattleStation TV, 2026. GPLv3; see BSTV-NOTICE.md.
import 'dart:convert';

import 'feature_models.dart';

String decodeEpgText(Object? raw) {
  final text = raw?.toString() ?? '';
  try {
    final decoded = utf8.decode(base64.decode(text));
    return decoded.isNotEmpty &&
            !RegExp(r'[\x00-\x08\x0b\x0c\x0e-\x1f]').hasMatch(decoded)
        ? decoded
        : text;
  } on FormatException {
    return text;
  }
}

DateTime? _epoch(Object? raw) {
  final number = raw is num ? raw.toDouble() : double.tryParse('$raw');
  if (number == null || !number.isFinite || number <= 0) return null;
  final milliseconds = number > 100000000000
      ? number.round()
      : (number * 1000).round();
  if (milliseconds < 0 || milliseconds > 4102444800000) return null;
  return DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: true);
}

/// Panels use both stop_timestamp and end_timestamp, sometimes milliseconds.
/// Epoch fields carry unambiguous timezone information. Local date strings are
/// accepted only with an explicit offset; guessing them can shift DST schedules.
DateTime? _time(Map entry, List<String> epochs, List<String> dates) {
  for (final key in epochs) {
    final time = _epoch(entry[key]);
    if (time != null) return time;
  }
  for (final key in dates) {
    final text = entry[key]?.toString();
    if (text != null && RegExp(r'(Z|[+-]\d{2}:?\d{2})$').hasMatch(text)) {
      final parsed = DateTime.tryParse(text);
      if (parsed != null) return parsed.toUtc();
    }
  }
  return null;
}

ParsedGuide parseXtreamEpg(Object? response, String source, String channel) {
  if (response is Map && response['user_info'] is Map) {
    final auth = (response['user_info'] as Map)['auth'];
    if (auth == 0 || auth == '0' || auth == false) {
      throw StateError(
        'EPG authentication rejected by the provider; check account access',
      );
    }
  }
  if (response is! Map || response['epg_listings'] is! List) {
    throw const FormatException('Missing EPG listings');
  }
  final programmes = <String, GuideProgramme>{};
  var skipped = 0;
  for (final entry in (response['epg_listings'] as List)) {
    if (entry is! Map) {
      skipped++;
      continue;
    }
    final start = _time(entry, ['start_timestamp'], ['start']);
    final end = _time(
      entry,
      ['stop_timestamp', 'end_timestamp'],
      ['end', 'stop'],
    );
    final title = decodeEpgText(entry['title']).trim();
    if (start == null || end == null || title.isEmpty) {
      skipped++;
      continue;
    }
    try {
      final programme = GuideProgramme(
        sourceId: source,
        channelId: channel,
        title: title,
        description: decodeEpgText(entry['description']),
        start: start,
        end: end,
      );
      programmes[programme.id] = programme;
    } on FormatException {
      skipped++;
    }
  }
  return ParsedGuide(const [], programmes.values.toList(), skipped: skipped);
}
