import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;
import 'package:iptvmac/bstv/local_data_policy.dart';
import 'package:iptvmac/bstv/cloud_sync_service.dart';
import 'package:iptvmac/ui/cloud_sync_screen.dart';

void main() {
  if (!localDataOnly) {
    test('production retains optional cloud support', () { expect(localDataOnly, isFalse); });
    return;
  }

  test(
    'local-only policy blocks cloud HTTP before contacting a server',
    () async {
      expect(localDataOnly, isTrue);
      var requests = 0;
      final client = CloudSyncClient(
        httpClient: MockClient((_) async {
          requests++;
          return http.Response('{}', 200);
        }),
      );
      await client.restoreSession();
      await expectLater(
        client.signIn('synthetic@example.invalid', 'synthetic'),
        throwsA(isA<CloudSyncException>()),
      );
      await expectLater(
        client.signUp('synthetic@example.invalid', 'synthetic'),
        throwsA(isA<CloudSyncException>()),
      );
      await expectLater(
        client.sendPasswordReset('synthetic@example.invalid'),
        throwsA(isA<CloudSyncException>()),
      );
      expect(requests, 0);
      client.dispose();
    },
  );
  testWidgets('local-only privacy screen offers no registration or upload', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: CloudSyncScreen()));
    await tester.pump();
    expect(find.text('Local data & privacy'), findsOneWidget);
    expect(find.byType(TextField), findsNothing);
    expect(find.text('Create account'), findsNothing);
    expect(tester.takeException(), isNull);
    await tester.pumpWidget(const SizedBox());
  });
}
