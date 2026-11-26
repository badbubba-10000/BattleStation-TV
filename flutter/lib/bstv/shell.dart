import 'package:iptvmac/ui/update_screen.dart';
// BattleStation TV modifications, 2026. Distributed under upstream GPLv3.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/core/models.dart';
import 'package:iptvmac/ui/browse_screen.dart';
import 'package:iptvmac/ui/downloads_screen.dart';
import 'package:iptvmac/ui/library_screen.dart';
import 'package:iptvmac/ui/settings_screen.dart';

import 'dashboard.dart';
import 'customize_screen.dart';
import 'identity.dart';
import 'guide_screen.dart';
import 'dvr_screen.dart';
import 'core_services.dart';
import 'guided_tour.dart';
import 'preview_navigation.dart';
import 'package:iptvmac/ui/cloud_sync_screen.dart';

class BstvShell extends StatefulWidget {
  const BstvShell({super.key});
  @override
  State<BstvShell> createState() => _BstvShellState();
}

class _BstvShellState extends State<BstvShell> {
  int _selected = 0;
  bool _tourActive = false;
  int _tourIndex = 0;
  late final List<TourStep> _tourSteps = [
    TourStep(
      title: 'Home',
      description: 'Your dashboard brings featured content, recommendations and quick access to your library together.',
      target: TourAnchors.nav[0],
      page: 0,
    ),
    TourStep(
      title: 'Search',
      description: 'Search the content provided by your own IPTV services. The app does not provide channels or subscriptions.',
      target: TourAnchors.search,
      page: 0,
    ),
    TourStep(
      title: 'Live TV',
      description: 'Browse the live channels from your configured IPTV provider and select a channel to watch.',
      target: TourAnchors.nav[1],
      page: 1,
    ),
    TourStep(
      title: 'TV Guide',
      description: 'View channel schedules and upcoming programs when your provider supplies guide information.',
      target: TourAnchors.nav[2],
      page: 2,
    ),
    TourStep(
      title: 'Movies',
      description:
          'Browse and filter movies supplied by your connected provider.',
      target: TourAnchors.nav[3],
      page: 3,
    ),
    TourStep(
      title: 'Series',
      description: 'Explore available series, seasons and episodes.',
      target: TourAnchors.nav[4],
      page: 4,
    ),
    TourStep(
      title: 'Favorites',
      description: 'Keep track of favorite content and continue watching when those features are available.',
      target: TourAnchors.nav[7],
      page: 7,
    ),
    TourStep(
      title: 'Customization Studio',
      description: 'Everything about the look and layout is organized here in expandable sections.',
      target: TourAnchors.nav[8],
      page: 8,
    ),
    TourStep(
      title: 'Interface Presets',
      description: 'Open this dropdown to choose a complete layout. Preview its arrangement before applying it; preview does not change your saved settings.',
      target: TourAnchors.customize['Interface Presets'],
      page: 8,
    ),
    TourStep(
      title: 'Preset preview screens',
      description: 'Use Full Preview to inspect Home, Movies, Series, Live TV and TV Guide. Switch Phone, Tablet, Desktop or TV before applying. Closing preview changes nothing.',
      target: TourAnchors.customize['Interface Presets'],
      page: 8,
    ),
    TourStep(
      title: 'Restore and custom presets',
      description: 'Restore Previous Layout reverses the last saved appearance. Profiles store independent custom presets and support rename, duplicate, import and export.',
      target: TourAnchors.customize['Share & Restore'],
      page: 8,
    ),
    TourStep(
      title: 'Navigation and interface',
      description: 'Interface controls change navigation placement, spacing, card radius, text size and reduced motion. All app sections remain accessible.',
      target: TourAnchors.customize['Appearance'],
      page: 8,
    ),
    TourStep(
      title: 'Appearance',
      description: 'Choose between Dark, Light and System appearance.',
      target: TourAnchors.customize['Appearance'],
      page: 8,
    ),
    TourStep(
      title: 'Accent Color',
      description:
          'Choose the highlight color used by buttons, selections and accents.',
      target: TourAnchors.customize['Accent Color'],
      page: 8,
    ),
    TourStep(
      title: 'Dashboard Widgets',
      description: 'Show or hide content rows and open the full widget editor to rearrange or resize sections.',
      target: TourAnchors.customize['Dashboard Widgets'],
      page: 8,
    ),
    TourStep(
      title: 'Share & Restore',
      description: 'Export or import a theme, manage profiles, or restore the default layout. This does not share your IPTV password.',
      target: TourAnchors.customize['Share & Restore'],
      page: 8,
    ),
    TourStep(
      title: 'Settings',
      description: 'Manage providers, playback behavior, downloads, and help. Replay this tour any time under Help & Tutorials.',
      target: TourAnchors.nav[9],
      page: 9,
    ),
  ];

  @override
  void initState() {
    super.initState();
    TourService.replay.addListener(_replayTour);
    BstvPreviewNavigation.requestedDestination.addListener(_onPreviewNavigation);
    WidgetsBinding.instance.addPostFrameCallback((_) => _offerTour());
  }

  @override
  void dispose() {
    TourService.replay.removeListener(_replayTour);
    BstvPreviewNavigation.requestedDestination.removeListener(_onPreviewNavigation);
    super.dispose();
  }

  void _replayTour() {
    if (!mounted) return;
    _moveTour(0);
  }

  Future<void> _offerTour() async {
    if (!await TourService.shouldOffer('main') || !mounted) return;
    final begin = await showDialog<bool>(
      context: context,
      builder: (dialog) => AlertDialog(
        title: const Text('Welcome! Take a quick tour?'),
        content: const Text(
          'Explore Home, Live TV, the TV Guide, Movies, Series and all five customization sections. You can skip everything now or at any step, and replay the tour later from Settings.',
        ),
        actions: [
          TextButton(
            key: const Key('tour-offer-skip'),
            onPressed: () => Navigator.pop(dialog, false),
            child: const Text('Skip Tutorial'),
          ),
          FilledButton(
            key: const Key('tour-offer-start'),
            onPressed: () => Navigator.pop(dialog, true),
            child: const Text('Start Tour'),
          ),
        ],
      ),
    );
    if (!mounted) return;
    if (begin == true) {
      _moveTour(0);
    } else {
      await TourService.remember('main');
    }
  }

  void _moveTour(int index) {
    if (!mounted) return;
    if (index >= _tourSteps.length) {
      _closeTour();
      return;
    }
    final step = _tourSteps[index];
    final nextPage = step.page ?? 0;
    _select(nextPage);
    setState(() {
      _tourIndex = index;
      _tourActive = true;
    });
  }

  Future<void> _closeTour() async {
    if (!mounted) return;
    setState(() => _tourActive = false);
    await TourService.remember('main');
  }

  static const destinations = BstvPreviewNavigation.destinations;

  void _onPreviewNavigation() {
    final destination = BstvPreviewNavigation.requestedDestination.value;
    if (destination == null || !mounted) return;
    _select(destination);
  }

  void _select(int index) {
    final type = switch (index) {
      1 => ItemType.live,
      3 => ItemType.movie,
      4 => ItemType.series,
      _ => null,
    };
    if (type != null) context.read<LibraryModel>().setTab(type);
    setState(() => _selected = index);
  }

  Widget _body() => switch (_selected) {
    0 => BstvDashboard(onNavigate: _select),
    1 => const BrowseScreen(key: ValueKey('bstv-live'), type: ItemType.live),
    2 => const GuideScreen(),
    6 => const DvrScreen(),
    3 => const BrowseScreen(key: ValueKey('bstv-movies'), type: ItemType.movie),
    4 => const BrowseScreen(
      key: ValueKey('bstv-series'),
      type: ItemType.series,
    ),
    5 => const DownloadsScreen(),
    7 => const LibraryScreen(), // Retains favorites AND continue-watching functionality.
    9 => const SettingsScreen(),
    10 => const CloudSyncScreen(),
    8 => const BstvCustomizeScreen(),
    _ => const SizedBox.shrink(),
  };

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LibraryModel>();
    final core = context.watch<CoreServices>();
    final reminders = core.store.dueReminders(DateTime.now());
    if (reminders.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Starting now: ${reminders.map((p) => p.title).join(', ')}',
              ),
              duration: const Duration(seconds: 15),
            ),
          );
        }
      });
    }
    return LayoutBuilder(
      builder: (context, size) {
        final nav = model.prefs.bstvTheme.interface.navigation;
        final interface = model.prefs.bstvTheme.interface;
        final visibleIndices = <int>[
          ...interface.navigationOrder,
          for (var i = 0; i < destinations.length; i++)
            if (!interface.navigationOrder.contains(i)) i,
        ].where((i) => i >= 0 && i < destinations.length &&
          (!interface.hiddenNavigation.contains(i) || i == 9)).toList();
        final navigationItems = [
          for (final i in visibleIndices)
            (i, destinations[i]),
        ];
        final desktop =
            (nav == 'sidebar' || nav == 'right') && size.maxWidth >= 720 ||
            (nav == 'adaptive' && size.maxWidth >= 1100);
        final rail =
            {'sidebar', 'right', 'compact', 'television'}.contains(nav) ||
            nav == 'adaptive' && size.maxWidth >= 720 && size.maxHeight >= 600;

        final body = Column(
          children: [
            const ReleaseUpdateBanner(),
            if (core.storageWarning != null)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(core.storageWarning!),
              ),
            Expanded(child: _body()),
          ],
        );
        return PopScope(
          canPop: _selected == 0,
          onPopInvokedWithResult: (didPop, _) {
            if (!didPop) _select(0);
          },
          child: Stack(
            children: [
              Scaffold(

                appBar: AppBar(
                  title: Text(
                    desktop ? BstvIdentity.name : BstvIdentity.shortName,
                  ),
                  actions: [
                    IconButton(
                      tooltip: 'Search your playlist',
                      onPressed: () => _select(1),
                      icon: const Icon(Icons.search),
                      key: TourAnchors.search,
                    ),
                    const PlaylistMenu(),
                  ],
                ),
                body: Column(
                  children: [
                    if (nav == 'top')
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (final (index, destination)
                                in navigationItems)
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: ChoiceChip(
                                  key: index<TourAnchors.nav.length?TourAnchors.nav[index]:const ValueKey('nav-cloud-sync'),
                                  label: Text(destination.$1),
                                  selected: index == _selected,
                                  onSelected: (_) => _select(index),
                                ),
                              ),
                          ],
                        ),
                      ),
                    Expanded(
                      child: Row(
                        textDirection: nav == 'right' ? TextDirection.rtl : TextDirection.ltr,
                        children: [
                          if (rail)
                            SizedBox(
                              width: desktop ? interface.sidebarWidth : 94,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          for (final (index, destination)
                                              in navigationItems)
                                            ListTile(
                                              key: index<TourAnchors.nav.length?TourAnchors.nav[index]:const ValueKey('nav-cloud-sync'),
                                              selected: index == _selected,
                                              leading: interface.navDisplay == 'text' ? null : Icon(destination.$2),
                                              title: desktop && interface.navDisplay != 'icons'
                                                  ? Text(destination.$1)
                                                  : null,
                                              subtitle: !desktop
                                                  ? Text(
                                                      destination.$1,
                                                      maxLines: 2,
                                                    )
                                                  : null,
                                              onTap: () => _select(index),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (desktop)
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        '${model.allPlaylists ? 'All playlists' : model.account?.name ?? 'No playlist'}\n${model.syncing
                                            ? 'Refreshing…'
                                            : model.syncMessage != null
                                            ? 'Refresh failed • cached library'
                                            : 'Local library ready'}',
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          Expanded(child: body),
                        ],
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: rail || nav == 'top'
                    ? null
                    : NavigationBar(
                        selectedIndex: switch (_selected) {
                          0 => 0,
                          1 => 1,
                          3 => 2,
                          4 => 3,
                          _ => 4,
                        },
                        onDestinationSelected: (index) async {
                          if (index < 4) {
                            _select([0, 1, 3, 4][index]);
                            return;
                          }
                          final chosen = await showModalBottomSheet<int>(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => SafeArea(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    for (final i in visibleIndices.where((i) => ![0, 1, 3, 4].contains(i)))
                                      ListTile(
                                        leading: Icon(destinations[i].$2),
                                        title: Text(destinations[i].$1),
                                        onTap: () => Navigator.pop(context, i),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          );
                          if (chosen != null && mounted) _select(chosen);
                        },
                        destinations: const [
                          NavigationDestination(
                            icon: Icon(Icons.home_outlined),
                            label: 'Home',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.live_tv),
                            label: 'Live TV',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.movie_outlined),
                            label: 'Movies',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.video_library_outlined),
                            label: 'Series',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.more_horiz),
                            label: 'More',
                          ),
                        ],
                      ),
              ),
              if (_tourActive)
                Positioned.fill(
                  child: GuidedTourOverlay(
                    key: ValueKey('main-tour-$_tourIndex'),
                    brand: 'BattleStation TV',
                    steps: _tourSteps,
                    index: _tourIndex,
                    onNext: () => _moveTour(_tourIndex + 1),
                    onBack: () => _moveTour(_tourIndex - 1),
                    onSkip: _closeTour,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
