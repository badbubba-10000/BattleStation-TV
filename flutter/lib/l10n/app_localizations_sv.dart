// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Direkt';

  @override
  String get tabMovies => 'Filmer';

  @override
  String get tabSeries => 'Serier';

  @override
  String get catAll => 'Alla';

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
  String get catFavorites => 'Favoriter';

  @override
  String get catContinue => 'Fortsätt titta';

  @override
  String get catFilter => 'Filtrera kategorier';

  @override
  String get playlistAll => 'Alla spellistor';

  @override
  String get playlistLabel => 'Spellista';

  @override
  String get aboutAcknowledgements => 'Tack till';

  @override
  String get aboutPrivacy => 'Integritet';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV samlar inte in några uppgifter om dig. Det finns inget konto, ingen analys, ingen reklam och ingen spårning.\n\nDina källor, favoriter och din visningshistorik stannar på den här enheten. Appen ansluter bara till de adresser du lägger till själv: leverantörens server, spellista, tablå, logotyper och strömmar.\n\nLeverantörens lösenord lagras i iOS Keychain, bara på den här enheten. De ingår aldrig i en säkerhetskopia.\n\nBattleStation TV innehåller inga kanaler, filmer eller spellistor. Du tar med din egen källa.';

  @override
  String get aboutSource => 'Källkod och licens';

  @override
  String get aboutCoffee => 'Bjud mig på en kaffe';

  @override
  String get tipsTitle => 'Stöd BattleStation TV';

  @override
  String get tipsFooter =>
      'Frivilliga dricks via Apple. De låser inte upp något: alla funktioner förblir gratis för alla.';

  @override
  String get tipsThanks => 'Tack för ditt stöd!';

  @override
  String get tipsPending => 'Väntar på godkännande.';

  @override
  String get tipsFailed => 'Dricksen gick inte igenom. Försök igen senare.';

  @override
  String get aboutVersion => 'Version';

  @override
  String get catTitle => 'Kategorier';

  @override
  String get commonCancel => 'Avbryt';

  @override
  String get emptyContinue => 'Inget att fortsätta titta på';

  @override
  String get emptyContinueHint =>
      'Filmer och avsnitt som du slutar titta på halvvägs visas här.';

  @override
  String get emptyFavorites => 'Inga favoriter än';

  @override
  String get emptyFavoritesHint =>
      'Tryck och håll på en titel och välj sedan Lägg till i favoriter.';

  @override
  String get emptyFavoritesLive =>
      'Svep en kanal åt vänster och tryck sedan på stjärnan.';

  @override
  String get emptyNone => 'Inget här än';

  @override
  String get emptyNoneHint =>
      'Dra nedåt för att uppdatera eller kontrollera din källa i Inställningar.';

  @override
  String get fieldServerInvalid =>
      'Adressen ser inte rätt ut. Exempel: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Ange hela länken, som börjar med http:// eller https://';

  @override
  String get infoResume => 'Återuppta';

  @override
  String get libraryEmpty => 'Ditt bibliotek är tomt';

  @override
  String get libraryEmptyHint =>
      'Favoriter och titlar som du har börjat titta på visas här.';

  @override
  String get onbNoChannels =>
      'BattleStation TV innehåller inga kanaler, filmer eller spellistor. Lägg till en källa från en leverantör som du prenumererar hos.';

  @override
  String get onbPasteHint => 'Har du kopierat en spellistlänk?';

  @override
  String get onbTestRunning => 'Testar…';

  @override
  String passwordBodyIos(String p1) {
    return 'Ange lösenordet för ”$p1”. Det lagras i iOS Keychain på den här enheten.';
  }

  @override
  String get searchRecent => 'Senaste sökningar';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Fortsätt S$p1 A$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'S$p1 A$p2';
  }

  @override
  String get seriesNoEpisodes => 'Inga avsnitt hittades';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Spela upp S$p1 A$p2';
  }

  @override
  String get seriesWatched => 'Sett';

  @override
  String get settingsAbout => 'Om';

  @override
  String get settingsEditSource => 'Redigera källa';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV använder enhetens språk. Om du vill använda ett annat språk bara för den här appen väljer du det i iOS-inställningarna.';

  @override
  String get settingsOpenIOS => 'Öppna iOS-inställningar';

  @override
  String get settingsPasswordNote =>
      'Lämna det nya lösenordet tomt för att behålla det nuvarande. Lösenord lagras i iOS Keychain.';

  @override
  String get settingsTitle => 'Inställningar';

  @override
  String get sourceDeleteWarn =>
      'Källan, dess favoriter och dess visningshistorik tas bort från den här enheten. Ditt konto hos leverantören påverkas inte.';

  @override
  String get syncNow => 'Uppdatera';

  @override
  String get tabLibrary => 'Bibliotek';

  @override
  String get scopeCategory => 'I kategorin';

  @override
  String get scopeType => 'I avdelningen';

  @override
  String get scopeEverywhere => 'Överallt';

  @override
  String get searchPrompt => 'Sök';

  @override
  String get syncRunning => 'Synkroniserar…';

  @override
  String get syncFailed => 'Synkroniseringen misslyckades';

  @override
  String get syncNotUpdated => 'Visar sparad data';

  @override
  String get emptyResults => 'Inga resultat';

  @override
  String get favAdd => 'Lägg till i favoriter';

  @override
  String get favRemove => 'Ta bort från favoriter';

  @override
  String get playerClose => 'Stäng';

  @override
  String get playerSubtitles => 'Undertexter';

  @override
  String get playerAudio => 'Ljud';

  @override
  String get playerOff => 'Av';

  @override
  String get playerAddSubtitle => 'Lägg till undertextfil…';

  @override
  String get playerCatchup => 'Titta i efterhand';

  @override
  String get playerFullscreen => 'Helskärm';

  @override
  String get playerError => 'Uppspelningen misslyckades';

  @override
  String get playerRetry => 'Försök igen';

  @override
  String get playerPip => 'Bild i bild';

  @override
  String get playerPipReturn => 'Tillbaka till appen';

  @override
  String get catchupTitle => 'Titta i efterhand';

  @override
  String get catchupNoEpg => 'Ingen TV-tablå. Välj tid manuellt.';

  @override
  String get catchupPick => 'Starttid';

  @override
  String get catchupDuration => 'Minuter';

  @override
  String get seriesSeason => 'Säsong';

  @override
  String get onbWelcomeTitle => 'Välkommen till BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Titta på livekanaler, filmer och serier från din IPTV-leverantör. Nu lägger vi till din första källa.';

  @override
  String get onbWhereTitle => 'Var anger jag adresserna?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: din leverantör ger dig en serveradress (till exempel http://host:8080), ett användarnamn och ett lösenord. Ange dem nedan.';

  @override
  String get onbWhereM3u =>
      'M3U: ge källan ett namn och klistra in spellistlänken som du fick av din leverantör.';

  @override
  String get fieldKind => 'Typ';

  @override
  String get fieldName => 'Namn';

  @override
  String get fieldServer => 'Serveradress';

  @override
  String get fieldUsername => 'Användarnamn';

  @override
  String get fieldPassword => 'Lösenord';

  @override
  String get fieldUrl => 'Spellistlänk';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Testa anslutningen';

  @override
  String get onbTestOk => 'Anslutningen lyckades';

  @override
  String get onbTestFail => 'Anslutningen misslyckades';

  @override
  String get onbNext => 'Nästa';

  @override
  String get onbBack => 'Tillbaka';

  @override
  String get onbSave => 'Spara och synkronisera';

  @override
  String get settingsAccounts => 'Källor';

  @override
  String get settingsLanguageSub => 'Önskade undertextspråk';

  @override
  String get settingsLanguageAudio => 'Önskade ljudspråk';

  @override
  String get settingsSubscale => 'Undertextstorlek';

  @override
  String get settingsSubdelay => 'Undertextfördröjning (sekunder)';

  @override
  String get settingsGuide => 'Visa snabbstartsguiden';

  @override
  String get settingsDelete => 'Ta bort';

  @override
  String get accountAdd => 'Lägg till källa…';

  @override
  String get settingsChangePassword => 'Ändra lösenord…';

  @override
  String get settingsNewPassword => 'Nytt lösenord';

  @override
  String updateAvailable(String p1) {
    return 'Version $p1 är tillgänglig';
  }

  @override
  String get updateNow => 'Uppdatera nu';

  @override
  String get updateNotes => 'Nyheter';

  @override
  String get updateLater => 'Senare';

  @override
  String get updateDownloading => 'Hämtar uppdatering…';

  @override
  String updateReady(String p1) {
    return 'Version $p1 är redo att installeras';
  }

  @override
  String get updateRestart => 'Starta om för att uppdatera';

  @override
  String get updateFailed => 'Uppdateringen misslyckades';

  @override
  String get updateManual => 'Hämta manuellt';

  @override
  String get updateCheckNow => 'Sök efter uppdateringar';

  @override
  String get updateAuto => 'Sök efter uppdateringar automatiskt';

  @override
  String get updateAutoInstall => 'Hämta uppdateringar automatiskt';

  @override
  String get updateUpToDate => 'Du har den senaste versionen';

  @override
  String get updateDevBuild =>
      'Uppdateringar finns bara i den installerade appen';

  @override
  String updateCurrent(String p1) {
    return 'Aktuell version: $p1';
  }

  @override
  String get playerBack => 'Tillbaka';

  @override
  String get playerErrorHint =>
      'Om det här fortsätter, kontrollera källans lösenord i Inställningar.';

  @override
  String get passwordTitle => 'Lösenord krävs';

  @override
  String passwordBody(String p1) {
    return 'Ange lösenordet för ”$p1”. Det lagras privat på den här Macen.';
  }

  @override
  String get passwordNone => 'Fortsätt utan lösenord';

  @override
  String get playerSpeed => 'Uppspelningshastighet';

  @override
  String get playerSpeedNormal => 'Normal';

  @override
  String get playerSpeedReset => 'Normal hastighet';

  @override
  String get settingsSeekPreview => 'Förhandsvisning på tidslinjen';

  @override
  String get settingsSeekPreviewNote =>
      'Öppnar en andra anslutning till din leverantör. Stäng av om uppspelningen avbryts eller om din leverantör bara tillåter en anslutning.';

  @override
  String get playerSeekBar => 'Uppspelningsposition';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 av $p2';
  }

  @override
  String get playerLive => 'Live';

  @override
  String get playerChannelPrev => 'Föregående kanal';

  @override
  String get playerChannelNext => 'Nästa kanal';

  @override
  String get playerScaleFit => 'Anpassa';

  @override
  String get playerScaleFill => 'Fyll';

  @override
  String get playerScaleStretch => 'Sträck';

  @override
  String get playerSubtitleAdjust => 'Justera undertexter…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Ljusstyrka';

  @override
  String get playerVolume => 'Volym';

  @override
  String get playerReplay => 'Spela igen';

  @override
  String get settingsClock => 'Visa klockan i spelaren';

  @override
  String get settingsSeekStep => 'Hoppsteg (piltangenter och hoppknappar)';

  @override
  String get settingsBarsHide => 'Dölj reglagen efter';

  @override
  String get settingsNever => 'Aldrig';

  @override
  String get settingsVideoScale => 'Videoskala';

  @override
  String get settingsScaleFit => 'Anpassa (svarta kanter)';

  @override
  String get settingsScaleFill => 'Fyll (beskär kanterna)';

  @override
  String get settingsScaleStretch => 'Sträck ut';

  @override
  String get settingsVideoScaleHint =>
      'Tryck på A i spelaren för att växla mellan de tre.';

  @override
  String get settingsBuffer => 'Nätverksbuffert';

  @override
  String get settingsBufferSmall => 'Liten';

  @override
  String get settingsBufferNormal => 'Normal';

  @override
  String get settingsBufferLarge => 'Stor';

  @override
  String get settingsBufferHint =>
      'En större buffert hjälper vid en långsam eller instabil anslutning.';

  @override
  String unitSeconds(int p1) {
    return '$p1 s';
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
    return 'Bakåt $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Framåt $p1';
  }

  @override
  String get playerSleep => 'Sovtimer';

  @override
  String get downloadsTitle => 'Hämtningar';

  @override
  String get downloadsAdd => 'Hämta';

  @override
  String get downloadsSeason => 'Hämta säsong';

  @override
  String get downloadsChooseFolder =>
      'Välj var hämtade filmer och avsnitt ska sparas';

  @override
  String get downloadsChoose => 'Välj';

  @override
  String get downloadsNotChosen => 'Frågar vid första hämtningen';

  @override
  String get downloadsChange => 'Ändra mapp…';

  @override
  String get downloadsPause => 'Pausa';

  @override
  String get downloadsResume => 'Återuppta';

  @override
  String get downloadsCancel => 'Avbryt';

  @override
  String get downloadsPlay => 'Spela upp';

  @override
  String get downloadsReveal => 'Visa i Finder';

  @override
  String get downloadsDelete => 'Ta bort fil';

  @override
  String get downloadsEmpty => 'Inga hämtningar än';

  @override
  String get downloadsQueued => 'Väntar';

  @override
  String get downloadsDone => 'Klar';

  @override
  String get downloadsHint =>
      'Hämtningar sker en i taget. Många leverantörer tillåter bara en anslutning, så uppspelning under hämtning kan misslyckas. Ofullständiga hämtningar sparas inte när appen avslutas.';

  @override
  String get epgNow => 'Nu';

  @override
  String get epgNext => 'Nästa';

  @override
  String get settingsFullscreen =>
      'Öppna uppspelning i helskärm (reglagen döljs tills du rör musen)';

  @override
  String get nextTitle => 'Härnäst';

  @override
  String nextIn(int p1) {
    return 'Spelas upp om $p1 s';
  }

  @override
  String get nextNow => 'Spela upp nu';

  @override
  String get nextCancel => 'Avbryt';

  @override
  String get settingsAutoNext => 'Spela upp nästa avsnitt automatiskt';

  @override
  String get downloadsNoSpace => 'Inte tillräckligt med ledigt diskutrymme';

  @override
  String get dbErrorTitle => 'BattleStation TV kan inte öppna sin databas';

  @override
  String get dbErrorBody =>
      'Om en annan kopia av BattleStation TV körs, avsluta den och försök igen.';

  @override
  String get dbRecoveredTitle => 'Databasen var skadad';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV startade med en ny databas (lägg till din källa igen). Den skadade filen sparades här:\n$p1';
  }

  @override
  String get menuShowWindow => 'Visa fönster';

  @override
  String get settingsTabGeneral => 'Allmänt';

  @override
  String get settingsTabPlayer => 'Spelare';

  @override
  String get settingsTabPlaylists => 'Spellistor';

  @override
  String get settingsAppearance => 'Utseende';

  @override
  String get settingsSystem => 'System';

  @override
  String get appearanceLight => 'Ljust';

  @override
  String get appearanceDark => 'Mörkt';

  @override
  String get settingsInterfaceLanguage => 'Gränssnittsspråk';

  @override
  String get settingsLanguageRestart =>
      'Börjar gälla efter omstart av BattleStation TV.';

  @override
  String get settingsHideCategories => 'Dölj kategorier';

  @override
  String get settingsHideCategoriesWords => 'Ord att dölja';

  @override
  String get settingsHideCategoriesNote =>
      'Dölj kategorier vars namn innehåller dessa ord (separera dem med kommatecken). Deras kanaler, filmer och serier försvinner också från sökning, favoriter och fortsätt titta. Det här är ett enkelt filter, inte ett föräldraskydd: vem som helst kan ändra det här.';

  @override
  String get settingsRefresh => 'Uppdatera spellistor';

  @override
  String get settingsRefresh0 => 'Bara när appen öppnas';

  @override
  String get settingsRefresh6 => 'Var 6:e timme';

  @override
  String get settingsRefresh12 => 'Var 12:e timme';

  @override
  String get settingsRefresh24 => 'Var 24:e timme';

  @override
  String get settingsBackup => 'Säkerhetskopiering och återställning';

  @override
  String get backupExport => 'Exportera säkerhetskopia…';

  @override
  String get backupImport => 'Importera säkerhetskopia…';

  @override
  String get backupWarn =>
      'Säkerhetskopian listar dina spellistor med deras adresser, som kan innehålla inloggningsuppgifter, så håll den privat. Lösenord för Xtream-källor sparas inte i den. Vid import läggs innehållet till dina nuvarande källor och inget raderas.';

  @override
  String get backupExported => 'Säkerhetskopian sparades.';

  @override
  String get backupImported => 'Säkerhetskopian importerades.';

  @override
  String get backupErrorInvalid =>
      'Det här är inte en BattleStation TV-säkerhetskopia.';

  @override
  String get backupErrorVersion =>
      'Den här säkerhetskopian kommer från en annan version av BattleStation TV och kan inte läsas.';

  @override
  String get backupErrorTooLarge =>
      'Filen är för stor för att vara en säkerhetskopia.';

  @override
  String get backupFailed => 'Säkerhetskopieringen misslyckades';

  @override
  String get settingsClearData => 'Rensa data';

  @override
  String get clearHistory => 'Rensa visningshistorik';

  @override
  String get clearFavorites => 'Rensa favoriter';

  @override
  String get clearImages => 'Rensa bildcache';

  @override
  String get clearConfirm => 'Rensa';

  @override
  String get clearHistoryWarn =>
      'Återupptagningspositioner och fortsätt titta-listorna för alla källor raderas. Det går inte att ångra.';

  @override
  String get clearFavoritesWarn =>
      'Dina favoriter i alla källor tas bort. Det går inte att ångra.';

  @override
  String get clearImagesWarn =>
      'Sparade logotyper och affischer tas bort och hämtas igen vid behov.';

  @override
  String get infoDetails => 'Detaljer';

  @override
  String get infoPlot => 'Handling';

  @override
  String get infoCast => 'Skådespelare';

  @override
  String get infoDirector => 'Regissör';

  @override
  String get infoGenre => 'Genre';

  @override
  String get infoYear => 'Utgivningsår';

  @override
  String get infoRating => 'Betyg';

  @override
  String get infoDuration => 'Längd';

  @override
  String get infoCountry => 'Land';

  @override
  String get infoTrailer => 'Trailer';

  @override
  String get infoPlay => 'Spela upp';

  @override
  String get infoEmpty => 'Din leverantör har inga detaljer om den här titeln.';

  @override
  String get infoLoading => 'Läser in detaljer…';

  @override
  String get infoError => 'Det gick inte att läsa in detaljerna.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 tim';
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
  String get playerSkipIntro => 'Hoppa över intro';

  @override
  String get playerSkipCredits => 'Hoppa över eftertexter';

  @override
  String get playerSkipMenu => 'Intro och eftertexter';

  @override
  String get playerMarkIntroStart => 'Introt börjar här';

  @override
  String get playerMarkIntroEnd => 'Introt slutar här';

  @override
  String get playerMarkCredits => 'Eftertexterna börjar här';

  @override
  String get playerSkipForget => 'Glöm intro och eftertexter';

  @override
  String get playerSkipSaved => 'Sparat för alla avsnitt i serien';

  @override
  String get playerSkipRefused => 'Inte möjligt på den här punkten';

  @override
  String get continueRemove => 'Ta bort från Fortsätt titta';

  @override
  String get settingsFavoritesAZ => 'Sortera favoriter efter namn (A–Ö)';

  @override
  String get settingsKeychain => 'Spara lösenord i nyckelringen';

  @override
  String get settingsKeychainNote =>
      'Av: lösenorden stannar i appens privata databas. På: macOS sparar dem i din inloggningsnyckelring.';

  @override
  String get settingsKeychainFailed =>
      'Nyckelringen tog inte emot lösenorden. Inget ändrades.';
}
