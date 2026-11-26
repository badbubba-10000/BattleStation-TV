import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/bstv/dashboard_model.dart';

void main() {
  test('independent widget display styles and rating visibility survive export', () {
    for (final style in ['grid', 'list', 'carousel', 'compact']) {
      final widget = DashboardInstance(
        id: 'test-$style',
        kind: DashboardKind.movies,
        displayStyle: style,
        showSourceRating: false,
        sort: 'recent',
      );
      final restored = DashboardInstance.fromJson(widget.toJson());
      expect(restored.displayStyle, style);
      expect(restored.showSourceRating, isFalse);
      expect(restored.sort, 'recent');
    }
  });

  test('legacy dashboard widgets keep source rating visibility on by default', () {
    final input = DashboardInstance(id: 'older', kind: DashboardKind.series).toJson();
    input.remove('showSourceRating');
    expect(DashboardInstance.fromJson(input).showSourceRating, isTrue);
  });

  test('unknown appearance variants are rejected', () {
    expect(
      () => DashboardInstance(id: 'bad', kind: DashboardKind.movies, displayStyle: 'third-party-ui'),
      throwsFormatException,
    );
  });
}
