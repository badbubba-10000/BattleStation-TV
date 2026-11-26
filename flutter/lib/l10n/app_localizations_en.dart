// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Live';

  @override
  String get tabMovies => 'Movies';

  @override
  String get tabSeries => 'Series';

  @override
  String get catAll => 'All';

  @override
  String get catAllLive => 'All channels';

  @override
  String get catAllMovies => 'All movies';

  @override
  String get catAllSeries => 'All series';

  @override
  String downloadsEta(String p1) {
    return '$p1 left';
  }

  @override
  String get catFavorites => 'Favorites';

  @override
  String get catContinue => 'Continue watching';

  @override
  String get catFilter => 'Filter categories';

  @override
  String get playlistAll => 'All playlists';

  @override
  String get playlistLabel => 'Playlist';

  @override
  String get aboutAcknowledgements => 'Acknowledgements';

  @override
  String get aboutPrivacy => 'Privacy';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV collects no data about you. It has no account, no analytics, no advertising and no tracking.\n\nYour sources, favorites and watch history stay on this device. The app only connects to the addresses you add yourself: your provider\'s server, playlist, program guide, logos and streams.\n\nProvider passwords are kept in the iOS Keychain on this device only. They are never included in a backup file.\n\nBattleStation TV includes no channels, movies or playlists. You bring your own source.';

  @override
  String get aboutSource => 'Source code and licence';

  @override
  String get aboutCoffee => 'Buy me a coffee';

  @override
  String get tipsTitle => 'Support BattleStation TV';

  @override
  String get tipsFooter =>
      'Optional tips through Apple. They unlock nothing: every feature stays free for everyone.';

  @override
  String get tipsThanks => 'Thank you for your support!';

  @override
  String get tipsPending => 'Waiting for approval.';

  @override
  String get tipsFailed => 'The tip did not go through. Try again later.';

  @override
  String get aboutVersion => 'Version';

  @override
  String get catTitle => 'Categories';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get emptyContinue => 'Nothing to continue';

  @override
  String get emptyContinueHint =>
      'Movies and episodes you stop halfway show up here.';

  @override
  String get emptyFavorites => 'No favorites yet';

  @override
  String get emptyFavoritesHint =>
      'Press and hold a title, then choose Add to favorites.';

  @override
  String get emptyFavoritesLive =>
      'Swipe a channel to the left, then tap the star.';

  @override
  String get emptyNone => 'Nothing here yet';

  @override
  String get emptyNoneHint =>
      'Pull down to refresh, or check your source in Settings.';

  @override
  String get fieldServerInvalid =>
      'This address does not look right. Example: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Enter the full link, starting with http:// or https://';

  @override
  String get infoResume => 'Resume';

  @override
  String get libraryEmpty => 'Your library is empty';

  @override
  String get libraryEmptyHint =>
      'Favorites and the titles you started watching show up here.';

  @override
  String get onbNoChannels =>
      'BattleStation TV includes no channels, movies or playlists. Add a source from a provider you subscribe to.';

  @override
  String get onbPasteHint => 'Copied a playlist link?';

  @override
  String get onbTestRunning => 'Testing…';

  @override
  String passwordBodyIos(String p1) {
    return 'Enter the password for “$p1”. It is stored in the iOS Keychain on this device.';
  }

  @override
  String get searchRecent => 'Recent searches';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Continue S$p1 E$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'S$p1 E$p2';
  }

  @override
  String get seriesNoEpisodes => 'No episodes found';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Play S$p1 E$p2';
  }

  @override
  String get seriesWatched => 'Watched';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsEditSource => 'Edit source';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV uses the language of your device. To use another language for this app only, choose it in iOS Settings.';

  @override
  String get settingsOpenIOS => 'Open iOS Settings';

  @override
  String get settingsPasswordNote =>
      'Leave the new password empty to keep the current one. Passwords are stored in the iOS Keychain.';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get sourceDeleteWarn =>
      'The source, its favorites and its watch history are removed from this device. Your provider account is not affected.';

  @override
  String get syncNow => 'Refresh';

  @override
  String get tabLibrary => 'Library';

  @override
  String get scopeCategory => 'In category';

  @override
  String get scopeType => 'In section';

  @override
  String get scopeEverywhere => 'Everywhere';

  @override
  String get searchPrompt => 'Search';

  @override
  String get syncRunning => 'Syncing…';

  @override
  String get syncFailed => 'Sync failed';

  @override
  String get syncNotUpdated => 'Showing saved data';

  @override
  String get emptyResults => 'Nothing found';

  @override
  String get favAdd => 'Add to favorites';

  @override
  String get favRemove => 'Remove from favorites';

  @override
  String get playerClose => 'Close';

  @override
  String get playerSubtitles => 'Subtitles';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerOff => 'Off';

  @override
  String get playerAddSubtitle => 'Add subtitle file…';

  @override
  String get playerCatchup => 'Watch from the past';

  @override
  String get playerFullscreen => 'Full screen';

  @override
  String get playerError => 'Playback failed';

  @override
  String get playerRetry => 'Retry';

  @override
  String get playerPip => 'Picture in Picture';

  @override
  String get playerPipReturn => 'Back to app';

  @override
  String get catchupTitle => 'Catch-up';

  @override
  String get catchupNoEpg => 'No program guide. Pick a time manually.';

  @override
  String get catchupPick => 'Start time';

  @override
  String get catchupDuration => 'Minutes';

  @override
  String get seriesSeason => 'Season';

  @override
  String get onbWelcomeTitle => 'Welcome to BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Watch live channels, movies and series from your IPTV provider. Let\'s add your first source.';

  @override
  String get onbWhereTitle => 'Where do the addresses go?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: your provider gives you a server address (like http://host:8080), a username and a password. Enter them below.';

  @override
  String get onbWhereM3u =>
      'M3U: give the source a name and paste the playlist link your provider gave you.';

  @override
  String get fieldKind => 'Type';

  @override
  String get fieldName => 'Name';

  @override
  String get fieldServer => 'Server address';

  @override
  String get fieldUsername => 'Username';

  @override
  String get fieldPassword => 'Password';

  @override
  String get fieldUrl => 'Playlist link';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Test connection';

  @override
  String get onbTestOk => 'Connected successfully';

  @override
  String get onbTestFail => 'Connection failed';

  @override
  String get onbNext => 'Next';

  @override
  String get onbBack => 'Back';

  @override
  String get onbSave => 'Save and sync';

  @override
  String get settingsAccounts => 'Sources';

  @override
  String get settingsLanguageSub => 'Preferred subtitle languages';

  @override
  String get settingsLanguageAudio => 'Preferred audio languages';

  @override
  String get settingsSubscale => 'Subtitle size';

  @override
  String get settingsSubdelay => 'Subtitle delay (seconds)';

  @override
  String get settingsGuide => 'Show quick start guide';

  @override
  String get settingsDelete => 'Delete';

  @override
  String get accountAdd => 'Add source…';

  @override
  String get settingsChangePassword => 'Change password…';

  @override
  String get settingsNewPassword => 'New password';

  @override
  String updateAvailable(String p1) {
    return 'Version $p1 is available';
  }

  @override
  String get updateNow => 'Update now';

  @override
  String get updateNotes => 'What\'s new';

  @override
  String get updateLater => 'Later';

  @override
  String get updateDownloading => 'Downloading update…';

  @override
  String updateReady(String p1) {
    return 'Version $p1 is ready to install';
  }

  @override
  String get updateRestart => 'Restart to update';

  @override
  String get updateFailed => 'Update failed';

  @override
  String get updateManual => 'Download manually';

  @override
  String get updateCheckNow => 'Check for updates';

  @override
  String get updateAuto => 'Check for updates automatically';

  @override
  String get updateAutoInstall => 'Download updates automatically';

  @override
  String get updateUpToDate => 'You have the latest version';

  @override
  String get updateDevBuild =>
      'Updates are only available in the installed app';

  @override
  String updateCurrent(String p1) {
    return 'Current version: $p1';
  }

  @override
  String get playerBack => 'Back';

  @override
  String get playerErrorHint =>
      'If this keeps happening, check the source\'s password in Settings.';

  @override
  String get passwordTitle => 'Password needed';

  @override
  String passwordBody(String p1) {
    return 'Enter the password for “$p1”. It is stored privately on this Mac.';
  }

  @override
  String get passwordNone => 'Continue without password';

  @override
  String get playerSpeed => 'Playback speed';

  @override
  String get playerSpeedNormal => 'Normal';

  @override
  String get playerSpeedReset => 'Normal speed';

  @override
  String get settingsSeekPreview => 'Preview thumbnails on the seek bar';

  @override
  String get settingsSeekPreviewNote =>
      'Opens a second connection to your provider. Turn it off if playback stops or your provider allows only one connection.';

  @override
  String get playerSeekBar => 'Playback position';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 of $p2';
  }

  @override
  String get playerLive => 'Live';

  @override
  String get playerChannelPrev => 'Previous channel';

  @override
  String get playerChannelNext => 'Next channel';

  @override
  String get playerScaleFit => 'Fit';

  @override
  String get playerScaleFill => 'Fill';

  @override
  String get playerScaleStretch => 'Stretch';

  @override
  String get playerSubtitleAdjust => 'Adjust subtitles…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Brightness';

  @override
  String get playerVolume => 'Volume';

  @override
  String get playerReplay => 'Play again';

  @override
  String get settingsClock => 'Show the time in the player';

  @override
  String get settingsSeekStep => 'Skip step (arrow keys and skip buttons)';

  @override
  String get settingsBarsHide => 'Hide the controls after';

  @override
  String get settingsNever => 'Never';

  @override
  String get settingsVideoScale => 'Video scale';

  @override
  String get settingsScaleFit => 'Fit (black bars)';

  @override
  String get settingsScaleFill => 'Fill (crops the edges)';

  @override
  String get settingsScaleStretch => 'Stretch';

  @override
  String get settingsVideoScaleHint =>
      'Press A in the player to switch between the three.';

  @override
  String get settingsBuffer => 'Network buffer';

  @override
  String get settingsBufferSmall => 'Small';

  @override
  String get settingsBufferNormal => 'Normal';

  @override
  String get settingsBufferLarge => 'Large';

  @override
  String get settingsBufferHint =>
      'A larger buffer helps on a slow or unstable connection.';

  @override
  String unitSeconds(int p1) {
    return '$p1 seconds';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 minutes';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 min';
  }

  @override
  String playerSkipBack(String p1) {
    return 'Back $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Forward $p1';
  }

  @override
  String get playerSleep => 'Sleep timer';

  @override
  String get downloadsTitle => 'Downloads';

  @override
  String get downloadsAdd => 'Download';

  @override
  String get downloadsSeason => 'Download season';

  @override
  String get downloadsChooseFolder =>
      'Choose where to save downloaded movies and episodes';

  @override
  String get downloadsChoose => 'Choose';

  @override
  String get downloadsNotChosen => 'Asked at the first download';

  @override
  String get downloadsChange => 'Change folder…';

  @override
  String get downloadsPause => 'Pause';

  @override
  String get downloadsResume => 'Resume';

  @override
  String get downloadsCancel => 'Cancel';

  @override
  String get downloadsPlay => 'Play';

  @override
  String get downloadsReveal => 'Show in Finder';

  @override
  String get downloadsDelete => 'Delete file';

  @override
  String get downloadsEmpty => 'No downloads yet';

  @override
  String get downloadsQueued => 'Waiting';

  @override
  String get downloadsDone => 'Done';

  @override
  String get downloadsHint =>
      'Downloads run one at a time. Many providers allow a single connection, so playing while downloading can fail. Unfinished downloads are not kept when the app quits.';

  @override
  String get epgNow => 'Now';

  @override
  String get epgNext => 'Next';

  @override
  String get settingsFullscreen =>
      'Open playback in full screen (controls hide until you move the mouse)';

  @override
  String get nextTitle => 'Up next';

  @override
  String nextIn(int p1) {
    return 'Playing in $p1 s';
  }

  @override
  String get nextNow => 'Play now';

  @override
  String get nextCancel => 'Cancel';

  @override
  String get settingsAutoNext => 'Play the next episode automatically';

  @override
  String get downloadsNoSpace => 'Not enough free disk space';

  @override
  String get dbErrorTitle => 'BattleStation TV cannot open its database';

  @override
  String get dbErrorBody =>
      'If another copy of BattleStation TV is running, quit it and try again.';

  @override
  String get dbRecoveredTitle => 'The database was damaged';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV started with a fresh database (add your source again). The damaged file was kept here:\n$p1';
  }

  @override
  String get menuShowWindow => 'Show Window';

  @override
  String get settingsTabGeneral => 'General';

  @override
  String get settingsTabPlayer => 'Player';

  @override
  String get settingsTabPlaylists => 'Playlists';

  @override
  String get settingsAppearance => 'Appearance';

  @override
  String get settingsSystem => 'System';

  @override
  String get appearanceLight => 'Light';

  @override
  String get appearanceDark => 'Dark';

  @override
  String get settingsInterfaceLanguage => 'Interface language';

  @override
  String get settingsLanguageRestart =>
      'Takes effect after restarting BattleStation TV.';

  @override
  String get settingsHideCategories => 'Hide categories';

  @override
  String get settingsHideCategoriesWords => 'Words to hide';

  @override
  String get settingsHideCategoriesNote =>
      'Hide categories whose name contains these words (separate them with commas). Their channels, movies and series also disappear from search, favorites and continue watching. This is a plain filter, not a parental lock: anyone can change it here.';

  @override
  String get settingsRefresh => 'Update playlists';

  @override
  String get settingsRefresh0 => 'Only when the app opens';

  @override
  String get settingsRefresh6 => 'Every 6 hours';

  @override
  String get settingsRefresh12 => 'Every 12 hours';

  @override
  String get settingsRefresh24 => 'Every 24 hours';

  @override
  String get settingsBackup => 'Backup and restore';

  @override
  String get backupExport => 'Export backup…';

  @override
  String get backupImport => 'Import backup…';

  @override
  String get backupWarn =>
      'The backup file lists your playlists with their addresses, which can include logins, so keep it private. Passwords of Xtream sources are not saved in it. Importing adds to your current sources and does not delete anything.';

  @override
  String get backupExported => 'The backup was saved.';

  @override
  String get backupImported => 'The backup was imported.';

  @override
  String get backupErrorInvalid =>
      'This is not an BattleStation TV backup file.';

  @override
  String get backupErrorVersion =>
      'This backup comes from a different version of BattleStation TV and cannot be read.';

  @override
  String get backupErrorTooLarge => 'This file is too large to be a backup.';

  @override
  String get backupFailed => 'The backup failed';

  @override
  String get settingsClearData => 'Clear data';

  @override
  String get clearHistory => 'Clear watch history';

  @override
  String get clearFavorites => 'Clear favorites';

  @override
  String get clearImages => 'Clear image cache';

  @override
  String get clearConfirm => 'Clear';

  @override
  String get clearHistoryWarn =>
      'Resume positions and the continue-watching lists of all sources will be erased. This cannot be undone.';

  @override
  String get clearFavoritesWarn =>
      'Your favorites in all sources will be removed. This cannot be undone.';

  @override
  String get clearImagesWarn =>
      'Saved logos and posters are removed and downloaded again when needed.';

  @override
  String get infoDetails => 'Details';

  @override
  String get infoPlot => 'Plot';

  @override
  String get infoCast => 'Cast';

  @override
  String get infoDirector => 'Director';

  @override
  String get infoGenre => 'Genre';

  @override
  String get infoYear => 'Release year';

  @override
  String get infoRating => 'Rating';

  @override
  String get infoDuration => 'Duration';

  @override
  String get infoCountry => 'Country';

  @override
  String get infoTrailer => 'Trailer';

  @override
  String get infoPlay => 'Play';

  @override
  String get infoEmpty => 'Your provider has no details for this title.';

  @override
  String get infoLoading => 'Loading details…';

  @override
  String get infoError => 'The details could not be loaded.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 h';
  }

  @override
  String subExpires(String p1) {
    return 'Expires $p1';
  }

  @override
  String subExpired(String p1) {
    return 'Expired $p1';
  }

  @override
  String subDaysLeft(int p1) {
    return 'Days left: $p1';
  }

  @override
  String get onbWelcomeRights =>
      'Use only sources you are authorized to access.';

  @override
  String get playerSkipIntro => 'Skip intro';

  @override
  String get playerSkipCredits => 'Skip credits';

  @override
  String get playerSkipMenu => 'Intro and credits';

  @override
  String get playerMarkIntroStart => 'Intro starts here';

  @override
  String get playerMarkIntroEnd => 'Intro ends here';

  @override
  String get playerMarkCredits => 'Credits start here';

  @override
  String get playerSkipForget => 'Forget intro and credits';

  @override
  String get playerSkipSaved => 'Saved for every episode of this series';

  @override
  String get playerSkipRefused => 'Not possible at this point';

  @override
  String get continueRemove => 'Remove from Continue watching';

  @override
  String get settingsFavoritesAZ => 'Sort favorites by name (A–Z)';

  @override
  String get settingsKeychain => 'Store passwords in the Keychain';

  @override
  String get settingsKeychainNote =>
      'Off: passwords stay in the app\'s private database. On: macOS keeps them in your login keychain.';

  @override
  String get settingsKeychainFailed =>
      'The Keychain did not accept the passwords. Nothing was changed.';
}
