import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/bstv/dashboard_model.dart';

void main() {
  for (final sort in ['catalog', 'name', 'random', 'recent']) {
    test('Dashboard sort $sort survives a saved layout', () {
      final widget = DashboardInstance(id: 'sample', kind: DashboardKind.movies, sort: sort);
      final roundTrip = DashboardInstance.fromJson(Map<String, dynamic>.from(widget.toJson()));
      expect(roundTrip.sort, sort);
    });
  }
}
