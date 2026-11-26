// BattleStation TV modifications, 2026. Distributed under upstream GPLv3.
// Pure, credential-free layout types. Editor gestures/persistence come next.
enum DashboardDevice { phone, tablet, desktop }

DashboardDevice dashboardDevice(double width) => width < 600
    ? DashboardDevice.phone
    : width < 1100
    ? DashboardDevice.tablet
    : DashboardDevice.desktop;

enum DashboardKind {
  featured,
  guide,
  movies,
  series,
  favorites,
  downloads,
  dvr,
}

class DashboardDefinition {
  const DashboardDefinition(
    this.kind,
    this.title, {
    this.minWidth = 240,
    this.minHeight = 180,
    this.maxWidth = 2400,
    this.maxHeight = 1600,
  });
  final DashboardKind kind;
  final String title;
  final double minWidth, minHeight, maxWidth, maxHeight;
}

abstract final class DashboardRegistry {
  static const definitions = {
    DashboardKind.featured: DashboardDefinition(
      DashboardKind.featured,
      'Featured',
      minHeight: 240,
    ),
    DashboardKind.guide: DashboardDefinition(
      DashboardKind.guide,
      'Live TV guide preview',
      minHeight: 200,
    ),
    DashboardKind.movies: DashboardDefinition(DashboardKind.movies, 'Movies'),
    DashboardKind.series: DashboardDefinition(DashboardKind.series, 'Series'),
    DashboardKind.favorites: DashboardDefinition(
      DashboardKind.favorites,
      'Favorite channels',
    ),
    DashboardKind.downloads: DashboardDefinition(
      DashboardKind.downloads,
      'Downloads',
    ),
    DashboardKind.dvr: DashboardDefinition(DashboardKind.dvr, 'DVR schedule'),
  };
}

class DashboardInstance {
  DashboardInstance({
    required this.id,
    required this.kind,
    this.categoryId,
    this.visible = true,
    this.locked = false,
    this.x = 0,
    this.y = 0,
    this.width = 400,
    this.height = 300,
    this.title,
    this.maxItems = 5,
    this.displayStyle = 'grid',
    this.showSourceRating = true,
    this.sourceScope = 'current',
    this.sort = 'catalog',
    this.padding = 16,
    this.backgroundArgb,
  }) {
    final definition = DashboardRegistry.definitions[kind]!;
    if (!RegExp(r'^[a-zA-Z0-9_-]{1,80}$').hasMatch(id) ||
        ![x, y, width, height].every((n) => n.isFinite) ||
        x < 0 ||
        y < 0 ||
        width < definition.minWidth ||
        width > definition.maxWidth ||
        height < definition.minHeight ||
        height > definition.maxHeight ||
        x > 10000 ||
        y > 120000 ||
        maxItems < 1 ||
        maxItems > 30 ||
        !{'grid', 'list', 'carousel', 'compact'}.contains(displayStyle) ||
        !{'current', 'all'}.contains(sourceScope) ||
        !{'catalog', 'name', 'random', 'recent'}.contains(sort) ||
        !padding.isFinite ||
        padding < 0 ||
        padding > 32 ||
        (backgroundArgb != null &&
            (backgroundArgb! < 0 || backgroundArgb! > 0xffffffff)) ||
        (title != null &&
            (title!.length > 80 || RegExp(r'[\x00-\x1f]').hasMatch(title!))) ||
        (categoryId != null &&
            (categoryId!.length > 128 ||
                RegExp(r'[:/\\\x00-\x1f]').hasMatch(categoryId!)))) {
      throw const FormatException('Invalid dashboard instance');
    }
  }
  final String id;
  final DashboardKind kind;
  // Provider mapping is local; portable layout must not carry URLs/credentials.
  final String? categoryId;
  final bool visible, locked;
  final double x, y, width, height;
  final String? title;
  final int maxItems;
  final String displayStyle, sourceScope, sort;
  final bool showSourceRating;
  final double padding;
  final int? backgroundArgb;
  DashboardInstance copyWith({
    String? id,
    String? title,
    String? categoryId,
    bool clearCategory = false,
    bool? visible,
    double? x,
    double? y,
    double? width,
    double? height,
    int? maxItems,
    String? displayStyle,
    bool? showSourceRating,
    String? sourceScope,
    String? sort,
    double? padding,
    int? backgroundArgb,
  }) => DashboardInstance(
    id: id ?? this.id,
    kind: kind,
    title: title ?? this.title,
    categoryId: clearCategory ? null : categoryId ?? this.categoryId,
    visible: visible ?? this.visible,
    locked: locked,
    x: x ?? this.x,
    y: y ?? this.y,
    width: width ?? this.width,
    height: height ?? this.height,
    maxItems: maxItems ?? this.maxItems,
    displayStyle: displayStyle ?? this.displayStyle,
    showSourceRating: showSourceRating ?? this.showSourceRating,
    sourceScope: sourceScope ?? this.sourceScope,
    sort: sort ?? this.sort,
    padding: padding ?? this.padding,
    backgroundArgb: backgroundArgb ?? this.backgroundArgb,
  );

  Map<String, Object?> toJson() => {
    'id': id,
    'type': kind.name,
    'visible': visible,
    'locked': locked,
    'x': x,
    'y': y,
    'width': width,
    'height': height,
    'title': ?title,
    'maxItems': maxItems,
    'displayStyle': displayStyle,
    'showSourceRating': showSourceRating,
    'sourceScope': sourceScope,
    'sort': sort,
    'padding': padding,
    'background': ?backgroundArgb,
    if (categoryId != null) 'categoryId': categoryId,
  };
  factory DashboardInstance.fromJson(Map<String, dynamic> json) {
    const fields = {
      'id',
      'type',
      'visible',
      'locked',
      'x',
      'y',
      'width',
      'height',
      'categoryId',
      'title',
      'maxItems',
      'displayStyle',
      'showSourceRating',
      'sourceScope',
      'sort',
      'padding',
      'background',
    };
    if (json.keys.any((key) => !fields.contains(key))) {
      throw const FormatException('Unsupported widget field');
    }
    try {
      return DashboardInstance(
        id: json['id'],
        kind: DashboardKind.values.byName(json['type']),
        visible: json['visible'] ?? true,
        locked: json['locked'] ?? false,
        x: (json['x'] as num? ?? 0).toDouble(),
        y: (json['y'] as num? ?? 0).toDouble(),
        width: (json['width'] as num? ?? 400).toDouble(),
        height: (json['height'] as num? ?? 300).toDouble(),
        categoryId: json['categoryId'],
        title: json['title'],
        maxItems: json['maxItems'] ?? 5,
        displayStyle: json['displayStyle'] ?? 'grid',
        showSourceRating: json['showSourceRating'] ?? true,
        sourceScope: json['sourceScope'] ?? 'current',
        sort: json['sort'] ?? 'catalog',
        padding: (json['padding'] as num? ?? 16).toDouble(),
        backgroundArgb: json['background'],
      );
    } catch (_) {
      throw const FormatException('Invalid dashboard widget');
    }
  }
}

class DashboardLayout {
  DashboardLayout({
    required this.device,
    required List<DashboardInstance> widgets,
  }) : widgets = List.unmodifiable(widgets) {
    if (widgets.length > 64 ||
        widgets.map((w) => w.id).toSet().length != widgets.length) {
      throw const FormatException('Duplicate IDs or too many widgets');
    }
  }
  static const schemaVersion = 1;
  final DashboardDevice device;
  final List<DashboardInstance> widgets;
  int get columns => switch (device) {
    DashboardDevice.phone => 4,
    DashboardDevice.tablet => 8,
    DashboardDevice.desktop => 12,
  };
  double get canvasWidth => columns * 100.0;
  factory DashboardLayout.fromJson(Map<String, dynamic> json) {
    if (json.keys.any(
          (key) => !{'schemaVersion', 'device', 'widgets'}.contains(key),
        ) ||
        json['schemaVersion'] != schemaVersion ||
        json['widgets'] is! List) {
      throw const FormatException('Unsupported layout format');
    }
    try {
      return DashboardLayout(
        device: DashboardDevice.values.byName(json['device']),
        widgets: [
          for (final item in json['widgets'])
            DashboardInstance.fromJson(Map<String, dynamic>.from(item)),
        ],
      );
    } catch (_) {
      throw const FormatException('Invalid dashboard layout');
    }
  }
  Map<String, Object?> toJson() => {
    'schemaVersion': schemaVersion,
    'device': device.name,
    'widgets': widgets.map((w) => w.toJson()).toList(),
  };

  factory DashboardLayout.defaults(DashboardDevice device) => DashboardLayout(
    device: device,
    widgets: [
      for (final (index, kind) in DashboardKind.values.indexed)
        DashboardInstance(
          id: 'default-${kind.name}',
          kind: kind,
          y: index * 320.0,
        ),
    ],
  );
}
