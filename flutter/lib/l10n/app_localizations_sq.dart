// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Drejtpërdrejt';

  @override
  String get tabMovies => 'Filma';

  @override
  String get tabSeries => 'Seriale';

  @override
  String get catAll => 'Të gjitha';

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
  String get catFavorites => 'Të preferuarat';

  @override
  String get catContinue => 'Vazhdo shikimin';

  @override
  String get catFilter => 'Filtro kategoritë';

  @override
  String get playlistAll => 'Të gjitha listat e luajtjes';

  @override
  String get playlistLabel => 'Lista e luajtjes';

  @override
  String get aboutAcknowledgements => 'Falënderime';

  @override
  String get aboutPrivacy => 'Privatësia';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV nuk mbledh asnjë të dhënë për ju. Nuk ka llogari, analitikë, reklama apo gjurmim.\n\nBurimet, të preferuarat dhe historiku i shikimit mbeten në këtë pajisje. Aplikacioni lidhet vetëm me adresat që shtoni vetë: serverin e ofruesit tuaj, listën e luajtjes, udhëzuesin e programit, logot dhe transmetimet.\n\nFjalëkalimet e ofruesit ruhen vetëm në iOS Keychain në këtë pajisje. Ato nuk përfshihen kurrë në një skedar kopjeruajtjeje.\n\nBattleStation TV nuk përfshin kanale, filma apo lista luajtjeje. Burimin e sillni ju.';

  @override
  String get aboutSource => 'Kodi burimor dhe licenca';

  @override
  String get aboutCoffee => 'Më blini një kafe';

  @override
  String get tipsTitle => 'Mbështetni BattleStation TV';

  @override
  String get tipsFooter =>
      'Bakshish opsional përmes Apple. Nuk zhbllokon asgjë: të gjitha veçoritë mbeten falas për të gjithë.';

  @override
  String get tipsThanks => 'Faleminderit për mbështetjen!';

  @override
  String get tipsPending => 'Në pritje të miratimit.';

  @override
  String get tipsFailed => 'Bakshishi nuk kaloi. Provoni përsëri më vonë.';

  @override
  String get aboutVersion => 'Versioni';

  @override
  String get catTitle => 'Kategoritë';

  @override
  String get commonCancel => 'Anulo';

  @override
  String get emptyContinue => 'Asgjë për të vazhduar';

  @override
  String get emptyContinueHint =>
      'Filmat dhe episodet që ndalni në mes shfaqen këtu.';

  @override
  String get emptyFavorites => 'Ende pa të preferuara';

  @override
  String get emptyFavoritesHint =>
      'Shtypni gjatë një titull, pastaj zgjidhni Shto te të preferuarat.';

  @override
  String get emptyFavoritesLive =>
      'Rrëshqitni një kanal majtas, pastaj trokitni te ylli.';

  @override
  String get emptyNone => 'Ende asgjë këtu';

  @override
  String get emptyNoneHint =>
      'Tërhiqeni poshtë për të rifreskuar, ose kontrolloni burimin te Cilësimet.';

  @override
  String get fieldServerInvalid =>
      'Kjo adresë nuk duket e saktë. Shembull: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Futni lidhjen e plotë, që fillon me http:// ose https://';

  @override
  String get infoResume => 'Vazhdo';

  @override
  String get libraryEmpty => 'Libraria juaj është bosh';

  @override
  String get libraryEmptyHint =>
      'Të preferuarat dhe titujt që filluat t’i shihni shfaqen këtu.';

  @override
  String get onbNoChannels =>
      'BattleStation TV nuk përfshin kanale, filma apo lista luajtjeje. Shtoni një burim nga një ofrues te i cili keni abonim.';

  @override
  String get onbPasteHint => 'Keni kopjuar një lidhje liste luajtjeje?';

  @override
  String get onbTestRunning => 'Po testohet…';

  @override
  String passwordBodyIos(String p1) {
    return 'Futni fjalëkalimin për „$p1“. Ruhet në iOS Keychain në këtë pajisje.';
  }

  @override
  String get searchRecent => 'Kërkimet e fundit';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Vazhdo S$p1 E$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'S$p1 E$p2';
  }

  @override
  String get seriesNoEpisodes => 'Nuk u gjet asnjë episod';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Luaj S$p1 E$p2';
  }

  @override
  String get seriesWatched => 'Parë';

  @override
  String get settingsAbout => 'Rreth';

  @override
  String get settingsEditSource => 'Ndrysho burimin';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV përdor gjuhën e pajisjes suaj. Për të përdorur një gjuhë tjetër vetëm për këtë aplikacion, zgjidhni atë te Cilësimet e iOS.';

  @override
  String get settingsOpenIOS => 'Hap Cilësimet e iOS';

  @override
  String get settingsPasswordNote =>
      'Lëreni fjalëkalimin e ri bosh për të mbajtur atë aktual. Fjalëkalimet ruhen në iOS Keychain.';

  @override
  String get settingsTitle => 'Cilësimet';

  @override
  String get sourceDeleteWarn =>
      'Burimi, të preferuarat e tij dhe historiku i shikimit hiqen nga kjo pajisje. Llogaria juaj te ofruesi nuk preket.';

  @override
  String get syncNow => 'Rifresko';

  @override
  String get tabLibrary => 'Libraria';

  @override
  String get scopeCategory => 'Në kategori';

  @override
  String get scopeType => 'Në seksion';

  @override
  String get scopeEverywhere => 'Kudo';

  @override
  String get searchPrompt => 'Kërko';

  @override
  String get syncRunning => 'Po sinkronizohet…';

  @override
  String get syncFailed => 'Sinkronizimi dështoi';

  @override
  String get syncNotUpdated => 'Po shfaqen të dhënat e ruajtura';

  @override
  String get emptyResults => 'Nuk u gjet asgjë';

  @override
  String get favAdd => 'Shto te të preferuarat';

  @override
  String get favRemove => 'Hiq nga të preferuarat';

  @override
  String get playerClose => 'Mbyll';

  @override
  String get playerSubtitles => 'Titrat';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerOff => 'Joaktiv';

  @override
  String get playerAddSubtitle => 'Shto skedar titrash…';

  @override
  String get playerCatchup => 'Shiko emisionet e kaluara';

  @override
  String get playerFullscreen => 'Ekran i plotë';

  @override
  String get playerError => 'Luajtja dështoi';

  @override
  String get playerRetry => 'Provo përsëri';

  @override
  String get playerPip => 'Figurë brenda figure';

  @override
  String get playerPipReturn => 'Kthehu te aplikacioni';

  @override
  String get catchupTitle => 'Rishikim';

  @override
  String get catchupNoEpg =>
      'Nuk ka udhëzues programi. Zgjidhni orën manualisht.';

  @override
  String get catchupPick => 'Ora e fillimit';

  @override
  String get catchupDuration => 'Minuta';

  @override
  String get seriesSeason => 'Sezoni';

  @override
  String get onbWelcomeTitle => 'Mirë se vini në BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Shikoni kanale të drejtpërdrejta, filma dhe seriale nga ofruesi juaj i IPTV. Le të shtojmë burimin tuaj të parë.';

  @override
  String get onbWhereTitle => 'Ku vendosen adresat?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: ofruesi juaj ju jep një adresë serveri (si http://host:8080), një emër përdoruesi dhe një fjalëkalim. Futini më poshtë.';

  @override
  String get onbWhereM3u =>
      'M3U: jepini burimit një emër dhe ngjitni lidhjen e listës së luajtjes që ju dha ofruesi juaj.';

  @override
  String get fieldKind => 'Lloji';

  @override
  String get fieldName => 'Emri';

  @override
  String get fieldServer => 'Adresa e serverit';

  @override
  String get fieldUsername => 'Emri i përdoruesit';

  @override
  String get fieldPassword => 'Fjalëkalimi';

  @override
  String get fieldUrl => 'Lidhja e listës së luajtjes';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Testo lidhjen';

  @override
  String get onbTestOk => 'U lidh me sukses';

  @override
  String get onbTestFail => 'Lidhja dështoi';

  @override
  String get onbNext => 'Tjetra';

  @override
  String get onbBack => 'Prapa';

  @override
  String get onbSave => 'Ruaj dhe sinkronizo';

  @override
  String get settingsAccounts => 'Burimet';

  @override
  String get settingsLanguageSub => 'Gjuhët e preferuara për titrat';

  @override
  String get settingsLanguageAudio => 'Gjuhët e preferuara për audion';

  @override
  String get settingsSubscale => 'Madhësia e titrave';

  @override
  String get settingsSubdelay => 'Vonesa e titrave (sekonda)';

  @override
  String get settingsGuide => 'Shfaq udhëzuesin e fillimit të shpejtë';

  @override
  String get settingsDelete => 'Fshi';

  @override
  String get accountAdd => 'Shto burim…';

  @override
  String get settingsChangePassword => 'Ndrysho fjalëkalimin…';

  @override
  String get settingsNewPassword => 'Fjalëkalimi i ri';

  @override
  String updateAvailable(String p1) {
    return 'Versioni $p1 është i disponueshëm';
  }

  @override
  String get updateNow => 'Përditëso tani';

  @override
  String get updateNotes => 'Çfarë ka të re';

  @override
  String get updateLater => 'Më vonë';

  @override
  String get updateDownloading => 'Po shkarkohet përditësimi…';

  @override
  String updateReady(String p1) {
    return 'Versioni $p1 është gati për instalim';
  }

  @override
  String get updateRestart => 'Rinis për të përditësuar';

  @override
  String get updateFailed => 'Përditësimi dështoi';

  @override
  String get updateManual => 'Shkarko manualisht';

  @override
  String get updateCheckNow => 'Kontrollo për përditësime';

  @override
  String get updateAuto => 'Kontrollo automatikisht për përditësime';

  @override
  String get updateAutoInstall => 'Shkarko automatikisht përditësimet';

  @override
  String get updateUpToDate => 'Keni versionin më të fundit';

  @override
  String get updateDevBuild =>
      'Përditësimet janë të disponueshme vetëm në aplikacionin e instaluar';

  @override
  String updateCurrent(String p1) {
    return 'Versioni aktual: $p1';
  }

  @override
  String get playerBack => 'Prapa';

  @override
  String get playerErrorHint =>
      'Nëse kjo vazhdon të ndodhë, kontrolloni fjalëkalimin e burimit te Cilësimet.';

  @override
  String get passwordTitle => 'Nevojitet fjalëkalimi';

  @override
  String passwordBody(String p1) {
    return 'Futni fjalëkalimin për „$p1“. Ruhet privatisht në këtë Mac.';
  }

  @override
  String get passwordNone => 'Vazhdo pa fjalëkalim';

  @override
  String get playerSpeed => 'Shpejtësia e luajtjes';

  @override
  String get playerSpeedNormal => 'Normale';

  @override
  String get playerSpeedReset => 'Shpejtësia normale';

  @override
  String get settingsSeekPreview => 'Pamje paraprake në shiritin e ecurisë';

  @override
  String get settingsSeekPreviewNote =>
      'Hap një lidhje të dytë me ofruesin tuaj. Çaktivizojeni nëse luajtja ndalon ose ofruesi juaj lejon vetëm një lidhje.';

  @override
  String get playerSeekBar => 'Pozicioni i luajtjes';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 nga $p2';
  }

  @override
  String get playerLive => 'Drejtpërdrejt';

  @override
  String get playerChannelPrev => 'Kanali i mëparshëm';

  @override
  String get playerChannelNext => 'Kanali tjetër';

  @override
  String get playerScaleFit => 'Përshtat';

  @override
  String get playerScaleFill => 'Mbush';

  @override
  String get playerScaleStretch => 'Shtrij';

  @override
  String get playerSubtitleAdjust => 'Rregullo titrat…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Ndriçimi';

  @override
  String get playerVolume => 'Volumi';

  @override
  String get playerReplay => 'Luaj përsëri';

  @override
  String get settingsClock => 'Shfaq orën në luajtës';

  @override
  String get settingsSeekStep =>
      'Hapi i kalimit (tastet me shigjeta dhe butonat e kalimit)';

  @override
  String get settingsBarsHide => 'Fshih kontrollet pas';

  @override
  String get settingsNever => 'Kurrë';

  @override
  String get settingsVideoScale => 'Shkallëzimi i videos';

  @override
  String get settingsScaleFit => 'Përshtat (me shirita të zinj)';

  @override
  String get settingsScaleFill => 'Mbush (i pret skajet)';

  @override
  String get settingsScaleStretch => 'Shtrije';

  @override
  String get settingsVideoScaleHint =>
      'Shtypni A te luajtësi për të kaluar mes të tria opsioneve.';

  @override
  String get settingsBuffer => 'Buferi i rrjetit';

  @override
  String get settingsBufferSmall => 'I vogël';

  @override
  String get settingsBufferNormal => 'Normal';

  @override
  String get settingsBufferLarge => 'I madh';

  @override
  String get settingsBufferHint =>
      'Një bufer më i madh ndihmon në një lidhje të ngadaltë ose të paqëndrueshme.';

  @override
  String unitSeconds(int p1) {
    return '$p1 sek';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 min';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 min';
  }

  @override
  String playerSkipBack(String p1) {
    return 'Prapa $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Përpara $p1';
  }

  @override
  String get playerSleep => 'Kohëmatësi i gjumit';

  @override
  String get downloadsTitle => 'Shkarkimet';

  @override
  String get downloadsAdd => 'Shkarko';

  @override
  String get downloadsSeason => 'Shkarko sezonin';

  @override
  String get downloadsChooseFolder =>
      'Zgjidhni ku të ruhen filmat dhe episodet e shkarkuara';

  @override
  String get downloadsChoose => 'Zgjidh';

  @override
  String get downloadsNotChosen => 'Pyetet në shkarkimin e parë';

  @override
  String get downloadsChange => 'Ndrysho dosjen…';

  @override
  String get downloadsPause => 'Pusho';

  @override
  String get downloadsResume => 'Vazhdo';

  @override
  String get downloadsCancel => 'Anulo';

  @override
  String get downloadsPlay => 'Luaj';

  @override
  String get downloadsReveal => 'Shfaq në Finder';

  @override
  String get downloadsDelete => 'Fshi skedarin';

  @override
  String get downloadsEmpty => 'Ende pa shkarkime';

  @override
  String get downloadsQueued => 'Në pritje';

  @override
  String get downloadsDone => 'Përfunduar';

  @override
  String get downloadsHint =>
      'Shkarkimet kryhen një nga një. Shumë ofrues lejojnë vetëm një lidhje, prandaj luajtja gjatë shkarkimit mund të dështojë. Shkarkimet e papërfunduara nuk ruhen kur aplikacioni mbyllet.';

  @override
  String get epgNow => 'Tani';

  @override
  String get epgNext => 'Më pas';

  @override
  String get settingsFullscreen =>
      'Hap luajtjen në ekran të plotë (kontrollet fshihen derisa të lëvizni mausin)';

  @override
  String get nextTitle => 'Vijon';

  @override
  String nextIn(int p1) {
    return 'Luhet pas $p1 sek';
  }

  @override
  String get nextNow => 'Luaj tani';

  @override
  String get nextCancel => 'Anulo';

  @override
  String get settingsAutoNext => 'Luaj automatikisht episodin tjetër';

  @override
  String get downloadsNoSpace =>
      'Nuk ka hapësirë të mjaftueshme të lirë në disk';

  @override
  String get dbErrorTitle =>
      'BattleStation TV nuk mund ta hapë bazën e tij të të dhënave';

  @override
  String get dbErrorBody =>
      'Nëse një kopje tjetër e BattleStation TV po ekzekutohet, mbylleni dhe provoni përsëri.';

  @override
  String get dbRecoveredTitle => 'Baza e të dhënave ishte e dëmtuar';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV nisi me një bazë të dhënash të re (shtoni burimin tuaj përsëri). Skedari i dëmtuar u ruajt këtu:\n$p1';
  }

  @override
  String get menuShowWindow => 'Shfaq dritaren';

  @override
  String get settingsTabGeneral => 'Të përgjithshme';

  @override
  String get settingsTabPlayer => 'Luajtësi';

  @override
  String get settingsTabPlaylists => 'Listat e luajtjes';

  @override
  String get settingsAppearance => 'Pamja';

  @override
  String get settingsSystem => 'Sistemi';

  @override
  String get appearanceLight => 'E çelët';

  @override
  String get appearanceDark => 'E errët';

  @override
  String get settingsInterfaceLanguage => 'Gjuha e ndërfaqes';

  @override
  String get settingsLanguageRestart =>
      'Hyn në fuqi pas rinisjes së BattleStation TV.';

  @override
  String get settingsHideCategories => 'Fshih kategoritë';

  @override
  String get settingsHideCategoriesWords => 'Fjalët për t’u fshehur';

  @override
  String get settingsHideCategoriesNote =>
      'Fsheh kategoritë emri i të cilave përmban këto fjalë (ndajini me presje). Kanalet, filmat dhe serialet e tyre zhduken edhe nga kërkimi, të preferuarat dhe vazhdimi i shikimit. Ky është një filtër i thjeshtë, jo një kyç prindëror: kushdo mund ta ndryshojë këtu.';

  @override
  String get settingsRefresh => 'Përditëso listat e luajtjes';

  @override
  String get settingsRefresh0 => 'Vetëm kur hapet aplikacioni';

  @override
  String get settingsRefresh6 => 'Çdo 6 orë';

  @override
  String get settingsRefresh12 => 'Çdo 12 orë';

  @override
  String get settingsRefresh24 => 'Çdo 24 orë';

  @override
  String get settingsBackup => 'Kopjeruajtja dhe rikthimi';

  @override
  String get backupExport => 'Eksporto kopjeruajtjen…';

  @override
  String get backupImport => 'Importo kopjeruajtjen…';

  @override
  String get backupWarn =>
      'Skedari i kopjeruajtjes liston listat tuaja të luajtjes me adresat e tyre, të cilat mund të përfshijnë të dhëna hyrjeje, prandaj mbajeni privat. Fjalëkalimet e burimeve Xtream nuk ruhen në të. Importimi shton te burimet tuaja aktuale dhe nuk fshin asgjë.';

  @override
  String get backupExported => 'Kopjeruajtja u ruajt.';

  @override
  String get backupImported => 'Kopjeruajtja u importua.';

  @override
  String get backupErrorInvalid =>
      'Ky nuk është skedar kopjeruajtjeje i BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'Kjo kopjeruajtje vjen nga një version tjetër i BattleStation TV dhe nuk mund të lexohet.';

  @override
  String get backupErrorTooLarge =>
      'Ky skedar është shumë i madh për të qenë kopjeruajtje.';

  @override
  String get backupFailed => 'Kopjeruajtja dështoi';

  @override
  String get settingsClearData => 'Pastro të dhënat';

  @override
  String get clearHistory => 'Pastro historikun e shikimit';

  @override
  String get clearFavorites => 'Pastro të preferuarat';

  @override
  String get clearImages => 'Pastro memorien e fshehtë të imazheve';

  @override
  String get clearConfirm => 'Pastro';

  @override
  String get clearHistoryWarn =>
      'Pozicionet e rifillimit dhe listat e vazhdimit të shikimit të të gjitha burimeve do të fshihen. Ky veprim nuk mund të zhbëhet.';

  @override
  String get clearFavoritesWarn =>
      'Të preferuarat tuaja në të gjitha burimet do të hiqen. Ky veprim nuk mund të zhbëhet.';

  @override
  String get clearImagesWarn =>
      'Logot dhe posterat e ruajtura hiqen dhe shkarkohen përsëri kur nevojiten.';

  @override
  String get infoDetails => 'Detajet';

  @override
  String get infoPlot => 'Përmbledhja';

  @override
  String get infoCast => 'Aktorët';

  @override
  String get infoDirector => 'Regjisori';

  @override
  String get infoGenre => 'Zhanri';

  @override
  String get infoYear => 'Viti i daljes';

  @override
  String get infoRating => 'Vlerësimi';

  @override
  String get infoDuration => 'Kohëzgjatja';

  @override
  String get infoCountry => 'Shteti';

  @override
  String get infoTrailer => 'Trailer';

  @override
  String get infoPlay => 'Luaj';

  @override
  String get infoEmpty => 'Ofruesi juaj nuk ka detaje për këtë titull.';

  @override
  String get infoLoading => 'Po ngarkohen detajet…';

  @override
  String get infoError => 'Detajet nuk u ngarkuan.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 orë';
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
  String get playerSkipIntro => 'Kapërce hyrjen';

  @override
  String get playerSkipCredits => 'Kapërce titrat e fundit';

  @override
  String get playerSkipMenu => 'Hyrja dhe titrat e fundit';

  @override
  String get playerMarkIntroStart => 'Hyrja fillon këtu';

  @override
  String get playerMarkIntroEnd => 'Hyrja mbaron këtu';

  @override
  String get playerMarkCredits => 'Titrat e fundit fillojnë këtu';

  @override
  String get playerSkipForget => 'Harro hyrjen dhe titrat';

  @override
  String get playerSkipSaved =>
      'Ruajtur për të gjitha episodet e këtij seriali';

  @override
  String get playerSkipRefused => 'Nuk është e mundur në këtë pikë';

  @override
  String get continueRemove => 'Hiqe nga Vazhdo shikimin';

  @override
  String get settingsFavoritesAZ => 'Rendit të preferuarat sipas emrit (A–Zh)';

  @override
  String get settingsKeychain => 'Ruaj fjalëkalimet në Keychain';

  @override
  String get settingsKeychainNote =>
      'Joaktiv: fjalëkalimet mbeten në bazën private të të dhënave të aplikacionit. Aktiv: macOS i mban në keychain-in tënd të hyrjes.';

  @override
  String get settingsKeychainFailed =>
      'Keychain nuk i pranoi fjalëkalimet. Nuk ndryshoi asgjë.';
}
