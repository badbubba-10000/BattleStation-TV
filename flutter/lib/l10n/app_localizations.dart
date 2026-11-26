import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sq.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bg'),
    Locale('bn'),
    Locale('cs'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fr'),
    Locale('he'),
    Locale('hi'),
    Locale('hu'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('ru'),
    Locale('sq'),
    Locale('sv'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
    Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'BattleStation TV'**
  String get appName;

  /// No description provided for @tabLive.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get tabLive;

  /// No description provided for @tabMovies.
  ///
  /// In en, this message translates to:
  /// **'Movies'**
  String get tabMovies;

  /// No description provided for @tabSeries.
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get tabSeries;

  /// No description provided for @catAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get catAll;

  /// No description provided for @catAllLive.
  ///
  /// In en, this message translates to:
  /// **'All channels'**
  String get catAllLive;

  /// No description provided for @catAllMovies.
  ///
  /// In en, this message translates to:
  /// **'All movies'**
  String get catAllMovies;

  /// No description provided for @catAllSeries.
  ///
  /// In en, this message translates to:
  /// **'All series'**
  String get catAllSeries;

  /// No description provided for @downloadsEta.
  ///
  /// In en, this message translates to:
  /// **'{p1} left'**
  String downloadsEta(String p1);

  /// No description provided for @catFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get catFavorites;

  /// No description provided for @catContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue watching'**
  String get catContinue;

  /// No description provided for @catFilter.
  ///
  /// In en, this message translates to:
  /// **'Filter categories'**
  String get catFilter;

  /// No description provided for @playlistAll.
  ///
  /// In en, this message translates to:
  /// **'All playlists'**
  String get playlistAll;

  /// No description provided for @playlistLabel.
  ///
  /// In en, this message translates to:
  /// **'Playlist'**
  String get playlistLabel;

  /// No description provided for @aboutAcknowledgements.
  ///
  /// In en, this message translates to:
  /// **'Acknowledgements'**
  String get aboutAcknowledgements;

  /// No description provided for @aboutPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get aboutPrivacy;

  /// No description provided for @aboutPrivacyBody.
  ///
  /// In en, this message translates to:
  /// **'BattleStation TV collects no data about you. It has no account, no analytics, no advertising and no tracking.\n\nYour sources, favorites and watch history stay on this device. The app only connects to the addresses you add yourself: your provider\'\'s server, playlist, program guide, logos and streams.\n\nProvider passwords are kept in the iOS Keychain on this device only. They are never included in a backup file.\n\nBattleStation TV includes no channels, movies or playlists. You bring your own source.'**
  String get aboutPrivacyBody;

  /// No description provided for @aboutSource.
  ///
  /// In en, this message translates to:
  /// **'Source code and licence'**
  String get aboutSource;

  /// No description provided for @aboutCoffee.
  ///
  /// In en, this message translates to:
  /// **'Buy me a coffee'**
  String get aboutCoffee;

  /// No description provided for @tipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Support BattleStation TV'**
  String get tipsTitle;

  /// No description provided for @tipsFooter.
  ///
  /// In en, this message translates to:
  /// **'Optional tips through Apple. They unlock nothing: every feature stays free for everyone.'**
  String get tipsFooter;

  /// No description provided for @tipsThanks.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your support!'**
  String get tipsThanks;

  /// No description provided for @tipsPending.
  ///
  /// In en, this message translates to:
  /// **'Waiting for approval.'**
  String get tipsPending;

  /// No description provided for @tipsFailed.
  ///
  /// In en, this message translates to:
  /// **'The tip did not go through. Try again later.'**
  String get tipsFailed;

  /// No description provided for @aboutVersion.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get aboutVersion;

  /// No description provided for @catTitle.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get catTitle;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @emptyContinue.
  ///
  /// In en, this message translates to:
  /// **'Nothing to continue'**
  String get emptyContinue;

  /// No description provided for @emptyContinueHint.
  ///
  /// In en, this message translates to:
  /// **'Movies and episodes you stop halfway show up here.'**
  String get emptyContinueHint;

  /// No description provided for @emptyFavorites.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get emptyFavorites;

  /// No description provided for @emptyFavoritesHint.
  ///
  /// In en, this message translates to:
  /// **'Press and hold a title, then choose Add to favorites.'**
  String get emptyFavoritesHint;

  /// No description provided for @emptyFavoritesLive.
  ///
  /// In en, this message translates to:
  /// **'Swipe a channel to the left, then tap the star.'**
  String get emptyFavoritesLive;

  /// No description provided for @emptyNone.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get emptyNone;

  /// No description provided for @emptyNoneHint.
  ///
  /// In en, this message translates to:
  /// **'Pull down to refresh, or check your source in Settings.'**
  String get emptyNoneHint;

  /// No description provided for @fieldServerInvalid.
  ///
  /// In en, this message translates to:
  /// **'This address does not look right. Example: http://host:8080'**
  String get fieldServerInvalid;

  /// No description provided for @fieldUrlInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter the full link, starting with http:// or https://'**
  String get fieldUrlInvalid;

  /// No description provided for @infoResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get infoResume;

  /// No description provided for @libraryEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your library is empty'**
  String get libraryEmpty;

  /// No description provided for @libraryEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'Favorites and the titles you started watching show up here.'**
  String get libraryEmptyHint;

  /// No description provided for @onbNoChannels.
  ///
  /// In en, this message translates to:
  /// **'BattleStation TV includes no channels, movies or playlists. Add a source from a provider you subscribe to.'**
  String get onbNoChannels;

  /// No description provided for @onbPasteHint.
  ///
  /// In en, this message translates to:
  /// **'Copied a playlist link?'**
  String get onbPasteHint;

  /// No description provided for @onbTestRunning.
  ///
  /// In en, this message translates to:
  /// **'Testing…'**
  String get onbTestRunning;

  /// No description provided for @passwordBodyIos.
  ///
  /// In en, this message translates to:
  /// **'Enter the password for “{p1}”. It is stored in the iOS Keychain on this device.'**
  String passwordBodyIos(String p1);

  /// No description provided for @searchRecent.
  ///
  /// In en, this message translates to:
  /// **'Recent searches'**
  String get searchRecent;

  /// No description provided for @seriesContinueEp.
  ///
  /// In en, this message translates to:
  /// **'Continue S{p1} E{p2}'**
  String seriesContinueEp(int p1, int p2);

  /// No description provided for @seriesEpShort.
  ///
  /// In en, this message translates to:
  /// **'S{p1} E{p2}'**
  String seriesEpShort(int p1, int p2);

  /// No description provided for @seriesNoEpisodes.
  ///
  /// In en, this message translates to:
  /// **'No episodes found'**
  String get seriesNoEpisodes;

  /// No description provided for @seriesPlayEp.
  ///
  /// In en, this message translates to:
  /// **'Play S{p1} E{p2}'**
  String seriesPlayEp(int p1, int p2);

  /// No description provided for @seriesWatched.
  ///
  /// In en, this message translates to:
  /// **'Watched'**
  String get seriesWatched;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsEditSource.
  ///
  /// In en, this message translates to:
  /// **'Edit source'**
  String get settingsEditSource;

  /// No description provided for @settingsLanguageNote.
  ///
  /// In en, this message translates to:
  /// **'BattleStation TV uses the language of your device. To use another language for this app only, choose it in iOS Settings.'**
  String get settingsLanguageNote;

  /// No description provided for @settingsOpenIOS.
  ///
  /// In en, this message translates to:
  /// **'Open iOS Settings'**
  String get settingsOpenIOS;

  /// No description provided for @settingsPasswordNote.
  ///
  /// In en, this message translates to:
  /// **'Leave the new password empty to keep the current one. Passwords are stored in the iOS Keychain.'**
  String get settingsPasswordNote;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @sourceDeleteWarn.
  ///
  /// In en, this message translates to:
  /// **'The source, its favorites and its watch history are removed from this device. Your provider account is not affected.'**
  String get sourceDeleteWarn;

  /// No description provided for @syncNow.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get syncNow;

  /// No description provided for @tabLibrary.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get tabLibrary;

  /// No description provided for @scopeCategory.
  ///
  /// In en, this message translates to:
  /// **'In category'**
  String get scopeCategory;

  /// No description provided for @scopeType.
  ///
  /// In en, this message translates to:
  /// **'In section'**
  String get scopeType;

  /// No description provided for @scopeEverywhere.
  ///
  /// In en, this message translates to:
  /// **'Everywhere'**
  String get scopeEverywhere;

  /// No description provided for @searchPrompt.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchPrompt;

  /// No description provided for @syncRunning.
  ///
  /// In en, this message translates to:
  /// **'Syncing…'**
  String get syncRunning;

  /// No description provided for @syncFailed.
  ///
  /// In en, this message translates to:
  /// **'Sync failed'**
  String get syncFailed;

  /// No description provided for @syncNotUpdated.
  ///
  /// In en, this message translates to:
  /// **'Showing saved data'**
  String get syncNotUpdated;

  /// No description provided for @emptyResults.
  ///
  /// In en, this message translates to:
  /// **'Nothing found'**
  String get emptyResults;

  /// No description provided for @favAdd.
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get favAdd;

  /// No description provided for @favRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get favRemove;

  /// No description provided for @playerClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get playerClose;

  /// No description provided for @playerSubtitles.
  ///
  /// In en, this message translates to:
  /// **'Subtitles'**
  String get playerSubtitles;

  /// No description provided for @playerAudio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get playerAudio;

  /// No description provided for @playerOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get playerOff;

  /// No description provided for @playerAddSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add subtitle file…'**
  String get playerAddSubtitle;

  /// No description provided for @playerCatchup.
  ///
  /// In en, this message translates to:
  /// **'Watch from the past'**
  String get playerCatchup;

  /// No description provided for @playerFullscreen.
  ///
  /// In en, this message translates to:
  /// **'Full screen'**
  String get playerFullscreen;

  /// No description provided for @playerError.
  ///
  /// In en, this message translates to:
  /// **'Playback failed'**
  String get playerError;

  /// No description provided for @playerRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get playerRetry;

  /// No description provided for @playerPip.
  ///
  /// In en, this message translates to:
  /// **'Picture in Picture'**
  String get playerPip;

  /// No description provided for @playerPipReturn.
  ///
  /// In en, this message translates to:
  /// **'Back to app'**
  String get playerPipReturn;

  /// No description provided for @catchupTitle.
  ///
  /// In en, this message translates to:
  /// **'Catch-up'**
  String get catchupTitle;

  /// No description provided for @catchupNoEpg.
  ///
  /// In en, this message translates to:
  /// **'No program guide. Pick a time manually.'**
  String get catchupNoEpg;

  /// No description provided for @catchupPick.
  ///
  /// In en, this message translates to:
  /// **'Start time'**
  String get catchupPick;

  /// No description provided for @catchupDuration.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get catchupDuration;

  /// No description provided for @seriesSeason.
  ///
  /// In en, this message translates to:
  /// **'Season'**
  String get seriesSeason;

  /// No description provided for @onbWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to BattleStation TV'**
  String get onbWelcomeTitle;

  /// No description provided for @onbWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Watch live channels, movies and series from your IPTV provider. Let\'\'s add your first source.'**
  String get onbWelcomeBody;

  /// No description provided for @onbWhereTitle.
  ///
  /// In en, this message translates to:
  /// **'Where do the addresses go?'**
  String get onbWhereTitle;

  /// No description provided for @onbWhereXtream.
  ///
  /// In en, this message translates to:
  /// **'Xtream Codes: your provider gives you a server address (like http://host:8080), a username and a password. Enter them below.'**
  String get onbWhereXtream;

  /// No description provided for @onbWhereM3u.
  ///
  /// In en, this message translates to:
  /// **'M3U: give the source a name and paste the playlist link your provider gave you.'**
  String get onbWhereM3u;

  /// No description provided for @fieldKind.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get fieldKind;

  /// No description provided for @fieldName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get fieldName;

  /// No description provided for @fieldServer.
  ///
  /// In en, this message translates to:
  /// **'Server address'**
  String get fieldServer;

  /// No description provided for @fieldUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get fieldUsername;

  /// No description provided for @fieldPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get fieldPassword;

  /// No description provided for @fieldUrl.
  ///
  /// In en, this message translates to:
  /// **'Playlist link'**
  String get fieldUrl;

  /// No description provided for @kindXtream.
  ///
  /// In en, this message translates to:
  /// **'Xtream Codes'**
  String get kindXtream;

  /// No description provided for @kindM3u.
  ///
  /// In en, this message translates to:
  /// **'M3U'**
  String get kindM3u;

  /// No description provided for @onbTest.
  ///
  /// In en, this message translates to:
  /// **'Test connection'**
  String get onbTest;

  /// No description provided for @onbTestOk.
  ///
  /// In en, this message translates to:
  /// **'Connected successfully'**
  String get onbTestOk;

  /// No description provided for @onbTestFail.
  ///
  /// In en, this message translates to:
  /// **'Connection failed'**
  String get onbTestFail;

  /// No description provided for @onbNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onbNext;

  /// No description provided for @onbBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get onbBack;

  /// No description provided for @onbSave.
  ///
  /// In en, this message translates to:
  /// **'Save and sync'**
  String get onbSave;

  /// No description provided for @settingsAccounts.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get settingsAccounts;

  /// No description provided for @settingsLanguageSub.
  ///
  /// In en, this message translates to:
  /// **'Preferred subtitle languages'**
  String get settingsLanguageSub;

  /// No description provided for @settingsLanguageAudio.
  ///
  /// In en, this message translates to:
  /// **'Preferred audio languages'**
  String get settingsLanguageAudio;

  /// No description provided for @settingsSubscale.
  ///
  /// In en, this message translates to:
  /// **'Subtitle size'**
  String get settingsSubscale;

  /// No description provided for @settingsSubdelay.
  ///
  /// In en, this message translates to:
  /// **'Subtitle delay (seconds)'**
  String get settingsSubdelay;

  /// No description provided for @settingsGuide.
  ///
  /// In en, this message translates to:
  /// **'Show quick start guide'**
  String get settingsGuide;

  /// No description provided for @settingsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get settingsDelete;

  /// No description provided for @accountAdd.
  ///
  /// In en, this message translates to:
  /// **'Add source…'**
  String get accountAdd;

  /// No description provided for @settingsChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password…'**
  String get settingsChangePassword;

  /// No description provided for @settingsNewPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get settingsNewPassword;

  /// No description provided for @updateAvailable.
  ///
  /// In en, this message translates to:
  /// **'Version {p1} is available'**
  String updateAvailable(String p1);

  /// No description provided for @updateNow.
  ///
  /// In en, this message translates to:
  /// **'Update now'**
  String get updateNow;

  /// No description provided for @updateNotes.
  ///
  /// In en, this message translates to:
  /// **'What\'\'s new'**
  String get updateNotes;

  /// No description provided for @updateLater.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get updateLater;

  /// No description provided for @updateDownloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading update…'**
  String get updateDownloading;

  /// No description provided for @updateReady.
  ///
  /// In en, this message translates to:
  /// **'Version {p1} is ready to install'**
  String updateReady(String p1);

  /// No description provided for @updateRestart.
  ///
  /// In en, this message translates to:
  /// **'Restart to update'**
  String get updateRestart;

  /// No description provided for @updateFailed.
  ///
  /// In en, this message translates to:
  /// **'Update failed'**
  String get updateFailed;

  /// No description provided for @updateManual.
  ///
  /// In en, this message translates to:
  /// **'Download manually'**
  String get updateManual;

  /// No description provided for @updateCheckNow.
  ///
  /// In en, this message translates to:
  /// **'Check for updates'**
  String get updateCheckNow;

  /// No description provided for @updateAuto.
  ///
  /// In en, this message translates to:
  /// **'Check for updates automatically'**
  String get updateAuto;

  /// No description provided for @updateAutoInstall.
  ///
  /// In en, this message translates to:
  /// **'Download updates automatically'**
  String get updateAutoInstall;

  /// No description provided for @updateUpToDate.
  ///
  /// In en, this message translates to:
  /// **'You have the latest version'**
  String get updateUpToDate;

  /// No description provided for @updateDevBuild.
  ///
  /// In en, this message translates to:
  /// **'Updates are only available in the installed app'**
  String get updateDevBuild;

  /// No description provided for @updateCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current version: {p1}'**
  String updateCurrent(String p1);

  /// No description provided for @playerBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get playerBack;

  /// No description provided for @playerErrorHint.
  ///
  /// In en, this message translates to:
  /// **'If this keeps happening, check the source\'\'s password in Settings.'**
  String get playerErrorHint;

  /// No description provided for @passwordTitle.
  ///
  /// In en, this message translates to:
  /// **'Password needed'**
  String get passwordTitle;

  /// No description provided for @passwordBody.
  ///
  /// In en, this message translates to:
  /// **'Enter the password for “{p1}”. It is stored privately on this Mac.'**
  String passwordBody(String p1);

  /// No description provided for @passwordNone.
  ///
  /// In en, this message translates to:
  /// **'Continue without password'**
  String get passwordNone;

  /// No description provided for @playerSpeed.
  ///
  /// In en, this message translates to:
  /// **'Playback speed'**
  String get playerSpeed;

  /// No description provided for @playerSpeedNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get playerSpeedNormal;

  /// No description provided for @playerSpeedReset.
  ///
  /// In en, this message translates to:
  /// **'Normal speed'**
  String get playerSpeedReset;

  /// No description provided for @settingsSeekPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview thumbnails on the seek bar'**
  String get settingsSeekPreview;

  /// No description provided for @settingsSeekPreviewNote.
  ///
  /// In en, this message translates to:
  /// **'Opens a second connection to your provider. Turn it off if playback stops or your provider allows only one connection.'**
  String get settingsSeekPreviewNote;

  /// No description provided for @playerSeekBar.
  ///
  /// In en, this message translates to:
  /// **'Playback position'**
  String get playerSeekBar;

  /// No description provided for @playerSeekValue.
  ///
  /// In en, this message translates to:
  /// **'{p1} of {p2}'**
  String playerSeekValue(String p1, String p2);

  /// No description provided for @playerLive.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get playerLive;

  /// No description provided for @playerChannelPrev.
  ///
  /// In en, this message translates to:
  /// **'Previous channel'**
  String get playerChannelPrev;

  /// No description provided for @playerChannelNext.
  ///
  /// In en, this message translates to:
  /// **'Next channel'**
  String get playerChannelNext;

  /// No description provided for @playerScaleFit.
  ///
  /// In en, this message translates to:
  /// **'Fit'**
  String get playerScaleFit;

  /// No description provided for @playerScaleFill.
  ///
  /// In en, this message translates to:
  /// **'Fill'**
  String get playerScaleFill;

  /// No description provided for @playerScaleStretch.
  ///
  /// In en, this message translates to:
  /// **'Stretch'**
  String get playerScaleStretch;

  /// No description provided for @playerSubtitleAdjust.
  ///
  /// In en, this message translates to:
  /// **'Adjust subtitles…'**
  String get playerSubtitleAdjust;

  /// No description provided for @playerAirplay.
  ///
  /// In en, this message translates to:
  /// **'AirPlay'**
  String get playerAirplay;

  /// No description provided for @playerBrightness.
  ///
  /// In en, this message translates to:
  /// **'Brightness'**
  String get playerBrightness;

  /// No description provided for @playerVolume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get playerVolume;

  /// No description provided for @playerReplay.
  ///
  /// In en, this message translates to:
  /// **'Play again'**
  String get playerReplay;

  /// No description provided for @settingsClock.
  ///
  /// In en, this message translates to:
  /// **'Show the time in the player'**
  String get settingsClock;

  /// No description provided for @settingsSeekStep.
  ///
  /// In en, this message translates to:
  /// **'Skip step (arrow keys and skip buttons)'**
  String get settingsSeekStep;

  /// No description provided for @settingsBarsHide.
  ///
  /// In en, this message translates to:
  /// **'Hide the controls after'**
  String get settingsBarsHide;

  /// No description provided for @settingsNever.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get settingsNever;

  /// No description provided for @settingsVideoScale.
  ///
  /// In en, this message translates to:
  /// **'Video scale'**
  String get settingsVideoScale;

  /// No description provided for @settingsScaleFit.
  ///
  /// In en, this message translates to:
  /// **'Fit (black bars)'**
  String get settingsScaleFit;

  /// No description provided for @settingsScaleFill.
  ///
  /// In en, this message translates to:
  /// **'Fill (crops the edges)'**
  String get settingsScaleFill;

  /// No description provided for @settingsScaleStretch.
  ///
  /// In en, this message translates to:
  /// **'Stretch'**
  String get settingsScaleStretch;

  /// No description provided for @settingsVideoScaleHint.
  ///
  /// In en, this message translates to:
  /// **'Press A in the player to switch between the three.'**
  String get settingsVideoScaleHint;

  /// No description provided for @settingsBuffer.
  ///
  /// In en, this message translates to:
  /// **'Network buffer'**
  String get settingsBuffer;

  /// No description provided for @settingsBufferSmall.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get settingsBufferSmall;

  /// No description provided for @settingsBufferNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get settingsBufferNormal;

  /// No description provided for @settingsBufferLarge.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get settingsBufferLarge;

  /// No description provided for @settingsBufferHint.
  ///
  /// In en, this message translates to:
  /// **'A larger buffer helps on a slow or unstable connection.'**
  String get settingsBufferHint;

  /// No description provided for @unitSeconds.
  ///
  /// In en, this message translates to:
  /// **'{p1} seconds'**
  String unitSeconds(int p1);

  /// No description provided for @unitMinutes.
  ///
  /// In en, this message translates to:
  /// **'{p1} minutes'**
  String unitMinutes(int p1);

  /// No description provided for @unitMinutesShort.
  ///
  /// In en, this message translates to:
  /// **'{p1} min'**
  String unitMinutesShort(int p1);

  /// No description provided for @playerSkipBack.
  ///
  /// In en, this message translates to:
  /// **'Back {p1}'**
  String playerSkipBack(String p1);

  /// No description provided for @playerSkipForward.
  ///
  /// In en, this message translates to:
  /// **'Forward {p1}'**
  String playerSkipForward(String p1);

  /// No description provided for @playerSleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep timer'**
  String get playerSleep;

  /// No description provided for @downloadsTitle.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get downloadsTitle;

  /// No description provided for @downloadsAdd.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get downloadsAdd;

  /// No description provided for @downloadsSeason.
  ///
  /// In en, this message translates to:
  /// **'Download season'**
  String get downloadsSeason;

  /// No description provided for @downloadsChooseFolder.
  ///
  /// In en, this message translates to:
  /// **'Choose where to save downloaded movies and episodes'**
  String get downloadsChooseFolder;

  /// No description provided for @downloadsChoose.
  ///
  /// In en, this message translates to:
  /// **'Choose'**
  String get downloadsChoose;

  /// No description provided for @downloadsNotChosen.
  ///
  /// In en, this message translates to:
  /// **'Asked at the first download'**
  String get downloadsNotChosen;

  /// No description provided for @downloadsChange.
  ///
  /// In en, this message translates to:
  /// **'Change folder…'**
  String get downloadsChange;

  /// No description provided for @downloadsPause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get downloadsPause;

  /// No description provided for @downloadsResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get downloadsResume;

  /// No description provided for @downloadsCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get downloadsCancel;

  /// No description provided for @downloadsPlay.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get downloadsPlay;

  /// No description provided for @downloadsReveal.
  ///
  /// In en, this message translates to:
  /// **'Show in Finder'**
  String get downloadsReveal;

  /// No description provided for @downloadsDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete file'**
  String get downloadsDelete;

  /// No description provided for @downloadsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No downloads yet'**
  String get downloadsEmpty;

  /// No description provided for @downloadsQueued.
  ///
  /// In en, this message translates to:
  /// **'Waiting'**
  String get downloadsQueued;

  /// No description provided for @downloadsDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get downloadsDone;

  /// No description provided for @downloadsHint.
  ///
  /// In en, this message translates to:
  /// **'Downloads run one at a time. Many providers allow a single connection, so playing while downloading can fail. Unfinished downloads are not kept when the app quits.'**
  String get downloadsHint;

  /// No description provided for @epgNow.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get epgNow;

  /// No description provided for @epgNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get epgNext;

  /// No description provided for @settingsFullscreen.
  ///
  /// In en, this message translates to:
  /// **'Open playback in full screen (controls hide until you move the mouse)'**
  String get settingsFullscreen;

  /// No description provided for @nextTitle.
  ///
  /// In en, this message translates to:
  /// **'Up next'**
  String get nextTitle;

  /// No description provided for @nextIn.
  ///
  /// In en, this message translates to:
  /// **'Playing in {p1} s'**
  String nextIn(int p1);

  /// No description provided for @nextNow.
  ///
  /// In en, this message translates to:
  /// **'Play now'**
  String get nextNow;

  /// No description provided for @nextCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get nextCancel;

  /// No description provided for @settingsAutoNext.
  ///
  /// In en, this message translates to:
  /// **'Play the next episode automatically'**
  String get settingsAutoNext;

  /// No description provided for @downloadsNoSpace.
  ///
  /// In en, this message translates to:
  /// **'Not enough free disk space'**
  String get downloadsNoSpace;

  /// No description provided for @dbErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'BattleStation TV cannot open its database'**
  String get dbErrorTitle;

  /// No description provided for @dbErrorBody.
  ///
  /// In en, this message translates to:
  /// **'If another copy of BattleStation TV is running, quit it and try again.'**
  String get dbErrorBody;

  /// No description provided for @dbRecoveredTitle.
  ///
  /// In en, this message translates to:
  /// **'The database was damaged'**
  String get dbRecoveredTitle;

  /// No description provided for @dbRecoveredBody.
  ///
  /// In en, this message translates to:
  /// **'BattleStation TV started with a fresh database (add your source again). The damaged file was kept here:\n{p1}'**
  String dbRecoveredBody(String p1);

  /// No description provided for @menuShowWindow.
  ///
  /// In en, this message translates to:
  /// **'Show Window'**
  String get menuShowWindow;

  /// No description provided for @settingsTabGeneral.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get settingsTabGeneral;

  /// No description provided for @settingsTabPlayer.
  ///
  /// In en, this message translates to:
  /// **'Player'**
  String get settingsTabPlayer;

  /// No description provided for @settingsTabPlaylists.
  ///
  /// In en, this message translates to:
  /// **'Playlists'**
  String get settingsTabPlaylists;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get settingsSystem;

  /// No description provided for @appearanceLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get appearanceLight;

  /// No description provided for @appearanceDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get appearanceDark;

  /// No description provided for @settingsInterfaceLanguage.
  ///
  /// In en, this message translates to:
  /// **'Interface language'**
  String get settingsInterfaceLanguage;

  /// No description provided for @settingsLanguageRestart.
  ///
  /// In en, this message translates to:
  /// **'Takes effect after restarting BattleStation TV.'**
  String get settingsLanguageRestart;

  /// No description provided for @settingsHideCategories.
  ///
  /// In en, this message translates to:
  /// **'Hide categories'**
  String get settingsHideCategories;

  /// No description provided for @settingsHideCategoriesWords.
  ///
  /// In en, this message translates to:
  /// **'Words to hide'**
  String get settingsHideCategoriesWords;

  /// No description provided for @settingsHideCategoriesNote.
  ///
  /// In en, this message translates to:
  /// **'Hide categories whose name contains these words (separate them with commas). Their channels, movies and series also disappear from search, favorites and continue watching. This is a plain filter, not a parental lock: anyone can change it here.'**
  String get settingsHideCategoriesNote;

  /// No description provided for @settingsRefresh.
  ///
  /// In en, this message translates to:
  /// **'Update playlists'**
  String get settingsRefresh;

  /// No description provided for @settingsRefresh0.
  ///
  /// In en, this message translates to:
  /// **'Only when the app opens'**
  String get settingsRefresh0;

  /// No description provided for @settingsRefresh6.
  ///
  /// In en, this message translates to:
  /// **'Every 6 hours'**
  String get settingsRefresh6;

  /// No description provided for @settingsRefresh12.
  ///
  /// In en, this message translates to:
  /// **'Every 12 hours'**
  String get settingsRefresh12;

  /// No description provided for @settingsRefresh24.
  ///
  /// In en, this message translates to:
  /// **'Every 24 hours'**
  String get settingsRefresh24;

  /// No description provided for @settingsBackup.
  ///
  /// In en, this message translates to:
  /// **'Backup and restore'**
  String get settingsBackup;

  /// No description provided for @backupExport.
  ///
  /// In en, this message translates to:
  /// **'Export backup…'**
  String get backupExport;

  /// No description provided for @backupImport.
  ///
  /// In en, this message translates to:
  /// **'Import backup…'**
  String get backupImport;

  /// No description provided for @backupWarn.
  ///
  /// In en, this message translates to:
  /// **'The backup file lists your playlists with their addresses, which can include logins, so keep it private. Passwords of Xtream sources are not saved in it. Importing adds to your current sources and does not delete anything.'**
  String get backupWarn;

  /// No description provided for @backupExported.
  ///
  /// In en, this message translates to:
  /// **'The backup was saved.'**
  String get backupExported;

  /// No description provided for @backupImported.
  ///
  /// In en, this message translates to:
  /// **'The backup was imported.'**
  String get backupImported;

  /// No description provided for @backupErrorInvalid.
  ///
  /// In en, this message translates to:
  /// **'This is not an BattleStation TV backup file.'**
  String get backupErrorInvalid;

  /// No description provided for @backupErrorVersion.
  ///
  /// In en, this message translates to:
  /// **'This backup comes from a different version of BattleStation TV and cannot be read.'**
  String get backupErrorVersion;

  /// No description provided for @backupErrorTooLarge.
  ///
  /// In en, this message translates to:
  /// **'This file is too large to be a backup.'**
  String get backupErrorTooLarge;

  /// No description provided for @backupFailed.
  ///
  /// In en, this message translates to:
  /// **'The backup failed'**
  String get backupFailed;

  /// No description provided for @settingsClearData.
  ///
  /// In en, this message translates to:
  /// **'Clear data'**
  String get settingsClearData;

  /// No description provided for @clearHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear watch history'**
  String get clearHistory;

  /// No description provided for @clearFavorites.
  ///
  /// In en, this message translates to:
  /// **'Clear favorites'**
  String get clearFavorites;

  /// No description provided for @clearImages.
  ///
  /// In en, this message translates to:
  /// **'Clear image cache'**
  String get clearImages;

  /// No description provided for @clearConfirm.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clearConfirm;

  /// No description provided for @clearHistoryWarn.
  ///
  /// In en, this message translates to:
  /// **'Resume positions and the continue-watching lists of all sources will be erased. This cannot be undone.'**
  String get clearHistoryWarn;

  /// No description provided for @clearFavoritesWarn.
  ///
  /// In en, this message translates to:
  /// **'Your favorites in all sources will be removed. This cannot be undone.'**
  String get clearFavoritesWarn;

  /// No description provided for @clearImagesWarn.
  ///
  /// In en, this message translates to:
  /// **'Saved logos and posters are removed and downloaded again when needed.'**
  String get clearImagesWarn;

  /// No description provided for @infoDetails.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get infoDetails;

  /// No description provided for @infoPlot.
  ///
  /// In en, this message translates to:
  /// **'Plot'**
  String get infoPlot;

  /// No description provided for @infoCast.
  ///
  /// In en, this message translates to:
  /// **'Cast'**
  String get infoCast;

  /// No description provided for @infoDirector.
  ///
  /// In en, this message translates to:
  /// **'Director'**
  String get infoDirector;

  /// No description provided for @infoGenre.
  ///
  /// In en, this message translates to:
  /// **'Genre'**
  String get infoGenre;

  /// No description provided for @infoYear.
  ///
  /// In en, this message translates to:
  /// **'Release year'**
  String get infoYear;

  /// No description provided for @infoRating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get infoRating;

  /// No description provided for @infoDuration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get infoDuration;

  /// No description provided for @infoCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get infoCountry;

  /// No description provided for @infoTrailer.
  ///
  /// In en, this message translates to:
  /// **'Trailer'**
  String get infoTrailer;

  /// No description provided for @infoPlay.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get infoPlay;

  /// No description provided for @infoEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your provider has no details for this title.'**
  String get infoEmpty;

  /// No description provided for @infoLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading details…'**
  String get infoLoading;

  /// No description provided for @infoError.
  ///
  /// In en, this message translates to:
  /// **'The details could not be loaded.'**
  String get infoError;

  /// No description provided for @unitHoursShort.
  ///
  /// In en, this message translates to:
  /// **'{p1} h'**
  String unitHoursShort(int p1);

  /// No description provided for @subExpires.
  ///
  /// In en, this message translates to:
  /// **'Expires {p1}'**
  String subExpires(String p1);

  /// No description provided for @subExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired {p1}'**
  String subExpired(String p1);

  /// No description provided for @subDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'Days left: {p1}'**
  String subDaysLeft(int p1);

  /// No description provided for @onbWelcomeRights.
  ///
  /// In en, this message translates to:
  /// **'Use only sources you are authorized to access.'**
  String get onbWelcomeRights;

  /// No description provided for @playerSkipIntro.
  ///
  /// In en, this message translates to:
  /// **'Skip intro'**
  String get playerSkipIntro;

  /// No description provided for @playerSkipCredits.
  ///
  /// In en, this message translates to:
  /// **'Skip credits'**
  String get playerSkipCredits;

  /// No description provided for @playerSkipMenu.
  ///
  /// In en, this message translates to:
  /// **'Intro and credits'**
  String get playerSkipMenu;

  /// No description provided for @playerMarkIntroStart.
  ///
  /// In en, this message translates to:
  /// **'Intro starts here'**
  String get playerMarkIntroStart;

  /// No description provided for @playerMarkIntroEnd.
  ///
  /// In en, this message translates to:
  /// **'Intro ends here'**
  String get playerMarkIntroEnd;

  /// No description provided for @playerMarkCredits.
  ///
  /// In en, this message translates to:
  /// **'Credits start here'**
  String get playerMarkCredits;

  /// No description provided for @playerSkipForget.
  ///
  /// In en, this message translates to:
  /// **'Forget intro and credits'**
  String get playerSkipForget;

  /// No description provided for @playerSkipSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved for every episode of this series'**
  String get playerSkipSaved;

  /// No description provided for @playerSkipRefused.
  ///
  /// In en, this message translates to:
  /// **'Not possible at this point'**
  String get playerSkipRefused;

  /// No description provided for @continueRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove from Continue watching'**
  String get continueRemove;

  /// No description provided for @settingsFavoritesAZ.
  ///
  /// In en, this message translates to:
  /// **'Sort favorites by name (A–Z)'**
  String get settingsFavoritesAZ;

  /// No description provided for @settingsKeychain.
  ///
  /// In en, this message translates to:
  /// **'Store passwords in the Keychain'**
  String get settingsKeychain;

  /// No description provided for @settingsKeychainNote.
  ///
  /// In en, this message translates to:
  /// **'Off: passwords stay in the app\'\'s private database. On: macOS keeps them in your login keychain.'**
  String get settingsKeychainNote;

  /// No description provided for @settingsKeychainFailed.
  ///
  /// In en, this message translates to:
  /// **'The Keychain did not accept the passwords. Nothing was changed.'**
  String get settingsKeychainFailed;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bg',
    'bn',
    'cs',
    'de',
    'el',
    'en',
    'es',
    'fa',
    'fr',
    'he',
    'hi',
    'hu',
    'id',
    'it',
    'ja',
    'ko',
    'nl',
    'pl',
    'pt',
    'ro',
    'ru',
    'sq',
    'sv',
    'th',
    'tr',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+script codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.scriptCode) {
          case 'Hans':
            return AppLocalizationsZhHans();
          case 'Hant':
            return AppLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fr':
      return AppLocalizationsFr();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sq':
      return AppLocalizationsSq();
    case 'sv':
      return AppLocalizationsSv();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
