import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/bstv/epg_health_report.dart';

void main() {
  test('selected window coverage distinguishes missing mappings from empty schedules', () {
    final report = formatSafeEpgHealthReport(
      [],
      totalLiveChannels: 10,
      withEpgInWindow: 3,
      withoutMapping: 2,
      from: DateTime.utc(2026, 11, 24),
      to: DateTime.utc(2026, 11, 24, 4),
    );
    expect(report, contains('Usable EPG in selected window: 3'));
    expect(report, contains('No usable EPG in selected window: 7'));
    expect(report, contains('Without a resolved mapping: 2'));
    expect(report, contains('2026-11-24T04:00:00.000Z'));
  });
  test('reports source counts without leaking provider identifiers', () {
    final report = formatSafeEpgHealthReport(const [
      EpgHealthEntry(
        kind: 'xmltv',
        enabled: true,
        cachedChannels: 5,
        cachedProgrammes: 20,
        matchedChannels: 3,
        lastFetchRecorded: true,
      ),
      EpgHealthEntry(
        kind: 'xtream',
        enabled: false,
        cachedChannels: 2,
        cachedProgrammes: 0,
        matchedChannels: 0,
        lastFetchRecorded: false,
      ),
    ]);
    expect(report, contains('Cached programmes across sources: 20'));
    expect(report, contains('Live channels matched to this source: 3'));
    expect(report, contains('Mapping counts do not guarantee'));
    expect(report, isNot(contains('http://')));
  });
  test('safe report distinguishes stale feed from unmapped programmes', () {
    final report = formatSafeEpgHealthReport([
      EpgHealthEntry(
        kind: 'xmltv',
        enabled: true,
        cachedChannels: 4000,
        cachedProgrammes: 26000,
        matchedChannels: 1500,
        lastFetchRecorded: true,
        earliestProgrammeUtc: DateTime.utc(2026, 11, 18),
        latestProgrammeUtc: DateTime.utc(2026, 11, 21),
        programmesInWindow: 0,
        guideChannelsInWindow: 0,
        matchedChannelsWithCachedProgrammes: 1000,
        matchedChannelsWithWindowProgrammes: 0,
      ),
    ]);
    expect(report, contains('Latest cached end UTC: 2026-11-21'));
    expect(report, contains('Programme records overlapping selected window: 0'));
    expect(report, contains('Mapped live channels with any cached programmes: 1000'));
    expect(report, contains('Mapped live channels with programmes in window: 0'));
  });

}
