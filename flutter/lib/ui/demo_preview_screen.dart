import 'package:iptvmac/bstv/guided_tour.dart';
// BattleStation TV - Offline Demo Preview.
// Fictional metadata only. Does not create an account, stream, load URLs,
// edit preferences, request permissions, or connect to the internet.
import 'package:flutter/material.dart';

@immutable
class _DemoTitle {
  const _DemoTitle(this.name, this.subtitle, this.icon, this.tint);
  final String name;
  final String subtitle;
  final IconData icon;
  final Color tint;
}

const _movies = <_DemoTitle>[
  _DemoTitle('Midnight Circuit', '2026  •  Action  •  1h 48m', Icons.directions_car_filled, Color(0xFF4052A4)),
  _DemoTitle('The Last Signal', '2025  •  Sci-Fi  •  2h 06m', Icons.satellite_alt, Color(0xFF356B75)),
  _DemoTitle('Harbor Lights', '2024  •  Drama  •  1h 52m', Icons.sailing, Color(0xFF864A5B)),
  _DemoTitle('The Hidden Trail', '2026  •  Mystery  •  1h 39m', Icons.forest, Color(0xFF456B43)),
  _DemoTitle('Neon Horizon', '2023  •  Adventure  •  2h 01m', Icons.landscape, Color(0xFF805095)),
  _DemoTitle('Sunday Detour', '2025  •  Comedy  •  1h 33m', Icons.sunny, Color(0xFF986A34)),
];

const _series = <_DemoTitle>[
  _DemoTitle('Northbound', '3 seasons  •  Adventure', Icons.terrain, Color(0xFF496C75)),
  _DemoTitle('The Archive', '2 seasons  •  Mystery', Icons.auto_stories, Color(0xFF755187)),
  _DemoTitle('City After Dark', '1 season  •  Crime', Icons.location_city, Color(0xFF3D518A)),
  _DemoTitle('Wild Frontier', '4 seasons  •  Documentary', Icons.pets, Color(0xFF426E57)),
  _DemoTitle('Second Sunrise', '2 seasons  •  Drama', Icons.wb_twilight, Color(0xFF9A6847)),
];

const _channels = <_DemoTitle>[
  _DemoTitle('Demo News 24', 'Now: The Morning Report', Icons.newspaper, Color(0xFF425E9C)),
  _DemoTitle('Demo Cinema', 'Now: Movie Showcase', Icons.movie_creation, Color(0xFF73518D)),
  _DemoTitle('Demo Sports', 'Now: Classic Highlights', Icons.sports_basketball, Color(0xFF427B60)),
  _DemoTitle('Demo Nature', 'Now: Ocean Discoveries', Icons.landscape, Color(0xFF4C7795)),
  _DemoTitle('Demo Classics', 'Now: Vintage Television', Icons.tv, Color(0xFF945B42)),
];

/// A deliberately non-interactive sample library to explore without a provider.
/// No real content, playback, external artwork, tracking or network access.
class DemoPreviewScreen extends StatefulWidget {
  const DemoPreviewScreen({super.key});

  @override
  State<DemoPreviewScreen> createState() => _DemoPreviewScreenState();
}

class _DemoPreviewScreenState extends State<DemoPreviewScreen> {
  int _tab = 0;
  bool _tourActive = false;
  int _tourIndex = 0;
  late final _steps = <TourStep>[
    TourStep(title: 'Demo Home', description: 'This is a sample dashboard with fictional recommendations, featured movies and series. Nothing here connects to a provider.', target: TourAnchors.demoHero, page: 0),
    TourStep(title: 'Live TV Preview', description: 'These example channels demonstrate how Live TV can be organized. They have no working streams.', target: TourAnchors.demoTabs[1], page: 1),
    TourStep(title: 'Movies Preview', description: 'Explore sample poster cards; no movie can be played in Demo Mode.', target: TourAnchors.demoTabs[2], page: 2),
    TourStep(title: 'Series Preview', description: 'Series here are fictional too. Connect your own provider to see real content.', target: TourAnchors.demoTabs[3], page: 3),
    const TourStep(title: 'Customize your player', description: 'In the full app, open Customize to explore Interface Presets, Appearance, Accent Color, Dashboard Widgets and Share & Restore.'),
    const TourStep(title: 'Ready to explore', description: 'Exit Demo whenever you want to add your own IPTV provider. You can skip this entire tour at any point.'),
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _offerTour());
  }
  Future<void> _offerTour() async {
    if (!await TourService.shouldOffer('demo') || !mounted) return;
    final go = await showDialog<bool>(context: context, builder: (d) => AlertDialog(
      title: const Text('Explore Demo Mode?'),
      content: const Text('A short interactive walkthrough will point to the demo features. Nothing in Demo Mode is playable.'),
      actions: [
        TextButton(key: const Key('demo-tour-offer-skip'), onPressed: () => Navigator.pop(d, false), child: const Text('Skip Tutorial')),
        FilledButton(key: const Key('demo-tour-offer-start'), onPressed: () => Navigator.pop(d, true), child: const Text('Start Tour')),
      ],
    ));
    if (!mounted) return;
    if (go == true) {
      _moveTour(0);
    } else {
      await TourService.remember('demo');
    }
  }
  void _moveTour(int index) {
    if (index >= _steps.length) { _endTour(); return; }
    setState(() { _tourActive = true; _tourIndex = index; _tab = _steps[index].page ?? _tab; });
  }
  Future<void> _endTour() async {
    if (!mounted) return;
    setState(() => _tourActive = false);
    await TourService.remember('demo');
  }

  static const _tabs = <(String, IconData)>[
    ('Home', Icons.home_outlined),
    ('Live TV', Icons.live_tv_outlined),
    ('Movies', Icons.movie_outlined),
    ('Series', Icons.video_library_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Stack(children: [Scaffold(
      appBar: AppBar(
        title: const Text('BattleStation TV · Demo'),
        actions: [
          TextButton.icon(
            key: const Key('leave-demo-mode'),
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.exit_to_app),
            label: const Text('Exit Demo'),
          ),
        ],
      ),
      body: Column(children: [
        MaterialBanner(
          leading: const Icon(Icons.science_outlined),
          backgroundColor: scheme.primaryContainer.withValues(alpha: 0.35),
          content: const Text('DEMO MODE — Everything shown is fictional. No IPTV account is connected, and playback is disabled.'),
          actions: const [SizedBox.shrink()],
        ),
        Expanded(child: LayoutBuilder(builder: (context, size) {
          final wide = size.maxWidth >= 700;
          return Row(children: [
            if (wide)
              NavigationRail(
                extended: size.maxWidth >= 1050,
                selectedIndex: _tab,
                onDestinationSelected: (value) => setState(() => _tab = value),
                destinations: [for (final item in _tabs)
                  NavigationRailDestination(icon: Icon(item.$2, key: TourAnchors.demoTabs[_tabs.indexOf(item)]), label: Text(item.$1))],
              ),
            Expanded(child: ListView(
              key: ValueKey('demo-tab-$_tab'),
              padding: const EdgeInsets.all(16),
              children: switch (_tab) {
                0 => [
                    KeyedSubtree(key: TourAnchors.demoHero, child: _DemoHero(item: _movies.first)),
                    const SizedBox(height: 18),
                    _DemoShelf(title: 'Recommended Movies', entries: _movies.take(5).toList()),
                    _DemoShelf(title: 'Recently Added Movies', entries: _movies.reversed.take(5).toList()),
                    _DemoShelf(title: 'Featured Series', entries: _series.take(5).toList()),
                    _DemoShelf(title: 'Random Picks', entries: [_movies[4], _series[2], _movies[1], _series[3]]),
                    _DemoShelf(title: 'Live TV Preview', entries: _channels.take(4).toList()),
                  ],
                1 => [
                    _DemoHeading('Live TV', 'Sample guide channels. Playback disabled.'),
                    for (final item in _channels) _DemoChannelRow(item: item),
                  ],
                2 => [
                    _DemoHeading('Movies', 'Sample movie collection. No videos included.'),
                    _DemoGrid(entries: _movies),
                  ],
                _ => [
                    _DemoHeading('Series', 'Sample TV series collection. No episodes included.'),
                    _DemoGrid(entries: _series),
                  ],
              },
            )),
          ]);
        })),
        if (MediaQuery.sizeOf(context).width < 700)
          NavigationBar(
            selectedIndex: _tab,
            onDestinationSelected: (value) => setState(() => _tab = value),
            destinations: [for (final item in _tabs) NavigationDestination(icon: Icon(item.$2, key: TourAnchors.demoTabs[_tabs.indexOf(item)]), label: item.$1)],
          ),
      ]),
    ),
    if (_tourActive) Positioned.fill(child: GuidedTourOverlay(
      key: ValueKey('demo-tour-$_tourIndex'), brand: 'BattleStation TV',
      steps: _steps, index: _tourIndex,
      onNext: () => _moveTour(_tourIndex + 1),
      onBack: () => _moveTour(_tourIndex - 1),
      onSkip: _endTour,
    )),
    ]);
  }
}

class _DemoHeading extends StatelessWidget {
  const _DemoHeading(this.title, this.note);
  final String title;
  final String note;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: Theme.of(context).textTheme.headlineSmall),
      const SizedBox(height: 4),
      Text(note, style: Theme.of(context).textTheme.bodySmall),
    ]),
  );
}

class _DemoHero extends StatelessWidget {
  const _DemoHero({required this.item});
  final _DemoTitle item;
  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(minHeight: 200),
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [item.tint, const Color(0xFF171321)]),
      borderRadius: BorderRadius.circular(18),
    ),
    padding: const EdgeInsets.all(22),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('FEATURED MOVIE · SAMPLE', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600)),
      const SizedBox(height: 8),
      Text(item.name, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      const SizedBox(height: 7),
      Text(item.subtitle, style: const TextStyle(color: Colors.white70)),
      const SizedBox(height: 14),
      FilledButton.icon(onPressed: null, icon: const Icon(Icons.play_arrow), label: const Text('Playback Unavailable in Demo')),
    ]),
  );
}

class _DemoShelf extends StatelessWidget {
  const _DemoShelf({required this.title, required this.entries});
  final String title;
  final List<_DemoTitle> entries;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: const EdgeInsets.only(bottom: 10), child: Text(title, style: Theme.of(context).textTheme.titleLarge)),
      SizedBox(height: 168, child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: entries.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (_, index) => SizedBox(width: 128, child: _DemoCard(item: entries[index])),
      )),
    ]),
  );
}

class _DemoGrid extends StatelessWidget {
  const _DemoGrid({required this.entries});
  final List<_DemoTitle> entries;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, box) => GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: entries.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (box.maxWidth / 170).floor().clamp(2, 6),
        childAspectRatio: 0.80,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (_, index) => _DemoCard(item: entries[index]),
    ),
  );
}

class _DemoCard extends StatelessWidget {
  const _DemoCard({required this.item});
  final _DemoTitle item;
  @override
  Widget build(BuildContext context) => Semantics(
    label: '${item.name}, sample only, unavailable for playback',
    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [item.tint, const Color(0xFF25202D)]),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(children: [
          Center(child: Icon(item.icon, size: 40, color: Colors.white70)),
          const Positioned(top: 7, right: 7, child: Icon(Icons.lock_outline, size: 16, color: Colors.white70)),
        ]),
      )),
      const SizedBox(height: 6),
      Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelLarge),
      Text(item.subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelSmall),
    ]),
  );
}

class _DemoChannelRow extends StatelessWidget {
  const _DemoChannelRow({required this.item});
  final _DemoTitle item;
  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: Icon(item.icon, color: item.tint),
      title: Text(item.name),
      subtitle: Text(item.subtitle),
      trailing: const Icon(Icons.lock_outline),
    ),
  );
}
