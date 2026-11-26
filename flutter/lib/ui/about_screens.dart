import 'package:iptvmac/app/device.dart';

import 'update_screen.dart';

// Modified for BattleStation TV, 2026-11-22. See BSTV-NOTICE.md.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iptvmac/ui/theme.dart';
import 'package:iptvmac/l10n/app_localizations.dart';
import 'package:iptvmac/ui/onboarding.dart';
import 'package:iptvmac/ui/tv.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:iptvmac/core/android_update.dart'
    show bstvGithubRepo, bstvUpdatesConfigured;
import 'package:iptvmac/ui/bstv_release_notes.dart';
import 'package:iptvmac/bstv/unlockables.dart';

// The upstream repository is linked only as an attribution/license resource.
const upstreamSourceUrl = 'https://github.com/Goelir/IPTVMac';

Future<void> _open(String url) async {
  try {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } catch (_) {} // a TV may have no browser to open it with
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final t = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return TvFrame(
      child: Scaffold(
        appBar: AppBar(title: Text(l.settingsAbout)),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: ListView(
              scrollCacheExtent: tvCache(12000),
              padding: const EdgeInsets.all(16),
              children: [
                ListTile(
                  leading: const Icon(Icons.update_outlined),
                  autofocus: isTelevision,
                  title: const Text('Check for Updates'),
                  subtitle: Text(
                    bstvUpdatesConfigured
                        ? 'Updates are optional. Checking never blocks playback.'
                        : 'Not configured yet: build with BSTV_GITHUB_REPO=owner/repository.',
                  ),
                  onTap: () => openUpdates(context),
                ),

                const SizedBox(height: 12),
                const Center(
                  child: SecretTapTarget(
                    id: 'logo',
                    count: 7,
                    child: LogoTile(size: 84),
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: SecretTapTarget(
                    id: 'popcorn',
                    count: 5,
                    child: Text(
                      l.appName,
                      style: t.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Center(
                  child: FutureBuilder<PackageInfo>(
                    future: PackageInfo.fromPlatform(),
                    builder: (_, s) => SecretTapTarget(
                      id: 'sequence',
                      count: 5,
                      child: Text(
                        s.hasData
                            ? '${l.aboutVersion} ${s.data!.version} (${s.data!.buildNumber})'
                            : l.aboutVersion,
                        style: t.bodyMedium?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const SizedBox.shrink();
                    final version = snapshot.data!.version;
                    final release = bstvReleaseNotesFor(version);
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Brand.radiusCard),
                      ),
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        leading: const Icon(Icons.auto_awesome_outlined),
                        title: Text(release.name),
                        subtitle: Text('Version $version • What’s new'),
                        children: [
                          if (release.changes.isEmpty)
                            const Padding(
                              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Release notes have not been published for this version.',
                                ),
                              ),
                            )
                          else
                            ...release.changes.map(
                              (change) => ListTile(
                                dense: true,
                                leading: const Icon(
                                  Icons.check_circle_outline,
                                  size: 18,
                                ),
                                title: Text(change),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Brand.radiusCard),
                  ),
                  child: ExpansionTile(
                    leading: const Icon(Icons.history_outlined),
                    title: const Text('Release history and changelog'),
                    subtitle: const Text('Named versions and their changes'),
                    children: [
                      ...bstvPublishedReleaseNotes.map(
                        (release) => ExpansionTile(
                          title: Text('${release.version} — ${release.name}'),
                          children: release.changes
                              .map(
                                (change) => ListTile(
                                  dense: true,
                                  leading: const Icon(
                                    Icons.arrow_right,
                                    size: 18,
                                  ),
                                  title: Text(change),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Card(
                  child: ExpansionTile(
                    leading: Icon(Icons.lightbulb_outline),
                    title: Text('Planned update names'),
                    subtitle: Text('Examples only — not released'),
                    children: [
                      ListTile(
                        title: Text('Appearance Update'),
                        subtitle: Text(
                          'Themes, interface presets and visual customization',
                        ),
                      ),
                      ListTile(
                        title: Text('Discovery Update'),
                        subtitle: Text(
                          'Recommendation widgets and movie/series browsing',
                        ),
                      ),
                      ListTile(
                        title: Text('Connected Update'),
                        subtitle: Text(
                          'Optional account and settings synchronization',
                        ),
                      ),
                      ListTile(
                        title: Text('Living Room Update'),
                        subtitle: Text(
                          'Google TV and Android TV remote-friendly layouts',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'BattleStation TV — independently modified IPTV player. Based on open-source IPTVMac (Goelir and contributors), with modifications in 2026. The original project does not endorse or maintain this version.',
                ),
                const SizedBox(height: 12),
                Text(
                  l.onbNoChannels,
                  style: t.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                ),
                const SizedBox(height: 12),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Brand.radiusCard),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.gavel_outlined),
                        title: const Text('Legal notice'),
                        subtitle: const Text(
                          'Independent media player; no content or subscriptions supplied',
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) => const _BstvNoticeScreen(
                              title: 'Legal notice',
                              body: 'BattleStation TV is an independent media player. It does not provide, sell, host, or endorse IPTV subscriptions, streams, movies, or television channels. Users supply their own sources and must be authorized to access them. Third-party services and marks are not affiliated with BattleStation TV.\n\nThis program is a modified version of IPTVMac, developed by Goelir and contributors. Changes made for BattleStation TV in 2026. Applicable IPTVMac-derived software is licensed under GNU GPL version 3. You may copy, redistribute, and modify covered software under the terms of that license. There is NO WARRANTY, to the extent permitted by law. The full GPL and third-party notices appear in Open-source licenses & credits.\n\nWhen distributing BattleStation TV builds, the complete corresponding source code for the GPL-covered program, including modifications and build scripts, must also be made available using a GPLv3-compliant method. This notice alone does not satisfy all source-distribution obligations.',
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.privacy_tip_outlined),
                        title: const Text('Privacy & local data'),
                        subtitle: const Text(
                          'Cloud sync is off; no BattleStation TV account is required',
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) => const _BstvNoticeScreen(
                              title: 'Privacy & local data',
                              body: 'BattleStation TV is designed without advertising analytics or developer-operated user tracking. IPTV account credentials and source URLs are stored on your device, not sent to a BattleStation TV cloud account.\n\nWhen you connect to an IPTV provider, artwork or metadata server, or check GitHub for updates, those third-party services receive the network requests required to provide their services. Optional Firebase Cloud Sync requires a separate account and privacy acknowledgement. Theme uploads are manual and exclude IPTV credentials, provider URLs, favorites and viewing history. This is a product design statement, not an independent audit of all third-party dependencies.',
                            ),
                          ),
                        ),
                      ),
                      // BattleStation TV links belong to this project, not the upstream author.
                      ListTile(
                        leading: const Icon(Icons.code_outlined),
                        title: const Text('BattleStation TV source code'),
                        subtitle: Text(
                          bstvUpdatesConfigured
                              ? 'View the source for this modified version'
                              : 'Repository not configured yet; source must be supplied when distributing builds',
                        ),
                        trailing: bstvUpdatesConfigured
                            ? const Icon(Icons.open_in_new, size: 18)
                            : null,
                        onTap: bstvUpdatesConfigured
                            ? () => _open('https://github.com/$bstvGithubRepo')
                            : null,
                      ),
                      ListTile(
                        key: const Key('acks-tile'),
                        leading: const Icon(Icons.menu_book_outlined),
                        title: const Text('Open-source licenses & credits'),
                        subtitle: const SecretTapTarget(
                          id: 'credits',
                          count: 5,
                          child: Text(
                            'GPLv3, original IPTVMac credit, and third-party notices',
                          ),
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          tvExpectEntry();
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => const AcknowledgementsScreen(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.account_tree_outlined),
                        title: const Text('Original IPTVMac project'),
                        subtitle: const Text(
                          'Goelir and contributors — upstream attribution only',
                        ),
                        trailing: const Icon(Icons.open_in_new, size: 18),
                        onTap: () => _open(upstreamSourceUrl),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The notices and licence texts (about 100 KB): a lazily built list of lines, not one giant text.
class AcknowledgementsScreen extends StatefulWidget {
  const AcknowledgementsScreen({super.key});
  @override
  State<AcknowledgementsScreen> createState() => _AcknowledgementsScreenState();
}

class _AcknowledgementsScreenState extends State<AcknowledgementsScreen> {
  final _scroll = ScrollController();

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TvFrame(
      child: Scaffold(
        appBar: AppBar(title: const Text('Open-source licenses & credits')),
        body: FutureBuilder<String>(
          future: rootBundle.loadString('assets/Acknowledgements.md'),
          builder: (context, s) {
            if (!s.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final lines = s.data!.split('\n');
            final style = Theme.of(context).textTheme.bodySmall
                ?.copyWith(fontFamily: 'monospace');
            return TvScrollKeys(
              controller: _scroll,
              child: SelectionArea(
                child: ListView.builder(
                  controller: _scroll,
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
                  itemCount: lines.length,
                  itemBuilder: (_, i) => Text(lines[i], style: style),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _BstvNoticeScreen extends StatelessWidget {
  const _BstvNoticeScreen({required this.title, required this.body});
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: ListView(
          scrollCacheExtent: tvCache(12000),
          padding: const EdgeInsets.all(24),
          children: [
            SelectableText(body, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    ),
  );
}
