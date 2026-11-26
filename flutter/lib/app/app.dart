// Modified for BattleStation TV, 2026-11-22. See BSTV-NOTICE.md.
import 'package:flutter/material.dart';
import 'package:iptvmac/bstv/identity.dart';
import 'package:iptvmac/bstv/theme_package.dart';
import 'package:iptvmac/bstv/core_services.dart';
import 'package:iptvmac/bstv/feature_store.dart';
import 'package:iptvmac/bstv/guide_service.dart';
import 'package:iptvmac/app/device.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/downloads/downloads_model.dart';
import 'package:iptvmac/l10n/app_localizations.dart';
import 'package:iptvmac/ui/root.dart';
import 'package:iptvmac/ui/theme.dart';
import 'package:iptvmac/ui/tv.dart';
import 'package:provider/provider.dart';

/// The app: Material 3, light/dark/system, the 31 languages (right-to-left ones mirror by themselves).
class IptvApp extends StatelessWidget {
  IptvApp({
    super.key,
    required this.model,
    DownloadsModel? downloads,
    this.locale,
    this.dashboard = true,
    this.core,
  }) : downloads = isTelevision
           ? DownloadsModel.disabled()
           : downloads ??
                 DownloadsModel.disabled(); // a TV has no storage for downloads
  final LibraryModel model;
  final CoreServices? core;

  /// Off (no buttons, no screens) unless the platform entry point passes a real one.
  final DownloadsModel downloads;

  /// Null = the device language.
  final Locale? locale;
  final bool dashboard;

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider<LibraryModel>.value(value: model),
      ChangeNotifierProvider<DownloadsModel>.value(value: downloads),
      ChangeNotifierProvider<CoreServices>(
        create: (_) =>
            core ??
            CoreServices(
              FeatureStore(':memory:'),
              model,
              '',
              MemoryGuideSecrets(),
            ),
      ),
    ],
    child: Selector<LibraryModel, String>(
      selector: (_, current) => current.prefs.bstvTheme.encode(),
      builder: (_, encoded, _) {
        final currentTheme = BstvThemePackage.decode(encoded);
        final accent = Color(currentTheme.accentArgb);
        return MaterialApp(
        title: BstvIdentity.name,
        debugShowCheckedModeBanner: false,
        theme: currentTheme.interface.apply(Brand.theme(Brightness.light, accentOverride: accent)),
        darkTheme: currentTheme.interface.apply(Brand.theme(Brightness.dark, accentOverride: accent)),
        highContrastTheme: Brand.theme(Brightness.light, high: true, accentOverride: accent),
        highContrastDarkTheme: Brand.theme(Brightness.dark, high: true, accentOverride: accent),
        themeMode: switch (currentTheme.appearance) {
          'light' => ThemeMode.light,
          'dark' => ThemeMode.dark,
          _ => ThemeMode.system,
        },
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context,child)=>MediaQuery(data:MediaQuery.of(context).copyWith(disableAnimations:currentTheme.interface.reducedMotion || MediaQuery.of(context).disableAnimations),child:isTelevision?TvShell(child:child!):child!),
        home: RootScreen(dashboard: dashboard),
      );
      },
    ),
  );
}
