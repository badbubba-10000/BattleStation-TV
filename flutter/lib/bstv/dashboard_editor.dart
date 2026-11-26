// BattleStation TV visual dashboard editor. GPLv3.
import 'package:flutter/material.dart';

import 'dashboard_transform_surface.dart';
import 'editor_preferences.dart';

import 'package:provider/provider.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/core/models.dart';

import 'dashboard.dart';
import 'dashboard_model.dart';
import 'dashboard_editor_model.dart';
import 'theme_package.dart';

class DashboardEditor extends StatefulWidget {
  const DashboardEditor({super.key, required this.initialDevice});
  final DashboardDevice initialDevice;
  @override
  State<DashboardEditor> createState() => _DashboardEditorState();
}

class _DashboardEditorState extends State<DashboardEditor> {
  final _drafts = <DashboardDevice, DashboardEditorModel>{};
  final _canvas = GlobalKey();
  late DashboardDevice _device = widget.initialDevice;
  bool _preview = false;
  final _panels = <String, (String, Widget)>{};
  Widget _panel(DashboardInstance item) {
    final settings = item.toJson()
      ..removeWhere((key, _) => {'x', 'y', 'width', 'height'}.contains(key));
    final signature = settings.toString(), cached = _panels[item.id];
    if (cached != null && cached.$1 == signature) return cached.$2;
    final panel = DashboardPanel(instance: item, onNavigate: (_) {});
    _panels[item.id] = (signature, panel);
    return panel;
  }

  double? _zoom;
  double _effectiveZoom = 1;
  String? _selectedId;
  late EditorPreferences _preferences = context
      .read<LibraryModel>()
      .prefs
      .bstvTheme
      .editor;
  late String _savedPreferences = _preferences.toJson().toString();
  bool get _dirty =>
      _drafts.values.any((draft) => draft.dirty) ||
      _preferences.toJson().toString() != _savedPreferences;
  void _setPreferences(EditorPreferences value) {
    setState(() {
      _preferences = value;
      for (final draft in _drafts.values) {
        draft.preferences = value;
      }
    });
  }

  DashboardEditorModel get editor => _drafts.putIfAbsent(
    _device,
    () => DashboardEditorModel(
      context.read<LibraryModel>().prefs.bstvTheme.layoutFor(_device),
      preferences: _preferences,
    )..addListener(_changed),
  );
  void _changed() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    for (final draft in _drafts.values) {
      draft.dispose();
    }
    super.dispose();
  }

  Future<void> _switchProfile(String id) async {
    if (_dirty) {
      final discard = await showDialog<bool>(
        context: context,
        builder: (dialog) => AlertDialog(
          title: const Text('Discard unsaved customization?'),
          content: const Text(
            'Save your layout before switching profiles to keep these edits.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialog, false),
              child: const Text('Keep editing'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialog, true),
              child: const Text('Discard'),
            ),
          ],
        ),
      );
      if (discard != true || !mounted) return;
    }
    final model = context.read<LibraryModel>();
    try {
      await model.applyCustomizationProfiles(
        model.prefs.customizationProfiles.activate(id),
      );
      if (!mounted) return;
      setState(() {
        for (final draft in _drafts.values) {
          draft.dispose();
        }
        _drafts.clear();
        _preferences = model.prefs.bstvTheme.editor;
        _savedPreferences = _preferences.toJson().toString();
        _selectedId = null;
      });
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile could not be activated.')),
        );
      }
    }
  }

  Future<void> _save() async {
    try {
      final model = context.read<LibraryModel>();
      var theme = model.prefs.bstvTheme;
      for (final draft in _drafts.values) {
        theme = theme.withLayout(draft.draft);
      }
      theme = theme.withEditor(_preferences);
      await model.applyBstvTheme(BstvThemePackage.decode(theme.encode()));
      if (mounted) Navigator.pop(context);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Layout could not be saved. Reduce the number or height of widgets.',
          ),
        ),
      );
    }
  }

  Future<void> _reset() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('Reset this layout?'),
        content: Text(
          'Restore the default ${_device.name} dashboard? You can undo this before saving.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialog, true),
            child: const Text('Reset Layout'),
          ),
        ],
      ),
    );
    if (confirmed == true && mounted) editor.reset();
  }

  Future<void> _configure(DashboardInstance item) async {
    final title = TextEditingController(
      text: item.title ?? DashboardRegistry.definitions[item.kind]!.title,
    );
    var count = item.maxItems,
        style = item.displayStyle,
        scope = item.sourceScope,
        sort = item.sort;
    var showSourceRating = item.showSourceRating;
    var padding = item.padding;
    var background = item.backgroundArgb;
    var category = item.categoryId;
    final model = context.read<LibraryModel>();
    final type = item.kind == DashboardKind.series
        ? ItemType.series
        : item.kind == DashboardKind.guide ||
              item.kind == DashboardKind.favorites
        ? ItemType.live
        : ItemType.movie;
    final categories = model.db.raw.select(
      'SELECT DISTINCT remoteId, name FROM category WHERE type = ? ORDER BY name COLLATE NOCASE',
      [type.name],
    );
    final choices = <String, String>{
      for (final row in categories)
        row['remoteId'] as String: row['name'] as String,
    };
    if (category != null) choices.putIfAbsent(category, () => category!);
    final contentWidget = {
      DashboardKind.featured,
      DashboardKind.movies,
      DashboardKind.series,
      DashboardKind.guide,
      DashboardKind.favorites,
    }.contains(item.kind);
    final accepted = await showDialog<bool>(
      context: context,
      builder: (dialog) => StatefulBuilder(
        builder: (context, update) => AlertDialog(
          title: const Text('Widget settings'),
          content: SizedBox(
            width: 440,
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: title,
                    maxLength: 80,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  if (contentWidget) ...[
                    DropdownButtonFormField<String>(
                      initialValue: scope,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        labelText: 'Playlist source',
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'current',
                          child: Text('Current playlist selection'),
                        ),
                        DropdownMenuItem(
                          value: 'all',
                          child: Text('All playlists'),
                        ),
                      ],
                      onChanged: (v) => update(() => scope = v!),
                    ),
                    DropdownButtonFormField<String>(
                      initialValue: category ?? '',
                      isExpanded: true,
                      decoration: const InputDecoration(labelText: 'Category'),
                      items: [
                        const DropdownMenuItem(
                          value: '',
                          child: Text('All categories'),
                        ),
                        for (final entry in choices.entries)
                          DropdownMenuItem(
                            value: entry.key,
                            child: Text(
                              entry.value,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                      ],
                      onChanged: (v) =>
                          update(() => category = v == '' ? null : v),
                    ),
                    DropdownButtonFormField<String>(
                      initialValue: sort,
                      isExpanded: true,
                      decoration: const InputDecoration(labelText: 'Sort'),
                      items: const [
                        DropdownMenuItem(
                          value: 'catalog',
                          child: Text('Playlist order'),
                        ),
                        DropdownMenuItem(
                          value: 'name',
                          child: Text('Name A–Z'),
                        ),
                        DropdownMenuItem(value: 'random', child: Text('Random picks')),
                        DropdownMenuItem(value: 'recent', child: Text('Recently imported (local database order)')),
                      ],
                      onChanged: (v) => update(() => sort = v!),
                    ),
                  ],
                  if (item.kind != DashboardKind.featured) ...[
                    Text('Items: $count'),
                    Slider(
                      value: count.toDouble(),
                      min: 1,
                      max: 30,
                      divisions: 29,
                      label: '$count',
                      onChanged: (v) => update(() => count = v.round()),
                    ),
                  ],
                  if (item.kind == DashboardKind.movies ||
                      item.kind == DashboardKind.series)
                    DropdownButtonFormField<String>(
                      initialValue: style,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        labelText: 'Artwork layout',
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'grid',
                          child: Text('Poster grid'),
                        ),
                        DropdownMenuItem(
                          value: 'list',
                          child: Text('Artwork list'),
                        ),
                        DropdownMenuItem(value: 'carousel', child: Text('Horizontal carousel')),
                        DropdownMenuItem(value: 'compact', child: Text('Compact cards')), 
                      ],
                      onChanged: (v) => update(() => style = v!),
                    ),
                  if (item.kind == DashboardKind.movies || item.kind == DashboardKind.series || item.kind == DashboardKind.featured)
                    SwitchListTile(
                      title: const Text('Show source rating when available'),
                      subtitle: const Text('Uses the connected provider score, not a verified IMDb or Rotten Tomatoes score.'),
                      value: showSourceRating,
                      onChanged: (value) => update(() => showSourceRating = value),
                    ),
                  Text('Spacing: ${padding.round()}'),
                  Slider(
                    value: padding,
                    min: 0,
                    max: 32,
                    divisions: 8,
                    onChanged: (v) => update(() => padding = v),
                  ),
                  const Text('Background'),
                  Wrap(
                    spacing: 8,
                    children: [
                      ChoiceChip(
                        label: const Text('Theme'),
                        selected: background == null,
                        onSelected: (_) => update(() => background = null),
                      ),
                      for (final color in [
                        0xff18212f,
                        0xff252034,
                        0xff18332c,
                        0xff382520,
                      ])
                        ChoiceChip(
                          label: const Icon(Icons.circle),
                          avatar: CircleAvatar(backgroundColor: Color(color)),
                          selected: background == color,
                          onSelected: (_) => update(() => background = color),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialog, false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialog, true),
              child: const Text('Apply'),
            ),
          ],
        ),
      ),
    );
    if (accepted == true && mounted) {
      editor.update(
        DashboardInstance(
          id: item.id,
          kind: item.kind,
          title: title.text.trim(),
          categoryId: category,
          visible: item.visible,
          locked: item.locked,
          x: item.x,
          y: item.y,
          width: item.width,
          height: item.height,
          maxItems: count,
          displayStyle: style,
          showSourceRating: showSourceRating,
          sourceScope: scope,
          sort: sort,
          padding: padding,
          backgroundArgb: background,
        ),
      );
    }
    // Dialog routes may still animate after completion; controller disposal waits.
    await Future<void>.delayed(const Duration(milliseconds: 300));
    title.dispose();
  }

  Future<void> _gridOptions() async {
    await showDialog<void>(
      context: context,
      builder: (dialog) => StatefulBuilder(
        builder: (context, update) => AlertDialog(
          title: const Text('Grid and alignment'),
          content: SizedBox(
            width: 360,
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<double>(
                    initialValue: _preferences.gridSize,
                    decoration: const InputDecoration(
                      labelText: 'Grid spacing (logical px)',
                    ),
                    items: [
                      for (final value in [
                        8.0,
                        16.0,
                        24.0,
                        32.0,
                        if (![
                          8.0,
                          16.0,
                          24.0,
                          32.0,
                        ].contains(_preferences.gridSize))
                          _preferences.gridSize,
                      ])
                        DropdownMenuItem(
                          value: value,
                          child: Text('${value.round()} px'),
                        ),
                    ],
                    onChanged: (v) {
                      _setPreferences(_preferences.copyWith(gridSize: v));
                      update(() {});
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Grid'),
                    value: _preferences.showGrid,
                    onChanged: (v) {
                      _setPreferences(_preferences.copyWith(showGrid: v));
                      update(() {});
                    },
                  ),
                  const Text('Grid opacity'),
                  Slider(
                    value: _preferences.gridOpacity,
                    min: 0,
                    max: .5,
                    onChanged: (v) {
                      _setPreferences(_preferences.copyWith(gridOpacity: v));
                      update(() {});
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Snap to Nearby Widgets'),
                    subtitle: const Text(
                      'Align edges and centers within 8 logical pixels',
                    ),
                    value: _preferences.magnetic,
                    onChanged: (v) {
                      _setPreferences(_preferences.copyWith(magnetic: v));
                      update(() {});
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Alignment Guides'),
                    value: _preferences.showGuides,
                    onChanged: (v) {
                      _setPreferences(_preferences.copyWith(showGuides: v));
                      update(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialog),
              child: const Text('Done'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _overlay(DashboardInstance item, double scale) =>
      DashboardTransformSurface(
        key: ValueKey('surface-${item.id}'),
        item: item,
        editor: editor,
        zoom: _effectiveZoom,
        selected: _selectedId == item.id,
        select: () => setState(() => _selectedId = item.id),
        toCanvas: (global) =>
            (_canvas.currentContext!.findRenderObject()! as RenderBox)
                .globalToLocal(global),
        menu: PopupMenuButton<String>(
          tooltip: 'Widget actions',
          onSelected: (action) {
            switch (action) {
              case 'settings':
                _configure(item);
              case 'duplicate':
                editor.duplicate(item.id);
              case 'hide':
                editor.update(item.copyWith(visible: false));
              case 'remove':
                editor.remove(item.id);
            }
          },
          itemBuilder: (_) => [
            const PopupMenuItem(
              value: 'settings',
              child: Text('Widget settings'),
            ),
            PopupMenuItem(
              value: 'duplicate',
              enabled: editor.draft.widgets.length < 64,
              child: const Text('Duplicate'),
            ),
            const PopupMenuItem(value: 'hide', child: Text('Hide')),
            const PopupMenuItem(value: 'remove', child: Text('Remove')),
          ],
        ),
      );

  Widget _workspace(DashboardEditorModel current) => LayoutBuilder(
    builder: (context, size) {
      final logicalWidth = current.draft.canvasWidth;
      _effectiveZoom =
          _zoom ?? ((size.maxWidth - 24) / logicalWidth).clamp(.25, 2.0);
      final height = current.draft.widgets
          .where((w) => w.visible)
          .fold<double>(
            600,
            (bottom, w) =>
                bottom > w.y + w.height + 300 ? bottom : w.y + w.height + 300,
          );
      final canvas = SizedBox(
        width: logicalWidth,
        height: height,
        child: Stack(
          children: [
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: EditorGridPainter(
                    current,
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            DashboardCanvas(
              key: _canvas,
              layout: current.draft,
              panelBuilder: _panel,
              onNavigate: (_) {},
              overlay: _preview
                  ? (_, _) => const Positioned.fill(child: AbsorbPointer())
                  : _overlay,
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: CustomPaint(
                  painter: EditorGridPainter(
                    current,
                    Theme.of(context).colorScheme.primary,
                    grid: false,
                  ),
                  isComplex: true,
                ),
              ),
            ),
          ],
        ),
      );
      return SingleChildScrollView(
        primary: false,
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            width: logicalWidth * _effectiveZoom,
            height: height * _effectiveZoom,
            child: OverflowBox(
              alignment: Alignment.topLeft,
              minWidth: logicalWidth,
              maxWidth: logicalWidth,
              minHeight: height,
              maxHeight: height,
              child: Transform.scale(
                scale: _effectiveZoom,
                alignment: Alignment.topLeft,
                child: canvas,
              ),
            ),
          ),
        ),
      );
    },
  );
  @override
  Widget build(BuildContext context) {
    final current = editor;
    return PopScope(
      canPop: !_dirty,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final discard = await showDialog<bool>(
          context: context,
          builder: (dialog) => AlertDialog(
            title: const Text('Discard layout changes?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialog, false),
                child: const Text('Keep editing'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(dialog, true),
                child: const Text('Discard'),
              ),
            ],
          ),
        );
        if (discard == true && context.mounted) Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _dirty ? 'Dashboard Editor * Unsaved changes' : 'Dashboard Editor',
          ),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 260),
              child: SingleChildScrollView(
                primary: false,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      DropdownButton<String>(
                        key: const Key('editor-profile'),
                        value: context
                            .watch<LibraryModel>()
                            .prefs
                            .customizationProfiles
                            .activeId,
                        items: [
                          for (final profile
                              in context
                                  .read<LibraryModel>()
                                  .prefs
                                  .customizationProfiles
                                  .profiles)
                            DropdownMenuItem(
                              value: profile.id,
                              child: Text(profile.name),
                            ),
                        ],
                        onChanged: (id) {
                          if (id != null) _switchProfile(id);
                        },
                      ),
                      DropdownButton<DashboardDevice>(
                        value: _device,
                        items: [
                          for (final device in DashboardDevice.values)
                            DropdownMenuItem(
                              value: device,
                              child: Text('${device.name} layout'),
                            ),
                        ],
                        onChanged: (value) => setState(() => _device = value!),
                      ),
                      FilledButton(
                        onPressed: _save,
                        child: const Text('Save Layout'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.maybePop(context),
                        child: const Text('Cancel Changes'),
                      ),
                      IconButton(
                        tooltip: 'Undo',
                        onPressed: current.canUndo ? current.undo : null,
                        icon: const Icon(Icons.undo),
                      ),
                      IconButton(
                        tooltip: 'Redo',
                        onPressed: current.canRedo ? current.redo : null,
                        icon: const Icon(Icons.redo),
                      ),
                      TextButton(
                        onPressed: _reset,
                        child: const Text('Reset Layout'),
                      ),
                      FilterChip(
                        label: const Text('Preview Changes'),
                        selected: _preview,
                        onSelected: (value) => setState(() => _preview = value),
                      ),
                      FilterChip(
                        key: const Key('snap-to-grid'),
                        label: const Text('Snap to Grid'),
                        selected: _preferences.snap,
                        onSelected: (v) =>
                            _setPreferences(_preferences.copyWith(snap: v)),
                      ),
                      TextButton(
                        onPressed: _gridOptions,
                        child: const Text('Grid options'),
                      ),
                      DropdownButton<double>(
                        key: const Key('editor-zoom'),
                        value: _zoom ?? 0,
                        items: [
                          const DropdownMenuItem(
                            value: 0,
                            child: Text('Fit to Screen'),
                          ),
                          for (final value in [.5, .75, 1.0, 1.25, 1.5])
                            DropdownMenuItem(
                              value: value,
                              child: Text('${(value * 100).round()}%'),
                            ),
                        ],
                        onChanged: (v) =>
                            setState(() => _zoom = v == 0 ? null : v),
                      ),
                      IconButton(
                        tooltip: 'Reset Zoom',
                        onPressed: () => setState(() => _zoom = 1),
                        icon: const Icon(Icons.center_focus_strong),
                      ),
                      PopupMenuButton<DashboardKind>(
                        enabled: current.draft.widgets.length < 64,
                        tooltip: 'Add Widget',
                        onSelected: current.add,
                        itemBuilder: (_) => [
                          for (final kind in DashboardKind.values)
                            PopupMenuItem(
                              value: kind,
                              child: Text(
                                DashboardRegistry.definitions[kind]!.title,
                              ),
                            ),
                        ],
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text('Add Widget'),
                        ),
                      ),
                      for (final item in current.draft.widgets.where(
                        (w) => !w.visible,
                      ))
                        ActionChip(
                          label: Text('Show ${item.title ?? item.kind.name}'),
                          onPressed: () =>
                              current.update(item.copyWith(visible: true)),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              _preview
                  ? 'Layout preview with your current data. Content actions are disabled while editing.'
                  : editor.collision
                  ? 'Collision feedback: nearby widgets move down to prevent overlap.'
                  : 'Drag a widget body to move; use any edge or corner to resize. Alt bypasses snapping. Content actions are disabled in edit mode.',
            ),
            if (_selectedId != null && !_preview)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Wrap(
                  spacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    for (final item in current.draft.widgets.where(
                      (w) => w.id == _selectedId,
                    )) ...[
                      Text(
                        '${item.title ?? item.kind.name}   x ${item.x.toStringAsFixed(2)}   y ${item.y.toStringAsFixed(2)}   ${item.width.toStringAsFixed(2)} x ${item.height.toStringAsFixed(2)}',
                      ),
                      TextButton(
                        onPressed: () => _configure(item),
                        child: const Text('Widget properties'),
                      ),
                    ],
                  ],
                ),
              ),
            Expanded(child: _workspace(current)),
          ],
        ),
      ),
    );
  }
}
