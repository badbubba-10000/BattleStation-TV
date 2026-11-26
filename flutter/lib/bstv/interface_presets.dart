// BattleStation TV original interface presets; inspired by common media layouts.
// No third-party artwork, branding, credentials or proprietary UI assets.
import 'dart:math' as math;

import 'dashboard_editor_model.dart';
import 'dashboard_model.dart';
import 'theme_package.dart';
import 'interface_layout.dart';

class BstvInterfacePreset {
  const BstvInterfacePreset(
    this.name,
    this.description,
    this.accent,
    this.order, {
    this.heroHeight = 300,
    this.tileHeight = 260,
    this.list = false,
    this.padding = 12,
    this.maxItems = 8,
  });

  final String name;
  final String description;
  final int accent;
  final List<DashboardKind> order;
  final double heroHeight, tileHeight, padding;
  final int maxItems;
  final bool list;

  static const cinematic = [
    DashboardKind.featured,
    DashboardKind.movies,
    DashboardKind.series,
    DashboardKind.guide,
    DashboardKind.favorites,
    DashboardKind.downloads,
    DashboardKind.dvr,
  ];
  static const television = [
    DashboardKind.guide,
    DashboardKind.favorites,
    DashboardKind.featured,
    DashboardKind.movies,
    DashboardKind.series,
    DashboardKind.dvr,
    DashboardKind.downloads,
  ];
  static const library = [
    DashboardKind.movies,
    DashboardKind.series,
    DashboardKind.featured,
    DashboardKind.favorites,
    DashboardKind.guide,
    DashboardKind.downloads,
    DashboardKind.dvr,
  ];

  static const all = <BstvInterfacePreset>[
    BstvInterfacePreset(
      'BattleStation Original',
      'Original purple home dashboard',
      0xFF7838D6,
      cinematic,
    ),
    BstvInterfacePreset(
      'Netflix-inspired',
      'Cinematic hero and large movie rows',
      0xFFE53935,
      cinematic,
      heroHeight: 430,
      tileHeight: 300,
      maxItems: 12,
    ),
    BstvInterfacePreset(
      'Hulu-inspired',
      'Green accents and prominent browsing',
      0xFF21B66F,
      cinematic,
      heroHeight: 370,
      tileHeight: 280,
    ),
    BstvInterfacePreset(
      'Peacock-inspired',
      'Violet highlights and compact content rows',
      0xFFAD62ED,
      cinematic,
      heroHeight: 340,
      tileHeight: 240,
    ),
    BstvInterfacePreset(
      'Jellyfin-inspired',
      'Media library first with blue accents',
      0xFF278BCE,
      library,
      tileHeight: 300,
    ),
    BstvInterfacePreset(
      'Plex-inspired',
      'Gold accent and collection-first browsing',
      0xFFE6A526,
      library,
      tileHeight: 290,
    ),
    BstvInterfacePreset(
      'YouTube-inspired',
      'Dense video grid and smaller feature card',
      0xFFED3B38,
      library,
      heroHeight: 250,
      tileHeight: 220,
      maxItems: 16,
    ),
    BstvInterfacePreset(
      'Apple TV-inspired',
      'Spacious featured artwork',
      0xFF647A91,
      cinematic,
      heroHeight: 450,
      tileHeight: 330,
      padding: 18,
    ),
    BstvInterfacePreset(
      'Disney-inspired',
      'Blue cinema collection browsing',
      0xFF2875D7,
      cinematic,
      heroHeight: 410,
    ),
    BstvInterfacePreset(
      'Prime Video-inspired',
      'Blue highlights and widescreen content',
      0xFF169AD9,
      cinematic,
    ),
    BstvInterfacePreset(
      'Classic Cable TV',
      'Live guide at the top with list-style panels',
      0xFF186AC6,
      television,
      heroHeight: 260,
      tileHeight: 260,
      list: true,
    ),
    BstvInterfacePreset(
      'TiviMate-inspired',
      'Guide-first TV layout',
      0xFF2888C9,
      television,
      list: true,
      tileHeight: 240,
    ),
    BstvInterfacePreset(
      'IPTV Smarters-inspired',
      'Large home sections and channel lists',
      0xFF4A83D9,
      television,
      heroHeight: 330,
      list: true,
    ),
    BstvInterfacePreset(
      'Kodi-inspired',
      'Organized media-center dashboard',
      0xFF2789C7,
      library,
      list: true,
    ),
    BstvInterfacePreset(
      'Sparkle TV-inspired',
      'Guide, favorites and recording sections',
      0xFF3C91C1,
      television,
      list: true,
    ),
    BstvInterfacePreset(
      'OTT Navigator-inspired',
      'Compact lists and channel browsing',
      0xFF309B7F,
      television,
      list: true,
      tileHeight: 220,
      maxItems: 14,
    ),
  ];

  String get _navigation => switch (all.indexWhere((p) => p.name == name)) {
    0 => 'adaptive',
    1 || 2 || 7 || 8 || 9 => 'top',
    3 => 'bottom',
    4 || 5 => 'sidebar',
    6 => 'compact',
    _ => 'television',
  };

  /// Generate distinct, non-overlapping phone/tablet/desktop widget layouts.
  /// Existing user accounts, favorites, passwords and provider configurations
  /// are deliberately absent from the portable theme package.
  BstvThemePackage buildTheme() {
    final layouts = <DashboardDevice, DashboardLayout>{};
    for (final device in DashboardDevice.values) {
      final canvas = device == DashboardDevice.phone
          ? 400.0
          : device == DashboardDevice.tablet
          ? 800.0
          : 1200.0;
      final columns = device == DashboardDevice.phone ? 1 : 2;
      final standardWidth = canvas / columns;
      final widgets = <DashboardInstance>[];
      for (final kind in order) {
        final isHero = kind == DashboardKind.featured;
        final isGuide = kind == DashboardKind.guide;
        final width = (isHero || (isGuide && list)) ? canvas : standardWidth;
        final minHeight = DashboardRegistry.definitions[kind]!.minHeight;
        widgets.add(
          DashboardInstance(
            id: 'default-${kind.name}',
            kind: kind,
            width: width,
            height: math.max(minHeight, isHero ? heroHeight : tileHeight),
            maxItems: maxItems,
            displayStyle: list ? 'list' : 'grid',
            padding: padding,
          ),
        );
      }
      layouts[device] = arrangeDashboard(
        DashboardLayout(device: device, widgets: widgets),
      );
    }
    return BstvThemePackage(
      appearance: 'dark',
      accentArgb: accent,
      dashboardOrder: [for (final kind in order) kind.name],
      hiddenWidgets: const [],
      layouts: layouts,
      interface: InterfaceLayout(
        navigation: _navigation,
        movies: list
            ? 'list'
            : maxItems >= 14
            ? 'grid'
            : 'carousel',
        series: list
            ? 'list'
            : heroHeight >= 370
            ? 'carousel'
            : 'grid',
        live: list ? 'list' : 'grid',
        spacing: padding,
        radius: list
            ? 4
            : heroHeight >= 370
            ? 18
            : 10,
        scale: list ? .95 : 1,
        reducedMotion: list,
      ),
    );
  }
}
