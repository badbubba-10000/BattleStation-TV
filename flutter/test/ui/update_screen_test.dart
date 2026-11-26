import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iptvmac/app/device.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/ui/update_screen.dart';

import '../app/harness.dart';

void main() {
  testWidgets('TV Select activates the update check without touch input', (
    tester,
  ) async {
    final old = isTelevision;
    isTelevision = true;
    addTearDown(() => isTelevision = old);
    final h = await Harness.create(tester, appVersion: '2.4.0+7');
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(1280, 720);
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      ChangeNotifierProvider<LibraryModel>.value(
        value: h.model,
        child: const MaterialApp(home: UpdateScreen()),
      ),
    );
    await tester.pumpAndSettle();
    await tester.sendKeyEvent(LogicalKeyboardKey.select);
    await settle(tester, 4);
    expect(h.model.updater.status, contains('No published compatible'));
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
    h.model.dispose();
    h.db.close();
  });

  for (final width in [390.0, 1280.0]) {
    testWidgets(
      'update settings are reachable and persistent at width $width',
      (tester) async {
        final h = await Harness.create(tester, appVersion: '2.4.0+7');
        tester.view.devicePixelRatio = 1;
        tester.view.physicalSize = Size(width, 1100);
        addTearDown(tester.view.reset);
        await tester.pumpWidget(
          ChangeNotifierProvider<LibraryModel>.value(
            value: h.model,
            child: const MaterialApp(home: UpdateScreen()),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('About & Updates'), findsOneWidget);
        expect(find.textContaining('2.4.0'), findsOneWidget);
        final automatic = find.widgetWithText(
          SwitchListTile,
          'Check automatically',
        );
        await tester.scrollUntilVisible(
          automatic,
          250,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.tap(automatic);
        await tester.pumpAndSettle();
        expect(h.model.updater.automatic, isFalse);
        expect(
          h.model.prefs.updateStorage.getBool('updates.v2.automatic'),
          isFalse,
        );
        final scheduled = find.widgetWithText(
          SwitchListTile,
          'Scheduled update checks',
        );
        await tester.scrollUntilVisible(
          scheduled,
          200,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.tap(scheduled);
        await tester.pumpAndSettle();
        expect(h.model.updater.scheduled, isTrue);
        await tester.scrollUntilVisible(
          find.text('Check frequency'),
          200,
          scrollable: find.byType(Scrollable).first,
        );
        expect(find.text('Check frequency'), findsOneWidget);
        await tester.scrollUntilVisible(
          find.text('Check for Updates'),
          -250,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.tap(find.text('Check for Updates'));
        await settle(tester, 4);
        expect(h.model.updater.status, contains('No published compatible'));
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
        h.model.dispose();
        h.db.close();
      },
    );
  }
}
