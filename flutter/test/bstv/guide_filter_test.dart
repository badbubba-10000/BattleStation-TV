import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/bstv/feature_models.dart';
import 'package:iptvmac/bstv/feature_store.dart';
import 'package:iptvmac/bstv/guide_filter.dart';
import 'package:iptvmac/bstv/guide_service.dart';
import 'package:iptvmac/core/models.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;

import '../app/harness.dart';

void main() {
  test('duplicate global XMLTV IDs prefer the playlist-scoped feed without overriding manual mappings', () async {
    final h = await Harness.createPlain(withAccount: true);
    final store = FeatureStore(':memory:');
    final guide = GuideService(store, h.model, MemoryGuideSecrets());
    addTearDown(() {
      guide.dispose();
      store.close();
      h.model.dispose();
      h.db.close();
    });
    final item = Item(
      accountId: h.model.account!.id!,
      type: ItemType.live,
      name: 'Channel',
      streamId: '42',
      epgChannelId: 'same-id',
    );
    store.saveSource(
      const GuideSource(
        id: 'global',
        name: 'Global',
        kind: GuideSourceKind.xmltv,
      ),
    );
    store.saveSource(
      GuideSource(
        id: 'scoped',
        name: 'Scoped',
        kind: GuideSourceKind.xmltv,
        accountId: item.accountId,
      ),
    );
    const global = GuideChannel(
      sourceId: 'global',
      id: 'same-id',
      name: 'Channel',
    );
    const scoped = GuideChannel(
      sourceId: 'scoped',
      id: 'same-id',
      name: 'Channel',
    );
    store.putChannel(global);
    store.putChannel(scoped);
    expect(guide.mapping(item)?.sourceId, 'scoped');
    guide.map(item, global);
    expect(guide.mapping(item)?.sourceId, 'global');
  });
  test('availability counts update after actual feed refresh and source enable changes', () async {
    final h = await Harness.createPlain();
    final store = FeatureStore(':memory:');
    final now = DateTime.now().toUtc();
    String stamp(DateTime t) =>
        t.toIso8601String().split('.').first.replaceAll(RegExp('[-T:]'), '');
    var count = 1, requests = 0;
    final guide = GuideService(
      store,
      h.model,
      MemoryGuideSecrets(),
      client: MockClient((_) async {
        requests++;
        return http.Response(
          '<tv><channel id="one"><display-name>One</display-name></channel><channel id="two"><display-name>Two</display-name></channel>${[
            for (final id in ['one', 'two'].take(count)) '<programme channel="$id" start="${stamp(now)}" stop="${stamp(now.add(const Duration(hours: 1)))}"><title>Programme</title></programme>',
          ].join()}</tv>',
          200,
        );
      }),
    );
    addTearDown(() {
      guide.dispose();
      store.close();
      h.model.dispose();
      h.db.close();
    });
    final items = [
      Item(
        accountId: 1,
        type: ItemType.live,
        name: 'One',
        streamId: '1',
        epgChannelId: 'one',
      ),
      Item(
        accountId: 1,
        type: ItemType.live,
        name: 'Two',
        streamId: '2',
        epgChannelId: 'two',
      ),
    ];
    await guide.addXmltv('Fixture', 'https://fixture.invalid/epg');
    final source = guide.sources.single;
    expect(
      guide
          .availableChannelKeys(items, now, now.add(const Duration(hours: 2)))
          .length,
      1,
    );
    count = 2;
    await guide.refresh(source.id);
    expect(
      guide
          .availableChannelKeys(items, now, now.add(const Duration(hours: 2)))
          .length,
      2,
    );
    await guide.updateSource(
      guide.sources.single,
      name: 'Fixture',
      enabled: false,
      interval: 60,
    );
    expect(
      guide.availableChannelKeys(items, now, now.add(const Duration(hours: 2))),
      isEmpty,
    );
    expect(requests, 2);
  });
  test('cached availability handles 5000 mapped channels without fetching providers', () async {
    final h = await Harness.createPlain();
    final store = FeatureStore(':memory:');
    var requests = 0;
    final guide = GuideService(
      store,
      h.model,
      MemoryGuideSecrets(),
      client: MockClient((_) async {
        requests++;
        return http.Response('', 500);
      }),
    );
    addTearDown(() {
      guide.dispose();
      store.close();
      h.model.dispose();
      h.db.close();
    });
    store.saveSource(
      const GuideSource(
        id: 'large',
        name: 'Large fixture',
        kind: GuideSourceKind.xmltv,
      ),
    );
    final now = DateTime.utc(2026, 11, 23), end = DateTime.utc(2026, 11, 24);
    final items = List.generate(
      5000,
      (i) => Item(
        accountId: 1,
        type: ItemType.live,
        name: 'Channel $i',
        streamId: '$i',
      ),
    );
    store.transaction(() {
      for (var i = 0; i < items.length; i++) {
        final mapped = GuideChannel(
          sourceId: 'large',
          id: '$i',
          name: items[i].name,
        );
        store.putChannel(mapped);
        store.mapChannel(channelKey(items[i]), mapped);
      }
    });
    store.replacePrograms('large', [
      for (var i = 0; i < items.length; i += 2)
        GuideProgramme(
          sourceId: 'large',
          channelId: '$i',
          title: 'Programme',
          start: now,
          end: end,
        ),
    ]);
    final available = guide.availableChannelKeys(items, now, end);
    expect(available.length, 2500);
    final result = filterGuideChannels(
      items,
      available: available,
      searchMatches: available,
      availability: EpgAvailability.noEpg,
    );
    expect((result.total, result.hasEpg, result.noEpg), (5000, 2500, 2500));
    expect(requests, 0);
  });
  Item channel(int n, {String category = 'news'}) => Item(
    accountId: 1,
    type: ItemType.live,
    name: 'Channel $n',
    streamId: '$n',
    categoryId: category,
  );
  test('availability, favorites, categories, search and Hide Empty combine consistently', () {
    final a = channel(1), b = channel(2), c = channel(3, category: 'sport');
    final available = {channelKey(a), channelKey(c)};
    GuideFilterResult apply({
      EpgAvailability mode = EpgAvailability.all,
      bool hide = false,
      bool favorites = false,
      String category = '',
      bool search = false,
    }) => filterGuideChannels(
      [a, b, c],
      available: available,
      searchMatches: {channelKey(c)},
      availability: mode,
      hideEmpty: hide,
      favoritesOnly: favorites,
      favorites: {channelKey(a), channelKey(b)},
      category: category,
      searching: search,
    );
    expect(apply().channels, [a, b, c]);
    expect(apply(mode: EpgAvailability.hasEpg).channels, [a, c]);
    expect(apply(mode: EpgAvailability.noEpg, hide: true).channels, [b]);
    final result = apply(favorites: true, category: 'news');
    expect((result.total, result.hasEpg, result.noEpg), (2, 1, 1));
    expect(
      apply(
        mode: EpgAvailability.noEpg,
        favorites: true,
        category: 'news',
      ).channels,
      [b],
    );
    expect(apply(hide: true).channels, [a, c]);
    expect(apply(search: true).channels, [c]);
    expect(apply(search: true, mode: EpgAvailability.noEpg).channels, isEmpty);
    expect(EpgAvailability.restore('noEpg'), EpgAvailability.noEpg);
    expect(EpgAvailability.restore('invalid'), EpgAvailability.all);
  });
  test('real cached programmes determine availability; mappings alone and out-of-window entries do not', () async {
    final h = await Harness.createPlain();
    final store = FeatureStore(':memory:');
    var requests = 0;
    final guide = GuideService(
      store,
      h.model,
      MemoryGuideSecrets(),
      client: MockClient((_) async {
        requests++;
        return http.Response('', 500);
      }),
    );
    addTearDown(() {
      guide.dispose();
      store.close();
      h.model.dispose();
      h.db.close();
    });
    store.saveSource(
      const GuideSource(id: 'xml', name: 'Guide', kind: GuideSourceKind.xmltv),
    );
    final items = List.generate(5, channel);
    for (var n = 0; n < 4; n++) {
      final c = GuideChannel(sourceId: 'xml', id: '$n', name: 'Guide $n');
      store.putChannel(c);
      store.mapChannel(channelKey(items[n]), c);
    }
    final now = DateTime.utc(2026, 11, 23, 12),
        end = DateTime.utc(2026, 11, 23, 13);
    GuideProgramme p(
      String id,
      DateTime start,
      DateTime stop, {
      String title = 'Bulletin',
    }) => GuideProgramme(
      sourceId: 'xml',
      channelId: id,
      title: title,
      start: start,
      end: stop,
    );
    store.replacePrograms('xml', [
      p('0', now, end),
      p(
        '2',
        now.subtract(const Duration(days: 1)),
        end.subtract(const Duration(days: 1)),
      ),
      p('3', now, end, title: ''),
    ]);
    expect(guide.availableChannelKeys(items, now, end), {channelKey(items[0])});
    expect(
      guide.availableChannelKeys(items, end, end.add(const Duration(hours: 1))),
      isEmpty,
    );
    expect(
      guide.emptyState(items[1], now, end),
      contains('No EPG in selected time range'),
    );
    expect(guide.emptyState(items[2], now, end), contains('other dates'));
    expect(guide.emptyState(items[4], now, end), contains('No EPG mapping'));
    store.replacePrograms('xml', [p('0', now, end), p('1', now, end)]);
    guide.map(
      items[1],
      const GuideChannel(sourceId: 'xml', id: '1', name: 'Guide 1'),
    );
    expect(guide.availableChannelKeys(items, now, end), {
      channelKey(items[0]),
      channelKey(items[1]),
    });
    expect(
      guide.availableChannelKeys(items, now, end, search: 'absent'),
      isEmpty,
    );
    expect(requests, 0);
  });
  test('thousands of channels filter in one pass without changing input', () {
    final channels = List.generate(10000, channel);
    final available = {
      for (var i = 0; i < channels.length; i += 2) channelKey(channels[i]),
    };
    final result = filterGuideChannels(
      channels,
      available: available,
      searchMatches: available,
      availability: EpgAvailability.noEpg,
    );
    expect((result.total, result.hasEpg, result.noEpg), (10000, 5000, 5000));
    expect(result.channels.length, 5000);
    expect(channels.length, 10000);
  });
}
