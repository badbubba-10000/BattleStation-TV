import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:iptvmac/app/device.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/bstv/core_services.dart';
import 'package:iptvmac/bstv/feature_models.dart';
import 'package:iptvmac/bstv/feature_store.dart';
import 'package:iptvmac/bstv/guide_service.dart';
import 'package:iptvmac/bstv/live_guide_workspace.dart';
import 'package:iptvmac/bstv/preview_navigation.dart';
import 'package:iptvmac/core/models.dart';
import 'package:iptvmac/l10n/app_localizations.dart';
import 'package:iptvmac/player/play_request.dart';
import 'package:iptvmac/player/playback_diagnostics.dart';
import 'package:iptvmac/player/player_model.dart';
import 'package:iptvmac/player/player_prefs.dart';
import 'package:iptvmac/player/player_screen.dart';

import '../app/harness.dart';
import '../player/fake_engine.dart';
import '../player/player_screen_test.dart' show FakeHost, FakeSystem;

class LiveHost extends FakeHost implements LiveChannelHost {
  bool allowed = true;
  @override
  bool allowReplacement(PlayRequest request) => allowed;
  @override
  PlayRequest channelRequest(Item item) => PlayRequest(
    title: item.name,
    url: Uri.parse('https://fixture.invalid/live/${item.streamId}.ts'),
    isLive: true,
    item: item,
  );
}

class GuideEngine extends FakeEngine implements DiagnosticPlaybackEngine {
  @override
  PlaybackDiagnostics get diagnostics => PlaybackDiagnostics(
    issue: lastError == null
        ? null
        : const PlaybackIssue(
            PlaybackFailureKind.authentication,
            'Access rejected',
            httpStatus: 401,
          ),
  );
}

void main() {
  testWidgets(
    'automatic muted single-stream previews switch selection, avoid same-channel restart, restore and commit',
    (tester) async {
      final h = await Harness.create(tester, withAccount: true);
      final store = FeatureStore(':memory:');
      final core = CoreServices(
        store,
        h.model,
        'unused',
        MemoryGuideSecrets(),
        guideClient: h.provider.client,
      );
      final engine = GuideEngine(), host = LiveHost();
      final oldDesktop = isDesktop;
      isDesktop = true;
      addTearDown(() => isDesktop = oldDesktop);
      final items = [
        for (final name in ['A', 'B', 'C'])
          h.db.write(
            (db) => Item(
              accountId: h.model.account!.id!,
              type: ItemType.live,
              name: name,
              streamId: name,
            ).insert(db),
          ),
      ];
      final now = DateTime.now();
      store.saveSource(
        const GuideSource(
          id: 'fixture',
          name: 'Fixture',
          kind: GuideSourceKind.xmltv,
        ),
      );
      for (final item in items) {
        final channel = GuideChannel(
          sourceId: 'fixture',
          id: item.streamId,
          name: item.name,
        );
        store.putChannel(channel);
        store.mapChannel(channelKey(item), channel);
      }
      store.replacePrograms('fixture', [
        GuideProgramme(
          sourceId: 'fixture',
          channelId: 'B',
          title: 'Current B',
          start: now.subtract(const Duration(minutes: 5)),
          end: now.add(const Duration(minutes: 55)),
        ),
        GuideProgramme(
          sourceId: 'fixture',
          channelId: 'C',
          title: 'Future C',
          start: now.add(const Duration(minutes: 20)),
          end: now.add(const Duration(minutes: 80)),
        ),
      ]);
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = const Size(1440, 900);
      addTearDown(tester.view.reset);
      PlayerModel? active;
      var factories = 0;
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<LibraryModel>.value(value: h.model),
            ChangeNotifierProvider<CoreServices>.value(value: core),
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: PlayerScreen(
              request: PlayRequest(
                title: 'A',
                url: Uri.parse('https://fixture.invalid/live/A.ts'),
                isLive: true,
                item: items[0],
                preview: false,
              ),
              host: host,
              engineFactory: (_) {
                factories++;
                return engine;
              },
              system: FakeSystem(),
              prefs: PlayerPrefs(keepGuideOpen: true),
              guideBuilder: (context, model, video) {
                active = model;
                return buildLiveGuideWorkspace(context, model, video);
              },
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.keyG);
      await tester.pump();
      await tester.pump();
      expect(factories, 1);
      expect(engine.loads.length, 1);
      expect(active!.muted, isTrue);
      active!.setVolume(.35);
      expect(engine.commands.last, 'volume 0.35');
      active!.setVolume(0);
      await tester.tap(find.widgetWithText(ListTile, 'B'));
      await tester.pump();
      expect(active!.request.title, 'B');
      expect(engine.loads.length, 2);
      expect(active!.muted, isTrue);
      await tester.tap(find.text('Current B').last);
      await tester.pump();
      expect(engine.loads.length, 2);
      await tester.tap(find.text('Future C'));
      await tester.pump();
      expect(active!.request.title, 'C');
      expect(engine.loads.length, 3);
      expect(find.byKey(const Key('watch-guide-channel')), findsNothing);
      await tester.tap(find.byKey(const Key('close-live-guide')));
      await tester.pump();
      expect(active!.request.title, 'A');
      expect(active!.volume, 1);
      expect(engine.loads.length, 4);
      await tester.sendKeyEvent(LogicalKeyboardKey.keyG);
      await tester.pump();
      await tester.pump();
      await tester.tap(find.widgetWithText(ListTile, 'B'));
      await tester.pump();
      final beforeCommit = engine.loads.length;
      expect(active!.muted, isTrue);
      await tester.tap(find.byKey(const Key('watch-guide-channel')));
      await tester.pump();
      expect(active!.request.title, 'B');
      expect(active!.muted, isFalse);
      expect(engine.loads.length, beforeCommit);
      await tester.tap(find.byKey(const Key('close-live-guide')));
      await tester.pump();
      expect(active!.request.title, 'B');
      expect(engine.loads.length, beforeCommit);
      expect(factories, 1);
      await tester.sendKeyEvent(LogicalKeyboardKey.keyG);
      await settle(tester, 4);
      expect(find.byType(BstvPreviewSidebar), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('preview-nav-3')));
      await tester.pump();
      expect(BstvPreviewNavigation.requestedDestination.value, 3);
      expect(host.closed, 1);
      expect(tester.takeException(), isNull);
      await tester.pumpWidget(const SizedBox.shrink());
      expect(engine.disposed, isTrue);
      core.dispose();
      store.close();
      h.model.dispose();
      h.db.close();
    },
  );
}
