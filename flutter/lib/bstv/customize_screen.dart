// BattleStation TV appearance editor. Application branding is intentionally locked.
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/bstv/dashboard_model.dart';
import 'package:iptvmac/bstv/theme_package.dart';
import 'package:provider/provider.dart';

import 'dashboard_editor.dart';
import 'unlockables.dart';
import 'interface_controls.dart';
import 'guided_tour.dart';
import 'preset_preview.dart';
import 'customization_profiles_screen.dart';
import 'dashboard_editor_model.dart';

class BstvCustomizeScreen extends StatelessWidget {
  const BstvCustomizeScreen({super.key});

  Future<bool> _apply(
    BuildContext context,
    LibraryModel model,
    BstvThemePackage value,
  ) async {
    try {
      await model.applyBstvTheme(value);
      return true;
    } catch (_) {
      if (context.mounted) {
        _say(
          context,
          'Theme could not be saved. Your previous appearance was restored.',
        );
      }
      return false;
    }
  }

  BstvThemePackage _update(
    BstvThemePackage old, {
    String? appearance,
    int? accent,
    List<String>? order,
    List<String>? hidden,
  }) => BstvThemePackage(
    appearance: appearance ?? old.appearance,
    accentArgb: accent ?? old.accentArgb,
    dashboardOrder: order ?? old.dashboardOrder,
    hiddenWidgets: hidden ?? old.hiddenWidgets,
    editor: old.editor,
    interface:old.interface,
    layouts: {
      for (final entry in old.layouts.entries)
        entry.key: order != null
            ? arrangeDashboard(
                DashboardLayout(
                  device: entry.key,
                  widgets: [
                    for (final name in order)
                      ...entry.value.widgets.where((w) => w.kind.name == name),
                  ],
                ),
              )
            : packDashboard(
                DashboardLayout(
                  device: entry.key,
                  widgets: [
                    for (final widget in entry.value.widgets)
                      hidden == null
                          ? widget
                          : widget.copyWith(
                              visible: !hidden.contains(widget.kind.name),
                            ),
                  ],
                ),
              ),
    },
  );

  void _say(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _export(BuildContext context, BstvThemePackage theme) async {
    try {
      final result = await FilePicker.saveFile(
        dialogTitle: 'Export BattleStation TV theme',
        fileName: 'BattleStation-Theme.bstvtheme',
        type: FileType.custom,
        allowedExtensions: ['bstvtheme'],
        mimeType: 'application/json',
        bytes: utf8.encode(theme.encode()),
      );
      if (context.mounted && result != null) {
        _say(
          context,
          'Theme exported successfully. No branding or IPTV account data was included.',
        );
      }
    } catch (error) {
      if (context.mounted) _say(context, 'Could not export theme: $error');
    }
  }

  Future<void> _import(BuildContext context, LibraryModel model) async {
    try {
      // Same cross-platform file picker used by the existing backup flow.
      final file = await FilePicker.pickFile(type: FileType.any);
      if (file == null) return;
      final size = await file.length();
      if (size == null || size > BstvThemePackage.maxBytes) {
        throw const FormatException('Theme must be 256 KB or smaller');
      }
      final bytes = await file.readAsBytes();
      final incoming = BstvThemePackage.decode(utf8.decode(bytes));
      if (!context.mounted) return;
      final accepted = await showDialog<bool>(
        context: context,
        builder: (dialog) => AlertDialog(
          title: const Text('Import this theme?'),
          content: Text(
            'Appearance: ${incoming.appearance}\n'
            'Accent: #${incoming.accentArgb.toRadixString(16).toUpperCase()}\n'
            'Hidden dashboard widgets: ${incoming.hiddenWidgets.length}\n\n'
            'This replaces only your theme and dashboard arrangement. '
            'It cannot change the app name, logo, icon, playlists, or credentials.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialog, false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialog, true),
              child: const Text('Apply Theme'),
            ),
          ],
        ),
      );
      if (accepted == true && context.mounted) {
        final applied = await _apply(context, model, incoming);
        if (context.mounted && applied) _say(context, 'Theme imported.');
      }
    } on FormatException catch (error) {
      if (context.mounted) _say(context, 'Invalid theme: ${error.message}');
    } catch (error) {
      if (context.mounted) _say(context, 'Could not import theme: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LibraryModel>();
    final theme = model.prefs.bstvTheme;
    final cs = Theme.of(context).colorScheme;

    Widget section(String title, IconData icon, String subtitle, Widget body,
        {bool initiallyExpanded = false}) => Card(
      key: TourAnchors.customize[title],
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        key: PageStorageKey<String>('bstv-section-$title'),
        initiallyExpanded: initiallyExpanded,
        leading: Icon(icon),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(subtitle),
        childrenPadding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [body],
      ),
    );

    return DefaultTabController(
      length: 2,
      child: Column(children: [
        const TabBar(tabs: [
          Tab(icon: Icon(Icons.tune), text: 'Appearance'),
          Tab(icon: Icon(Icons.emoji_events_outlined), text: 'Unlockables'),
        ]),
        Expanded(child: TabBarView(children: [
    ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const InterfaceControls(),
        Text('Customization Studio', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 6),
        const Text('Open a section to customize it. Preset previews never change your saved settings until you choose Apply.'),
        const SizedBox(height: 16),
        section('Interface Presets', Icons.dashboard_customize_outlined,
          'Browse 16 layouts, preview Home widgets, then apply',
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Each preset has its own widget order, sizes and density for phone, tablet and desktop. The preview uses placeholders, not your IPTV library.'),
            const SizedBox(height: 12),
            BstvPresetPicker(
              onApply: (preset) async {
                // Preserve the previous layout locally before replacing it.
                final previous = model.prefs.bstvTheme;
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (dialog) => AlertDialog(
                    title: Text('Apply ${preset.name}?'),
                    content: const Text('This replaces the current appearance and widget layouts. IPTV connections, favorites, passwords and app branding are never changed. Export your current theme first to keep a permanent backup.'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(dialog, false), child: const Text('Cancel')),
                      FilledButton(onPressed: () => Navigator.pop(dialog, true), child: const Text('Apply preset')),
                    ],
                  ),
                );
                if (confirmed != true || !context.mounted) return;
                final saved = await _apply(context, model, preset.buildTheme());
                if (!context.mounted || !saved) return;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${preset.name} applied.'),
                  duration: const Duration(seconds: 8),
                  action: SnackBarAction(label: 'Undo', onPressed: () {
                    _apply(context, model, previous);
                  }),
                ));
              },
            ),
          ]), initiallyExpanded: true),
        section('Appearance', Icons.brightness_6_outlined,
          'Dark, light or system appearance',
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final value in ['dark', 'light', 'system'])
              ChoiceChip(
                label: Text(value[0].toUpperCase() + value.substring(1)),
                selected: theme.appearance == value,
                onSelected: (_) => _apply(context, model, _update(theme, appearance: value)),
              ),
          ])),
        section('Accent Color', Icons.palette_outlined,
          'Customize the application highlight color',
          Wrap(spacing: 12, runSpacing: 12, children: [
            for (final color in BstvThemePackage.accents)
              Tooltip(
                message: '#${color.toRadixString(16).substring(2).toUpperCase()}',
                child: InkWell(
                  key: Key('bstv-accent-$color'),
                  onTap: () => _apply(context, model, _update(theme, accent: color)),
                  borderRadius: BorderRadius.circular(30),
                  child: CircleAvatar(
                    radius: 22, backgroundColor: Color(color),
                    child: theme.accentArgb == color ? const Icon(Icons.check, color: Colors.white) : null,
                  ),
                ),
              ),
          ])),
        section('Dashboard Widgets', Icons.widgets_outlined,
          'Show, hide, rearrange, resize and configure each widget',
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Use the full editor for draggable positioning, dimensions, display style, item count and source filters.'),
            const SizedBox(height: 10),
            LayoutBuilder(builder: (context, size) => FilledButton.icon(
              key: const Key('customize-dashboard'),
              onPressed: () => Navigator.push(context, MaterialPageRoute<void>(
                builder: (_) => DashboardEditor(initialDevice: dashboardDevice(size.maxWidth + 48)),
              )),
              icon: const Icon(Icons.open_in_new), label: const Text('Open Full Widget Editor'),
            )),
            const SizedBox(height: 16),
            for (final (index, name) in theme.dashboardOrder.indexed)
              Card(child: ListTile(
                leading: Switch(
                  value: !theme.hiddenWidgets.contains(name),
                  onChanged: (enabled) {
                    final hidden = theme.hiddenWidgets.toList();
                    if (enabled) { hidden.remove(name); }
                    else if (!hidden.contains(name)) { hidden.add(name); }
                    _apply(context, model, _update(theme, hidden: hidden));
                  },
                ),
                title: Text(DashboardRegistry.definitions[
                  DashboardKind.values.firstWhere((kind) => kind.name == name)]!.title),
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  IconButton(tooltip: 'Move up', icon: const Icon(Icons.arrow_upward),
                    onPressed: index == 0 ? null : () {
                      final order = theme.dashboardOrder.toList();
                      final item = order.removeAt(index); order.insert(index - 1, item);
                      _apply(context, model, _update(theme, order: order));
                    }),
                  IconButton(tooltip: 'Move down', icon: const Icon(Icons.arrow_downward),
                    onPressed: index == theme.dashboardOrder.length - 1 ? null : () {
                      final order = theme.dashboardOrder.toList();
                      final item = order.removeAt(index); order.insert(index + 1, item);
                      _apply(context, model, _update(theme, order: order));
                    }),
                ]),
              )),
          ])),
        section('Share & Restore', Icons.settings_backup_restore_outlined,
          'Export/import themes, manage profiles and restore defaults',
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Wrap(spacing: 12, runSpacing: 12, children: [
              FilledButton.tonalIcon(
                onPressed: () => Navigator.push(context, MaterialPageRoute<void>(
                  builder: (_) => const CustomizationProfilesScreen(),
                )), icon: const Icon(Icons.people_outline), label: const Text('Customization Profiles'),
              ),
              FilledButton.icon(onPressed: () => _export(context, theme),
                icon: const Icon(Icons.ios_share), label: const Text('Export .bstvtheme')),
              OutlinedButton.icon(onPressed: () => _import(context, model),
                icon: const Icon(Icons.file_open), label: const Text('Import Theme')),
              TextButton.icon(
                onPressed: () async {
                  final confirmed = await showDialog<bool>(context: context, builder: (dialog) => AlertDialog(
                    title: const Text('Reset theme?'),
                    content: const Text('Restore default colors, appearance and dashboard widgets? IPTV accounts are unaffected.'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(dialog, false), child: const Text('Cancel')),
                      FilledButton(onPressed: () => Navigator.pop(dialog, true), child: const Text('Reset')),
                    ],
                  ));
                  if (confirmed == true && context.mounted) {
                    _apply(context, model, BstvThemePackage.defaults());
                  }
                },
                icon: Icon(Icons.restart_alt, color: cs.error), label: const Text('Reset Theme'),
              ),
            ]),
            const SizedBox(height: 12),
            const Text('Cloud account sync is planned but not connected to a hosting service. Local .bstvtheme export/import works without an account.'),
          ])),
      ],
    ),
    const UnlockablesScreen(),
        ])),
      ]),
    );
  }
}
