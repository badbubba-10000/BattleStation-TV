import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/app/app.dart';
import 'package:iptvmac/bstv/dashboard.dart';
import 'package:iptvmac/bstv/dashboard_model.dart';
import 'package:iptvmac/bstv/dashboard_editor.dart';
import 'package:iptvmac/bstv/dashboard_editor_model.dart';
import 'package:iptvmac/bstv/dashboard_transform_surface.dart';
import 'package:iptvmac/bstv/editor_preferences.dart';
import 'package:iptvmac/bstv/customization_profiles_screen.dart';

import '../app/harness.dart';
import '../player/fake_engine.dart';
import '../player/player_screen_test.dart' show FakeHost, FakeSystem;

import 'package:iptvmac/player/player_screen.dart';
import 'package:iptvmac/player/play_request.dart';
import 'package:iptvmac/player/player_prefs.dart';
import 'package:iptvmac/bstv/theme_package.dart';

void main() {
  for (final zoom in [.5, 1.0, 1.5]) {
    for (final edge in [
      'move',
      'left',
      'right',
      'top',
      'bottom',
      'top-left',
      'top-right',
      'bottom-left',
      'bottom-right',
    ]) {
      testWidgets('$edge pointer geometry cursor undo at zoom $zoom', (
        tester,
      ) async {
        final controller = DashboardEditorModel(
          DashboardLayout(
            device: DashboardDevice.desktop,
            widgets: [
              DashboardInstance(
                id: 'test',
                kind: DashboardKind.movies,
                x: 200,
                y: 200,
              ),
            ],
          ),
          preferences: const EditorPreferences(snap: false),
        );
        addTearDown(controller.dispose);
        final canvas = GlobalKey();
        tester.view.devicePixelRatio = 1;
        tester.view.physicalSize = const Size(1600, 1200);
        addTearDown(tester.view.reset);
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 1200 * zoom,
                  height: 800 * zoom,
                  child: OverflowBox(
                    alignment: Alignment.topLeft,
                    minWidth: 1200,
                    maxWidth: 1200,
                    minHeight: 800,
                    maxHeight: 800,
                    child: Transform.scale(
                      scale: zoom,
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        key: canvas,
                        width: 1200,
                        height: 800,
                        child: ListenableBuilder(
                          listenable: controller,
                          builder: (context, child) {
                            final item = controller.draft.widgets.single;
                            return Stack(
                              children: [
                                Positioned(
                                  left: item.x,
                                  top: item.y,
                                  width: item.width,
                                  height: item.height,
                                  child: DashboardTransformSurface(
                                    item: item,
                                    editor: controller,
                                    zoom: zoom,
                                    selected: true,
                                    select: () {},
                                    toCanvas: (global) =>
                                        (canvas.currentContext!
                                                    .findRenderObject()!
                                                as RenderBox)
                                            .globalToLocal(global),
                                    menu: const SizedBox(width: 30, height: 30),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        final target = find.byKey(Key('transform-test-$edge'));
        final zone = tester.widget<Listener>(target);
        expect(zone.onPointerDown, isNotNull);
        final mouseRegion = tester.widget<MouseRegion>(
          find.ancestor(of: target, matching: find.byType(MouseRegion)).first,
        );
        final expected = edge == 'move'
            ? SystemMouseCursors.move
            : edge == 'left' || edge == 'right'
            ? SystemMouseCursors.resizeLeftRight
            : edge == 'top' || edge == 'bottom'
            ? SystemMouseCursors.resizeUpDown
            : edge == 'top-left' || edge == 'bottom-right'
            ? SystemMouseCursors.resizeUpLeftDownRight
            : SystemMouseCursors.resizeUpRightDownLeft;
        expect(mouseRegion.cursor, expected);
        // Use an interior body location, rather than header/menu hit targets.
        final point = edge == 'move'
            ? tester.getTopLeft(target) + Offset(123 * zoom, 130 * zoom)
            : tester.getCenter(target);
        if (edge == 'move' && zoom == 1) {
          controller.preferences = const EditorPreferences();
          await tester.sendKeyDownEvent(LogicalKeyboardKey.altLeft);
        }
        final pointer = await tester.startGesture(
          point,
          kind: PointerDeviceKind.mouse,
        );
        await pointer.moveBy(Offset(31.125 * zoom, 21.375 * zoom));
        await tester.pump();
        final w = controller.draft.widgets.single;
        expect(
          controller.canUndo,
          false,
          reason: 'one transaction is committed on release',
        );
        if (edge == 'move' || edge.contains('left')) {
          expect(w.x, closeTo(231.125, .001));
        } else {
          expect(w.x, 200);
        }
        if (edge == 'move' || edge.contains('top')) {
          expect(w.y, closeTo(221.375, .001));
        } else {
          expect(w.y, 200);
        }
        if (edge != 'move' && edge.contains('right')) {
          expect(w.width, closeTo(431.125, .001));
        }
        if (edge != 'move' && edge.contains('left')) {
          expect(w.width, closeTo(368.875, .001));
        }
        if (edge != 'move' && edge.contains('bottom')) {
          expect(w.height, closeTo(321.375, .001));
        }
        if (edge != 'move' && edge.contains('top')) {
          expect(w.height, closeTo(278.625, .001));
        }
        await pointer.up();
        if (edge == 'move' && zoom == 1) {
          await tester.sendKeyUpEvent(LogicalKeyboardKey.altLeft);
        }
        await tester.pump();
        expect(controller.canUndo, true);
        controller.undo();
        await tester.pump();
        expect(controller.draft.widgets.single.x, 200);
        controller.redo();
        await tester.pump();
        expect(controller.draft.widgets.single.toJson(), w.toJson());
        expect(tester.takeException(), isNull);
      });
    }
  }
  testWidgets(
    'editor snap toggle leaves coordinates, Alt bypass and profile UI has no provider refresh',
    (tester) async {
      final h = await Harness.create(tester, withAccount: true, sync: true);
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(1440, 1000);
      addTearDown(tester.view.reset);
      await tester.pumpWidget(IptvApp(model: h.model));
      await tester.pumpAndSettle();
      final calls = h.provider.calls.length;
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
      final before = tester.getTopLeft(
        find.byKey(const Key('canvas-default-featured')),
      );
      await tester.tap(find.byKey(const Key('snap-to-grid')));
      await tester.pumpAndSettle();
      expect(
        tester.getTopLeft(find.byKey(const Key('canvas-default-featured'))),
        before,
      );
      await tester.tap(find.text('Save Layout'));
      await tester.pumpAndSettle();
      expect(h.model.prefs.bstvTheme.editor.snap, false);
      navigator.push(
        MaterialPageRoute<void>(
          builder: (_) => const CustomizationProfilesScreen(),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Create profile'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextFormField), 'Sports');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();
      expect(h.model.prefs.customizationProfiles.profiles.length, 2);
      await tester.tap(find.text('Activate').last);
      await tester.pumpAndSettle();
      expect(h.model.prefs.customizationProfiles.active.name, 'Sports');
      await tester.tap(find.text('Restore default profile'));
      await tester.pumpAndSettle();
      expect(h.model.prefs.customizationProfiles.activeId, 'default');
      expect(h.provider.calls.length, calls);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    },
  );
  testWidgets(
    'activating an appearance profile preserves the existing player and stream',
    (tester) async {
      final h = await Harness.create(tester, withAccount: true, sync: true);
      await tester.pumpWidget(IptvApp(model: h.model));
      await tester.pumpAndSettle();
      final navigator = Navigator.of(
        tester.element(find.byType(BstvDashboard)),
      );
      final engine = FakeEngine();
      var factories = 0;
      navigator.push(
        MaterialPageRoute<void>(
          builder: (_) => PlayerScreen(
            request: PlayRequest(
              title: 'Synthetic live',
              url: Uri.parse('https://fixture.invalid/live.ts'),
              isLive: true,
            ),
            prefs: PlayerPrefs(),
            host: FakeHost(),
            system: FakeSystem(),
            engineFactory: (_) {
              factories++;
              return engine;
            },
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      engine.position = 5;
      await tester.pump(const Duration(milliseconds: 300));
      await tester.pumpAndSettle();
      expect(factories, 1);
      expect(engine.loads.length, 1);
      final before = h.provider.calls.length;
      final light = BstvThemePackage(
        appearance: 'light',
        accentArgb: BstvThemePackage.accents[1],
        dashboardOrder: BstvThemePackage.defaultOrder,
        hiddenWidgets: const [],
      );
      var profiles = h.model.prefs.customizationProfiles.add(
        'Light',
        theme: light,
      );
      profiles = profiles.activate(profiles.profiles.last.id);
      await h.model.applyCustomizationProfiles(profiles);
      await tester.pumpAndSettle();
      expect(factories, 1);
      expect(engine.loads.length, 1);
      expect(engine.disposed, false);
      expect(h.provider.calls.length, before);
      expect(find.byType(PlayerScreen), findsOneWidget);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
      expect(engine.disposed, true);
    },
  );
}
