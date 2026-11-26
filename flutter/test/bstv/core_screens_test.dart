import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/bstv/core_services.dart';
import 'package:iptvmac/bstv/feature_models.dart';
import 'package:iptvmac/bstv/feature_store.dart';
import 'package:iptvmac/bstv/guide_service.dart';
import 'package:iptvmac/bstv/guide_screen.dart';
import 'package:iptvmac/bstv/dvr_screen.dart';
import 'package:iptvmac/core/models.dart';

import '../app/harness.dart';

void main() {
  for (final size in [
    const Size(390, 844),
    const Size(800, 600),
    const Size(1440, 900),
  ]) {
    testWidgets(
      'guide and DVR fit ${size.width.toInt()} px and schedule a real persistent job',
      (tester) async {
        final h = await Harness.create(tester, withAccount: true, sync: true);
        h.model.accounts.single.kind = AccountKind
            .m3u; // Suppress provider API; use explicit cached mapping.
        final store = FeatureStore(':memory:');
        final core = CoreServices(
          store,
          h.model,
          'test-recordings',
          MemoryGuideSecrets(),
        );
        final channel = h.db
            .read(
              (db) => Item.fromRows(
                db.select('SELECT * FROM item WHERE type=? ORDER BY id', [
                  'live',
                ]),
              ),
            )
            .first;
        final now = DateTime.now();
        final programme = GuideProgramme(
          sourceId: 'fixture',
          channelId: 'news',
          title: 'Upcoming fixture bulletin',
          description: 'A synthetic description used only in tests.',
          start: now.add(const Duration(minutes: 10)),
          end: now.add(const Duration(minutes: 50)),
        );
        store.saveSource(
          const GuideSource(
            id: 'fixture',
            name: 'Fixture XMLTV',
            kind: GuideSourceKind.xmltv,
          ),
        );
        store.putChannel(
          const GuideChannel(sourceId: 'fixture', id: 'news', name: 'News'),
        );
        store.mapChannel(
          channelKey(channel),
          const GuideChannel(sourceId: 'fixture', id: 'news', name: 'News'),
        );
        store.replacePrograms('fixture', [programme]);
        tester.view.devicePixelRatio = 1;
        tester.view.physicalSize = size;
        addTearDown(tester.view.reset);
        Widget host(Widget screen) => MultiProvider(
          providers: [
            ChangeNotifierProvider<LibraryModel>.value(value: h.model),
            ChangeNotifierProvider<CoreServices>.value(value: core),
          ],
          child: MaterialApp(home: Scaffold(body: screen)),
        );
        await tester.pumpWidget(host(const GuideScreen()));
        await tester.pump();
        expect(tester.takeException(), isNull);
        expect(find.text(programme.title), findsOneWidget);
        if (size.width < 600) {
          await tester.drag(
            find.byWidgetPredicate(
              (widget) =>
                  widget is SingleChildScrollView &&
                  widget.scrollDirection == Axis.horizontal,
            ),
            const Offset(-250, 0),
          );
          await tester.pumpAndSettle();
          expect(tester.getTopLeft(find.text(channel.name)).dx, lessThan(170));
        }
        await tester.tap(find.text(programme.title));
        await tester.pumpAndSettle();
        expect(find.text(programme.description), findsOneWidget);
        await tester.tap(find.text('Schedule recording'));
        await tester.pumpAndSettle();
        expect(store.jobs.single.title, programme.title);
        expect(store.jobs.single.state, RecordingState.scheduled);
        await tester.pumpWidget(host(const DvrScreen()));
        await tester.pump();
        expect(tester.takeException(), isNull);
        expect(find.text(programme.title), findsOneWidget);
        await tester.pumpWidget(const SizedBox.shrink());
        core.dispose();
        store.close();
        h.model.dispose();
        h.db.close();
      },
    );
  }
}
