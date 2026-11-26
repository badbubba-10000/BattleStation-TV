import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/bstv/dashboard_editor_model.dart';
import 'package:iptvmac/bstv/dashboard_model.dart';
import 'package:iptvmac/bstv/interface_presets.dart';
import 'package:iptvmac/bstv/theme_package.dart';

void main() {
  test('every built-in preset can export and import across all devices', () {
    for (final preset in BstvInterfacePreset.all) {
      final saved = BstvThemePackage.decode(preset.buildTheme().encode());
      expect(saved.accentArgb, preset.accent, reason: preset.name);
      expect(saved.dashboardOrder.toSet(), DashboardKind.values.map((k) => k.name).toSet());
      for (final device in DashboardDevice.values) {
        final layout = saved.layoutFor(device);
        expect(layout.widgets.length, DashboardKind.values.length);
        for (final widget in layout.widgets) {
          expect(widget.visible, isTrue);
          expect(widget.x + widget.width <= layout.canvasWidth, isTrue);
          expect(widget.height >= DashboardRegistry.definitions[widget.kind]!.minHeight, isTrue);
        }
        for (var i = 0; i < layout.widgets.length; i++) {
          for (var j = i + 1; j < layout.widgets.length; j++) {
            expect(overlaps(layout.widgets[i], layout.widgets[j]), isFalse,
                reason: '${preset.name} ${device.name}');
          }
        }
      }
      expect(saved.encode().contains('password'), isFalse);
      expect(saved.encode().contains('logo'), isFalse);
    }
  });
}
