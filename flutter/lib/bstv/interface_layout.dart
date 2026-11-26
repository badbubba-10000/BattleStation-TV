// Interface Revolution configuration, 2026. GPLv3. No identity or private data.
import 'package:flutter/material.dart';

class InterfaceLayout {
  const InterfaceLayout({
    this.navigation = 'adaptive',
    this.movies = 'grid',
    this.series = 'grid',
    this.live = 'list',
    this.spacing = 16,
    this.radius = 10,
    this.scale = 1,
    this.reducedMotion = false,
    this.sidebarWidth = 220,
    this.navDisplay = 'both',
    this.hiddenNavigation = const <int>[],
    this.navigationOrder = const <int>[],
  });
  final String navigation, movies, series, live;
  final double spacing, radius, scale;
  final bool reducedMotion;
  final double sidebarWidth;
  final String navDisplay;
  final List<int> hiddenNavigation, navigationOrder;
  static const navigationStyles = [
    'adaptive',
    'sidebar',
    'right',
    'compact',
    'top',
    'bottom',
    'television',
  ];
  InterfaceLayout copyWith({
    String? navigation,
    double? spacing,
    double? radius,
    double? scale,
    bool? reducedMotion,
    double? sidebarWidth,
    String? navDisplay,
    List<int>? hiddenNavigation,
    List<int>? navigationOrder,
  }) => InterfaceLayout(
    navigation: navigation ?? this.navigation,
    movies: movies,
    series: series,
    live: live,
    spacing: spacing ?? this.spacing,
    radius: radius ?? this.radius,
    scale: scale ?? this.scale,
    reducedMotion: reducedMotion ?? this.reducedMotion,
    sidebarWidth: sidebarWidth ?? this.sidebarWidth,
    navDisplay: navDisplay ?? this.navDisplay,
    hiddenNavigation: hiddenNavigation ?? this.hiddenNavigation,
    navigationOrder: navigationOrder ?? this.navigationOrder,
  );
  Map<String, Object> toJson() => {
    'navigation': navigation,
    'movies': movies,
    'series': series,
    'live': live,
    'spacing': spacing,
    'radius': radius,
    'scale': scale,
    'reducedMotion': reducedMotion,
    'sidebarWidth': sidebarWidth,
    'navDisplay': navDisplay,
    'hiddenNavigation': hiddenNavigation,
    'navigationOrder': navigationOrder,
  };
  factory InterfaceLayout.fromJson(Map<String, dynamic> json) {
    if (json.keys.any(
      (k) => !{
        'navigation',
        'movies',
        'series',
        'live',
        'spacing',
        'radius',
        'scale',
        'reducedMotion',
        'sidebarWidth',
        'navDisplay',
        'hiddenNavigation',
        'navigationOrder',
      }.contains(k),
    )) {
      throw const FormatException('Unsupported interface field');
    }
    try {
      final v = InterfaceLayout(
        navigation: json['navigation'] ?? 'adaptive',
        movies: json['movies'] ?? 'grid',
        series: json['series'] ?? 'grid',
        live: json['live'] ?? 'list',
        spacing: (json['spacing'] as num? ?? 16).toDouble(),
        radius: (json['radius'] as num? ?? 10).toDouble(),
        scale: (json['scale'] as num? ?? 1).toDouble(),
        reducedMotion: json['reducedMotion'] ?? false,
        sidebarWidth: (json['sidebarWidth'] as num? ?? 220).toDouble(),
        navDisplay: json['navDisplay'] ?? 'both',
        hiddenNavigation: (json['hiddenNavigation'] as List<dynamic>? ?? []).cast<int>(),
        navigationOrder: (json['navigationOrder'] as List<dynamic>? ?? []).cast<int>(),
      );
      if (!navigationStyles.contains(v.navigation) ||
          !v.sidebarWidth.isFinite || v.sidebarWidth < 72 || v.sidebarWidth > 360 ||
          !{'icons', 'text', 'both'}.contains(v.navDisplay) ||
          v.hiddenNavigation.any((i) => i < 0 || i > 10 || i == 9) ||
          v.navigationOrder.any((i) => i < 0 || i > 10) ||
          v.hiddenNavigation.toSet().length != v.hiddenNavigation.length ||
          v.navigationOrder.toSet().length != v.navigationOrder.length ||
          !{'grid', 'list', 'carousel'}.contains(v.movies) ||
          !{'grid', 'list', 'carousel'}.contains(v.series) ||
          !{'grid', 'list'}.contains(v.live) ||
          !v.spacing.isFinite ||
          v.spacing < 4 ||
          v.spacing > 32 ||
          !v.radius.isFinite ||
          v.radius < 0 ||
          v.radius > 32 ||
          !v.scale.isFinite ||
          v.scale < .85 ||
          v.scale > 1.4) {
        throw const FormatException('Invalid interface configuration');
      }
      return v;
    } catch (_) {
      throw const FormatException('Invalid interface configuration');
    }
  }
  ThemeData apply(ThemeData base) => base.copyWith(
    textTheme: base.textTheme.apply(fontSizeFactor: scale),
    cardTheme: base.cardTheme.copyWith(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
    visualDensity: spacing <= 10
        ? VisualDensity.compact
        : VisualDensity.standard,
  );
}
