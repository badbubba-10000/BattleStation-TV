import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:iptvmac/app/app.dart';
import 'package:iptvmac/app/prefs.dart';
import 'package:iptvmac/bstv/interface_layout.dart';
import 'package:iptvmac/bstv/interface_presets.dart';
import 'package:iptvmac/bstv/theme_package.dart';
import 'package:iptvmac/bstv/preset_screen_preview.dart';
import 'package:iptvmac/bstv/shell.dart';

import '../app/harness.dart';

void main() {
  test('all presets carry real navigation and screen configuration through theme sharing', () {
    expect(BstvInterfacePreset.all.length, 16);
    final navigation = <String>{}, geometries = <String>{};
    for (final preset in BstvInterfacePreset.all) {
      final theme = BstvThemePackage.decode(preset.buildTheme().encode());
      navigation.add(theme.interface.navigation);
      geometries.add(
        jsonEncode({
          'interface': theme.interface.toJson(),
          'layouts': theme.toJson()['layouts'],
        }),
      );
      expect(theme.interface.movies, isIn(['grid', 'list', 'carousel']));
    }
    // Built-in presets need not select every user override (e.g. right sidebar).
    // The separate navigation widget test exercises all allowed overrides.
    expect(navigation.length, greaterThanOrEqualTo(6));
    expect(navigation, everyElement(isIn(InterfaceLayout.navigationStyles)));
    expect(geometries.length, greaterThanOrEqualTo(12));
    final old = BstvThemePackage.defaults().toJson()
      ..['version'] = 3
      ..remove('interface');
    expect(
      BstvThemePackage.decode(jsonEncode(old)).interface.navigation,
      'adaptive',
    );
    expect(
      () => InterfaceLayout.fromJson({'navigation': 'unsafe'}),
      throwsFormatException,
    );
    expect(
      () => InterfaceLayout.fromJson({'scale': double.nan}),
      throwsFormatException,
    );
    expect(
      () => InterfaceLayout.fromJson({'logo': 'file:///secret'}),
      throwsFormatException,
    );
  });
  test('previous full layout survives restart and unrelated preferences remain intact', () async {
    SharedPreferences.setMockInitialValues({
      'playlist': '12',
      'sentinel': 'keep',
    });
    final storage = await SharedPreferences.getInstance();
    final prefs = AppPrefs(storage);
    final first = prefs.bstvTheme;
    await prefs.saveBstvTheme(BstvInterfacePreset.all[1].buildTheme());
    final restored = AppPrefs(storage);
    expect(restored.previousInterface!.encode(), first.encode());
    expect(restored.bstvTheme.interface.navigation, 'top');
    await restored.saveBstvTheme(restored.previousInterface!);
    expect(restored.bstvTheme.encode(), first.encode());
    expect(storage.getString('playlist'), '12');
    expect(storage.getString('sentinel'), 'keep');
  });
  testWidgets(
    'navigation overrides preserve important sections and do not refresh providers',
    (tester) async {
      final h = await Harness.create(
        tester,
        withAccount: true,
        sync: true,
        prefs: {'guided_tour_v1_main': true},
      );
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(1440, 1000);
      addTearDown(tester.view.reset);
      await tester.pumpWidget(IptvApp(model: h.model));
      await tester.pumpAndSettle();
      final calls = h.provider.calls.length;
      for (final nav in InterfaceLayout.navigationStyles) {
        await h.model.applyBstvTheme(
          h.model.prefs.bstvTheme.withInterface(
            InterfaceLayout(navigation: nav),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(BstvShell), findsOneWidget);
        if (nav == 'bottom') {
          await tester.tap(find.text('More'));
          await tester.pumpAndSettle();
          expect(find.text('Settings'), findsWidgets);
          Navigator.of(tester.element(find.text('Settings').last)).pop();
          await tester.pumpAndSettle();
        } else {
          expect(
            find.descendant(
              of: find.byType(BstvShell),
              matching: find.text('Settings'),
            ),
            findsOneWidget,
          );
        }
        expect(tester.takeException(), isNull);
      }
      expect(h.provider.calls.length, calls);
      await tester.pumpWidget(const SizedBox());
    },
  );
  testWidgets(
    'five-screen preview and device switching never mutate persisted settings',
    (tester) async {
      final h = await Harness.create(
        tester,
        withAccount: true,
        sync: true,
        prefs: {'guided_tour_v1_main': true},
      );
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(1440, 1000);
      addTearDown(tester.view.reset);
      await tester.pumpWidget(IptvApp(model: h.model));
      await tester.pumpAndSettle();
      final before = h.model.prefs.bstvTheme.encode(),
          calls = h.provider.calls.length;
      final navigator = Navigator.of(tester.element(find.byType(BstvShell)));
      var applied = false;
      navigator.push(
        MaterialPageRoute<void>(
          builder: (_) => PresetScreenPreview(
            preset: BstvInterfacePreset.all[1],
            onApply: () => applied = true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      for (final tab in ['Movies', 'Series', 'Live TV', 'TV Guide', 'Home']) {
        await tester.tap(find.widgetWithText(Tab, tab));
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
      }
      await tester.tap(find.byType(DropdownButton<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Phone').last);
      await tester.pumpAndSettle();
      expect(h.model.prefs.bstvTheme.encode(), before);
      expect(h.provider.calls.length, calls);
      expect(applied, false);
      await tester.tap(find.text('Cancel'));
      await tester.pumpAndSettle();
      expect(h.model.prefs.bstvTheme.encode(), before);
      await tester.pumpWidget(const SizedBox());
    },
  );
}
