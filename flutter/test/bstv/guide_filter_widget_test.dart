import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/bstv/core_services.dart';
import 'package:iptvmac/bstv/feature_models.dart';
import 'package:iptvmac/bstv/feature_store.dart';
import 'package:iptvmac/bstv/guide_filter.dart';
import 'package:iptvmac/bstv/guide_screen.dart';
import 'package:iptvmac/bstv/guide_service.dart';
import 'package:iptvmac/core/models.dart';

import '../app/harness.dart';

void main() {
  testWidgets(
    'toolbar counts, Hide Empty, cached updates, persistence, reset and no filter downloads',
    (tester) async {
      final h = await Harness.create(tester, withAccount: true);
      final store = FeatureStore(':memory:');
      var requests = 0;
      final core = CoreServices(
        store,
        h.model,
        'unused',
        MemoryGuideSecrets(),
        guideClient: MockClient((_) async {
          requests++;
          return http.Response('', 500);
        }),
      );
      final now = DateTime.now();
      final items = <Item>[];
      store.saveSource(
        const GuideSource(
          id: 'xml',
          name: 'Fixture',
          kind: GuideSourceKind.xmltv,
        ),
      );
      for (var i = 0; i < 40; i++) {
        final item = h.db.write(
          (db) => Item(
            accountId: h.model.account!.id!,
            type: ItemType.live,
            name: 'Channel ${i.toString().padLeft(3, '0')}',
            streamId: '$i',
          ).insert(db),
        );
        items.add(item);
        final channel = GuideChannel(
          sourceId: 'xml',
          id: '$i',
          name: item.name,
        );
        store.putChannel(channel);
        store.mapChannel(channelKey(item), channel);
      }
      List<GuideProgramme> programmes(int count) => [
        for (var i = 0; i < count; i++)
          GuideProgramme(
            sourceId: 'xml',
            channelId: '$i',
            title: 'Programme $i',
            start: now,
            end: now.add(const Duration(hours: 1)),
          ),
      ];
      store.replacePrograms('xml', programmes(30));
      // Initial load is deferred; selecting No EPG exposes previously unbuilt rows.
      h.model.syncing = true;
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(1440, 900);
      addTearDown(tester.view.reset);
      Widget host(Key key) => MultiProvider(
        providers: [
          ChangeNotifierProvider<LibraryModel>.value(value: h.model),
          ChangeNotifierProvider<CoreServices>.value(value: core),
        ],
        child: MaterialApp(
          home: Scaffold(body: GuideScreen(key: key)),
        ),
      );
      await tester.pumpWidget(host(const ValueKey('first')));
      await tester.pump();
      h.model.syncing = false;
      expect(find.text('All Channels (40)'), findsOneWidget);
      await tester.ensureVisible(find.text('Hide empty'));
      await tester.tap(find.text('Hide empty'));
      await tester.pump();
      await tester.ensureVisible(find.byKey(const Key('epg-availability')));
      await tester.tap(find.byKey(const Key('epg-availability')));
      await tester.pumpAndSettle();
      await tester.tap(find.text('No EPG (10)').last);
      await tester.pumpAndSettle();
      var dropdown = tester.widget<DropdownButton<EpgAvailability>>(
        find.byKey(const Key('epg-availability')),
      );
      expect(dropdown.value, EpgAvailability.noEpg);
      final chip = tester.widget<FilterChip>(
        find.widgetWithText(FilterChip, 'Hide empty'),
      );
      expect(chip.selected, isFalse);
      expect(chip.onSelected, isNull);
      expect(requests, 0);
      expect(
        (store.setting('guidePreferences') as Map)['availability'],
        'noEpg',
      );
      store.replacePrograms('xml', programmes(31));
      core.guide.map(
        items[30],
        const GuideChannel(sourceId: 'xml', id: '30', name: 'Channel 030'),
      );
      await tester.pump();
      expect(find.text('No EPG (9)'), findsOneWidget);
      h.model.syncing = true;
      await tester.pumpWidget(host(const ValueKey('reopened')));
      await tester.pump();
      dropdown = tester.widget<DropdownButton<EpgAvailability>>(
        find.byKey(const Key('epg-availability')),
      );
      expect(dropdown.value, EpgAvailability.noEpg);
      await tester.tap(find.byKey(const Key('reset-guide-filters')));
      await tester.pump();
      dropdown = tester.widget<DropdownButton<EpgAvailability>>(
        find.byKey(const Key('epg-availability')),
      );
      expect(dropdown.value, EpgAvailability.all);
      expect((store.setting('guidePreferences') as Map)['availability'], 'all');
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
      core.dispose();
      store.close();
      h.model.dispose();
      h.db.close();
    },
  );
}
