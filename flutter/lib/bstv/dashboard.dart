// BattleStation TV modifications, 2026. Distributed under upstream GPLv3.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/core/models.dart';
import 'package:iptvmac/core/user_data.dart';
import 'package:iptvmac/core/search.dart';
import 'package:iptvmac/downloads/downloads_model.dart';
import 'package:iptvmac/ui/item_views.dart';
import 'package:iptvmac/ui/artwork.dart';
import 'package:iptvmac/ui/play.dart';

import 'dashboard_model.dart';
import 'identity.dart';
import 'tokens.dart';
import 'core_services.dart';

class BstvDashboard extends StatelessWidget {
  const BstvDashboard({super.key, required this.onNavigate});
  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LibraryModel>();
    return LayoutBuilder(
      builder: (context, constraints) {
        final theme = model.prefs.bstvTheme;
        final layout = theme.layoutFor(dashboardDevice(constraints.maxWidth));
        return RefreshIndicator(
          onRefresh: model.sync,
          child: ListView(
            padding: EdgeInsets.all(theme.interface.spacing),
            children: [
              Text(
                BstvIdentity.tagline,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              if (!layout.widgets.any((w) => w.visible))
                const Text(
                  'All dashboard widgets are hidden. Open Customize to show them.',
                ),
              DashboardCanvas(layout: layout, onNavigate: onNavigate),
            ],
          ),
        );
      },
    );
  }
}

/// Independent measured render boundary. It does not scale its subtree.
class DashboardPanel extends StatelessWidget {
  const DashboardPanel({
    super.key,
    required this.instance,
    required this.onNavigate,
  });
  final DashboardInstance instance;
  final ValueChanged<int> onNavigate;

  @override
  Widget build(BuildContext context) {
    if (!instance.visible) return const SizedBox.shrink();
    final model = context.watch<LibraryModel>();
    final downloads = context.watch<DownloadsModel>();
    final core = context.watch<CoreServices?>();
    final definition = DashboardRegistry.definitions[instance.kind]!;
    return Container(
      key: ValueKey(instance.id),
      padding: EdgeInsets.all(instance.padding),
      decoration: BoxDecoration(
        color: instance.backgroundArgb == null
            ? Theme.of(context).colorScheme.surfaceContainerLow
            : Color(instance.backgroundArgb!),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(BstvTokens.radius),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: LayoutBuilder(
          builder: (context, size) {
            final compact = size.maxWidth < 480;
            final count = instance.maxItems;
            final columns = (size.maxWidth / 130).floor().clamp(1, count);
            final kind = instance.kind;
            final type = kind == DashboardKind.series
                ? ItemType.series
                : kind == DashboardKind.guide || kind == DashboardKind.favorites
                ? ItemType.live
                : ItemType.movie;
            // Bounded queries, scoped to the chosen playlist; no all-catalog materialization.
            final accountId =
                instance.sourceScope == 'all' || model.allPlaylists
                ? null
                : model.account?.id;
            var items = kind == DashboardKind.favorites
                ? model.categoryFilter
                      .visible(
                        UserData.favorites(
                          model.db.raw,
                          accountId: accountId,
                          type: ItemType.live,
                        ),
                        model.db.raw,
                      )
                      .where(
                        (item) =>
                            (accountId == null ||
                                item.accountId == accountId) &&
                            (instance.categoryId == null ||
                                item.categoryId == instance.categoryId),
                      )
                      .toList()
                : kind == DashboardKind.dvr || kind == DashboardKind.downloads
                ? <Item>[]
                : const {'name', 'random', 'recent'}.contains(instance.sort)
                ? [
                    for (final row in model.db.raw.select(
                      'SELECT * FROM item WHERE type = ? AND (? IS NULL OR accountId = ?) AND (? IS NULL OR categoryId = ?) ORDER BY ${instance.sort == 'random' ? 'RANDOM()' : instance.sort == 'recent' ? 'id DESC' : 'name COLLATE NOCASE, id'} LIMIT ?',
                      [
                        type.name,
                        accountId,
                        accountId,
                        instance.categoryId,
                        instance.categoryId,
                        count,
                      ],
                    ))
                      Item.fromRow(row),
                  ]
                : Search.run(
                    model.db.raw,
                    SearchRequest(
                      accountId: accountId,
                      type: type,
                      categoryId: instance.categoryId,
                      limit: count,
                    ),
                  );
            if (kind == DashboardKind.favorites && instance.sort == 'name') {
              items.sort(
                (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
              );
            }
            items = model.categoryFilter
                .visible(items, model.db.raw)
                .take(count)
                .toList();
            Widget content;
            if (kind == DashboardKind.dvr) {
              final jobs = core?.dvr.jobs.take(count).toList() ?? [];
              content = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (jobs.isEmpty)
                    const Text(
                      'No recordings scheduled. Open DVR or schedule from the guide.',
                    ),
                  for (final job in jobs)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(job.title),
                      subtitle: Text(
                        '${job.channelName} • ${job.state.name} • ${(job.bytes / (1024 * 1024)).toStringAsFixed(1)} MB',
                      ),
                      onTap: () => onNavigate(6),
                    ),
                  const Text(
                    'Compatible unencrypted streams only. Keep BSTV running and device awake.',
                  ),
                ],
              );
            } else if (kind == DashboardKind.downloads) {
              final entries = downloads.entries.take(count).toList();
              content = Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (!downloads.enabled)
                    const Text('Downloads are unavailable in this session.')
                  else if (entries.isEmpty)
                    const Text(
                      'No downloads yet. Add a supported movie or episode from its details.',
                    ),
                  for (final entry in entries)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            entry.status.name,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 6),
                          LinearProgressIndicator(value: entry.fraction),
                        ],
                      ),
                    ),
                  TextButton(
                    onPressed: () => onNavigate(5),
                    child: const Text('Open download manager'),
                  ),
                ],
              );
            } else if (model.syncing && items.isEmpty) {
              content = const LinearProgressIndicator();
            } else if (items.isEmpty) {
              content = Text(
                model.syncMessage != null
                    ? 'Source unavailable. Open Live TV to review or retry.'
                    : kind == DashboardKind.favorites
                    ? 'Favorite channels will appear here.'
                    : 'No content in this playlist yet.',
              );
            } else if (kind == DashboardKind.featured) {
              final item = items.first;
              content = Wrap(
                spacing: 24,
                runSpacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(
                    width: compact ? 96 : 140,
                    child: PosterImage(name: item.name, url: artUri(item.icon)),
                  ),
                  SizedBox(
                    width: compact
                        ? size.maxWidth
                        : (size.maxWidth - 200).clamp(180, 1100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 12),
                        const Text('From your playlist'),
                        const SizedBox(height: 16),
                        FilledButton.icon(
                          onPressed: () => openItem(context, item),
                          icon: const Icon(Icons.play_arrow),
                          label: const Text('Watch now'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else if (kind == DashboardKind.guide ||
                kind == DashboardKind.favorites) {
              content = Column(
                children: [
                  if (kind == DashboardKind.guide)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Channel preview • Open TV Guide for timeline and XMLTV mapping',
                      ),
                    ),
                  for (final item in items.take(count))
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: ChannelLogo(item: item, size: 40),
                      title: Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.play_circle_outline),
                      onTap: () => openItem(context, item),
                    ),
                ],
              );
            } else {
              // Poster count and metadata adapt to measured width. Aspect ratio stays fixed.
              content = Wrap(
                spacing: 10,
                runSpacing: 12,
                children: [
                  for (final item in items.take(count)) ...[
                    SizedBox(
                      width: (size.maxWidth - (columns - 1) * 10) / columns,
                      child: InkWell(
                        onTap: () => openItem(context, item),
                        child: Column(
                          children: [
                            PosterImage(
                              name: item.name,
                              url: artUri(item.icon),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (instance.showSourceRating && item.rating?.isNotEmpty == true)
                              Text('Source rating: ${item.rating}',
                                  maxLines: 1, overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.labelSmall),
                            if (!compact)
                              Text(
                                'View details',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              );
            }
            // Independent per-widget appearance. All styles use the same
            // authorized provider items and open the existing details view.
            if ((kind == DashboardKind.movies || kind == DashboardKind.series) &&
                instance.displayStyle == 'carousel') {
              content = SizedBox(
                height: compact ? 235 : 285,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return SizedBox(
                      width: compact ? 125 : 165,
                      child: InkWell(
                        onTap: () => openItem(context, item),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: PosterImage(name: item.name, url: artUri(item.icon))),
                            const SizedBox(height: 6),
                            Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis),
                            if (instance.showSourceRating && item.rating?.isNotEmpty == true)
                              Text('Source rating: ${item.rating}', maxLines: 1,
                                  style: Theme.of(context).textTheme.labelSmall),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if ((kind == DashboardKind.movies || kind == DashboardKind.series) &&
                       instance.displayStyle == 'compact') {
              content = Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [for (final item in items)
                  ActionChip(
                    avatar: const Icon(Icons.movie_outlined, size: 18),
                    label: Text(item.name, overflow: TextOverflow.ellipsis),
                    onPressed: () => openItem(context, item),
                  ),
                ],
              );
            }
            if (instance.displayStyle == 'list' &&
                (kind == DashboardKind.movies ||
                    kind == DashboardKind.series)) {
              content = Column(
                children: [
                  for (final item in items)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SizedBox(
                        width: 40,
                        child: PosterImage(
                          name: item.name,
                          url: artUri(item.icon),
                        ),
                      ),
                      title: Text(
                        item.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: instance.showSourceRating && item.rating?.isNotEmpty == true
                          ? Text('Source rating: ${item.rating}') : null,
                      onTap: () => openItem(context, item),
                    ),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  instance.title?.isNotEmpty == true
                      ? instance.title!
                      : definition.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                content,
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Shared rendering for saved layouts and the editor's real-data preview.
class DashboardCanvas extends StatelessWidget {
  const DashboardCanvas({
    super.key,
    required this.layout,
    required this.onNavigate,
    this.overlay,
    this.panelBuilder,
  });
  final DashboardLayout layout;
  final ValueChanged<int> onNavigate;
  final Widget Function(DashboardInstance, double)? overlay;
  final Widget Function(DashboardInstance)? panelBuilder;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, size) {
      final scale = size.maxWidth / layout.canvasWidth;
      final visible = layout.widgets.where((w) => w.visible).toList();
      final height = visible.fold<double>(
        0,
        (bottom, w) => bottom > w.y + w.height ? bottom : w.y + w.height,
      );
      return SizedBox(
        height: height,
        child: Stack(
          children: [
            for (final item in visible)
              Positioned(
                key: Key('canvas-${item.id}'),
                left: item.x * scale,
                top: item.y,
                width: item.width * scale,
                height: item.height,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRect(
                        child: SingleChildScrollView(
                          primary: false,
                          child:
                              panelBuilder?.call(item) ??
                              DashboardPanel(
                                instance: item,
                                onNavigate: onNavigate,
                              ),
                        ),
                      ),
                      if (overlay != null) overlay!(item, scale),
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
