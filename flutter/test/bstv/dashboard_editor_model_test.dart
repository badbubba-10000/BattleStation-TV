import 'dart:ui' show Rect;
import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/bstv/dashboard_model.dart';
import 'package:iptvmac/bstv/dashboard_editor_model.dart';
import 'package:iptvmac/bstv/theme_package.dart';
import 'package:iptvmac/app/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

void main() {
  DashboardEditorModel create() => DashboardEditorModel(
    DashboardLayout(
      device: DashboardDevice.desktop,
      widgets: [
        DashboardInstance(
          id: 'a',
          kind: DashboardKind.movies,
          title: 'Action',
          categoryId: '7',
        ),
        DashboardInstance(id: 'b', kind: DashboardKind.guide, x: 400),
      ],
    ),
  );
  test('move and resize snap, collide safely, preserve configuration; undo redo cancel', () {
    final m = create();
    addTearDown(m.dispose);
    m.move('a', 17, 330);
    final a = m.draft.widgets.first, b = m.draft.widgets.last;
    expect(a.x, 16);
    expect(a.y, 336);
    expect(overlaps(a, b), false);
    expect(a.title, 'Action');
    expect(a.categoryId, '7');
    m.resize('a', 711, 442);
    expect(m.draft.widgets.first.width, 704);
    expect(m.draft.widgets.first.height, 448);
    m.undo();
    expect(m.draft.widgets.first.width, 400);
    m.redo();
    expect(m.draft.widgets.first.width, 704);
    m.cancel();
    expect(m.dirty, false);
    expect(m.canUndo, false);
  });
  test('dragging over another widget never pushes unrelated widgets', () {
    final m = create();
    addTearDown(m.dispose);
    final initial = m.draft.toJson();
    final other = m.draft.widgets.last;

    m.beginTransform();
    // Drag into the guide's occupied area. This should be a red preview,
    // not a request to cascade all other dashboard widgets downward.
    m.transform('a', Rect.fromLTWH(300, 0, 400, 300), 'move');
    expect(m.collision, isTrue);
    expect(m.candidate, isNotNull);
    expect(m.draft.toJson(), initial);
    expect(m.draft.widgets.last.x, other.x);
    expect(m.draft.widgets.last.y, other.y);

    // Moving on to a free part of the canvas must work in the SAME gesture.
    m.transform('a', Rect.fromLTWH(200, 400, 400, 300), 'move');
    expect(m.collision, isFalse);
    expect(m.draft.widgets.last.x, other.x);
    expect(m.draft.widgets.last.y, other.y);
    m.endTransform();
    expect(m.draft.widgets.first.y, 400);
    m.undo();
    expect(m.draft.toJson(), initial);
  });

  test('dropping on an occupied area rejects the drag without moving other widgets', () {
    final m = create();
    addTearDown(m.dispose);
    final initial = m.draft.toJson();
    m.beginTransform();
    m.transform('a', Rect.fromLTWH(300, 400, 400, 300), 'move');
    expect(m.collision, isFalse);
    m.transform('a', Rect.fromLTWH(300, 0, 400, 300), 'move');
    expect(m.collision, isTrue);
    m.endTransform();
    expect(m.draft.toJson(), initial);
    expect(m.canUndo, isFalse);
  });

  test('resizing into a neighbor never shoves it to a new row', () {
    final m = create();
    addTearDown(m.dispose);
    final initial = m.draft.toJson();
    m.beginTransform();
    m.transform('a', Rect.fromLTWH(0, 0, 600, 300), 'right');
    expect(m.collision, isTrue);
    expect(m.draft.toJson(), initial);
    m.endTransform();
    expect(m.draft.toJson(), initial);
  });

  test('add duplicate independent settings hide restore remove and reset', () {
    final m = create();
    addTearDown(m.dispose);
    m.duplicate('a');
    final duplicate = m.draft.widgets.last;
    expect(duplicate.id, isNot('a'));
    expect(duplicate.categoryId, '7');
    m.update(duplicate.copyWith(title: 'Comedy', categoryId: '8'));
    expect(m.draft.widgets.first.title, 'Action');
    m.update(m.draft.widgets.first.copyWith(visible: false));
    m.update(m.draft.widgets.first.copyWith(visible: true));
    for (final a in m.draft.widgets.where((w) => w.visible)) {
      for (final b in m.draft.widgets.where((w) => w.visible && w.id != a.id)) {
        expect(overlaps(a, b), false);
      }
    }
    m.add(DashboardKind.downloads);
    expect(m.draft.widgets.length, 4);
    m.remove(duplicate.id);
    expect(m.draft.widgets.length, 3);
    m.reset();
    expect(m.draft.widgets.length, DashboardKind.values.length);
  });
  test('three profiles and settings persist through preferences; appearance preserves layouts', () async {
    SharedPreferences.setMockInitialValues({
      'playlist': '123',
      'sentinel': 'untouched',
    });
    final storage = await SharedPreferences.getInstance();
    final prefs = AppPrefs(storage);
    var theme = BstvThemePackage.defaults();
    for (final device in DashboardDevice.values) {
      theme = theme.withLayout(
        arrangeDashboard(DashboardLayout.defaults(device)),
      );
    }
    prefs.bstvTheme = theme;
    final restored = AppPrefs(storage).bstvTheme;
    expect(restored.layouts.length, 3);
    expect(restored.layoutFor(DashboardDevice.phone).canvasWidth, 400);
    prefs.appearance = 'light';
    expect(prefs.bstvTheme.layouts.length, 3);
    expect(storage.getString('playlist'), '123');
    expect(storage.getString('sentinel'), 'untouched');
  });
  test('v1 migration, v2 round trip, reject overlapping unsafe and oversized imports', () {
    final old = BstvThemePackage.defaults().toJson()..['version'] = 1;
    expect(
      BstvThemePackage.decode(jsonEncode(old))
          .layoutFor(DashboardDevice.phone)
          .widgets,
      isNotEmpty,
    );
    final theme = BstvThemePackage.defaults().withLayout(create().draft);
    final round = BstvThemePackage.decode(theme.encode());
    expect(
      round.layouts[DashboardDevice.desktop]!.widgets.first.categoryId,
      '7',
    );
    final invalid = theme.toJson();
    final layouts = invalid['layouts'] as Map;
    final layout = layouts['desktop'] as Map;
    final widgets = layout['widgets'] as List;
    widgets[1]['x'] = 0;
    expect(
      () => BstvThemePackage.decode(jsonEncode(invalid)),
      throwsFormatException,
    );
    expect(
      () => BstvThemePackage.decode(' ' * (BstvThemePackage.maxBytes + 1)),
      throwsFormatException,
    );
    expect(
      () => DashboardInstance.fromJson({
        'id': 'a',
        'type': 'movies',
        'accountId': 123,
      }),
      throwsFormatException,
    );
  });
}
