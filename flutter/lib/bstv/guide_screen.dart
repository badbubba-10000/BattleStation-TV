// BattleStation TV, 2026. GPLv3; see BSTV-NOTICE.md.
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/core/models.dart';
import 'package:iptvmac/core/remote_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:iptvmac/ui/play.dart';

import 'core_services.dart';
import 'feature_models.dart';
import 'guide_service.dart';
import 'epg_health_report.dart';

import 'package:flutter/services.dart';

import 'guide_filter.dart';

class GuideFocusController extends ChangeNotifier {
  void backToPlayingChannel() => notifyListeners();
}

class GuideScreen extends StatefulWidget {
  const GuideScreen({
    super.key,
    this.fullscreen = false,
    this.embedded = false,
    this.playingChannel,
    this.selectedChannel,
    this.onChannelSelected,
    this.onProgrammeSelected,
    this.focusController,
    this.fetchVisibleEpg = true,
  });
  final bool embedded, fetchVisibleEpg;
  final Item? playingChannel, selectedChannel;
  final ValueChanged<Item>? onChannelSelected;
  final void Function(Item, GuideProgramme)? onProgrammeSelected;
  final GuideFocusController? focusController;
  final bool fullscreen;
  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  DateTime from = DateTime.now().subtract(const Duration(minutes: 30));
  int interval = 30;
  bool compact = false, favorites = false, hideEmpty = false, clock24 = true;
  String search = '', category = '';
  EpgAvailability availability = EpgAvailability.all;
  final _searchController = TextEditingController();
  bool _allowVisibleFetch = true;
  Timer? timer;
  final _programScroll = ScrollController(),
      _channelScroll = ScrollController();
  bool _syncingScroll = false, _preferencesLoaded = false;
  final pending = <String>{};
  List<Item> _visibleChannels = [];
  double _rowHeight = 88;
  bool _initialPlayingFocus = false;
  @override
  void initState() {
    super.initState();
    widget.focusController?.addListener(_returnToPlaying);
    _programScroll.addListener(
      () => _syncScroll(_programScroll, _channelScroll),
    );
    _channelScroll.addListener(
      () => _syncScroll(_channelScroll, _programScroll),
    );
    timer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (mounted) {
        setState(() {
          pending.clear();
          _allowVisibleFetch = true;
        });
      }
    });
  }

  @override
  void dispose() {
    widget.focusController?.removeListener(_returnToPlaying);
    timer?.cancel();
    _programScroll.dispose();
    _channelScroll.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant GuideScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusController != widget.focusController) {
      oldWidget.focusController?.removeListener(_returnToPlaying);
      widget.focusController?.addListener(_returnToPlaying);
    }
  }

  void _returnToPlaying() {
    filterPreferences(() {
      availability = EpgAvailability.all;
      favorites = false;
      hideEmpty = false;
      category = '';
      search = '';
      _searchController.clear();
      from = DateTime.now().subtract(const Duration(minutes: 30));
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToPlaying());
  }

  void _scrollToPlaying() {
    if (!mounted ||
        widget.playingChannel == null ||
        !_channelScroll.hasClients) {
      return;
    }
    final key = channelKey(widget.playingChannel!);
    final index = _visibleChannels.indexWhere(
      (item) => channelKey(item) == key,
    );
    if (index >= 0) {
      _channelScroll.jumpTo(
        (index * _rowHeight).clamp(
          0.0,
          _channelScroll.position.maxScrollExtent,
        ),
      );
    }
  }

  void _syncScroll(ScrollController source, ScrollController target) {
    if (_syncingScroll ||
        !target.hasClients ||
        !target.position.hasContentDimensions) {
      return;
    }
    _syncingScroll = true;
    target.jumpTo(
      source.offset.clamp(
        target.position.minScrollExtent,
        target.position.maxScrollExtent,
      ),
    );
    _syncingScroll = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_preferencesLoaded) return;
    _preferencesLoaded = true;
    final saved = context.read<CoreServices>().store.setting(
      'guidePreferences',
    );
    if (saved is Map) {
      if ([15, 30, 60, 120].contains(saved['interval'])) {
        interval = saved['interval'];
      }
      clock24 = saved['clock24'] == true;
      compact = saved['compact'] == true;
      favorites = saved['favorites'] == true;
      hideEmpty = saved['hideEmpty'] == true;
      availability = EpgAvailability.restore(saved['availability']);
      if (availability == EpgAvailability.noEpg) hideEmpty = false;
    }
  }

  void preferences(VoidCallback change) {
    setState(change);
    context.read<CoreServices>().store.setSetting('guidePreferences', {
      'interval': interval,
      'clock24': clock24,
      'compact': compact,
      'favorites': favorites,
      'hideEmpty': hideEmpty,
      'availability': availability.name,
    });
  }

  void filterPreferences(VoidCallback change) {
    preferences(change);
    // Filtering reads the cache. Newly exposed rows wait for the refresh timer
    // or an explicit refresh, rather than starting provider downloads.
    _allowVisibleFetch = false;
  }

  String time(DateTime value) =>
      DateFormat(clock24 ? 'HH:mm' : 'h:mm a').format(value.toLocal());
  void jump(DateTime value) => setState(() => from = value);
  Future<void> date() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: from.toLocal(),
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (selected != null) jump(selected);
  }

  void load(Item channel, GuideService service) {
    if (!_allowVisibleFetch || !widget.fetchVisibleEpg) return;
    final key = channelKey(channel);
    if (pending.add(key)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) unawaited(service.ensureChannel(channel));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final core = context.watch<CoreServices>(),
        library = context.watch<LibraryModel>();
    final guide = core.guide;
    var channels = library.db.read(
      (db) => Item.fromRows(
        db.select(
          'SELECT * FROM item WHERE type=? AND (? OR accountId=?) ORDER BY name',
          ['live', library.allPlaylists ? 1 : 0, library.account?.id ?? -1],
        ),
      ),
    );
    final categories =
        channels
            .map((c) => c.categoryId ?? '')
            .where((c) => c.isNotEmpty)
            .toSet()
            .toList()
          ..sort();
    if (category.isNotEmpty && !categories.contains(category)) category = '';
    final favoriteKeys = (library.favoriteItems[ItemType.live] ?? [])
        .map(channelKey)
        .toSet();
    final to = from.add(Duration(minutes: interval * 8));
    final available = guide.availableChannelKeys(channels, from, to);
    final matches = search.trim().isEmpty
        ? available
        : guide.availableChannelKeys(channels, from, to, search: search);
    final filtered = filterGuideChannels(
      channels,
      available: available,
      searchMatches: matches,
      availability: availability,
      favoritesOnly: favorites,
      favorites: favoriteKeys,
      category: category,
      hideEmpty: hideEmpty,
      searching: search.trim().isNotEmpty,
    );
    channels = filtered.channels;
    const channelWidth = 170.0, cellWidth = 180.0;
    const timelineWidth = cellWidth * 8;
    final rowHeight =
        (compact ? 56.0 : 88.0) *
        MediaQuery.textScalerOf(context).scale(1).clamp(1.0, 3.0);
    _visibleChannels = channels;
    _rowHeight = rowHeight;
    if (!_initialPlayingFocus && widget.playingChannel != null) {
      _initialPlayingFocus = true;
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToPlaying());
    }
    final nowPosition =
        DateTime.now().difference(from).inMilliseconds /
        Duration(minutes: interval).inMilliseconds *
        cellWidth;
    final content = Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: widget.embedded ? 96 : 180),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(
                    width: 230,
                    child: DropdownButton<EpgAvailability>(
                      key: const Key('epg-availability'),
                      isExpanded: true,
                      value: availability,
                      items: [
                        DropdownMenuItem(
                          value: EpgAvailability.all,
                          child: Text('All Channels (${filtered.total})'),
                        ),
                        DropdownMenuItem(
                          value: EpgAvailability.hasEpg,
                          child: Text('Has EPG (${filtered.hasEpg})'),
                        ),
                        DropdownMenuItem(
                          value: EpgAvailability.noEpg,
                          child: Text('No EPG (${filtered.noEpg})'),
                        ),
                      ],
                      onChanged: (value) => filterPreferences(() {
                        availability = value!;
                        if (availability == EpgAvailability.noEpg) {
                          hideEmpty = false;
                        }
                      }),
                    ),
                  ),
                  TextButton(
                    key: const Key('reset-guide-filters'),
                    onPressed: () => filterPreferences(() {
                      availability = EpgAvailability.all;
                      favorites = false;
                      hideEmpty = false;
                      category = '';
                      search = '';
                      _searchController.clear();
                    }),
                    child: const Text('Reset Filters'),
                  ),
                  Text(
                    DateFormat('EEE, d MMM yyyy').format(from.toLocal()),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () => jump(
                      DateTime.now().subtract(const Duration(minutes: 30)),
                    ),
                    child: const Text('Now'),
                  ),
                  TextButton(
                    onPressed: () {
                      final now = DateTime.now();
                      jump(DateTime(now.year, now.month, now.day, 19));
                    },
                    child: const Text('Tonight'),
                  ),
                  TextButton(
                    onPressed: () {
                      final now = DateTime.now();
                      jump(DateTime(now.year, now.month, now.day + 1, 6));
                    },
                    child: const Text('Tomorrow'),
                  ),
                  IconButton(
                    tooltip: 'Previous day',
                    onPressed: () {
                      final d = from.toLocal();
                      jump(
                        DateTime(d.year, d.month, d.day - 1, d.hour, d.minute),
                      );
                    },
                    icon: const Icon(Icons.chevron_left),
                  ),
                  IconButton(
                    tooltip: 'Choose date',
                    onPressed: date,
                    icon: const Icon(Icons.calendar_month),
                  ),
                  IconButton(
                    tooltip: 'Next day',
                    onPressed: () {
                      final d = from.toLocal();
                      jump(
                        DateTime(d.year, d.month, d.day + 1, d.hour, d.minute),
                      );
                    },
                    icon: const Icon(Icons.chevron_right),
                  ),
                  DropdownButton<int>(
                    value: interval,
                    items: [
                      for (final n in [15, 30, 60, 120])
                        DropdownMenuItem(value: n, child: Text('$n min')),
                    ],
                    onChanged: (n) => preferences(() => interval = n!),
                  ),
                  FilterChip(
                    label: const Text('24-hour'),
                    selected: clock24,
                    onSelected: (v) => preferences(() => clock24 = v),
                  ),
                  FilterChip(
                    label: const Text('Favorites'),
                    selected: favorites,
                    onSelected: (v) => filterPreferences(() => favorites = v),
                  ),
                  FilterChip(
                    label: const Text('Hide empty'),
                    selected: hideEmpty,
                    onSelected: availability == EpgAvailability.noEpg
                        ? null
                        : (v) => filterPreferences(() => hideEmpty = v),
                    tooltip: availability == EpgAvailability.noEpg
                        ? 'Hide Empty is off while No EPG is selected'
                        : null,
                  ),
                  FilterChip(
                    label: const Text('Compact'),
                    selected: compact,
                    onSelected: (v) => filterPreferences(() => compact = v),
                  ),
                  DropdownButton<String>(
                    value: category,
                    items: [
                      const DropdownMenuItem(
                        value: '',
                        child: Text('All categories'),
                      ),
                      for (final c in categories)
                        DropdownMenuItem(value: c, child: Text(c)),
                    ],
                    onChanged: (v) => filterPreferences(() => category = v!),
                  ),
                  SizedBox(
                    width: 190,
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        labelText: 'Search programmes',
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (v) => filterPreferences(() => search = v),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Refresh EPG',
                    onPressed: () async {
                      pending.clear();
                      _allowVisibleFetch = true;
                      for (final source in guide.sources.where(
                        (s) => s.kind == GuideSourceKind.xmltv,
                      )) {
                        await guide.refresh(source.id);
                      }
                      for (final c in channels.take(30)) {
                        await guide.ensureChannel(c, force: true);
                      }
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                  TextButton.icon(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) => GuideSourcesScreen(
                          from: from,
                          to: from.add(Duration(minutes: interval * 8)),
                        ),
                      ),
                    ),
                    icon: const Icon(Icons.source),
                    label: const Text('Sources'),
                  ),
                  if (!widget.fullscreen && !widget.embedded)
                    IconButton(
                      tooltip: 'Fullscreen guide',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => const Scaffold(
                            body: SafeArea(
                              child: GuideScreen(fullscreen: true),
                            ),
                          ),
                        ),
                      ),
                      icon: const Icon(Icons.fullscreen),
                    ),
                  if (widget.fullscreen && !widget.embedded)
                    IconButton(
                      tooltip: 'Close fullscreen',
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.fullscreen_exit),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (guide.busy.isNotEmpty) const LinearProgressIndicator(),
        if (availability == EpgAvailability.noEpg && search.trim().isNotEmpty)
          const Padding(
            padding: EdgeInsets.all(4),
            child: Text(
              'Program Search only matches channels with schedules. Clear search to see channels with No EPG.',
            ),
          ),
        Expanded(
          child: channels.isEmpty
              ? const Center(
                  child: Text(
                    'No matching channels. Add a playlist or adjust filters.',
                  ),
                )
              : LayoutBuilder(
                  builder: (context, bounds) => Stack(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: channelWidth + timelineWidth,
                          height: bounds.maxHeight,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: channelWidth,
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text('Channel • Watch'),
                                      ),
                                    ),
                                    for (var i = 0; i < 8; i++)
                                      SizedBox(
                                        width: cellWidth,
                                        child: Text(
                                          time(
                                            from.add(
                                              Duration(minutes: interval * i),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  controller: _programScroll,
                                  itemCount: channels.length,
                                  itemExtent: rowHeight,
                                  itemBuilder: (context, index) {
                                    final channel = channels[index];
                                    load(channel, guide);
                                    final programmes = guide.programmes(
                                      channel,
                                      from,
                                      to,
                                      search: search,
                                    );
                                    return Row(
                                      children: [
                                        SizedBox(width: channelWidth),
                                        SizedBox(
                                          width: timelineWidth,
                                          height: rowHeight,
                                          child: Stack(
                                            clipBehavior: Clip.hardEdge,
                                            children: [
                                              if (programmes.isEmpty)
                                                Positioned(
                                                  left: 12,
                                                  top: 10,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        guide.emptyState(
                                                          channel,
                                                          from,
                                                          to,
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            mappingDialog(
                                                              context,
                                                              channel,
                                                              guide,
                                                            ),
                                                        child: const Text(
                                                          'Map channel',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              for (final p in programmes)
                                                Builder(
                                                  builder: (context) {
                                                    final left =
                                                        p.start
                                                            .difference(from)
                                                            .inMilliseconds /
                                                        Duration(
                                                          minutes: interval,
                                                        ).inMilliseconds *
                                                        cellWidth;
                                                    final end =
                                                        p.end
                                                            .difference(from)
                                                            .inMilliseconds /
                                                        Duration(
                                                          minutes: interval,
                                                        ).inMilliseconds *
                                                        cellWidth;
                                                    final clippedLeft = left
                                                            .clamp(
                                                              0.0,
                                                              timelineWidth,
                                                            ),
                                                        clippedEnd = end.clamp(
                                                          0.0,
                                                          timelineWidth,
                                                        );
                                                    return Positioned(
                                                      left: clippedLeft,
                                                      width:
                                                          (clippedEnd -
                                                                  clippedLeft)
                                                              .clamp(
                                                                1.0,
                                                                timelineWidth,
                                                              ),
                                                      top: 2,
                                                      bottom: 2,
                                                      child: Card(
                                                        color:
                                                            p.current(
                                                              DateTime.now(),
                                                            )
                                                            ? Theme.of(context)
                                                                  .colorScheme
                                                                  .primaryContainer
                                                            : null,
                                                        margin:
                                                            const EdgeInsets.all(
                                                              1,
                                                            ),
                                                        child: InkWell(
                                                          onTap: () =>
                                                              widget.onProgrammeSelected !=
                                                                  null
                                                              ? widget
                                                                    .onProgrammeSelected!(
                                                                  channel,
                                                                  p,
                                                                )
                                                              : programmeDialog(
                                                                  context,
                                                                  channel,
                                                                  p,
                                                                ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                  6,
                                                                ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  p.title,
                                                                  maxLines:
                                                                      compact
                                                                      ? 1
                                                                      : 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                                if (!compact)
                                                                  Text(
                                                                    '${time(p.start)}–${time(p.end)}',
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                if (p.current(
                                                                  DateTime.now(),
                                                                ))
                                                                  LinearProgressIndicator(
                                                                    value: p.progress(
                                                                      DateTime.now(),
                                                                    ),
                                                                    minHeight:
                                                                        2,
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              if (nowPosition >= 0 &&
                                                  nowPosition < timelineWidth)
                                                Positioned(
                                                  left: nowPosition,
                                                  top: 0,
                                                  bottom: 0,
                                                  child: Container(
                                                    width: 2,
                                                    color: Colors.redAccent,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        width: channelWidth,
                        height: 40,
                        child: Material(
                          color: Theme.of(context).colorScheme.surface,
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Channel • Watch',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 40,
                        bottom: 0,
                        width: channelWidth,
                        child: Material(
                          color: Theme.of(context).colorScheme.surface,
                          child: ListView.builder(
                            controller: _channelScroll,
                            itemCount: channels.length,
                            itemExtent: rowHeight,
                            itemBuilder: (context, index) {
                              final channel = channels[index];
                              return ListTile(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color:
                                        widget.selectedChannel != null &&
                                            channelKey(
                                                  widget.selectedChannel!,
                                                ) ==
                                                channelKey(channel)
                                        ? Theme.of(context)
                                              .colorScheme
                                              .secondary
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                selected:
                                    widget.selectedChannel != null &&
                                    channelKey(widget.selectedChannel!) ==
                                        channelKey(channel),
                                tileColor:
                                    widget.playingChannel != null &&
                                        channelKey(widget.playingChannel!) ==
                                            channelKey(channel)
                                    ? Theme.of(context)
                                          .colorScheme
                                          .primaryContainer
                                    : null,
                                trailing:
                                    widget.playingChannel != null &&
                                        channelKey(widget.playingChannel!) ==
                                            channelKey(channel)
                                    ? const Icon(
                                        Icons.play_circle,
                                        semanticLabel: 'Currently playing',
                                      )
                                    : null,
                                onFocusChange: widget.onChannelSelected == null
                                    ? null
                                    : (focused) {
                                        if (focused) {
                                          widget.onChannelSelected!(channel);
                                        }
                                      },
                                dense: true,
                                leading: channel.iconURL == null
                                    ? const Icon(Icons.live_tv)
                                    : Image.network(
                                        channel.iconURL.toString(),
                                        width: 30,
                                        errorBuilder: (_, _, _) =>
                                            const Icon(Icons.live_tv),
                                      ),
                                title: Text(
                                  channel.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onTap: () => widget.onChannelSelected != null
                                    ? widget.onChannelSelected!(channel)
                                    : channelDetailsDialog(
                                        context,
                                        channel,
                                        guide,
                                      ),
                                onLongPress: () =>
                                    mappingDialog(context, channel, guide),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        const Padding(
          padding: EdgeInsets.all(4),
          child: Text(
            'Long press a channel to map its guide. Recordings and reminders require BSTV running and the device awake.',
          ),
        ),
      ],
    );
    return content;
  }
}

Future<void> mappingDialog(
  BuildContext context,
  Item item,
  GuideService guide,
) async {
  final selected = await showDialog<GuideChannel>(
    context: context,
    builder: (context) => _MappingDialog(guide: guide, item: item),
  );
  if (selected != null) guide.map(item, selected);
}

class _MappingDialog extends StatefulWidget {
  const _MappingDialog({required this.guide, required this.item});
  final GuideService guide;
  final Item item;
  @override
  State<_MappingDialog> createState() => _MappingDialogState();
}

class _MappingDialogState extends State<_MappingDialog> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    final channels = widget.guide.store
        .channels()
        .where(
          (c) =>
              '${c.name} ${c.id}'.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    return AlertDialog(
      title: Text('Guide for ${widget.item.name}'),
      content: SizedBox(
        width: 500,
        height: 400,
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Search guide channels / aliases',
              ),
              onChanged: (v) => setState(() => query = v),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: channels.length,
                itemBuilder: (_, i) => ListTile(
                  title: Text(channels[i].name),
                  subtitle: Text(
                    '${widget.guide.sources.where((s) => s.id == channels[i].sourceId).firstOrNull?.name ?? 'Guide'} • ${channels[i].id}',
                  ),
                  onTap: () => Navigator.pop(context, channels[i]),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.guide.map(widget.item, null);
            Navigator.pop(context);
          },
          child: const Text('Use automatic matching'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}

Future<void> programmeDialog(
  BuildContext context,
  Item channel,
  GuideProgramme p,
) async {
  final core = context.read<CoreServices>(),
      library = context.read<LibraryModel>();
  if (p.current(DateTime.now())) {
    if (library.prefs.autoPreviewSelectedChannels) {
      await playItem(context, channel, preview: true);
      return;
    }
    final result = await showDialog<String>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: Text(p.title),
        content: SizedBox(
          width: 900,
          height: 380,
          child: LayoutBuilder(
            builder: (context, bounds) {
              final information = SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (channel.iconURL != null)
                      Image.network(
                        channel.iconURL.toString(),
                        height: 40,
                        errorBuilder: (_, _, _) => const SizedBox.shrink(),
                      ),
                    Text(channel.name),
                    Text(
                      '${DateFormat.jm().format(p.start.toLocal())}–${DateFormat.jm().format(p.end.toLocal())}',
                    ),
                    Text(
                      '${p.end.difference(DateTime.now()).inMinutes.clamp(0, 1440)} min remaining',
                    ),
                    LinearProgressIndicator(value: p.progress(DateTime.now())),
                    Text(
                      p.description.isEmpty
                          ? 'No description supplied.'
                          : p.description,
                    ),
                    if (p.category.isNotEmpty) Text(p.category),
                    if (p.episode != null) Text('Episode ${p.episode}'),
                  ],
                ),
              );
              final preview = AspectRatio(
                aspectRatio: 16 / 9,
                child: ColoredBox(
                  color: Colors.black,
                  child: Center(
                    child: TextButton.icon(
                      onPressed: () => Navigator.pop(dialog, 'preview'),
                      icon: const Icon(Icons.play_circle),
                      label: const Text('Start muted live preview'),
                    ),
                  ),
                ),
              );
              return bounds.maxWidth >= 640
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: information),
                        const SizedBox(width: 16),
                        SizedBox(width: 320, child: preview),
                      ],
                    )
                  : Column(
                      children: [
                        Expanded(child: information),
                        SizedBox(height: 160, child: preview),
                      ],
                    );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog, 'watch'),
            child: const Text('Watch Channel'),
          ),
          TextButton(
            onPressed: () async {
              await library.toggleFavorite(channel);
              if (dialog.mounted) Navigator.pop(dialog);
            },
            child: Text(
              library.isFavorite(channel)
                  ? 'Remove favorite'
                  : 'Add to Favorites',
            ),
          ),
          TextButton(
            onPressed: () {
              try {
                core.dvr.schedule(core.dvr.forProgramme(channel, p));
                Navigator.pop(dialog);
              } catch (_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Unable to schedule recording. Check DVR settings and connection limits.',
                    ),
                  ),
                );
              }
            },
            child: const Text('Record remaining'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialog),
            child: const Text('Back to TV Guide'),
          ),
        ],
      ),
    );
    if (!context.mounted) return;
    if (result == 'preview' || result == 'watch') {
      await playItem(context, channel, preview: result == 'preview');
    }
    return;
  }
  await showDialog<void>(
    context: context,
    builder: (dialog) => AlertDialog(
      title: Text(p.title),
      content: SizedBox(
        width: 500,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(channel.name),
              if (safeImageUrl(p.artwork) case final Uri artwork)
                Image.network(
                  artwork.toString(),
                  height: 150,
                  errorBuilder: (_, _, _) => const SizedBox.shrink(),
                ),
              Text(
                '${DateFormat.yMd().add_jm().format(p.start.toLocal())} – ${DateFormat.jm().format(p.end.toLocal())} • ${p.end.difference(p.start).inMinutes} min',
              ),
              if (p.category.isNotEmpty) Text(p.category),
              if (p.episode != null) Text('Episode ${p.episode}'),
              const SizedBox(height: 12),
              Text(
                p.description.isEmpty
                    ? 'No description supplied.'
                    : p.description,
              ),
              const SizedBox(height: 12),
              const Text(
                'Recording: unencrypted MPEG-TS / TS HLS only. App must remain running and device awake.',
              ),
              if (p.seriesId == null)
                const Text(
                  'Series recording unavailable: provider supplied no reliable series identifier.',
                ),
            ],
          ),
        ),
      ),
      actions: [
        if (p.seriesId != null && p.end.isAfter(DateTime.now()))
          TextButton(
            onPressed: () {
              core.dvr.addSeriesRule(channel, p);
              Navigator.pop(dialog);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Series rule saved for matching future programmes on this channel.',
                  ),
                ),
              );
            },
            child: const Text('Record series'),
          ),
        if (p.current(DateTime.now()))
          TextButton(
            onPressed: () {
              Navigator.pop(dialog);
              unawaited(playItem(context, channel));
            },
            child: const Text('Watch now'),
          ),
        TextButton(
          onPressed: () async {
            await library.toggleFavorite(channel);
            if (dialog.mounted) Navigator.pop(dialog);
          },
          child: const Text('Toggle favorite'),
        ),
        if (p.start.isAfter(DateTime.now()))
          TextButton(
            onPressed: () {
              core.store.addReminder(p);
              Navigator.pop(dialog);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('In-app reminder saved')),
              );
            },
            child: const Text('Remind me'),
          ),
        if (p.end.isAfter(DateTime.now()))
          TextButton(
            onPressed: () {
              try {
                core.dvr.schedule(core.dvr.forProgramme(channel, p));
                Navigator.pop(dialog);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Recording scheduled. Keep BSTV running and device awake.',
                    ),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$e')));
              }
            },
            child: Text(
              p.current(DateTime.now())
                  ? 'Record remaining'
                  : 'Schedule recording',
            ),
          ),
        TextButton(
          onPressed: () => Navigator.pop(dialog),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}

Future<void> channelDetailsDialog(
  BuildContext context,
  Item channel,
  GuideService guide,
) async {
  final library = context.read<LibraryModel>();
  final now = DateTime.now();
  final current = guide
      .programmes(channel, now, now.add(const Duration(hours: 4)))
      .where((p) => p.current(now))
      .firstOrNull;
  if (current != null) return programmeDialog(context, channel, current);
  final result = await showDialog<String>(
    context: context,
    builder: (dialog) => AlertDialog(
      title: Text(channel.name),
      content: const Text(
        'No current programme information. Playback does not require an EPG mapping.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialog, 'watch'),
          child: const Text('Watch Channel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(dialog, 'preview'),
          child: const Text('Start muted preview'),
        ),
        TextButton(
          onPressed: () async {
            await library.toggleFavorite(channel);
            if (dialog.mounted) Navigator.pop(dialog);
          },
          child: Text(
            library.isFavorite(channel)
                ? 'Remove favorite'
                : 'Add to Favorites',
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(dialog, 'map'),
          child: const Text('Map channel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(dialog),
          child: const Text('Close'),
        ),
      ],
    ),
  );
  if (!context.mounted) return;
  if (result == 'map') await mappingDialog(context, channel, guide);
  if (!context.mounted) return;
  if (result == 'watch' || result == 'preview') {
    await playItem(context, channel, preview: result == 'preview');
  }
}

class GuideSourcesScreen extends StatelessWidget {
  const GuideSourcesScreen({super.key, this.from, this.to});
  final DateTime? from, to;
  @override
  Widget build(BuildContext context) {
    final rangeFrom =
        from ?? DateTime.now().subtract(const Duration(minutes: 30));
    final rangeTo = to ?? rangeFrom.add(const Duration(hours: 4));
    final guide = context.watch<CoreServices>().guide;
    return Scaffold(
      appBar: AppBar(title: const Text('EPG sources')),
      body: ListView(
        children: [
          const ListTile(
            title: Text(
              'Xtream XMLTV is discovered automatically, with provider API fallback for visible channels. Add custom URLs or local XMLTV/gzip files. Failed updates retain cached programmes. Credentials are never shown here.',
            ),
          ),
          ListTile(
            key: const Key('epg-copy-safe-report'),
            leading: const Icon(Icons.copy_all_outlined),
            title: const Text('Copy safe EPG coverage report'),
            subtitle: const Text(
              'Includes cached programme counts and mapped channels by source. '
              'Never includes playlist URLs, usernames, passwords, or raw errors.',
            ),
            onTap: () async {
              final library = context.read<LibraryModel>();
              final scope = library.db.read(
                (db) => Item.fromRows(
                  db.select(
                    'SELECT * FROM item WHERE type=? AND (? OR accountId=?)',
                    [
                      'live',
                      library.allPlaylists ? 1 : 0,
                      library.account?.id ?? -1,
                    ],
                  ),
                ),
              );
              // Calculate each channel's mapping once so the report measures
              // the same selected playlist scope as the actual TV guide.
              final mappedBySource = <String, List<GuideChannel>>{};
              var withoutMapping = 0;
              for (final item in scope) {
                final mapped = guide.mapping(item);
                if (mapped == null) {
                  withoutMapping++;
                } else {
                  (mappedBySource[mapped.sourceId] ??= []).add(mapped);
                }
              }
              final fromMs = rangeFrom.toUtc().millisecondsSinceEpoch;
              final toMs = rangeTo.toUtc().millisecondsSinceEpoch;
              final entries = <EpgHealthEntry>[];
              for (final source in guide.sources) {
                final database = guide.store.db;
                // These SQL queries inspect the LOCAL cache only. They do not
                // make provider requests or expose source addresses/tokens.
                final bounds = database.select(
                  'SELECT MIN(start) AS earliest, MAX(end) AS latest, '
                  'SUM(CASE WHEN end>? AND start<? AND end>start THEN 1 ELSE 0 END) AS currentCount '
                  'FROM programmes WHERE source=?',
                  [fromMs, toMs, source.id],
                ).single;
                final cachedChannelRows = database.select(
                  'SELECT DISTINCT channel FROM programmes WHERE source=?',
                  [source.id],
                );
                final windowChannelRows = database.select(
                  'SELECT DISTINCT channel FROM programmes WHERE source=? AND end>? AND start<? AND end>start '
                  r"AND length(trim(json_extract(json, '$.title')))>0",
                  [source.id, fromMs, toMs],
                );
                final cachedChannelIds = {
                  for (final row in cachedChannelRows) row['channel'] as String,
                };
                final windowChannelIds = {
                  for (final row in windowChannelRows) row['channel'] as String,
                };
                final mapped = mappedBySource[source.id] ?? const <GuideChannel>[];
                DateTime? utcTime(Object? value) => value is int
                    ? DateTime.fromMillisecondsSinceEpoch(value, isUtc: true)
                    : null;
                entries.add(
                  EpgHealthEntry(
                    kind: source.kind.name,
                    enabled: source.enabled,
                    cachedChannels: guide.store.channelCount(source.id),
                    cachedProgrammes: guide.store.programmeCount(source.id),
                    matchedChannels: mapped.length,
                    lastFetchRecorded: source.lastFetch != null,
                    earliestProgrammeUtc: utcTime(bounds['earliest']),
                    latestProgrammeUtc: utcTime(bounds['latest']),
                    programmesInWindow: (bounds['currentCount'] as int?) ?? 0,
                    guideChannelsInWindow: windowChannelIds.length,
                    matchedChannelsWithCachedProgrammes: mapped
                        .where((m) => cachedChannelIds.contains(m.id))
                        .length,
                    matchedChannelsWithWindowProgrammes: mapped
                        .where((m) => windowChannelIds.contains(m.id))
                        .length,
                  ),
                );
              }
              final usable = guide.availableChannelKeys(scope, rangeFrom, rangeTo);
              final report = formatSafeEpgHealthReport(
                entries,
                totalLiveChannels: scope.length,
                withEpgInWindow: usable.length,
                withoutMapping: withoutMapping,
                from: rangeFrom,
                to: rangeTo,
              );
              await Clipboard.setData(ClipboardData(text: report));
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Safe EPG report copied.')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Add XMLTV URL'),
            onTap: () async {
              final name = TextEditingController(),
                  url = TextEditingController();
              final accepted = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Add XMLTV source'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: name,
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      TextField(
                        controller: url,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          labelText: 'HTTP(S) XMLTV URL',
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Add'),
                    ),
                  ],
                ),
              );
              if (accepted == true) {
                try {
                  await guide.addXmltv(name.text, url.text);
                } catch (_) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Enter a name and valid HTTP(S) URL'),
                      ),
                    );
                  }
                }
              }
              name.dispose();
              url.dispose();
            },
          ),
          ListTile(
            leading: const Icon(Icons.file_open),
            title: const Text('Import local XMLTV / gzip file'),
            onTap: () async {
              final result = await FilePicker.pickFile(type: FileType.any);
              final path = result?.path;
              if (path != null) {
                try {
                  await guide.addLocalFile(result!.name, path);
                } catch (_) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Guide file could not be imported. See source diagnostics.',
                        ),
                      ),
                    );
                  }
                }
              }
            },
          ),
          for (final source in guide.sources)
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      '${source.name}${source.enabled ? '' : ' • disabled'}',
                    ),
                    subtitle: Text(_sourceSummary(guide, source)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Wrap(
                      spacing: 4,
                      children: [
                        TextButton(
                          onPressed: guide.busy.contains(source.id)
                              ? null
                              : () => _editSource(context, guide, source),
                          child: const Text('Edit'),
                        ),
                        TextButton(
                          onPressed: guide.busy.contains(source.id)
                              ? null
                              : () => guide.updateSource(
                                  source,
                                  name: source.name,
                                  enabled: !source.enabled,
                                  interval: source.intervalMinutes,
                                ),
                          child: Text(source.enabled ? 'Disable' : 'Enable'),
                        ),
                        if (source.kind == GuideSourceKind.xmltv)
                          TextButton(
                            onPressed:
                                !source.enabled ||
                                    guide.busy.contains(source.id)
                                ? null
                                : () => guide.refresh(source.id),
                            child: const Text('Test / Refresh'),
                          ),
                        TextButton(
                          onPressed: () {
                            final summary = guide.matchingSummary(source.id);
                            showDialog<void>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Measured guide matching'),
                                content: Text(
                                  '${summary.matched} matched channels\n${summary.unmatched} channels using another source or unmatched\n${guide.store.programmeCount(source.id)} cached programmes',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Close'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text('Matching counts'),
                        ),
                        TextButton(
                          onPressed: guide.busy.contains(source.id)
                              ? null
                              : () async {
                                  final yes = await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text(
                                        'Remove guide source and its mappings?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, false),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, true),
                                          child: const Text('Remove'),
                                        ),
                                      ],
                                    ),
                                  );
                                  if (yes == true) {
                                    await guide.remove(source.id);
                                  }
                                },
                          child: const Text('Remove'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ListTile(
            title: const Text('Rebuild automatic mappings'),
            subtitle: const Text('Preserves manual mappings and playlists.'),
            onTap: () async {
              final yes = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Rebuild automatic mappings?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Rebuild'),
                    ),
                  ],
                ),
              );
              if (yes == true) {
                guide.clearAutomaticMappings();
              }
            },
          ),
        ],
      ),
    );
  }
}

String _sourceSummary(GuideService guide, GuideSource source) {
  final stats = guide.stats(source.id);
  String date(Object? value) => value is int
      ? DateFormat.yMd().add_jm().format(
          DateTime.fromMillisecondsSinceEpoch(value).toLocal(),
        )
      : 'Never';
  final error = guide.errors[source.id] ?? stats['error'];
  return '${source.kind.name} • every ${source.intervalMinutes} min\nLast success: ${source.lastFetch == null ? 'Never' : DateFormat.yMd().add_jm().format(source.lastFetch!.toLocal())}\nLast attempt: ${date(stats['attempt'])}\nCached: ${guide.store.channelCount(source.id)} channels • ${guide.store.programmeCount(source.id)} programmes\nStatus: ${stats['status'] ?? 'Not requested'}${error == null ? '' : '\n$error'}${stats['skipped'] == null ? '' : '\nInvalid entries: ${stats['skipped']}'}';
}

Future<void> _editSource(
  BuildContext context,
  GuideService guide,
  GuideSource source,
) async {
  final name = TextEditingController(text: source.name);
  final url = TextEditingController();
  final interval = TextEditingController(text: '${source.intervalMinutes}');
  var enabled = source.enabled;
  String? error;
  await showDialog<void>(
    context: context,
    builder: (dialog) => StatefulBuilder(
      builder: (dialog, update) => AlertDialog(
        title: const Text('Edit EPG source'),
        content: SizedBox(
          width: 480,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: name,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                if (source.kind == GuideSourceKind.xmltv &&
                    !guide.isProviderSource(source) &&
                    guide.store.setting('localFile.${source.id}') != true)
                  TextField(
                    controller: url,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      labelText: 'New URL (leave blank to keep saved URL)',
                    ),
                  ),
                if (guide.isProviderSource(source))
                  const Text(
                    'Provider XMLTV address is derived from the saved account; credentials are not duplicated.',
                  ),
                TextField(
                  controller: interval,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Automatic refresh interval (15–10080 minutes)',
                  ),
                ),
                SwitchListTile(
                  title: const Text('Enabled'),
                  value: enabled,
                  onChanged: (v) => update(() => enabled = v),
                ),
                if (error != null) Text(error!),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialog),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                await guide.updateSource(
                  source,
                  name: name.text,
                  enabled: enabled,
                  interval: int.parse(interval.text),
                  url: url.text,
                );
                if (dialog.mounted) Navigator.pop(dialog);
              } catch (_) {
                update(
                  () => error = 'Enter a name, valid interval and HTTP(S) URL, or leave the URL blank.',
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    ),
  );
  name.dispose();
  url.dispose();
  interval.dispose();
}
