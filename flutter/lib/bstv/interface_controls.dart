// Shared Interface Revolution controls, 2026. GPLv3.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/bstv/identity.dart';

import 'interface_layout.dart';
import 'customization_profiles_screen.dart';

class InterfaceControls extends StatelessWidget {
  const InterfaceControls({super.key});
  @override
  Widget build(BuildContext context) {
    final model = context.watch<LibraryModel>(), theme = model.prefs.bstvTheme;
    final style = theme.interface;
    final showTvGuide = BstvIdentity.name != 'GET ETV';
    Future<void> apply(InterfaceLayout next) async {
      try {
        await model.applyBstvTheme(theme.withInterface(next));
      } catch (_) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not save interface.')),
          );
        }
      }
    }

    return Card(
      child: ExpansionTile(
        title: const Text('Navigation & interface'),
        childrenPadding: const EdgeInsets.all(16),
        children: [
          DropdownButtonFormField<String>(
            key: const Key('interface-navigation'),
            initialValue: style.navigation,
            decoration: const InputDecoration(labelText: 'Navigation'),
            items: [
              for (final value in InterfaceLayout.navigationStyles)
                DropdownMenuItem(value: value, child: Text(value)),
            ],
            onChanged: (v) {
              if (v != null) apply(style.copyWith(navigation: v));
            },
          ),
          const SizedBox(height: 12),
          const Text('Navigation position: Left, Right, Top, Bottom, or Adaptive'),
          const SizedBox(height: 12),
          Text('Sidebar width: ${style.sidebarWidth.round()} px'),
          Slider(
            min: 72, max: 360, divisions: 24,
            value: style.sidebarWidth,
            onChanged: (v) => apply(style.copyWith(sidebarWidth: v)),
          ),
          DropdownButtonFormField<String>(
            key: const Key('navigation-label-style'),
            initialValue: style.navDisplay,
            decoration: const InputDecoration(labelText: 'Navigation buttons'),
            items: const [
              DropdownMenuItem(value: 'both', child: Text('Icons + text')),
              DropdownMenuItem(value: 'icons', child: Text('Icons only')),
              DropdownMenuItem(value: 'text', child: Text('Text only')),
            ],
            onChanged: (v) { if (v != null) apply(style.copyWith(navDisplay: v)); },
          ),
          const SizedBox(height: 12),
          const Text('Visible navigation items (Settings cannot be hidden)'),
          for (final (index, label) in const <String>[
            'Home', 'Live TV', 'TV Guide', 'Movies', 'Series',
            'Downloads', 'DVR', 'Favorites', 'Customize', 'Settings', 'Cloud Sync',
          ].indexed)
            if (index != 9 && (index != 2 || showTvGuide))
              SwitchListTile(
                dense: true,
                title: Text(label),
                value: !style.hiddenNavigation.contains(index),
                onChanged: (enabled) {
                  final hidden = [...style.hiddenNavigation];
                  if (enabled) { hidden.remove(index); }
                  else if (!hidden.contains(index)) { hidden.add(index); }
                  apply(style.copyWith(hiddenNavigation: hidden));
                },
              ),
          const Text('Navigation ordering'),
          for (final (index, label) in const <String>[
            'Home', 'Live TV', 'TV Guide', 'Movies', 'Series',
            'Downloads', 'DVR', 'Favorites', 'Customize', 'Settings', 'Cloud Sync',
          ].indexed)
            if (!style.hiddenNavigation.contains(index) && (index != 2 || showTvGuide))
              ListTile(
                dense: true,
                title: Text(label),
                trailing: Wrap(children: [
                  IconButton(
                    tooltip: 'Move up', icon: const Icon(Icons.arrow_upward),
                    onPressed: () {
                      final order = [...style.navigationOrder,
                        for (var i = 0; i < 11; i++)
                          if (!style.navigationOrder.contains(i)) i];
                      final at = order.indexOf(index);
                      if (at > 0) {
                        final other = order[at - 1];
                        order[at - 1] = index; order[at] = other;
                        apply(style.copyWith(navigationOrder: order));
                      }
                    },
                  ),
                  IconButton(
                    tooltip: 'Move down', icon: const Icon(Icons.arrow_downward),
                    onPressed: () {
                      final order = [...style.navigationOrder,
                        for (var i = 0; i < 11; i++)
                          if (!style.navigationOrder.contains(i)) i];
                      final at = order.indexOf(index);
                      if (at >= 0 && at < order.length - 1) {
                        final other = order[at + 1];
                        order[at + 1] = index; order[at] = other;
                        apply(style.copyWith(navigationOrder: order));
                      }
                    },
                  ),
                ]),
              ),
          TextButton(
            onPressed: () => apply(style.copyWith(
              navigation: 'adaptive', sidebarWidth: 220,
              navDisplay: 'both', hiddenNavigation: [], navigationOrder: [],
            )),
            child: const Text('Reset navigation to defaults'),
          ),
          Text('Dashboard margins: ${style.spacing.round()}'),
          Slider(
            value: style.spacing,
            min: 4,
            max: 32,
            divisions: 14,
            onChanged: (v) => apply(style.copyWith(spacing: v)),
          ),
          Text('Card radius: ${style.radius.round()}'),
          Slider(
            value: style.radius,
            min: 0,
            max: 32,
            divisions: 16,
            onChanged: (v) => apply(style.copyWith(radius: v)),
          ),
          Text('Text scale: ${style.scale.toStringAsFixed(2)}'),
          Slider(
            value: style.scale,
            min: .85,
            max: 1.4,
            divisions: 11,
            onChanged: (v) => apply(style.copyWith(scale: v)),
          ),
          SwitchListTile(
            title: const Text('Reduced motion'),
            value: style.reducedMotion,
            onChanged: (v) => apply(style.copyWith(reducedMotion: v)),
          ),
          TextButton(
            onPressed: () async {
              String name = 'My custom preset';
              final accepted = await showDialog<bool>(
                context: context,
                builder: (dialog) => AlertDialog(
                  title: const Text('Save Current Layout as Preset'),
                  content: TextFormField(
                    initialValue: name,
                    maxLength: 60,
                    onChanged: (v) => name = v,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(dialog, false),
                      child: const Text('Cancel'),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pop(dialog, true),
                      child: const Text('Save'),
                    ),
                  ],
                ),
              );
              if (accepted != true || !context.mounted) return;
              try {
                await model.applyCustomizationProfiles(
                  model.prefs.customizationProfiles.add(
                    name,
                    theme: model.prefs.bstvTheme,
                  ),
                );
              } catch (_) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Could not save custom preset. Check its name and the 12-profile limit.',
                      ),
                    ),
                  );
                }
              }
            },
            child: const Text('Save Current Layout as Preset'),
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => const CustomizationProfilesScreen(),
              ),
            ),
            child: const Text('Manage custom presets / profiles'),
          ),
          TextButton(
            onPressed: model.prefs.previousInterface == null
                ? null
                : () async {
                    final previous = model.prefs.previousInterface!;
                    try {
                      await model.applyBstvTheme(previous);
                    } catch (_) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Previous layout could not be restored.',
                            ),
                          ),
                        );
                      }
                    }
                  },
            child: const Text('Restore Previous Layout'),
          ),
        ],
      ),
    );
  }
}
