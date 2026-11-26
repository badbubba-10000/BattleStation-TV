// BattleStation TV editor preferences. GPLv3. Portable logical pixels.
class EditorPreferences {
  const EditorPreferences({
    this.snap = true,
    this.gridSize = 16,
    this.magnetic = false,
    this.showGrid = true,
    this.gridOpacity = .12,
    this.showGuides = true,
    this.threshold = 8,
  });
  final bool snap, magnetic, showGrid, showGuides;
  final double gridSize, gridOpacity, threshold;
  EditorPreferences copyWith({
    bool? snap,
    double? gridSize,
    bool? magnetic,
    bool? showGrid,
    double? gridOpacity,
    bool? showGuides,
  }) => EditorPreferences(
    snap: snap ?? this.snap,
    gridSize: gridSize ?? this.gridSize,
    magnetic: magnetic ?? this.magnetic,
    showGrid: showGrid ?? this.showGrid,
    gridOpacity: gridOpacity ?? this.gridOpacity,
    showGuides: showGuides ?? this.showGuides,
    threshold: threshold,
  );
  Map<String, Object> toJson() => {
    'snap': snap,
    'gridSize': gridSize,
    'magnetic': magnetic,
    'showGrid': showGrid,
    'gridOpacity': gridOpacity,
    'showGuides': showGuides,
    'threshold': threshold,
  };
  factory EditorPreferences.fromJson(Map<String, dynamic> json) {
    const keys = {
      'snap',
      'gridSize',
      'magnetic',
      'showGrid',
      'gridOpacity',
      'showGuides',
      'threshold',
    };
    if (json.keys.any((k) => !keys.contains(k))) {
      throw const FormatException('Unsupported editor preference');
    }
    try {
      final value = EditorPreferences(
        snap: json['snap'] ?? true,
        gridSize: (json['gridSize'] as num? ?? 16).toDouble(),
        magnetic: json['magnetic'] ?? false,
        showGrid: json['showGrid'] ?? true,
        gridOpacity: (json['gridOpacity'] as num? ?? .12).toDouble(),
        showGuides: json['showGuides'] ?? true,
        threshold: (json['threshold'] as num? ?? 8).toDouble(),
      );
      if (!value.gridSize.isFinite ||
          value.gridSize < 4 ||
          value.gridSize > 128 ||
          !value.gridOpacity.isFinite ||
          value.gridOpacity < 0 ||
          value.gridOpacity > .5 ||
          !value.threshold.isFinite ||
          value.threshold < 1 ||
          value.threshold > 24) {
        throw const FormatException('Invalid grid preferences');
      }
      return value;
    } catch (_) {
      throw const FormatException('Invalid editor preferences');
    }
  }
}
