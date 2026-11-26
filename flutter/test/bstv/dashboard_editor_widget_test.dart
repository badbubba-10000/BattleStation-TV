import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/app/app.dart';
import 'package:iptvmac/bstv/dashboard.dart';
import 'package:iptvmac/bstv/dashboard_editor.dart';
import 'package:iptvmac/bstv/dashboard_model.dart';

import '../app/harness.dart';

void main() {
  for (final customTitles in [false, true]) {
    testWidgets(
      'each widget keeps one original heading in Home, edit and preview (custom=$customTitles)',
      (tester) async {
        final h = await Harness.create(tester, withAccount: true, sync: true);
        tester.view.devicePixelRatio = 1;
        tester.view.physicalSize = const Size(1440, 1000);
        addTearDown(tester.view.reset);
        final original = h.model.prefs.bstvTheme;
        final layout = original.layoutFor(DashboardDevice.desktop);
        if (customTitles) {
          await h.model.applyBstvTheme(
            original.withLayout(
              DashboardLayout(
                device: layout.device,
                widgets: [
                  for (final item in layout.widgets)
                    item.copyWith(title: 'Original ${item.kind.name} heading'),
                ],
              ),
            ),
          );
        }
        await tester.pumpWidget(IptvApp(model: h.model));
        await tester.pumpAndSettle();
        void expectSingleHeadings(Finder scope) {
          for (final kind in DashboardKind.values) {
            final title = customTitles
                ? 'Original ${kind.name} heading'
                : DashboardRegistry.definitions[kind]!.title;
            expect(
              find.descendant(of: scope, matching: find.text(title)),
              findsOneWidget,
              reason:
                  '${kind.name} must use its original panel heading exactly once',
            );
          }
        }

        expectSingleHeadings(find.byType(BstvDashboard));
        final navigator = Navigator.of(
          tester.element(find.byType(BstvDashboard)),
        );
        navigator.push(
          MaterialPageRoute<void>(
            builder: (_) =>
                const DashboardEditor(initialDevice: DashboardDevice.desktop),
          ),
        );
        await tester.pumpAndSettle();
        expectSingleHeadings(find.byType(DashboardEditor));
        expect(
          find.byTooltip('Widget actions'),
          findsNWidgets(DashboardKind.values.length),
        );
        await tester.tap(find.byTooltip('Widget actions').first);
        await tester.pumpAndSettle();
        expect(find.text('Widget settings'), findsOneWidget);
        await tester.tap(find.text('Widget settings'));
        await tester.pumpAndSettle();
        expect(find.text('Widget settings'), findsOneWidget);
        await tester.tap(find.text('Cancel'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Preview Changes'));
        await tester.pumpAndSettle();
        expectSingleHeadings(find.byType(DashboardEditor));
        await tester.tap(find.text('Cancel Changes'));
        await tester.pumpAndSettle();
        expectSingleHeadings(find.byType(BstvDashboard));
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      },
    );
  }
  for (final size in [
    const Size(390, 844),
    const Size(800, 1000),
    const Size(1440, 1000),
  ]) {
    testWidgets(
      'real-data editor move resize save and cancel at ${size.width}',
      (tester) async {
        final h = await Harness.create(tester, withAccount: true, sync: true);
        tester.view.devicePixelRatio = 1;
        tester.view.physicalSize = size;
        addTearDown(tester.view.reset);
        await tester.pumpWidget(IptvApp(model: h.model));
        await tester.pumpAndSettle();
        final navigator = Navigator.of(
          tester.element(find.byType(BstvDashboard)),
        );
        final device = dashboardDevice(size.width);
        // Give this gesture test free space. Collision rejection is covered by
        // the editor model tests; the populated default layout blocks this drag.
        final theme = h.model.prefs.bstvTheme;
        await h.model.applyBstvTheme(
          theme.withLayout(
            DashboardLayout(
              device: device,
              widgets: [theme.layoutFor(device).widgets.first],
            ),
          ),
        );
        navigator.push(
          MaterialPageRoute<void>(
            builder: (_) => DashboardEditor(initialDevice: device),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('Big Movie'), findsWidgets);
        final before = h.model.prefs.bstvTheme.encode();
        // First widget is reachable at every viewport width.
        final drag = find.byKey(const Key('transform-default-featured-move'));
        final firstBefore = tester.getTopLeft(
          find.byKey(const Key('canvas-default-featured')),
        );
        await tester.drag(drag, const Offset(0, 120));
        await tester.pumpAndSettle();
        final firstAfter = tester.getTopLeft(
          find.byKey(const Key('canvas-default-featured')),
        );
        expect(firstAfter.dy - firstBefore.dy, greaterThanOrEqualTo(60));
        final handle = find.byKey(
          const Key('transform-default-featured-bottom-right'),
        );
        await tester.ensureVisible(handle);
        await tester.pumpAndSettle();
        final heightBefore = tester
            .getSize(find.byKey(const Key('canvas-default-featured')))
            .height;
        await tester.drag(handle, const Offset(0, 60));
        await tester.pumpAndSettle();
        expect(
          tester
              .getSize(find.byKey(const Key('canvas-default-featured')))
              .height,
          greaterThan(heightBefore),
        );
        expect(h.model.prefs.bstvTheme.encode(), before);
        await tester.tap(find.text('Save Layout'));
        await tester.pumpAndSettle();
        final saved = h.model.prefs.bstvTheme;
        expect(saved.layouts[device]!.widgets.first.y, greaterThan(0));
        expect(saved.layouts[device]!.widgets.first.height, greaterThan(300));
        navigator.push(
          MaterialPageRoute<void>(
            builder: (_) => DashboardEditor(initialDevice: device),
          ),
        );
        await tester.pumpAndSettle();
        if (size.width == 1440) {
          await tester.tap(find.byTooltip('Widget actions').first);
          await tester.pumpAndSettle();
          await tester.tap(find.text('Widget settings'));
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull, reason: 'opening settings');
          await tester.enterText(
            find.byType(TextField),
            'My featured selection',
          );
          await tester.tap(find.text('Apply'));
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull, reason: 'applying settings');
          expect(find.text('My featured selection'), findsWidgets);
          await tester.tap(find.text('Preview Changes'));
          await tester.pumpAndSettle();
          expect(
            find.byKey(const Key('transform-default-featured-bottom-right')),
            findsNothing,
          );
          await tester.tap(find.text('Preview Changes'));
          await tester.pumpAndSettle();
          await tester.tap(find.byTooltip('Widget actions').first);
          await tester.pumpAndSettle();
          await tester.tap(find.text('Duplicate'));
          await tester.pumpAndSettle();
          expect(find.byType(DashboardPanel), findsNWidgets(2));
          await tester.ensureVisible(find.byTooltip('Undo'));
          await tester.pumpAndSettle();
          await tester.tap(find.byTooltip('Undo'));
          await tester.pumpAndSettle();
        }
        await tester.ensureVisible(find.text('Add Widget'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Add Widget'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Movies').last);
        await tester.pumpAndSettle();
        expect(find.byType(DashboardPanel), findsNWidgets(2));
        await tester.ensureVisible(find.byTooltip('Undo'));
        await tester.pumpAndSettle();
        await tester.tap(find.byTooltip('Undo'));
        await tester.pumpAndSettle();
        expect(find.byType(DashboardPanel), findsOneWidget);
        await tester.ensureVisible(find.byTooltip('Redo'));
        await tester.pumpAndSettle();
        await tester.tap(find.byTooltip('Redo'));
        await tester.pumpAndSettle();
        expect(find.byType(DashboardPanel), findsNWidgets(2));
        await tester.ensureVisible(find.text('Cancel Changes'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Cancel Changes'));
        await tester.pumpAndSettle();
        await tester.tap(find.text('Discard'));
        await tester.pumpAndSettle();
        expect(h.model.prefs.bstvTheme.encode(), saved.encode());
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      },
    );
  }
}
