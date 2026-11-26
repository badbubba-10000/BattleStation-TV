import 'dart:convert';
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:iptvmac/bstv/dashboard_model.dart';
import 'package:iptvmac/bstv/dashboard_editor_model.dart';
import 'package:iptvmac/bstv/editor_preferences.dart';
import 'package:iptvmac/bstv/theme_package.dart';
import 'package:iptvmac/app/prefs.dart';

void main() {
  DashboardEditorModel editor({
    EditorPreferences prefs = const EditorPreferences(snap: false),
  }) => DashboardEditorModel(
    DashboardLayout(
      device: DashboardDevice.desktop,
      widgets: [
        DashboardInstance(
          id: 'a',
          kind: DashboardKind.movies,
          x: 200,
          y: 200,
          width: 400,
          height: 300,
        ),
      ],
    ),
    preferences: prefs,
  );
  test('legacy coordinates load unchanged, toggles do not rearrange and free mode retains fractions', () {
    final m = editor();
    addTearDown(m.dispose);
    final saved = m.draft.toJson();
    m.preferences = m.preferences.copyWith(snap: true, gridSize: 24);
    expect(m.draft.toJson(), saved);
    m.preferences = m.preferences.copyWith(snap: false);
    m.move('a', 127.125, 82.375);
    expect(m.draft.widgets.single.x, 127.125);
    expect(m.draft.widgets.single.y, 82.375);
    m.resize('a', 411.625, 321.875);
    expect(m.draft.widgets.single.width, 411.625);
    expect(m.draft.widgets.single.height, 321.875);
    final restored = BstvThemePackage.decode(
      BstvThemePackage.defaults()
          .withLayout(m.draft)
          .withEditor(m.preferences)
          .encode(),
    );
    expect(
      restored.layouts[DashboardDevice.desktop]!.widgets.single.width,
      411.625,
    );
    expect(restored.editor.snap, false);
  });
  for (final edge in [
    'left',
    'right',
    'top',
    'bottom',
    'top-left',
    'top-right',
    'bottom-left',
    'bottom-right',
  ]) {
    test(
      '$edge preserves opposite boundary and is a single undo transaction',
      () {
        final m = editor();
        addTearDown(m.dispose);
        m.beginTransform();
        final rect = Rect.fromLTRB(
          edge.contains('left') ? 180.125 : 200,
          edge.contains('top') ? 177.25 : 200,
          edge.contains('right') ? 633.625 : 600,
          edge.contains('bottom') ? 532.375 : 500,
        );
        m.transform('a', rect, edge);
        m.transform('a', rect, edge);
        m.endTransform();
        final w = m.draft.widgets.single;
        expect(w.x, rect.left);
        expect(w.y, rect.top);
        expect(w.x + w.width, rect.right);
        expect(w.y + w.height, rect.bottom);
        m.undo();
        expect(m.draft.widgets.single.x, 200);
        expect(m.canUndo, false);
        m.redo();
        expect(m.draft.widgets.single.width, rect.width);
      },
    );
  }
  for (final size in [8.0, 16.0, 24.0, 32.0]) {
    test('grid $size snaps moved edges while Alt bypass keeps precision', () {
      final m = editor(prefs: EditorPreferences(gridSize: size));
      addTearDown(m.dispose);
      m.move('a', 123.25, 88.75);
      final w = m.draft.widgets.single;
      expect(w.x % size, 0);
      expect(w.y % size, 0);
      m.beginTransform();
      m.transform(
        'a',
        const Rect.fromLTWH(123.25, 88.75, 400, 300),
        'move',
        bypassSnap: true,
      );
      m.endTransform();
      expect(m.draft.widgets.single.x, 123.25);
      m.beginTransform();
      m.transform(
        'a',
        const Rect.fromLTRB(123.25, 88.75, 654.5, 445.75),
        'bottom-right',
      );
      m.endTransform();
      expect(
        (m.draft.widgets.single.x + m.draft.widgets.single.width) % size,
        0,
      );
      expect(
        (m.draft.widgets.single.y + m.draft.widgets.single.height) % size,
        0,
      );
    });
  }
  test('boundaries minimums collision feedback cancel and magnetic guides', () {
    final m = editor();
    addTearDown(m.dispose);
    m.move('a', -500, -300);
    expect(m.draft.widgets.single.x, 0);
    m.resize('a', 1, 1);
    expect(m.draft.widgets.single.width, 240);
    expect(m.draft.widgets.single.height, 180);
    m.add(DashboardKind.movies);
    final second = m.draft.widgets.last;
    final before = m.draft.toJson();
    m.beginTransform();
    m.transform('a', Rect.fromLTWH(second.x, second.y, 240, 180), 'move');
    expect(m.collision, true);
    expect(overlaps(m.draft.widgets.first, m.draft.widgets.last), false);
    m.endTransform(cancel: true);
    expect(m.draft.toJson(), before);
    m.preferences = const EditorPreferences(
      snap: false,
      magnetic: true,
      showGrid: false,
    );
    m.beginTransform();
    m.transform(
      'a',
      Rect.fromLTWH(second.x + 3, second.y + second.height + 20, 240, 180),
      'move',
    );
    expect(m.verticalGuides, isNotEmpty);
    expect(m.draft.widgets.first.x, second.x);
    m.endTransform();
  });
  test('old themes accept new default options; strict limits and branding protection', () {
    for (final version in [1, 2]) {
      final old = BstvThemePackage.defaults().toJson()
        ..['version'] = version
        ..remove('editor');
      expect(BstvThemePackage.decode(jsonEncode(old)).editor.gridSize, 16);
    }
    expect(
      () => EditorPreferences.fromJson({'gridSize': 0}),
      throwsFormatException,
    );
    expect(
      () => EditorPreferences.fromJson({'showGrid': 'yes'}),
      throwsFormatException,
    );
    final theme = BstvThemePackage.defaults().toJson()
      ..['updateEndpoint'] = 'evil';
    expect(
      () => BstvThemePackage.decode(jsonEncode(theme)),
      throwsFormatException,
    );
  });
  test('profiles create rename duplicate activate delete default recovery and restart persistence', () async {
    SharedPreferences.setMockInitialValues({
      'playlist': '123',
      'private-sentinel': 'untouched',
      'bstv.appearanceTheme.v1': BstvThemePackage.defaults().encode(),
    });
    final storage = await SharedPreferences.getInstance();
    final prefs = AppPrefs(storage);
    var profiles = prefs.customizationProfiles;
    expect(profiles.active.theme.appearance, 'dark');
    profiles = profiles.add('Movie Night');
    final id = profiles.profiles.last.id;
    profiles = profiles.rename(id, 'Cinema').activate(id);
    final free = editor();
    addTearDown(free.dispose);
    free.move('a', 81.125, 123.875);
    profiles = profiles.updateActive(
      profiles.active.theme
          .withLayout(free.draft)
          .withEditor(const EditorPreferences(snap: false, magnetic: true)),
    );
    await prefs.saveCustomizationProfiles(profiles);
    final restored = AppPrefs(storage).customizationProfiles;
    expect(restored.active.name, 'Cinema');
    expect(restored.active.theme.editor.snap, false);
    expect(
      restored.active.theme.layouts[DashboardDevice.desktop]!.widgets.single.x,
      81.125,
    );
    expect(restored.profiles.first.theme.layouts, isEmpty);
    expect(() => restored.remove(restored.defaultId), throwsFormatException);
    final removed = restored.remove(id);
    expect(removed.activeId, removed.defaultId);
    expect(removed.profiles.length, 1);
    expect(storage.getString('playlist'), '123');
    expect(storage.getString('private-sentinel'), 'untouched');
    expect(restored.active.theme.encode(), isNot(contains('private-sentinel')));
    final recovery = profiles.setDefault(id).remove('default');
    expect(recovery.defaultId, id);
    expect(recovery.profiles.length, 1);
    final invalid = profiles.active.theme.withLayout(
      DashboardLayout(
        device: DashboardDevice.desktop,
        widgets: [
          DashboardInstance(id: 'x', kind: DashboardKind.movies),
          DashboardInstance(id: 'y', kind: DashboardKind.movies),
        ],
      ),
    );
    final before = storage.getString('bstv.profiles.v1');
    await expectLater(prefs.saveBstvTheme(invalid), throwsFormatException);
    expect(storage.getString('bstv.profiles.v1'), before);
  });
}
