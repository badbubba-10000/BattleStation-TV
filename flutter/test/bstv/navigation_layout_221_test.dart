import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/bstv/interface_layout.dart';

void main() {
  test('navigation preferences round-trip with visibility, order and size', () {
    const original = InterfaceLayout(
      navigation: 'right', sidebarWidth: 172,
      navDisplay: 'icons', hiddenNavigation: [5, 6],
      navigationOrder: [10, 1, 0, 9],
    );
    final restored = InterfaceLayout.fromJson(original.toJson());
    expect(restored.navigation, 'right');
    expect(restored.sidebarWidth, 172);
    expect(restored.navDisplay, 'icons');
    expect(restored.hiddenNavigation, [5, 6]);
    expect(restored.navigationOrder, [10, 1, 0, 9]);
  });

  test('settings always visible and invalid nav order rejected', () {
    expect(() => InterfaceLayout.fromJson({'hiddenNavigation': [9]}), throwsFormatException);
    expect(() => InterfaceLayout.fromJson({'navigationOrder': [3, 3]}), throwsFormatException);
    expect(() => InterfaceLayout.fromJson({'sidebarWidth': 400}), throwsFormatException);
  });
}
