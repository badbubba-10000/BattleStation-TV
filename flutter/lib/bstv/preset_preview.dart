// BattleStation TV interface preset gallery and sandbox preview. GPLv3.
// No provider connections or actual artwork are accessed during preview.
import 'package:flutter/material.dart';

import 'dashboard_model.dart';
import 'interface_presets.dart';
import 'identity.dart';
import 'preset_screen_preview.dart';

class BstvPresetPicker extends StatefulWidget {
  const BstvPresetPicker({super.key, required this.onApply});
  final Future<void> Function(BstvInterfacePreset preset) onApply;

  @override
  State<BstvPresetPicker> createState() => _BstvPresetPickerState();
}

class _BstvPresetPickerState extends State<BstvPresetPicker> {
  BstvInterfacePreset selected = BstvInterfacePreset.all.first;
  DashboardDevice device = DashboardDevice.desktop;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          key: const Key('bstv-preset-selector'),
          initialValue: selected.name,
          decoration: const InputDecoration(
            labelText: 'Interface preset',
            border: OutlineInputBorder(),
          ),
          isExpanded: true,
          items: [
            for (final preset in BstvInterfacePreset.all)
              DropdownMenuItem(value: preset.name, child: Text(preset.name)),
          ],
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selected = BstvInterfacePreset.all.firstWhere(
                  (p) => p.name == value,
                );
              });
            }
          },
        ),
        const SizedBox(height: 8),
        Text(selected.description),
        const SizedBox(height: 12),
        SegmentedButton<DashboardDevice>(
          showSelectedIcon: false,
          segments: const [
            ButtonSegment(
              value: DashboardDevice.phone,
              label: Text('Phone'),
              icon: Icon(Icons.phone_android),
            ),
            ButtonSegment(
              value: DashboardDevice.tablet,
              label: Text('Tablet'),
              icon: Icon(Icons.tablet),
            ),
            ButtonSegment(
              value: DashboardDevice.desktop,
              label: Text('Desktop'),
              icon: Icon(Icons.desktop_windows),
            ),
          ],
          selected: {device},
          onSelectionChanged: (set) => setState(() => device = set.first),
        ),
        const SizedBox(height: 10),
        BstvPresetMiniature(preset: selected, device: device),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            OutlinedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => PresetScreenPreview(
                    preset: selected,
                    onApply: () => widget.onApply(selected),
                  ),
                ),
              ),
              icon: const Icon(Icons.visibility_outlined),
              label: const Text('Full Preview'),
            ),
            FilledButton.icon(
              onPressed: () => widget.onApply(selected),
              icon: const Icon(Icons.check),
              label: const Text('Apply Preset'),
            ),
          ],
        ),
      ],
    );
  }
}

class BstvPresetMiniature extends StatelessWidget {
  const BstvPresetMiniature({
    super.key,
    required this.preset,
    required this.device,
    this.expanded = false,
  });
  final BstvInterfacePreset preset;
  final DashboardDevice device;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.fromSeed(
      seedColor: Color(preset.accent),
      brightness: Brightness.dark,
    );
    final layout = preset.buildTheme().layoutFor(device);
    final widgets = layout.widgets.where((item) => item.visible).toList()
      ..sort((a, b) {
        final row = a.y.compareTo(b.y);
        return row != 0 ? row : a.x.compareTo(b.x);
      });

    final canvasWidth = switch (device) {
      DashboardDevice.phone => 400.0,
      DashboardDevice.tablet => 800.0,
      DashboardDevice.desktop => 1200.0,
    };
    final contentHeight = widgets.fold<double>(300.0, (height, item) {
      final bottom = item.y + item.height;
      return bottom > height ? bottom : height;
    });

    return LayoutBuilder(
      builder: (context, bounds) {
        // The preview represents the preset's stored widget geometry.
        final maxScale = expanded ? 0.72 : 0.48;
        final scale = (bounds.maxWidth / canvasWidth)
            .clamp(0.05, maxScale)
            .toDouble();
        final maxHeight = expanded ? 620.0 : 255.0;
        final height = (contentHeight * scale + 38)
            .clamp(180.0, maxHeight)
            .toDouble();

        return Container(
          key: const Key('bstv-preset-live-preview'),
          width: double.infinity,
          height: height,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: scheme.outlineVariant),
          ),
          child: Column(
            children: [
              Container(
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                color: scheme.surfaceContainerHighest,
                child: Row(
                  children: [
                    Icon(Icons.tv, size: 15, color: scheme.primary),
                    const SizedBox(width: 7),
                    const Text(
                      BstvIdentity.name,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    if (bounds.maxWidth >= 520)
                      for (final label in [
                        'Home',
                        'Live',
                        'Movies',
                        'Series',
                      ]) ...[
                        Text(label, style: const TextStyle(fontSize: 9)),
                        const SizedBox(width: 8),
                      ],
                  ],
                ),
              ),
              Expanded(
                child: ClipRect(
                  child: Stack(
                    children: [
                      for (final item in widgets)
                        Positioned(
                          left: item.x * scale,
                          top: item.y * scale,
                          width: item.width * scale,
                          height: item.height * scale,
                          child: _PreviewTile(
                            item: item,
                            scheme: scheme,
                            expanded: expanded,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PreviewTile extends StatelessWidget {
  const _PreviewTile({
    required this.item,
    required this.scheme,
    required this.expanded,
  });

  final DashboardInstance item;
  final ColorScheme scheme;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final isFeatured = item.kind == DashboardKind.featured;
    final isGuide = item.kind == DashboardKind.guide;
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: isFeatured
              ? scheme.primaryContainer
              : scheme.surfaceContainerHigh,
          border: Border.all(color: scheme.primary.withValues(alpha: 0.35)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DashboardRegistry.definitions[item.kind]!.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: expanded ? 12 : 9,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: isFeatured
                  ? Row(
                      children: [
                        Icon(
                          Icons.movie_outlined,
                          size: expanded ? 38 : 24,
                          color: scheme.onPrimaryContainer,
                        ),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'FEATURED • SAMPLE CONTENT',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    )
                  : isGuide
                  ? Column(
                      children: [
                        for (var i = 0; i < 3; i++)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 44,
                                    child: Text(
                                      'CH ${i + 1}',
                                      style: const TextStyle(fontSize: 9),
                                    ),
                                  ),
                                  Expanded(
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: scheme.primary.withValues(
                                          alpha: i == 0 ? 0.45 : 0.15,
                                        ),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    )
                  : Row(
                      children: [
                        for (var i = 0; i < 5; i++)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Color.lerp(
                                    scheme.primary,
                                    scheme.surfaceContainerHighest,
                                    i / 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
