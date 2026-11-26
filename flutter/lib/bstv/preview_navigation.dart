// Shared navigation destinations for the main shell and in-player EPG preview.
// The preview is a separate Navigator route; requests go to the existing shell.
import 'package:flutter/material.dart';

class PreviewDestinationNotifier extends ValueNotifier<int?> {
  PreviewDestinationNotifier() : super(null);
  void request(int destination) {
    if (value == destination) {
      notifyListeners();
    } else {
      value = destination;
    }
  }
}

class BstvPreviewNavigation {
  static const destinations = <(String, IconData)>[
    ('Home', Icons.home_outlined),
    ('Live TV', Icons.live_tv),
    ('TV Guide', Icons.grid_view),
    ('Movies', Icons.movie_outlined),
    ('Series', Icons.video_library_outlined),
    ('Downloads', Icons.download_outlined),
    ('DVR', Icons.radio_button_checked),
    ('Favorites', Icons.favorite_outline),
    ('Customize', Icons.dashboard_customize_outlined),
    ('Settings', Icons.settings_outlined),
    ('Cloud Sync', Icons.cloud_sync_outlined),
  ];

  static final PreviewDestinationNotifier requestedDestination =
      PreviewDestinationNotifier();

  static void navigate(int destination) {
    if (destination < 0 || destination >= destinations.length) return;
    requestedDestination.request(destination);
  }
}

/// Uses the same destination labels, icons and ListTile presentation as the
/// primary shell. Never creates a second dropdown or independent page stack.
class BstvPreviewSidebar extends StatelessWidget {
  const BstvPreviewSidebar({
    super.key,
    required this.onNavigate,
    this.compact = false,
  });
  final ValueChanged<int> onNavigate;
  final bool compact;

  @override
  Widget build(BuildContext context) => Material(
    color: Theme.of(context).colorScheme.surface,
    child: SizedBox(
      width: compact ? 94 : 220,
      child: SafeArea(
        child: ListView(
          children: [
            for (final (index, destination)
                in BstvPreviewNavigation.destinations.indexed)
              ListTile(
                key: ValueKey('preview-nav-$index'),
                leading: Icon(destination.$2),
                title: compact ? null : Text(destination.$1),
                subtitle: compact ? Text(destination.$1, maxLines: 2) : null,
                selected: index == 2,
                onTap: () => onNavigate(index),
              ),
          ],
        ),
      ),
    ),
  );
}
