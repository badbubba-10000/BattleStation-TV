// Shared EPG coverage diagnostics for BattleStation TV and GET ETV.
// Deliberately excludes provider names, URLs, credentials, and raw errors.
class EpgHealthEntry {
  const EpgHealthEntry({
    required this.kind,
    required this.enabled,
    required this.cachedChannels,
    required this.cachedProgrammes,
    required this.matchedChannels,
    required this.lastFetchRecorded,
    this.earliestProgrammeUtc,
    this.latestProgrammeUtc,
    this.programmesInWindow = 0,
    this.guideChannelsInWindow = 0,
    this.matchedChannelsWithCachedProgrammes = 0,
    this.matchedChannelsWithWindowProgrammes = 0,
  });

  final String kind;
  final bool enabled;
  final int cachedChannels;
  final int cachedProgrammes;
  final int matchedChannels;
  final bool lastFetchRecorded;
  final DateTime? earliestProgrammeUtc;
  final DateTime? latestProgrammeUtc;
  final int programmesInWindow;
  final int guideChannelsInWindow;
  final int matchedChannelsWithCachedProgrammes;
  final int matchedChannelsWithWindowProgrammes;
}

String formatSafeEpgHealthReport(
  List<EpgHealthEntry> entries, {
  int? totalLiveChannels,
  int? withEpgInWindow,
  int? withoutMapping,
  DateTime? from,
  DateTime? to,
}) {
  final totalChannels = entries.fold<int>(
    0,
    (sum, entry) => sum + entry.cachedChannels,
  );
  final totalProgrammes = entries.fold<int>(
    0,
    (sum, entry) => sum + entry.cachedProgrammes,
  );
  final buffer = StringBuffer()
    ..writeln('EPG HEALTH REPORT — SAFE COUNTS ONLY')
    ..writeln('Sources: ${entries.length}')
    ..writeln('Cached guide channels across sources: $totalChannels')
    ..writeln('Cached programmes across sources: $totalProgrammes')
    ..writeln(
      'These are source totals, not unique IPTV channels or programmes.',
    )
    ..writeln('Mapping counts do not guarantee current-time listings.')
    ..writeln();
  if (totalLiveChannels != null) {
    buffer
      ..writeln('Live channels in selected playlist scope: $totalLiveChannels')
      ..writeln('Usable EPG in selected window: ${withEpgInWindow ?? 0}')
      ..writeln(
        'No usable EPG in selected window: ${totalLiveChannels - (withEpgInWindow ?? 0)}',
      )
      ..writeln('Without a resolved mapping: ${withoutMapping ?? 0}')
      ..writeln(
        'Coverage is measured before Favorites/Category/Search filters.',
      );
  }
  if (from != null && to != null) {
    buffer.writeln(
      'Guide window UTC: ${from.toUtc().toIso8601String()} to ${to.toUtc().toIso8601String()}',
    );
  }
  for (var i = 0; i < entries.length; i++) {
    final entry = entries[i];
    buffer
      ..writeln(
        'Source ${i + 1} (${{'xmltv', 'xtream'}.contains(entry.kind) ? entry.kind : 'other'})',
      )
      ..writeln('  Enabled: ${entry.enabled}')
      ..writeln('  Last successful fetch recorded: ${entry.lastFetchRecorded}')
      ..writeln('  Cached EPG channel records: ${entry.cachedChannels}')
      ..writeln('  Cached EPG programme records: ${entry.cachedProgrammes}')
      ..writeln(
        '  Live channels matched to this source: ${entry.matchedChannels}',
      )
      ..writeln('  Earliest cached start UTC: ${entry.earliestProgrammeUtc?.toUtc().toIso8601String() ?? 'none'}')
      ..writeln('  Latest cached end UTC: ${entry.latestProgrammeUtc?.toUtc().toIso8601String() ?? 'none'}')
      ..writeln('  Programme records overlapping selected window: ${entry.programmesInWindow}')
      ..writeln('  Guide channels with programmes in window: ${entry.guideChannelsInWindow}')
      ..writeln('  Mapped live channels with any cached programmes: ${entry.matchedChannelsWithCachedProgrammes}')
      ..writeln('  Mapped live channels with programmes in window: ${entry.matchedChannelsWithWindowProgrammes}');
  }
  buffer
    ..writeln()
    ..writeln('If cached programmes are zero, check EPG source refresh/import.')
    ..writeln(
      'If programmes exist but matches are zero, check channel mapping.',
    )
    ..writeln(
      'If both exist, check programme dates/time zone and guide filters.',
    )
    ..writeln(
      'No provider URLs, names, secrets, or raw error messages are included.',
    );
  return buffer.toString();
}
