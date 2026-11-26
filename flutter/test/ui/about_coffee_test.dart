// BattleStation TV: replacement for the obsolete IPTVMac donation-link test.
// The original coffeeUrl constant and third-party donation button were removed.
import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/bstv/interface_presets.dart';

void main() {
  test('BattleStation TV offers named interface presets', () {
    expect(BstvInterfacePreset.all, isNotEmpty);
    expect(BstvInterfacePreset.all.first.name, 'BattleStation Original');
  });
}
