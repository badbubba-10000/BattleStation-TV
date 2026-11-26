import 'package:iptvmac/bstv/local_data_policy.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:provider/provider.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/bstv/cloud_sync_service.dart';
import 'package:iptvmac/bstv/theme_package.dart';
import 'package:iptvmac/bstv/dashboard_model.dart';
import 'package:iptvmac/bstv/preview_navigation.dart';
import 'package:iptvmac/ui/cloud_sync_screen.dart';

import '../app/harness.dart';

class TestCloud extends CloudSyncClient {
  int registrations = 0, uploads = 0;
  @override
  Future<void> restoreSession() async {}
  @override
  Future<void> signUp(String email, String password) async {
    registrations++;
  }

  @override
  Future<void> saveTheme(BstvThemePackage theme) async {
    uploads++;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test(
    'same sidebar destination dispatches once per request, including repeats',
    () {
      var count = 0;
      void listener() => count++;
      BstvPreviewNavigation.requestedDestination.addListener(listener);
      BstvPreviewNavigation.navigate(0);
      BstvPreviewNavigation.navigate(0);
      expect(count, 2);
      BstvPreviewNavigation.requestedDestination.removeListener(listener);
      expect(BstvPreviewNavigation.destinations.last.$1, 'Cloud Sync');
    },
  );
  if (!localDataOnly) {
    test('cloud payload excludes free text, provider bindings and imported IDs without changing local theme', () async {
      FlutterSecureStorage.setMockInitialValues({});
      final calls = <http.Request>[];
      final client = CloudSyncClient(
        httpClient: MockClient((request) async {
          calls.add(request);
          return http.Response(
            request.url.host == 'identitytoolkit.googleapis.com'
                ? jsonEncode({
                    'idToken': 'fake-id-token',
                    'refreshToken': 'fake-refresh',
                    'localId': 'fake-uid',
                    'email': 'test@example.invalid',
                    'expiresIn': '3600',
                  })
                : '{}',
            200,
          );
        }),
      );
      await client.signUp('test@example.invalid', 'test-only-password');
      expect(calls.length, 1);
      expect(calls.first.url.host, 'identitytoolkit.googleapis.com');
      final theme = BstvThemePackage.defaults().withLayout(
        DashboardLayout(
          device: DashboardDevice.desktop,
          widgets: [
            DashboardInstance(
              id: 'privateImportedToken',
              kind: DashboardKind.movies,
              title: 'http://private-provider.invalid/user/password',
              categoryId: 'privateCategoryToken',
            ),
          ],
        ),
      );
      final before = theme.encode();
      await client.saveTheme(theme);
      final body = calls.last.body;
      expect(calls.last.url.host, 'firestore.googleapis.com');
      expect(body, isNot(contains('private-provider')));
      expect(body, isNot(contains('privateCategoryToken')));
      expect(body, isNot(contains('privateImportedToken')));
      expect(theme.encode(), before);
      client.dispose();
    });
    testWidgets(
      'registration requires an explicit privacy acknowledgement and never uploads a theme',
      (tester) async {
        final h = await Harness.create(tester);
        final client = TestCloud();
        tester.view.devicePixelRatio = 1;
        tester.view.physicalSize = const Size(1200, 1000);
        addTearDown(tester.view.reset);
        await tester.pumpWidget(
          ChangeNotifierProvider<LibraryModel>.value(
            value: h.model,
            child: MaterialApp(home: CloudSyncScreen(client: client)),
          ),
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('New user? Create account'));
        await tester.pumpAndSettle();
        await tester.enterText(
          find.widgetWithText(TextField, 'Email address'),
          'test@example.invalid',
        );
        await tester.enterText(
          find.widgetWithText(TextField, 'Password'),
          'test-only-password',
        );
        await tester.tap(find.text('Create account'));
        await tester.pumpAndSettle();
        final agree = find.widgetWithText(
          FilledButton,
          'I Agree — Create Account',
        );
        expect(tester.widget<FilledButton>(agree).onPressed, isNull);
        expect(client.registrations, 0);
        await tester.ensureVisible(find.byType(CheckboxListTile));
        await tester.tap(find.byType(CheckboxListTile));
        await tester.pumpAndSettle();
        expect(tester.widget<FilledButton>(agree).onPressed, isNotNull);
        await tester.tap(agree);
        await tester.pumpAndSettle();
        expect(client.registrations, 1);
        expect(client.uploads, 0);
        expect(tester.takeException(), isNull);
        await tester.pumpWidget(const SizedBox());
      },
    );
  }
}
