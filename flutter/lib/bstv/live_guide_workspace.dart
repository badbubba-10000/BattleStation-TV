// BattleStation TV, 2026. GPLv3; see BSTV-NOTICE.md.
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/core/models.dart';
import 'package:iptvmac/player/play_request.dart';
import 'package:iptvmac/player/player_model.dart';
import 'package:iptvmac/player/player_widgets.dart';
import 'package:iptvmac/player/media_kit_engine.dart';
import 'package:iptvmac/player/engine.dart';

import 'core_services.dart';
import 'feature_models.dart';
import 'guide_screen.dart';
import 'dvr_screen.dart';
import 'preview_navigation.dart';

Widget buildLiveGuideWorkspace(
  BuildContext context,
  PlayerModel model,
  Widget video,
) => LayoutBuilder(
  builder: (context, constraints) {
    // Only the in-player EPG workspace gets the shell's existing left sidebar.
    // Full-screen video without the guide stays distraction-free.
    final wide = constraints.maxWidth >= 720;
    final compact = constraints.maxWidth < 1100;
    void go(int destination) {
      BstvPreviewNavigation.navigate(destination);
      model.close(); // Leave the player route and return to the selected shell page.
    }

    if (!wide) {
      return Scaffold(
        appBar: AppBar(title: const Text('TV Guide')),
        drawer: Drawer(child: BstvPreviewSidebar(onNavigate: go)),
        body: LiveGuideWorkspace(model: model, video: video),
      );
    }
    return Row(
      children: [
        if (wide) BstvPreviewSidebar(onNavigate: go, compact: compact),
        Expanded(
          child: LiveGuideWorkspace(model: model, video: video),
        ),
      ],
    );
  },
);

class LiveGuideWorkspace extends StatefulWidget {
  const LiveGuideWorkspace({
    super.key,
    required this.model,
    required this.video,
  });
  final PlayerModel model;
  final Widget video;
  @override
  State<LiveGuideWorkspace> createState() => _LiveGuideWorkspaceState();
}

class _LiveGuideWorkspaceState extends State<LiveGuideWorkspace> {
  Item? selected;
  GuideProgramme? selection;
  PlayRequest? lastWorking;
  Widget? _guideWidget;
  String? _guideActive, _guideSelected;
  final focus = GuideFocusController();
  PlaybackEngine? _selectedPreview;
  Timer? _previewDebounce;
  String? _previewKey;
  bool _allowUnverifiedExtraStream = false;
  String? _previewStatus;
  // A provider with one connection cannot show two simultaneous streams.
  // In explicit single-stream mode, selections reuse the existing player.
  // The previous channel is restored when browsing ends unless Watch is used.
  bool _temporarySingleStream = false;
  bool _automaticPreviewInitialized = false;
  PlayRequest? _beforeTemporaryPreview;
  double? _beforeTemporaryVolume;

  bool get _reuseCurrentStream => model.previewMode || _temporarySingleStream;

  void _restoreTemporaryPreview({bool afterFrame = false}) {
    if (!_temporarySingleStream) return;
    final previous = _beforeTemporaryPreview;
    final volume = _beforeTemporaryVolume;
    final player = model;
    final previewRequest = player.request;
    _temporarySingleStream = false;
    _beforeTemporaryPreview = null;
    _beforeTemporaryVolume = null;
    void restore() {
      // A newer explicit selection or a closed player supersedes this restore.
      if (player.closed || !identical(player.request, previewRequest)) return;
      if (previous != null && player.request.url != previous.url) {
        player.replace(previous);
      }
      if (volume != null && !player.closed) player.setVolume(volume);
    }

    // Disposal runs while Flutter locks the widget tree; notify after that frame.
    if (afterFrame) {
      WidgetsBinding.instance.addPostFrameCallback((_) => restore());
    } else {
      restore();
    }
  }

  void _enableTemporaryPreview() {
    if (_temporarySingleStream || model.previewMode) return;
    // This mode temporarily reuses the current stream and restores it on exit.
    _beforeTemporaryPreview = model.request;
    _beforeTemporaryVolume = model.volume;
    _temporarySingleStream = true;
    model.setVolume(0);
    final item = selected;
    if (item != null) _queueSelectedPreview(item);
    setState(() {});
  }

  // Connection metadata determines whether a second muted session is allowed.
  int? _maxConnections(int accountId) =>
      context.read<LibraryModel>().subscriptions[accountId]?.maxConnections;

  bool _mayPreview(Item item) {
    final max = _maxConnections(item.accountId);
    if (max != null) return max >= 2;
    // If the provider doesn't report the connection limit, explicit consent
    // is required before opening a second stream.
    return _allowUnverifiedExtraStream;
  }

  void _stopSelectedPreview() {
    _previewDebounce?.cancel();
    _previewDebounce = null;
    _selectedPreview?.dispose();
    _selectedPreview = null;
    _previewKey = null;
  }

  void _queueSelectedPreview(Item item) {
    _previewDebounce?.cancel();
    final activeItem = model.request.item;
    if (activeItem != null && channelKey(activeItem) == channelKey(item)) {
      _stopSelectedPreview();
      if (mounted) {
        setState(
          () => _previewStatus = _temporarySingleStream
              ? 'Automatic muted preview is on. Browsing temporarily changes the current stream; closing the guide restores it.'
              : null,
        );
      }
      return;
    }
    // Initial channel previews already own the one stream. Reuse that stream
    // when browsing instead of attempting to open a blocked second connection.
    // Active playback stays untouched unless the user explicitly opts into
    // temporary single-stream browsing.
    if (_reuseCurrentStream) {
      _stopSelectedPreview();
      final host = model.host;
      if (host is! LiveChannelHost) return;
      final request = (host as LiveChannelHost).channelRequest(item);
      if (request == null) {
        if (mounted) {
          setState(
            () => _previewStatus = 'This channel has no playable stream.',
          );
        }
        return;
      }
      if (model.request.url != request.url) model.replace(request);
      if (model.request.url != request.url) {
        if (mounted) {
          setState(
            () => _previewStatus = 'Could not open this channel preview.',
          );
        }
        return;
      }
      if (!model.muted) model.setVolume(0);
      if (mounted) {
        setState(
          () => _previewStatus = _temporarySingleStream
              ? 'Temporary muted preview • Previous channel returns when you close the guide.'
              : 'Muted preview • Watch Channel to continue with sound.',
        );
      }
      return;
    }
    // Do not let a stale selection keep an extra IPTV connection alive.
    _stopSelectedPreview();
    if (!_mayPreview(item)) {
      if (mounted) {
        setState(
          () => _previewStatus = _maxConnections(item.accountId) == 1
              ? 'Provider reports one connection: cannot preview another channel while playback continues.'
              : 'Connection limit unknown. Enable extra-stream preview below to preview other channels.',
        );
      }
      return;
    }
    if (mounted) setState(() => _previewStatus = 'Loading muted preview…');
    _previewDebounce = Timer(const Duration(milliseconds: 450), () {
      if (!mounted || !model.guideOpen) return;
      final host = model.host;
      if (host is! LiveChannelHost) return;
      final request = (host as LiveChannelHost).channelRequest(item);
      if (request == null) {
        setState(
          () => _previewStatus = 'No playable preview for this channel.',
        );
        return;
      }
      final engine = MediaKitEngine(
        subLang: model.prefs.subLang,
        audioLang: model.prefs.audioLang,
      );
      // Mute *before* opening to avoid even a brief second audio stream.
      engine.setVolume(0);
      engine.load(request.url.toString());
      setState(() {
        _selectedPreview = engine;
        _previewKey = channelKey(item);
        _previewStatus = null;
      });
    });
  }

  PlayerModel get model => widget.model;
  Widget guide(Item? active, Item? item) {
    final activeKey = active == null ? null : channelKey(active),
        selectedKey = item == null ? null : channelKey(item);
    if (_guideWidget == null ||
        _guideActive != activeKey ||
        _guideSelected != selectedKey) {
      _guideActive = activeKey;
      _guideSelected = selectedKey;
      _guideWidget = GuideScreen(
        key: const PageStorageKey('in-player-guide'),
        embedded: true,
        fetchVisibleEpg: true,
        playingChannel: active,
        selectedChannel: item,
        focusController: focus,
        onChannelSelected: selectChannel,
        onProgrammeSelected: selectProgramme,
      );
    }
    return _guideWidget!;
  }

  @override
  void initState() {
    super.initState();
    selected = model.request.item;
    lastWorking = model.lastWorkingLiveRequest;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_automaticPreviewInitialized) return;
    _automaticPreviewInitialized = true;
    // No extra IPTV session is started silently. For a known single-stream
    // account, or when the limit is unknown, default to the existing player:
    // selections become muted previews and the original request is restored
    // when the guide closes unless the user explicitly presses Watch Channel.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !model.guideOpen || model.previewMode) return;
      final channel = selected ?? model.request.item;
      if (channel == null) return;
      final max = _maxConnections(channel.accountId);
      if (max == null || max < 2) {
        _enableTemporaryPreview();
      }
    });
  }

  @override
  void dispose() {
    _restoreTemporaryPreview(afterFrame: true);
    _stopSelectedPreview();
    focus.dispose();
    super.dispose();
  }

  List<GuideProgramme> schedule(Item item) =>
      context.read<CoreServices>().guide.programmes(
        item,
        DateTime.now().subtract(const Duration(hours: 8)),
        DateTime.now().add(const Duration(hours: 12)),
      );
  void selectChannel(Item item) {
    setState(() {
      selected = item;
      selection = schedule(item)
          .where((p) => p.current(DateTime.now()))
          .firstOrNull;
    });
    _queueSelectedPreview(item);
  }

  void selectProgramme(Item item, GuideProgramme programme) {
    final changed =
        selected == null || channelKey(selected!) != channelKey(item);
    setState(() {
      selected = item;
      selection = programme;
    });
    if (changed) _queueSelectedPreview(item);
  }

  void finishPreview() {
    if (model.previewMode && model.muted) model.toggleMute();
    model.previewMode = false;
  }

  void watch() {
    final item = selected;
    if (item == null ||
        (selection != null && !selection!.current(DateTime.now()))) {
      return;
    }
    final same =
        model.request.item != null &&
        channelKey(model.request.item!) == channelKey(item) &&
        !model.core.failed;
    if (!same) {
      final host = model.host;
      if (host is! LiveChannelHost) return;
      final request = (host as LiveChannelHost).channelRequest(item);
      if (request == null) return;
      model.replace(request);
      if (!identical(model.request, request)) {
        return; // Admission refused: old session stays intact.
      }
    }
    _stopSelectedPreview();
    if (_temporarySingleStream) {
      // Watch commits the selected stream; closing the guide must not restore
      // the old channel after the user explicitly chose this one.
      final volume = _beforeTemporaryVolume;
      _temporarySingleStream = false;
      _beforeTemporaryPreview = null;
      _beforeTemporaryVolume = null;
      if (volume != null) model.setVolume(volume);
    }
    finishPreview();
    if (!model.prefs.keepGuideOpen) {
      model.guideOpen = false;
      if (!model.fullscreen) model.toggleFullscreen();
    }
    model.touchControls();
  }

  void fullscreen() {
    _restoreTemporaryPreview();
    _stopSelectedPreview();
    finishPreview();
    model.guideOpen = false;
    model.touchControls();
    if (!model.fullscreen) model.toggleFullscreen();
  }

  void recording(GuideProgramme p) {
    final item = selected;
    if (item == null) return;
    try {
      final dvr = context.read<CoreServices>().dvr;
      dvr.schedule(dvr.forProgramme(item, p));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Recording scheduled. Keep BSTV running and the device awake.',
          ),
        ),
      );
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Recording could not be scheduled. Check the provider connection limit and DVR settings.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final library = context.watch<LibraryModel>();
    final core = context.watch<CoreServices>();
    final now = DateTime.now();
    final confirmed = !model.core.failed && model.core.position > 0;
    if (confirmed) lastWorking = model.request;
    final active = confirmed ? model.request.item : null;
    final current = active == null
        ? null
        : schedule(active).where((p) => p.current(now)).firstOrNull;
    final next = active == null
        ? null
        : schedule(active).where((p) => p.start.isAfter(now)).firstOrNull;
    final item = selected ?? model.request.item;
    final programme =
        selection ??
        (item == null
            ? null
            : schedule(item).where((p) => p.current(now)).firstOrNull);
    String time(DateTime t) => DateFormat.jm().format(t.toLocal());
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: LayoutBuilder(
        builder: (context, bounds) => Column(
          children: [
            SizedBox(
              height: (bounds.maxHeight * .32).clamp(130.0, 280.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              confirmed
                                  ? 'Currently playing: ${model.request.title}'
                                  : model.core.failed
                                  ? 'Playback unavailable: ${model.request.title}'
                                  : 'Connecting: ${model.request.title}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            if (current != null) ...[
                              Text(current.title),
                              Text(
                                '${time(current.start)}–${time(current.end)}',
                              ),
                              LinearProgressIndicator(
                                value: current.progress(now),
                              ),
                              if (current.description.isNotEmpty)
                                Text(
                                  current.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                            ],
                            if (next != null)
                              Text('Next: ${next.title} • ${time(next.start)}'),
                            const Divider(),
                            Text(
                              'Selected: ${item?.name ?? 'No channel'}',
                              key: const Key('selected-guide-channel'),
                            ),
                            if (programme != null) ...[
                              Text(
                                programme.title,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              Text(
                                '${time(programme.start)}–${time(programme.end)}',
                              ),
                              Text(
                                programme.description.isEmpty
                                    ? 'No description supplied.'
                                    : programme.description,
                              ),
                              if (programme.category.isNotEmpty)
                                Text(programme.category),
                              if (programme.episode != null)
                                Text('Episode ${programme.episode}'),
                              if (programme.current(now))
                                Text(
                                  '${programme.end.difference(now).inMinutes.clamp(0, 1440)} min remaining',
                                ),
                            ] else
                              const Text(
                                'No current programme information. This channel can still be watched or mapped.',
                              ),
                            Wrap(
                              spacing: 6,
                              children: [
                                if (item != null &&
                                    (programme == null ||
                                        programme.current(now)))
                                  FilledButton(
                                    key: const Key('watch-guide-channel'),
                                    onPressed: watch,
                                    child: const Text('Watch Channel'),
                                  ),
                                if (item != null)
                                  TextButton(
                                    onPressed: () =>
                                        library.toggleFavorite(item),
                                    child: Text(
                                      library.isFavorite(item)
                                          ? 'Remove favorite'
                                          : 'Add to Favorites',
                                    ),
                                  ),
                                if (item != null)
                                  OutlinedButton.icon(
                                    onPressed: () => scheduleDialog(
                                      context, selectedChannel: item,
                                    ),
                                    icon: const Icon(Icons.fiber_manual_record),
                                    label: const Text('Record / Schedule'),
                                  ),
                                if (item != null)
                                  TextButton(
                                    onPressed: () => mappingDialog(
                                      context,
                                      item,
                                      core.guide,
                                    ),
                                    child: const Text('Map channel'),
                                  ),
                                if (programme != null &&
                                    programme.end.isAfter(now))
                                  TextButton(
                                    onPressed: () => recording(programme),
                                    child: Text(
                                      programme.current(now)
                                          ? 'Record remaining'
                                          : 'Schedule recording',
                                    ),
                                  ),
                                if (programme != null &&
                                    programme.start.isAfter(now))
                                  TextButton(
                                    onPressed: () {
                                      core.store.addReminder(programme);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'In-app reminder saved',
                                              ),
                                            ),
                                          );
                                    },
                                    child: const Text('Reminder'),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  _selectedPreview == null
                                      ? widget.video
                                      : KeyedSubtree(
                                          key: ValueKey(
                                            'selected-preview-$_previewKey',
                                          ),
                                          child: _selectedPreview!.buildVideo(
                                            BoxFit.contain,
                                          ),
                                        ),
                                  if (_selectedPreview == null &&
                                      model.core.buffering)
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  if (_selectedPreview == null &&
                                      model.core.failed)
                                    ColoredBox(
                                      color: Colors.black87,
                                      child: Center(
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text('Playback failed'),
                                              TextButton(
                                                onPressed: model.retry,
                                                child: const Text('Retry'),
                                              ),
                                              TextButton(
                                                onPressed: () =>
                                                    showPlaybackDiagnostics(
                                                      context,
                                                      model,
                                                    ),
                                                child: const Text(
                                                  'Diagnostics',
                                                ),
                                              ),
                                              if (lastWorking != null &&
                                                  lastWorking!.url !=
                                                      model.request.url)
                                                TextButton(
                                                  onPressed: () {
                                                    model.replace(lastWorking!);
                                                    model.touchControls();
                                                  },
                                                  child: const Text(
                                                    'Return to previous channel',
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_selectedPreview != null)
                              const Tooltip(
                                message: 'Selected-channel preview is muted',
                                child: Icon(Icons.volume_off),
                              )
                            else ...[
                              IconButton(
                                tooltip: model.muted ? 'Unmute' : 'Mute',
                                onPressed: model.toggleMute,
                                icon: Icon(
                                  model.muted
                                      ? Icons.volume_off
                                      : Icons.volume_up,
                                ),
                              ),
                              SizedBox(
                                width: 125,
                                child: Slider(
                                  key: const Key('guide-volume-slider'),
                                  value: model.volume,
                                  onChanged: model.setVolume,
                                ),
                              ),
                              Text('${(model.volume * 100).round()}%'),
                            ],
                            IconButton(
                              tooltip: 'Open Fullscreen',
                              onPressed: fullscreen,
                              icon: const Icon(Icons.fullscreen),
                            ),
                          ],
                        ),
                        if (_previewStatus != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              _previewStatus!,
                              style: const TextStyle(fontSize: 11),
                            ),
                          ),
                        if (!model.previewMode &&
                            !_temporarySingleStream &&
                            _maxConnections(
                                  (selected ?? model.request.item)?.accountId ??
                                      -1,
                                ) ==
                                1)
                          TextButton.icon(
                            key: const Key('temporary-single-stream-preview'),
                            onPressed: _enableTemporaryPreview,
                            icon: const Icon(Icons.visibility_outlined),
                            label: const Text(
                              'Preview selected channels (temporarily interrupts current TV; restores on exit)',
                            ),
                          ),
                        if (!_temporarySingleStream &&
                            _maxConnections(
                                  (selected ?? model.request.item)?.accountId ??
                                      -1,
                                ) ==
                                null &&
                            !_allowUnverifiedExtraStream)
                          TextButton(
                            onPressed: () {
                              setState(
                                () => _allowUnverifiedExtraStream = true,
                              );
                              if (selected != null) {
                                _queueSelectedPreview(selected!);
                              }
                            },
                            child: const Text(
                              'Enable preview (uses a second IPTV connection)',
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 42,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TextButton.icon(
                      key: const Key('close-live-guide'),
                      onPressed: model.toggleGuide,
                      icon: const Icon(Icons.close),
                      label: const Text('Close Guide'),
                    ),
                    TextButton(
                      key: const Key('back-playing-channel'),
                      onPressed: () {
                        if (_temporarySingleStream) {
                          final original = _beforeTemporaryPreview?.item;
                          _restoreTemporaryPreview();
                          if (original != null) selectChannel(original);
                        } else if (active != null) {
                          selectChannel(active);
                        }
                        focus.backToPlayingChannel();
                      },
                      child: const Text('Back to Playing Channel'),
                    ),
                    if (model.previewMode)
                      TextButton(
                        onPressed: model.close,
                        child: const Text('Close Preview'),
                      ),
                    const Text(
                      'Browsing previews are muted • Watch Channel switches the main stream',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GuideScreen(
                key: const PageStorageKey('in-player-guide'),
                embedded: true,
                fetchVisibleEpg: true,
                playingChannel: active,
                selectedChannel: item,
                focusController: focus,
                onChannelSelected: selectChannel,
                onProgrammeSelected: selectProgramme,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
