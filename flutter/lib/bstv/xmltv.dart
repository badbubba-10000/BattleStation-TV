// BattleStation TV, 2026. GPLv3; see BSTV-NOTICE.md.
import 'dart:convert';

import 'package:xml/xml.dart';
import 'package:xml/xml_events.dart';

import 'feature_models.dart';

/// XMLTV defines an omitted timezone as UTC (xmltv.dtd). Explicit offsets are
/// applied per programme; ambiguous named zones are not guessed.
DateTime xmltvTime(String value) {
  var normalized = value.trim();
  if (RegExp(r'^\d{12}(?:\d{2})?$').hasMatch(normalized)) {
    normalized += ' +0000';
  }
  normalized = normalized.replaceFirst(RegExp(r'\s*(?:UTC|GMT|Z)$'), ' +0000');
  final match = RegExp(
    r'^(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})?\s*([+-])(\d{2}):?(\d{2})$',
  ).firstMatch(normalized);
  if (match == null) {
    throw const FormatException('Guide time requires a UTC offset');
  }
  int n(int i) => int.parse(match[i]!);
  final year = n(1), month = n(2), day = n(3), hour = n(4), minute = n(5);
  final second = match[6] == null ? 0 : n(6);
  final time = DateTime.utc(year, month, day, hour, minute, second);
  if (time.year != year ||
      time.month != month ||
      time.day != day ||
      hour > 23 ||
      minute > 59 ||
      second > 59 ||
      n(8) > 14 ||
      n(9) > 59 ||
      (n(8) == 14 && n(9) != 0)) {
    throw const FormatException('Invalid guide timestamp');
  }
  final offset = Duration(
    minutes: (n(8) * 60 + n(9)) * (match[7] == '+' ? 1 : -1),
  );
  return time.subtract(offset);
}

/// Bounded streaming subtree parser: no whole-document DOM and no external
/// entity resolution. Invalid programmes are skipped; malformed XML fails the
/// import so the last successful cache can remain available.
Future<ParsedGuide> parseXmltv(
  Stream<List<int>> input,
  String source, {
  int maxBytes = 64 * 1024 * 1024,
  int maxProgrammes = 250000,
  DateTime? retainFrom,
  DateTime? retainUntil,
}) async {
  var bytes = 0, skipped = 0, outsideWindow = 0;
  final channels = <String, GuideChannel>{};
  final programmes = <String, GuideProgramme>{};
  final drafts = <Map<String, dynamic>>[];
  final bounded = input.map((chunk) {
    bytes += chunk.length;
    if (bytes > maxBytes) {
      throw const FormatException('Guide exceeds size limit');
    }
    return chunk;
  });
  var rootSeen = false;
  final trees = bounded
      .transform(utf8.decoder)
      .transform(XmlEventDecoder(validateDocument: true, validateNesting: true))
      .map((events) {
        for (final event in events) {
          if (!rootSeen && event is XmlStartElementEvent) {
            rootSeen = true;
            if (event.name != 'tv') {
              throw const FormatException('Expected an XMLTV document');
            }
          }
        }
        return events;
      })
      .normalizeEvents()
      .selectSubtreeEvents(
        (event) => event.name == 'channel' || event.name == 'programme',
      )
      .toXmlNodes();
  var count = 0;
  await for (final nodes in trees) {
    for (final node in nodes.whereType<XmlElement>()) {
      String text(String tag) => node.getElement(tag)?.innerText.trim() ?? '';
      if (node.name.local == 'channel') {
        final id = node.getAttribute('id');
        if (id != null && id.isNotEmpty) {
          if (channels.length >= 50000 && !channels.containsKey(id)) {
            throw const FormatException('Too many guide channels');
          }
          channels[id] = GuideChannel(
            sourceId: source,
            id: id,
            name: text('display-name').isEmpty ? id : text('display-name'),
          );
        }
      } else {
        if (++count > maxProgrammes) {
          throw const FormatException('Too many guide programmes');
        }
        try {
          final channel = node.getAttribute('channel'), title = text('title');
          if (channel == null || channel.isEmpty || title.isEmpty) {
            throw const FormatException();
          }
          final start = xmltvTime(node.getAttribute('start') ?? '');
          final stop = node.getAttribute('stop');
          DateTime? end;
          if (stop != null && stop.trim().isNotEmpty) {
            end = xmltvTime(stop);
          } else {
            final length = node.getElement('length');
            final value = double.tryParse(length?.innerText.trim() ?? '');
            final multiplier = switch (length?.getAttribute('units')) {
              'seconds' => 1,
              'minutes' => 60,
              'hours' => 3600,
              _ => null,
            };
            if (value != null &&
                value.isFinite &&
                value > 0 &&
                multiplier != null &&
                value * multiplier <= 7 * 86400) {
              end = start.add(Duration(seconds: (value * multiplier).round()));
            }
          }
          drafts.add({
            'source': source,
            'channel': channel,
            'title': title,
            'start': start.millisecondsSinceEpoch,
            'end': end?.millisecondsSinceEpoch,
            'description': text('desc'),
            'category': text('category'),
            'artwork': node.getElement('icon')?.getAttribute('src'),
            'episode': text('episode-num').isEmpty ? null : text('episode-num'),
            'seriesId': _seriesId(node),
          });
        } on FormatException {
          skipped++;
        }
      }
    }
  }
  if (!rootSeen) throw const FormatException('Empty XMLTV document');
  // stop is optional in XMLTV. Infer only from an explicit length or the next
  // distinct programme start on the same channel, independent of feed ordering.
  drafts.sort((a, b) => (b['start'] as int).compareTo(a['start'] as int));
  final nextStart = <String, int>{}, nextDistinct = <String, int?>{};
  for (final draft in drafts) {
    final channel = draft['channel'] as String, start = draft['start'] as int;
    if (nextStart[channel] != start) nextDistinct[channel] = nextStart[channel];
    nextStart[channel] = start;
    final end = draft['end'] ?? nextDistinct[channel];
    if (end == null) {
      skipped++;
      continue;
    }
    try {
      final programme = GuideProgramme.fromJson({...draft, 'end': end});
      if (!channels.containsKey(programme.channelId)) {
        if (channels.length >= 50000) {
          throw const FormatException('Too many guide channels');
        }
        channels[programme.channelId] = GuideChannel(
          sourceId: source,
          id: programme.channelId,
          name: programme.channelId,
        );
      }
      if ((retainFrom == null || programme.end.isAfter(retainFrom)) &&
          (retainUntil == null || programme.start.isBefore(retainUntil))) {
        programmes[programme.id] = programme;
      } else {
        outsideWindow++;
      }
    } on FormatException {
      skipped++;
    }
  }
  return ParsedGuide(
    channels.values.toList(),
    programmes.values.toList(),
    skipped: skipped,
    outsideWindow: outsideWindow,
  );
}

String? _seriesId(XmlElement programme) {
  // DD programme IDs explicitly distinguish series episodes from movies.
  // Do not infer series identity from a repeated programme title.
  for (final episode in programme.findElements('episode-num')) {
    final value = episode.innerText.trim();
    if (episode.getAttribute('system') == 'dd_progid' &&
        RegExp(r'^EP\d+\.\d+$').hasMatch(value)) {
      return value.split('.').first;
    }
  }
  return null;
}

String normalizedGuideName(String name) =>
    name.toLowerCase().replaceAll(RegExp(r'[^\p{L}\p{N}]', unicode: true), '');

/// Only unique exact identifiers or unique normalized names are safe matches.
GuideChannel? matchGuideChannel(
  Iterable<GuideChannel> candidates, {
  String? tvgId,
  String? providerId,
  required String name,
}) {
  final all = candidates.toList();
  for (final id in [tvgId, providerId]) {
    if (id == null || id.isEmpty) continue;
    final exact = all.where((c) => c.id == id).toList();
    if (exact.length == 1) return exact.single;
    if (exact.length > 1) return null;
  }
  final normalized = normalizedGuideName(name);
  if (normalized.isEmpty) return null;
  final matches = all
      .where((c) => normalizedGuideName(c.name) == normalized)
      .toList();
  return matches.length == 1 ? matches.single : null;
}
