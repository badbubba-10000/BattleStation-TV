import 'package:package_info_plus/package_info_plus.dart';
import 'package:iptvmac/app/update_manager.dart';

// Modified for BattleStation TV, 2026-11-22. See BSTV-NOTICE.md.
import 'dart:io' show Platform, Directory, File, pid;

import 'package:iptvmac/bstv/identity.dart';
import 'package:iptvmac/bstv/core_services.dart';
import 'package:iptvmac/bstv/feature_store.dart';
import 'package:iptvmac/bstv/guide_service.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:iptvmac/app/app.dart';
import 'package:iptvmac/app/demo_seed.dart';
import 'package:iptvmac/app/device.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/app/secure_secret_store.dart';
import 'package:iptvmac/app/sync_worker.dart';
import 'package:iptvmac/core/app_database.dart';
import 'package:iptvmac/core/secret_store.dart';
import 'package:iptvmac/downloads/open_downloads.dart';
import 'package:iptvmac/downloads/downloads_model.dart';
import 'package:media_kit/media_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main(List<String> arguments) async {
  WidgetsFlutterBinding.ensureInitialized();
  // Explicit developer smoke mode: never opens the user's persistent data,
  // credential store, transfer queue or preferences and never auto-refreshes.
  final smokeTest = arguments.contains('--bstv-smoke-test');
  if (smokeTest) {
    // This explicitly requested diagnostic session is a test, even in release
    // mode. Use the package's in-memory test store instead of any user file.
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
  }
  if (!Platform.isWindows) MediaKit.ensureInitialized(); // Windows loads libmpv with the first picture (MediaKitEngine): the app opens lighter and faster
  final dir = smokeTest
      ? await Directory.systemTemp.createTemp('bstv-smoke-')
      : await Directory(
          '${(await getApplicationSupportDirectory()).path}/${BstvIdentity.storageFolder}',
        ).create(recursive: true);
  final path = '${dir.path}/iptv.sqlite';
  AppDatabase db;
  String? movedAside, failure;
  try {
    final opened = AppDatabase.openRecovering(path);
    db = opened.db;
    movedAside = opened.movedAside;
  } catch (e) {
    // No disk or no access: an in-memory database keeps the app usable, nothing is saved this session.
    db = AppDatabase.memory();
    failure = e.toString();
  }
  isDesktop = Platform.isWindows;
  isTelevision = await detectTelevision();
  if (isTelevision) {
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    ); // a TV has no bars; an emulator or box that draws them gets none
  }
  final package = smokeTest ? null : await PackageInfo.fromPlatform();
  final model = LibraryModel(
    db: db,
    secrets: smokeTest ? MemorySecretStore() : SecureSecretStore(),
    prefs: await SharedPreferences.getInstance(),
    dbPath: path,
    syncRunner: failure == null ? null : inlineSyncRunner(db),
    dbMovedAside: movedAside,
    autoRefresh: !smokeTest,
    appVersion: package == null
        ? null
        : '${package.version}+${package.buildNumber}',
    onClearImages: () async {
      PaintingBinding.instance.imageCache.clear();
      await DefaultCacheManager().emptyCache();
    },
  );
  if (failure != null) model.syncMessage = failure;
  await model.loadAccounts(); // before the first frame: a returning user must not see the welcome screen for an instant
  final downloads = smokeTest
      ? DownloadsModel.disabled()
      : await openDownloads(model, dir);
  FeatureStore featureStore;
  var featureStorageAvailable = true;
  try {
    featureStore = FeatureStore('${dir.path}/bstv-features.sqlite');
  } catch (_) {
    featureStore = FeatureStore(':memory:');
    featureStorageAvailable = false;
  }
  final core = CoreServices(
    featureStore,
    model,
    '${dir.path}/Recordings',
    smokeTest ? MemoryGuideSecrets() : SecureGuideSecrets(),
  );
  if (!featureStorageAvailable) {
    core.storageWarning = 'Guide storage is temporary and DVR scheduling is disabled because its database could not be opened. The original file was retained.';
    core.dvr.schedulingEnabled = false;
  }
  core.dvr.activeDownloads = (accountId) => downloads.entries
      .where((entry) => entry.accountId == accountId && entry.active)
      .length;
  if (!smokeTest) core.start();
  UpdateLifecycle.prepare = () async {
    if (model.syncing) {
      throw StateError(
        'Wait for the current playlist refresh before updating.',
      );
    }
    for (final close in tvExitHooks.toList()) {
      close();
    }
    for (final entry in downloads.entries.where((e) => e.active)) {
      await downloads.pause(entry.id);
    }
    await core.dvr.prepareForUpdate();
  };
  final app = IptvApp(model: model, downloads: downloads, core: core);
  runApp(
    smokeTest
        ? Directionality(
            textDirection: TextDirection.ltr,
            child: Banner(
              message: 'TEMPORARY',
              location: BannerLocation.topEnd,
              child: app,
            ),
          )
        : app,
  );
  if (smokeTest) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Fixed diagnostic fields only; no source names, addresses or credentials.
      final free = await core.dvr.freeSpace(dir.path);
      await File(
        '${Directory.systemTemp.path}/bstv-smoke-ready-$pid.txt',
      ).writeAsString(
        'FIRST_FRAME; temporary=true; accounts=${model.accounts.length}; storageProbe=${free > 0 ? 'passed' : 'failed'}',
      );
    });
    return;
  }
  await model.start();
  if (kDebugMode && const bool.fromEnvironment('DEMO_SEED')) {
    await seedDemo(model);
  }
}
