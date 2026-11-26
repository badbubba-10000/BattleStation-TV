import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/bstv/dashboard_model.dart';

void main() {
  test('independent instances preserve dimensions and safe configuration', () {
    final first = DashboardInstance(
      id: 'movies-action',
      kind: DashboardKind.movies,
      categoryId: '7',
    );
    final second = DashboardInstance(
      id: 'movies-other',
      kind: DashboardKind.movies,
      categoryId: '8',
      width: 800,
    );
    final layout = DashboardLayout(
      device: DashboardDevice.desktop,
      widgets: [first, second],
    );
    final document = jsonDecode(jsonEncode(layout.toJson())) as Map;
    expect((document['widgets'] as List).length, 2);
    expect(first.width, 400);
    expect(second.width, 800);
    expect(jsonEncode(document), isNot(contains('password')));
    expect(() => layout.widgets.add(first), throwsUnsupportedError);
  });

  test(
    'invalid sizes, coordinates, URL config and duplicate IDs are rejected',
    () {
      expect(
        () => DashboardInstance(id: 'x', kind: DashboardKind.movies, width: 10),
        throwsFormatException,
      );
      expect(
        () => DashboardInstance(
          id: 'x',
          kind: DashboardKind.movies,
          x: double.nan,
        ),
        throwsFormatException,
      );
      expect(
        () => DashboardInstance(id: 'x', kind: DashboardKind.movies, y: -1),
        throwsFormatException,
      );
      expect(
        () => DashboardInstance(
          id: 'x',
          kind: DashboardKind.movies,
          categoryId: 'https://provider.test/token',
        ),
        throwsFormatException,
      );
      final widget = DashboardInstance(id: 'x', kind: DashboardKind.movies);
      expect(
        () => DashboardLayout(
          device: DashboardDevice.phone,
          widgets: [widget, widget],
        ),
        throwsFormatException,
      );
    },
  );

  test('device classes get independent default documents', () {
    expect(dashboardDevice(390), DashboardDevice.phone);
    expect(dashboardDevice(800), DashboardDevice.tablet);
    expect(dashboardDevice(1440), DashboardDevice.desktop);
    final phone = DashboardLayout.defaults(DashboardDevice.phone);
    final desktop = DashboardLayout.defaults(DashboardDevice.desktop);
    expect(identical(phone.widgets, desktop.widgets), isFalse);
    expect(phone.widgets.map((w) => w.id).toSet().length, phone.widgets.length);
    expect(DashboardRegistry.definitions.length, DashboardKind.values.length);
  });
}
