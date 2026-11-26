// Shared safe multi-screen preset preview, 2026. GPLv3.
import 'package:flutter/material.dart';

import 'interface_presets.dart';
import 'dashboard_model.dart';
import 'preset_preview.dart';
import 'identity.dart';

class PresetScreenPreview extends StatefulWidget {
  const PresetScreenPreview({
    super.key,
    required this.preset,
    required this.onApply,
  });
  final BstvInterfacePreset preset;
  final VoidCallback onApply;
  @override
  State<PresetScreenPreview> createState() => _PresetScreenPreviewState();
}

class _PresetScreenPreviewState extends State<PresetScreenPreview> {
  String device = 'Desktop';
  @override
  Widget build(BuildContext context) {
    final layout = widget.preset.buildTheme().interface;
    final variant = device == 'Phone'
        ? DashboardDevice.phone
        : device == 'Tablet'
        ? DashboardDevice.tablet
        : DashboardDevice.desktop;
    return Theme(
      data: layout.apply(
        ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(widget.preset.accent),
            brightness: Brightness.dark,
          ),
        ),
      ),
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text('${BstvIdentity.name} • ${widget.preset.name}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close preview'),
              ),
            ],
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Home'),
                Tab(text: 'Movies'),
                Tab(text: 'Series'),
                Tab(text: 'Live TV'),
                Tab(text: 'TV Guide'),
              ],
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Wrap(
                  spacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: device,
                      items: [
                        for (final name in [
                          'Desktop',
                          'Phone',
                          'Tablet',
                          'Android TV / Google TV',
                        ])
                          DropdownMenuItem(value: name, child: Text(name)),
                      ],
                      onChanged: (v) => setState(() => device = v!),
                    ),
                    const Text(
                      'Fictional sample content. Preview does not write preferences.',
                    ),
                    FilledButton(
                      onPressed: widget.onApply,
                      child: const Text('Apply Preset'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: device == 'Phone'
                          ? 400
                          : device == 'Tablet'
                          ? 800
                          : 1200,
                    ),
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: BstvPresetMiniature(
                            preset: widget.preset,
                            device: variant,
                            expanded: true,
                          ),
                        ),
                        _sample('Movies', layout.movies, layout.navigation),
                        _sample('Series', layout.series, layout.navigation),
                        _sample('Live TV', layout.live, layout.navigation),
                        ListView(
                          children: [
                            const ListTile(
                              title: Text('Traditional program timeline'),
                              subtitle: Text(
                                'Actual provider programs are available in the live guide; these are sample labels.',
                              ),
                            ),
                            for (var i = 0; i < 8; i++)
                              Row(
                                children: [
                                  SizedBox(
                                    width: 110,
                                    child: Text('Sample channel ${i + 1}'),
                                  ),
                                  for (var j = 0; j < 3; j++)
                                    Expanded(
                                      child: Card(
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                            layout.spacing,
                                          ),
                                          child: Text(
                                            'Sample program ${j + 1}',
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                          ],
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
    );
  }

  Widget _sample(String screen, String mode, String nav) {
    final content = mode == 'list'
        ? ListView(
            children: [
              for (var i = 0; i < 12; i++)
                ListTile(
                  leading: Icon(
                    screen == 'Live TV' ? Icons.live_tv : Icons.movie,
                  ),
                  title: Text('Sample $screen ${i + 1}'),
                ),
            ],
          )
        : mode == 'carousel'
        ? ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var i = 0; i < 12; i++)
                SizedBox(
                  width: 180,
                  child: Card(
                    child: Center(child: Text('Sample $screen ${i + 1}')),
                  ),
                ),
            ],
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: screen == 'Live TV' ? 420 : 180,
              mainAxisExtent: screen == 'Live TV' ? 100 : 250,
            ),
            itemCount: 12,
            itemBuilder: (_, i) =>
                Card(child: Center(child: Text('Sample $screen ${i + 1}'))),
          );
    return Column(
      children: [
        Text('$screen • $mode • $nav navigation'),
        Expanded(child: content),
      ],
    );
  }
}
