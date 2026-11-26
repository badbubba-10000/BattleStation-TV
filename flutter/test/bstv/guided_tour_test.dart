import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:iptvmac/bstv/guided_tour.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('tour is optional and remembers a skip', () async {
    expect(await TourService.shouldOffer('demo'), isTrue);
    await TourService.remember('demo');
    expect(await TourService.shouldOffer('demo'), isFalse);
    expect(await TourService.shouldOffer('main'), isTrue);
  });

  testWidgets('spotlight controls advance, go back and skip entire tour', (tester) async {
    final anchor = GlobalKey();
    var index = 0;
    var skipped = false;
    final steps = <TourStep>[
      TourStep(title: 'Home', description: 'A home screen.', target: anchor),
      const TourStep(title: 'Second', description: 'Second step.'),
      const TourStep(title: 'Third', description: 'Third step.'),
    ];
    late StateSetter rebuild;
    await tester.pumpWidget(MaterialApp(home: StatefulBuilder(builder: (context, setState) {
      rebuild = setState;
      return Scaffold(body: Stack(children: [
        Positioned(top: 60, left: 20, child: SizedBox(key: anchor, width: 100, height: 40)),
        if (!skipped) Positioned.fill(child: GuidedTourOverlay(
          brand: 'Test', steps: steps, index: index,
          onNext: () => rebuild(() { index++; if (index >= steps.length) skipped = true; }),
          onBack: () => rebuild(() { index--; }),
          onSkip: () => rebuild(() { skipped = true; }),
        )),
      ]));
    })));
    expect(find.text('Home'), findsOneWidget);
    await tester.tap(find.byKey(const Key('tour-next')));
    await tester.pump();
    expect(find.text('Second'), findsOneWidget);
    await tester.tap(find.byKey(const Key('tour-back')));
    await tester.pump();
    expect(find.text('Home'), findsOneWidget);
    await tester.tap(find.byKey(const Key('tour-skip')));
    await tester.pump();
    expect(find.byType(GuidedTourOverlay), findsNothing);
  });
}
