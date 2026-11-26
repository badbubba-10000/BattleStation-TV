import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/app/app.dart';
import 'package:iptvmac/bstv/dashboard.dart';
import 'package:iptvmac/bstv/shell.dart';

import '../app/harness.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    if (Platform.environment['BSTV_CAPTURE_PREVIEWS'] == '1') {
      for (final font in [
        ('Roboto', 'roboto-regular.ttf'),
        ('MaterialIcons', 'materialicons-regular.otf'),
      ]) {
        final bytes = File(
          '../../.tooling/flutter/bin/cache/artifacts/material_fonts/${font.$2}',
        ).readAsBytesSync();
        await (FontLoader(
          font.$1,
        )..addFont(Future.value(bytes.buffer.asByteData()))).load();
      }
    }
  });
  for (final size in [
    const Size(390, 844),
    const Size(800, 1000),
    const Size(1440, 1000),
  ]) {
    testWidgets('dashboard reflows at ${size.width} without overflow', (
      tester,
    ) async {
      final h = await Harness.create(tester, withAccount: true, sync: true);
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = size;
      addTearDown(tester.view.reset);
      final boundary = GlobalKey();
      await tester.pumpWidget(
        RepaintBoundary(
          key: boundary,
          child: IptvApp(model: h.model),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(BstvShell), findsOneWidget);
      expect(find.byType(DashboardPanel), findsWidgets);
      expect(find.text('Big Movie'), findsWidgets);
      expect(tester.takeException(), isNull);
      // Optional local preview artifacts; synthetic data, no provider credentials.
      if (Platform.environment['BSTV_CAPTURE_PREVIEWS'] == '1') {
        final render =
            boundary.currentContext!.findRenderObject()!
                as RenderRepaintBoundary;
        await tester.runAsync(() async {
          final image = await render.toImage();
          final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
          final file = File(
            '../../evidence/phase1/dashboard-${size.width.toInt()}.png',
          );
          await file.writeAsBytes(bytes!.buffer.asUint8List());
          image.dispose();
        });
      }
      // Movies remains the real upstream browsing screen, including its categories.
      await tester.tap(
        find
            .descendant(
              of: find.byType(size.width >= 720 ? ListTile : NavigationBar),
              matching: find.text('Movies'),
            )
            .first,
      );
      await go(tester);
      expect(find.byType(BstvDashboard), findsNothing);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox());
    });
  }

  testWidgets('phone large text and More preserve access to pending features', (
    tester,
  ) async {
    final h = await Harness.create(tester, withAccount: true, sync: true);
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(360, 800);
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.view.reset);
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
    await tester.pumpWidget(IptvApp(model: h.model));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await tester.tap(find.text('More'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('DVR').last);
    await tester.pumpAndSettle();
    expect(find.textContaining('No recordings match.'), findsOneWidget);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
}
