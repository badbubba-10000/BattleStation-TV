import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/bstv/theme_package.dart';

void main() {
  test('theme round-trip contains appearance only, never branding or accounts', () {
    final a = BstvThemePackage.defaults();
    final encoded = a.encode();
    final b = BstvThemePackage.decode(encoded);
    expect(b.appearance, 'dark');
    expect(b.accentArgb, BstvThemePackage.defaultAccent);
    expect(b.dashboardOrder, BstvThemePackage.defaultOrder);
    expect(encoded.contains('password'), false);
    expect(encoded.contains('logo'), false);
    expect(encoded.contains('applicationId'), false);
  });
  test('theme import rejects branding and unknown fields', () {
    final original = BstvThemePackage.defaults().toJson()..['logo']='evil';
    expect(() => BstvThemePackage.decode(jsonEncode(original)), throwsFormatException);
  });
  test('theme import rejects invalid dashboard order', () {
    final original = BstvThemePackage.defaults().encode();
    expect(() => BstvThemePackage.decode(original.replaceFirst('"featured",', '"featured", "featured",')), throwsFormatException);
  });
}
