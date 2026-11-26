// BattleStation TV theme sharing. No credentials or application branding.
import 'dart:convert';

import 'dashboard_model.dart';
import 'interface_layout.dart';
import 'editor_preferences.dart';
import 'dashboard_editor_model.dart';

class BstvThemePackage {
  const BstvThemePackage({
    required this.appearance,
    required this.accentArgb,
    required this.dashboardOrder,
    required this.hiddenWidgets,
    this.layouts = const {},
    this.interface = const InterfaceLayout(),
    this.editor = const EditorPreferences(),
  });
  static const version = 4;
  static const maxBytes = 262144;
  static const defaultAccent = 0xFF7838D6;
  static const accents = <int>[
    0xFF7838D6,
    0xFF186AC6,
    0xFF007D71,
    0xFFB54332,
    0xFFAD6700,
    0xFFAB3988,
    0xFF455A64,
    0xFF337A36,
    // Additional original interface preset accent colors.
    0xFFE53935, 0xFF21B66F, 0xFFAD62ED, 0xFF278BCE,
    0xFFE6A526, 0xFFED3B38, 0xFF647A91, 0xFF2875D7,
    0xFF169AD9, 0xFF2888C9, 0xFF4A83D9, 0xFF2789C7,
    0xFF3C91C1, 0xFF309B7F,
  ];
  final InterfaceLayout interface;
  final EditorPreferences editor;
  final String appearance;
  final int accentArgb;
  final List<String> dashboardOrder;
  final List<String> hiddenWidgets;
  final Map<DashboardDevice, DashboardLayout> layouts;
  DashboardLayout layoutFor(DashboardDevice device) =>
      layouts[device] ??
      arrangeDashboard(
        DashboardLayout(
          device: device,
          widgets: [
            for (final name in dashboardOrder)
              DashboardInstance(
                id: 'default-$name',
                kind: DashboardKind.values.byName(name),
                visible: !hiddenWidgets.contains(name),
                width: name == 'featured'
                    ? (device == DashboardDevice.desktop
                          ? 1200
                          : device == DashboardDevice.tablet
                          ? 800
                          : 400)
                    : 400,
              ),
          ],
        ),
      );
  BstvThemePackage withLayout(DashboardLayout layout) => BstvThemePackage(
    appearance: appearance,
    accentArgb: accentArgb,
    dashboardOrder: dashboardOrder,
    hiddenWidgets: hiddenWidgets,
    layouts: {...layouts, layout.device: layout},
    editor: editor,
    interface: interface,
  );

  BstvThemePackage withEditor(EditorPreferences value) => BstvThemePackage(
    appearance: appearance,
    accentArgb: accentArgb,
    dashboardOrder: dashboardOrder,
    hiddenWidgets: hiddenWidgets,
    layouts: layouts,
    editor: value,
    interface: interface,
  );

  BstvThemePackage withInterface(InterfaceLayout value) => BstvThemePackage(
    appearance: appearance,
    accentArgb: accentArgb,
    dashboardOrder: dashboardOrder,
    hiddenWidgets: hiddenWidgets,
    layouts: layouts,
    editor: editor,
    interface: value,
  );
  static List<String> get defaultOrder => [
    for (final kind in DashboardKind.values) kind.name,
  ];

  factory BstvThemePackage.defaults() => BstvThemePackage(
    appearance: 'dark',
    accentArgb: defaultAccent,
    dashboardOrder: defaultOrder,
    hiddenWidgets: const [],
  );

  Map<String, Object> toJson() => {
    'format': 'bstvtheme',
    'version': version,
    'appearance': appearance,
    'accent': accentArgb,
    'dashboardOrder': dashboardOrder,
    'hiddenWidgets': hiddenWidgets,
    'editor': editor.toJson(),
    'interface': interface.toJson(),
    if (layouts.isNotEmpty)
      'layouts': {
        for (final entry in layouts.entries)
          entry.key.name: entry.value.toJson(),
      },
  };

  String encode() => const JsonEncoder.withIndent('  ').convert(toJson());

  static BstvThemePackage decode(String source) {
    if (utf8.encode(source).length > maxBytes) {
      throw const FormatException('Theme file too large');
    }
    final decoded = jsonDecode(source);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Invalid theme format');
    }
    // Reject all unknown keys, especially credentials, branding and internal app identifiers.
    const allowed = {
      'format',
      'version',
      'appearance',
      'accent',
      'dashboardOrder',
      'hiddenWidgets',
      'layouts',
      'editor',
      'interface',
    };
    if (decoded.keys.any((key) => !allowed.contains(key))) {
      throw const FormatException('Unsupported theme field');
    }
    if (decoded['format'] != 'bstvtheme' ||
        !{1, 2, 3, version}.contains(decoded['version'])) {
      throw const FormatException('Unsupported theme version');
    }
    final appearance = decoded['appearance'];
    final accent = decoded['accent'];
    final order = decoded['dashboardOrder'];
    final hidden = decoded['hiddenWidgets'];
    if (appearance is! String ||
        !{'dark', 'light', 'system'}.contains(appearance) ||
        accent is! int ||
        !accents.contains(accent) ||
        order is! List ||
        hidden is! List ||
        order.any((item) => item is! String) ||
        hidden.any((item) => item is! String)) {
      throw const FormatException('Invalid theme settings');
    }
    final names = defaultOrder.toSet();
    final typedOrder = order.cast<String>();
    final typedHidden = hidden.cast<String>();
    if (typedOrder.length != names.length ||
        typedOrder.toSet().length != names.length ||
        !typedOrder.toSet().containsAll(names) ||
        typedHidden.length > names.length ||
        typedHidden.toSet().length != typedHidden.length ||
        typedHidden.any((name) => !names.contains(name))) {
      throw const FormatException('Invalid dashboard configuration');
    }
    final layouts = <DashboardDevice, DashboardLayout>{};
    final rawLayouts = decoded['layouts'];
    if (rawLayouts != null) {
      if (rawLayouts is! Map || rawLayouts.length > 3) {
        throw const FormatException('Invalid device layouts');
      }
      for (final entry in rawLayouts.entries) {
        final device = DashboardDevice.values
            .where((d) => d.name == entry.key)
            .firstOrNull;
        if (device == null || entry.value is! Map) {
          throw const FormatException('Unsupported layout profile');
        }
        final layout = DashboardLayout.fromJson(
          Map<String, dynamic>.from(entry.value),
        );
        if (layout.device != device) {
          throw const FormatException('Layout profile mismatch');
        }
        final visible = layout.widgets.where((w) => w.visible).toList();
        for (var i = 0; i < visible.length; i++) {
          if (visible[i].x + visible[i].width > layout.canvasWidth) {
            throw const FormatException('Widget lies outside the layout');
          }
          for (var j = i + 1; j < visible.length; j++) {
            if (overlaps(visible[i], visible[j])) {
              throw const FormatException('Widgets overlap');
            }
          }
        }
        layouts[device] = layout;
      }
    }
    return BstvThemePackage(
      appearance: appearance,
      accentArgb: accent,
      dashboardOrder: List.unmodifiable(typedOrder),
      hiddenWidgets: List.unmodifiable(typedHidden),
      layouts: Map.unmodifiable(layouts),
      interface: decoded['interface'] == null
          ? const InterfaceLayout()
          : InterfaceLayout.fromJson(
              Map<String, dynamic>.from(decoded['interface']),
            ),
      editor: decoded['editor'] == null
          ? const EditorPreferences()
          : EditorPreferences.fromJson(
              Map<String, dynamic>.from(decoded['editor']),
            ),
    );
  }
}
