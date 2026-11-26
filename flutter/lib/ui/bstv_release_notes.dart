/// BattleStation TV release notes displayed in Settings > About.
/// Keep [pubspec.yaml] version and these entries in sync.
/// Entries describe locally prepared builds, NOT necessarily published releases.
class BstvReleaseNotes {
  const BstvReleaseNotes({
    required this.version,
    required this.name,
    required this.changes,
  });

  final String version;
  final String name;
  final List<String> changes;
}

const List<BstvReleaseNotes> bstvPublishedReleaseNotes = [
  BstvReleaseNotes(version:'2.5.0',name:'Automatic Update System',changes:[
    'Added public GitHub release discovery with independent application and platform assets.',
    'Added version/build comparisons, stable/beta choices and persisted update preferences.',
    'Added SHA256-verified downloads, progress, cancellation and user-approved installation handoff.',
    'Preserved optional Firebase REST cloud backups and existing appearance/navigation.',
    'Mobile dashboard and playback-orientation work remains deferred to 2.6.0.',
  ]),
  BstvReleaseNotes(
    version: '2.3.0',
    name: 'Secret Unlockables & Appearance',
    changes: [
      'Added an Unlockables tab in Customization Studio with locally saved rewards.',
      'Added matching mouse, touch and TV-remote Easter egg activation methods.',
      'Added exclusive BattleStation TV appearance rewards and a master reward.',
      'Appearance rewards preserve your dashboard layout and account settings.',
      'Optional Firebase cloud synchronization remains deferred.',
    ],
  ),
  BstvReleaseNotes(
    version: '2.2.1',
    name: 'Live TV Playback Stability & Navigation Customization',
    changes: [
      'Live TV failures stay inside the player instead of automatically switching to the Guide.',
      'Failed channels show Retry, Previous, Next, and playback diagnostics.',
      'Desktop Left/Right arrows switch live channels without exiting the player.',
      'Removed duplicate Cloud Sync link from Settings; sidebar entry remains.',
      'Added left/right/top/bottom navigation choices, sidebar size, icon/text display, and item visibility and ordering.',
      'BattleStation TV retains its standalone TV Guide and optional manual in-player EPG.',
    ],
  ),
  BstvReleaseNotes(
    version: '2.2.0',
    name: 'Live TV & Window Control Update',
    changes: [
      'Added Record / Schedule shortcuts in Live TV channel actions and player controls.',
      'Added a Windows-only Startup Window Size selector with monitor-aware size limits.',
      'Added optional center-on-open and remember-last-window-size settings.',
      'Expanded safe EPG date and mapping diagnostics for troubleshooting missing listings.',
      'Preserved Firebase privacy acknowledgement and independent app settings.',
      'BattleStation TV retains its TV Guide navigation entry.',
      'Prepared a secure-update configuration approach; private authenticated downloads require an authorized distribution endpoint.',
    ],
  ),

  BstvReleaseNotes(
    version: '0.2.0',
    name: 'Customization Studio Preview',
    changes: [
      'Development/testing build for Android and Windows; not a published stable release.',
      'Organized customization into five collapsible sections: Interface Presets, Appearance, Accent Color, Dashboard Widgets, and Share & Restore.',
      'Added an interface preset selector with a sample dashboard layout preview and a separate Apply action.',
      'Added Phone, Tablet, and Desktop layout preview selections.',
      'Added a fictional-content Demo Mode for exploring screens without playable streams.',
      'Expanded About with named version information, a changelog, privacy and legal notices, and open-source credits.',
      'Kept update checking optional; the BattleStation TV GitHub repository must be configured before update checks work.',
      'Included additional dashboard widget appearance and recommendation sorting controls.',
    ],
  ),
  BstvReleaseNotes(
    version: '0.1.0',
    name: 'Development Preview',
    changes: [
      'Initial development preview for Windows and Android testing.',
      'Feature availability may vary during development.',
    ],
  ),
];

BstvReleaseNotes bstvReleaseNotesFor(String version) {
  for (final release in bstvPublishedReleaseNotes) {
    if (release.version == version) return release;
  }
  return BstvReleaseNotes(
    version: version,
    name: 'BattleStation TV Update',
    changes: const [],
  );
}
