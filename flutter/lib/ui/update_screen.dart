import 'update_schedule_settings.dart';
import 'tv.dart';
import 'bstv_release_notes.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:iptvmac/app/library_model.dart';
import 'package:iptvmac/app/update_manager.dart';
import 'package:iptvmac/bstv/identity.dart';

void openUpdates(BuildContext context) =>
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (_) => const UpdateScreen()));

class ReleaseUpdateBanner extends StatelessWidget {
  const ReleaseUpdateBanner({super.key});
  @override
  Widget build(BuildContext context) {
    final manager = context.watch<LibraryModel>().updater;
    if (!manager.showNotification) return const SizedBox.shrink();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => manager.markNotificationShown(),
    );
    final release = manager.release!;
    return Material(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 12,
          children: [
            Image.asset('assets/icon/icon.png', width: 32, height: 32),
            Text(
              '${BstvIdentity.name}: ${release.version.semantic} · Build ${release.version.build} available',
            ),
            FilledButton(
              onPressed: () => openUpdates(context),
              child: const Text('Update Now'),
            ),
            TextButton(
              onPressed: () => openUpdates(context),
              child: const Text('View Release Notes'),
            ),
            TextButton(
              onPressed: manager.remindLater,
              child: const Text('Remind Me Later'),
            ),
            TextButton(
              onPressed: manager.skip,
              child: const Text('Skip This Version'),
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});
  String size(int value) => '${(value / (1024 * 1024)).toStringAsFixed(1)} MB';
  @override
  Widget build(BuildContext context) {
    final m = context.read<LibraryModel>().updater;
    return AnimatedBuilder(
      animation: m,
      builder: (context, _) {
        final r = m.release, metrics = m.metrics;
        return TvFrame(
          child: Scaffold(
            appBar: AppBar(title: const Text('About & Updates')),
            body: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 820),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icon/icon.png',
                          height: 60,
                          width: 60,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            BstvIdentity.name,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Installed: ${m.installed?.semantic ?? 'Unknown'} · Build ${m.installed?.build ?? 'Unknown'} · ${m.platform}',
                    ),
                    const Text('Current release: Automatic Update System'),
                    Text(
                      'Last successful check: ${m.lastSuccess?.toLocal().toString() ?? 'Not checked this session'}',
                    ),
                    const SizedBox(height: 8),
                    Text(m.status, key: const Key('update-status')),
                    Wrap(
                      spacing: 12,
                      children: [
                        FilledButton(
                          onPressed: m.busy
                              ? null
                              : () => m.check(manual: true),
                          autofocus: true,
                          child: const Text('Check for Updates'),
                        ),
                        TextButton(
                          onPressed: () => launchUrl(
                            m.client.identity.releases,
                            mode: LaunchMode.externalApplication,
                          ),
                          child: const Text('View GitHub Releases'),
                        ),
                        TextButton(
                          onPressed: () => showDialog<void>(
                            context: context,
                            builder: (dialog) => AlertDialog(
                              title: const Text('Changelog'),
                              content: SingleChildScrollView(
                                child: SelectableText(
                                  r?.notes ??
                                      bstvReleaseNotesFor(
                                        m.installed?.core ?? '2.5.0',
                                      ).changes.join('\n'),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(dialog),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          ),
                          child: const Text('View Changelog'),
                        ),
                      ],
                    ),
                    if (r != null) ...[
                      const Divider(),
                      Text(
                        '${r.version.semantic} · Build ${r.version.build}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(r.name),
                      Text(
                        'Published ${r.published.toLocal()} · ${size(r.package.size)}${r.beta ? ' · Beta/prerelease' : ''}',
                      ),
                      const SizedBox(height: 8),
                      SelectableText(
                        r.notes.isEmpty
                            ? 'No release notes were provided.'
                            : r.notes,
                      ),
                      if (m.newer)
                        Wrap(
                          spacing: 12,
                          children: [
                            OutlinedButton(
                              onPressed: m.busy ? null : m.download,
                              child: Text(
                                m.phase == UpdatePhase.failed
                                    ? 'Retry Download'
                                    : 'Download Only',
                              ),
                            ),
                            FilledButton(
                              onPressed: m.busy
                                  ? null
                                  : () async {
                                      final approval = await showDialog<bool>(
                                        context: context,
                                        builder: (dialog) => AlertDialog(
                                          title: Text(
                                            'Update ${BstvIdentity.name}?',
                                          ),
                                          content: const Text(
                                            'The correct package will be downloaded and its SHA256 verified. Installation requires normal Windows/Android approval. Playback will stop and progress will be saved; active recordings will finish closing and downloads will pause. Windows packages may be unsigned: a checksum proves integrity, not publisher identity. Your accounts and settings are preserved. Android may require choosing Open after installation.',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(dialog, false),
                                              child: const Text('Cancel'),
                                            ),
                                            FilledButton(
                                              onPressed: () =>
                                                  Navigator.pop(dialog, true),
                                              child: const Text(
                                                'Approve Update',
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                      if (approval == true) {
                                        await m.install(approved: true);
                                      }
                                    },
                              child: Text(
                                m.phase == UpdatePhase.ready
                                    ? 'Install Verified Update'
                                    : 'Update Now',
                              ),
                            ),
                            TextButton(
                              onPressed: m.remindLater,
                              child: const Text('Remind Me Later'),
                            ),
                            TextButton(
                              onPressed: m.skip,
                              child: const Text('Skip This Version'),
                            ),
                          ],
                        ),
                    ],
                    if (m.phase == UpdatePhase.downloading) ...[
                      LinearProgressIndicator(value: metrics?.fraction),
                      Text(
                        metrics == null
                            ? 'Preparing download…'
                            : '${(metrics.fraction * 100).toStringAsFixed(1)}% · ${size(metrics.bytes)} / ${size(metrics.total)} · ${size(metrics.bytesPerSecond.round())}/s · ETA ${metrics.remaining?.inSeconds ?? 0}s',
                      ),
                      TextButton(
                        onPressed: m.cancel,
                        child: const Text('Cancel Download'),
                      ),
                    ],
                    const Divider(),
                    SwitchListTile(
                      title: const Text('Check automatically'),
                      subtitle: const Text(
                        'Check at startup (Recommended). Disabling automatic checks may cause important updates to be missed.',
                      ),
                      value: m.automatic,
                      onChanged: (v) => m.preference('automatic', v),
                    ),
                    SwitchListTile(
                      title: const Text('Scheduled update checks'),
                      subtitle: const Text(
                        'Optional periodic checks while the application is running. Disabled by default.',
                      ),
                      value: m.scheduled,
                      onChanged: (v) => m.preference('scheduled', v),
                    ),
                    SwitchListTile(
                      title: const Text('Update notifications'),
                      subtitle: Text(
                        m.notifications ? 'Recommended' : 'Not recommended: important update notifications may be missed.',
                      ),
                      value: m.notifications,
                      onChanged: (v) => m.preference('notifications', v),
                    ),
                    if (m.platform == 'windows')
                      SwitchListTile(
                        title: const Text(
                          'Reopen after a successful Windows update',
                        ),
                        value: m.restart,
                        onChanged: (v) => m.preference('restart', v),
                      ),
                    if (m.scheduled && m.scheduleMode == 'interval')
                      ListTile(
                        title: const Text('Check frequency'),
                        trailing: DropdownButton<int>(
                          value: m.frequency,
                          items: [
                            for (final h in List<int>.generate(
                              24,
                              (i) => i + 1,
                            ))
                              DropdownMenuItem(
                                value: h,
                                child: Text('$h hours'),
                              ),
                          ],
                          onChanged: (v) {
                            if (v != null) m.preference('hours', v);
                          },
                        ),
                      ),
                    UpdateScheduleSettings(manager: m),
                    SwitchListTile(
                      title: const Text('Include beta/prerelease updates'),
                      subtitle: const Text(
                        'Prereleases can contain unfinished changes.',
                      ),
                      value: m.beta,
                      onChanged: (v) => m.preference('beta', v),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Checks use public GitHub release metadata without an access token or IPTV account details. An empty release repository does not affect playback. No 2.6.0 mobile/orientation changes are included.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
