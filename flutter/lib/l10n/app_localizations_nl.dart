// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Live';

  @override
  String get tabMovies => 'Films';

  @override
  String get tabSeries => 'Series';

  @override
  String get catAll => 'Alle';

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
  String get catFavorites => 'Favorieten';

  @override
  String get catContinue => 'Verder kijken';

  @override
  String get catFilter => 'Categorieën filteren';

  @override
  String get playlistAll => 'Alle afspeellijsten';

  @override
  String get playlistLabel => 'Afspeellijst';

  @override
  String get aboutAcknowledgements => 'Dankbetuigingen';

  @override
  String get aboutPrivacy => 'Privacy';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV verzamelt geen gegevens over jou. Er is geen account, geen analyse, geen reclame en geen tracking.\n\nJe bronnen, favorieten en kijkgeschiedenis blijven op dit apparaat. De app maakt alleen verbinding met de adressen die je zelf toevoegt: de server van je aanbieder, afspeellijst, tv-gids, logo’s en streams.\n\nWachtwoorden van aanbieders worden alleen op dit apparaat bewaard in de iOS Keychain. Ze worden nooit opgenomen in een reservekopiebestand.\n\nBattleStation TV bevat geen zenders, films of afspeellijsten. Je neemt zelf een bron mee.';

  @override
  String get aboutSource => 'Broncode en licentie';

  @override
  String get aboutCoffee => 'Trakteer me op een koffie';

  @override
  String get tipsTitle => 'Steun BattleStation TV';

  @override
  String get tipsFooter =>
      'Vrijwillige fooi via Apple. Er wordt niets mee ontgrendeld: alle functies blijven gratis voor iedereen.';

  @override
  String get tipsThanks => 'Bedankt voor je steun!';

  @override
  String get tipsPending => 'Wacht op goedkeuring.';

  @override
  String get tipsFailed => 'De fooi is niet gelukt. Probeer het later opnieuw.';

  @override
  String get aboutVersion => 'Versie';

  @override
  String get catTitle => 'Categorieën';

  @override
  String get commonCancel => 'Annuleer';

  @override
  String get emptyContinue => 'Niets om verder te kijken';

  @override
  String get emptyContinueHint =>
      'Films en afleveringen die je halverwege stopt, verschijnen hier.';

  @override
  String get emptyFavorites => 'Nog geen favorieten';

  @override
  String get emptyFavoritesHint =>
      'Houd een titel ingedrukt en kies Voeg toe aan favorieten.';

  @override
  String get emptyFavoritesLive =>
      'Veeg een zender naar links en tik op de ster.';

  @override
  String get emptyNone => 'Hier is nog niets';

  @override
  String get emptyNoneHint =>
      'Sleep omlaag om te verversen, of controleer je bron in Instellingen.';

  @override
  String get fieldServerInvalid =>
      'Dit adres lijkt niet te kloppen. Voorbeeld: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Voer de volledige link in, beginnend met http:// of https://';

  @override
  String get infoResume => 'Hervat';

  @override
  String get libraryEmpty => 'Je bibliotheek is leeg';

  @override
  String get libraryEmptyHint =>
      'Favorieten en titels die je bent gaan kijken, verschijnen hier.';

  @override
  String get onbNoChannels =>
      'BattleStation TV bevat geen zenders, films of afspeellijsten. Voeg een bron toe van een aanbieder waarbij je een abonnement hebt.';

  @override
  String get onbPasteHint => 'Een afspeellijstlink gekopieerd?';

  @override
  String get onbTestRunning => 'Testen…';

  @override
  String passwordBodyIos(String p1) {
    return 'Voer het wachtwoord in voor “$p1”. Het wordt bewaard in de iOS Keychain op dit apparaat.';
  }

  @override
  String get searchRecent => 'Recente zoekopdrachten';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Verder kijken S$p1 A$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'S$p1 A$p2';
  }

  @override
  String get seriesNoEpisodes => 'Geen afleveringen gevonden';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Speel S$p1 A$p2 af';
  }

  @override
  String get seriesWatched => 'Bekeken';

  @override
  String get settingsAbout => 'Over';

  @override
  String get settingsEditSource => 'Wijzig bron';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV gebruikt de taal van je apparaat. Wil je alleen voor deze app een andere taal gebruiken, kies die dan in de iOS-instellingen.';

  @override
  String get settingsOpenIOS => 'Open iOS-instellingen';

  @override
  String get settingsPasswordNote =>
      'Laat het nieuwe wachtwoord leeg om het huidige te behouden. Wachtwoorden worden bewaard in de iOS Keychain.';

  @override
  String get settingsTitle => 'Instellingen';

  @override
  String get sourceDeleteWarn =>
      'De bron, de favorieten en de kijkgeschiedenis ervan worden van dit apparaat verwijderd. Je account bij de aanbieder blijft ongewijzigd.';

  @override
  String get syncNow => 'Ververs';

  @override
  String get tabLibrary => 'Bibliotheek';

  @override
  String get scopeCategory => 'In categorie';

  @override
  String get scopeType => 'In sectie';

  @override
  String get scopeEverywhere => 'Overal';

  @override
  String get searchPrompt => 'Zoek';

  @override
  String get syncRunning => 'Synchroniseren…';

  @override
  String get syncFailed => 'Synchroniseren mislukt';

  @override
  String get syncNotUpdated => 'Opgeslagen gegevens worden getoond';

  @override
  String get emptyResults => 'Niets gevonden';

  @override
  String get favAdd => 'Voeg toe aan favorieten';

  @override
  String get favRemove => 'Verwijder uit favorieten';

  @override
  String get playerClose => 'Sluit';

  @override
  String get playerSubtitles => 'Ondertitels';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerOff => 'Uit';

  @override
  String get playerAddSubtitle => 'Voeg ondertitelbestand toe…';

  @override
  String get playerCatchup => 'Programma terugkijken';

  @override
  String get playerFullscreen => 'Volledig scherm';

  @override
  String get playerError => 'Afspelen mislukt';

  @override
  String get playerRetry => 'Probeer opnieuw';

  @override
  String get playerPip => 'Beeld-in-beeld';

  @override
  String get playerPipReturn => 'Terug naar de app';

  @override
  String get catchupTitle => 'Terugkijken';

  @override
  String get catchupNoEpg =>
      'Geen tv-gids beschikbaar. Kies handmatig een tijd.';

  @override
  String get catchupPick => 'Starttijd';

  @override
  String get catchupDuration => 'Minuten';

  @override
  String get seriesSeason => 'Seizoen';

  @override
  String get onbWelcomeTitle => 'Welkom bij BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Bekijk live zenders, films en series van je IPTV-aanbieder. Laten we je eerste bron toevoegen.';

  @override
  String get onbWhereTitle => 'Waar vul je de adressen in?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: je aanbieder geeft je een serveradres (zoals http://host:8080), een gebruikersnaam en een wachtwoord. Vul ze hieronder in.';

  @override
  String get onbWhereM3u =>
      'M3U: geef de bron een naam en plak de afspeellijstlink die je aanbieder je heeft gegeven.';

  @override
  String get fieldKind => 'Type';

  @override
  String get fieldName => 'Naam';

  @override
  String get fieldServer => 'Serveradres';

  @override
  String get fieldUsername => 'Gebruikersnaam';

  @override
  String get fieldPassword => 'Wachtwoord';

  @override
  String get fieldUrl => 'Afspeellijstlink';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Test verbinding';

  @override
  String get onbTestOk => 'Verbinding gelukt';

  @override
  String get onbTestFail => 'Verbinding mislukt';

  @override
  String get onbNext => 'Volgende';

  @override
  String get onbBack => 'Terug';

  @override
  String get onbSave => 'Bewaar en synchroniseer';

  @override
  String get settingsAccounts => 'Bronnen';

  @override
  String get settingsLanguageSub => 'Voorkeurstalen voor ondertitels';

  @override
  String get settingsLanguageAudio => 'Voorkeurstalen voor audio';

  @override
  String get settingsSubscale => 'Grootte van ondertitels';

  @override
  String get settingsSubdelay => 'Vertraging van ondertitels (seconden)';

  @override
  String get settingsGuide => 'Toon de snelstartgids';

  @override
  String get settingsDelete => 'Verwijder';

  @override
  String get accountAdd => 'Voeg bron toe…';

  @override
  String get settingsChangePassword => 'Wijzig wachtwoord…';

  @override
  String get settingsNewPassword => 'Nieuw wachtwoord';

  @override
  String updateAvailable(String p1) {
    return 'Versie $p1 is beschikbaar';
  }

  @override
  String get updateNow => 'Nu bijwerken';

  @override
  String get updateNotes => 'Wat is er nieuw';

  @override
  String get updateLater => 'Later';

  @override
  String get updateDownloading => 'Update wordt gedownload…';

  @override
  String updateReady(String p1) {
    return 'Versie $p1 is klaar om te installeren';
  }

  @override
  String get updateRestart => 'Herstart om bij te werken';

  @override
  String get updateFailed => 'Bijwerken mislukt';

  @override
  String get updateManual => 'Download handmatig';

  @override
  String get updateCheckNow => 'Zoek naar updates';

  @override
  String get updateAuto => 'Zoek automatisch naar updates';

  @override
  String get updateAutoInstall => 'Download updates automatisch';

  @override
  String get updateUpToDate => 'Je hebt de nieuwste versie';

  @override
  String get updateDevBuild =>
      'Updates zijn alleen beschikbaar in de geïnstalleerde app';

  @override
  String updateCurrent(String p1) {
    return 'Huidige versie: $p1';
  }

  @override
  String get playerBack => 'Terug';

  @override
  String get playerErrorHint =>
      'Als dit blijft gebeuren, controleer dan het wachtwoord van de bron in Instellingen.';

  @override
  String get passwordTitle => 'Wachtwoord vereist';

  @override
  String passwordBody(String p1) {
    return 'Voer het wachtwoord in voor “$p1”. Het wordt privé bewaard op deze Mac.';
  }

  @override
  String get passwordNone => 'Ga door zonder wachtwoord';

  @override
  String get playerSpeed => 'Afspeelsnelheid';

  @override
  String get playerSpeedNormal => 'Normaal';

  @override
  String get playerSpeedReset => 'Normale snelheid';

  @override
  String get settingsSeekPreview =>
      'Voorbeeldafbeeldingen op de voortgangsbalk';

  @override
  String get settingsSeekPreviewNote =>
      'Opent een tweede verbinding met je aanbieder. Zet dit uit als het afspelen stopt of je aanbieder maar één verbinding toestaat.';

  @override
  String get playerSeekBar => 'Afspeelpositie';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 van $p2';
  }

  @override
  String get playerLive => 'Live';

  @override
  String get playerChannelPrev => 'Vorige zender';

  @override
  String get playerChannelNext => 'Volgende zender';

  @override
  String get playerScaleFit => 'Passend';

  @override
  String get playerScaleFill => 'Vullen';

  @override
  String get playerScaleStretch => 'Uitrekken';

  @override
  String get playerSubtitleAdjust => 'Ondertitels aanpassen…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Helderheid';

  @override
  String get playerVolume => 'Volume';

  @override
  String get playerReplay => 'Opnieuw afspelen';

  @override
  String get settingsClock => 'Toon de tijd in de speler';

  @override
  String get settingsSeekStep =>
      'Sprongstap (pijltjestoetsen en sprongknoppen)';

  @override
  String get settingsBarsHide => 'Verberg de bediening na';

  @override
  String get settingsNever => 'Nooit';

  @override
  String get settingsVideoScale => 'Videoschaal';

  @override
  String get settingsScaleFit => 'Passend (zwarte balken)';

  @override
  String get settingsScaleFill => 'Vullend (snijdt de randen af)';

  @override
  String get settingsScaleStretch => 'Uitrekken';

  @override
  String get settingsVideoScaleHint =>
      'Druk in de speler op A om tussen de drie te wisselen.';

  @override
  String get settingsBuffer => 'Netwerkbuffer';

  @override
  String get settingsBufferSmall => 'Klein';

  @override
  String get settingsBufferNormal => 'Normaal';

  @override
  String get settingsBufferLarge => 'Groot';

  @override
  String get settingsBufferHint =>
      'Een grotere buffer helpt bij een trage of instabiele verbinding.';

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
    return '$p1 terug';
  }

  @override
  String playerSkipForward(String p1) {
    return '$p1 vooruit';
  }

  @override
  String get playerSleep => 'Slaaptimer';

  @override
  String get downloadsTitle => 'Downloads';

  @override
  String get downloadsAdd => 'Download';

  @override
  String get downloadsSeason => 'Download seizoen';

  @override
  String get downloadsChooseFolder =>
      'Kies waar gedownloade films en afleveringen worden bewaard';

  @override
  String get downloadsChoose => 'Kies';

  @override
  String get downloadsNotChosen => 'Wordt gevraagd bij de eerste download';

  @override
  String get downloadsChange => 'Wijzig map…';

  @override
  String get downloadsPause => 'Pauzeer';

  @override
  String get downloadsResume => 'Hervat';

  @override
  String get downloadsCancel => 'Annuleer';

  @override
  String get downloadsPlay => 'Speel af';

  @override
  String get downloadsReveal => 'Toon in Finder';

  @override
  String get downloadsDelete => 'Verwijder bestand';

  @override
  String get downloadsEmpty => 'Nog geen downloads';

  @override
  String get downloadsQueued => 'Wachtend';

  @override
  String get downloadsDone => 'Klaar';

  @override
  String get downloadsHint =>
      'Downloads worden een voor een uitgevoerd. Veel aanbieders staan maar één verbinding toe, dus afspelen tijdens het downloaden kan mislukken. Onvoltooide downloads worden niet bewaard als de app wordt afgesloten.';

  @override
  String get epgNow => 'Nu';

  @override
  String get epgNext => 'Straks';

  @override
  String get settingsFullscreen =>
      'Open het afspelen in volledig scherm (de bediening blijft verborgen tot je de muis beweegt)';

  @override
  String get nextTitle => 'Hierna';

  @override
  String nextIn(int p1) {
    return 'Afspelen over $p1 s';
  }

  @override
  String get nextNow => 'Nu afspelen';

  @override
  String get nextCancel => 'Annuleer';

  @override
  String get settingsAutoNext => 'Speel de volgende aflevering automatisch af';

  @override
  String get downloadsNoSpace => 'Niet genoeg vrije schijfruimte';

  @override
  String get dbErrorTitle => 'BattleStation TV kan de database niet openen';

  @override
  String get dbErrorBody =>
      'Als er een andere kopie van BattleStation TV actief is, stop die dan en probeer het opnieuw.';

  @override
  String get dbRecoveredTitle => 'De database was beschadigd';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV is gestart met een nieuwe database (voeg je bron opnieuw toe). Het beschadigde bestand is hier bewaard:\n$p1';
  }

  @override
  String get menuShowWindow => 'Toon venster';

  @override
  String get settingsTabGeneral => 'Algemeen';

  @override
  String get settingsTabPlayer => 'Speler';

  @override
  String get settingsTabPlaylists => 'Afspeellijsten';

  @override
  String get settingsAppearance => 'Weergave';

  @override
  String get settingsSystem => 'Systeem';

  @override
  String get appearanceLight => 'Licht';

  @override
  String get appearanceDark => 'Donker';

  @override
  String get settingsInterfaceLanguage => 'Taal van de interface';

  @override
  String get settingsLanguageRestart =>
      'Wordt van kracht nadat je BattleStation TV opnieuw hebt gestart.';

  @override
  String get settingsHideCategories => 'Categorieën verbergen';

  @override
  String get settingsHideCategoriesWords => 'Te verbergen woorden';

  @override
  String get settingsHideCategoriesNote =>
      'Verbergt categorieën waarvan de naam deze woorden bevat (scheid ze met komma’s). Hun zenders, films en series verdwijnen ook uit zoeken, favorieten en Verder kijken. Dit is een eenvoudig filter, geen ouderlijk toezicht: iedereen kan het hier wijzigen.';

  @override
  String get settingsRefresh => 'Afspeellijsten bijwerken';

  @override
  String get settingsRefresh0 => 'Alleen als de app opent';

  @override
  String get settingsRefresh6 => 'Elke 6 uur';

  @override
  String get settingsRefresh12 => 'Elke 12 uur';

  @override
  String get settingsRefresh24 => 'Elke 24 uur';

  @override
  String get settingsBackup => 'Reservekopie en herstel';

  @override
  String get backupExport => 'Exporteer reservekopie…';

  @override
  String get backupImport => 'Importeer reservekopie…';

  @override
  String get backupWarn =>
      'Het reservekopiebestand bevat je afspeellijsten met hun adressen, die inloggegevens kunnen bevatten. Bewaar het dus privé. Wachtwoorden van Xtream-bronnen worden er niet in opgeslagen. Importeren voegt toe aan je huidige bronnen en verwijdert niets.';

  @override
  String get backupExported => 'De reservekopie is bewaard.';

  @override
  String get backupImported => 'De reservekopie is geïmporteerd.';

  @override
  String get backupErrorInvalid =>
      'Dit is geen BattleStation TV-reservekopiebestand.';

  @override
  String get backupErrorVersion =>
      'Deze reservekopie komt van een andere versie van BattleStation TV en kan niet worden gelezen.';

  @override
  String get backupErrorTooLarge =>
      'Dit bestand is te groot om een reservekopie te zijn.';

  @override
  String get backupFailed => 'De reservekopie is mislukt';

  @override
  String get settingsClearData => 'Wis gegevens';

  @override
  String get clearHistory => 'Wis kijkgeschiedenis';

  @override
  String get clearFavorites => 'Wis favorieten';

  @override
  String get clearImages => 'Wis afbeeldingscache';

  @override
  String get clearConfirm => 'Wis';

  @override
  String get clearHistoryWarn =>
      'Hervatposities en de Verder kijken-lijsten van alle bronnen worden gewist. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get clearFavoritesWarn =>
      'Je favorieten in alle bronnen worden verwijderd. Dit kan niet ongedaan worden gemaakt.';

  @override
  String get clearImagesWarn =>
      'Bewaarde logo’s en posters worden verwijderd en zo nodig opnieuw gedownload.';

  @override
  String get infoDetails => 'Details';

  @override
  String get infoPlot => 'Verhaal';

  @override
  String get infoCast => 'Acteurs';

  @override
  String get infoDirector => 'Regisseur';

  @override
  String get infoGenre => 'Genre';

  @override
  String get infoYear => 'Jaar van uitgave';

  @override
  String get infoRating => 'Beoordeling';

  @override
  String get infoDuration => 'Duur';

  @override
  String get infoCountry => 'Land';

  @override
  String get infoTrailer => 'Trailer';

  @override
  String get infoPlay => 'Speel af';

  @override
  String get infoEmpty => 'Je aanbieder heeft geen details over deze titel.';

  @override
  String get infoLoading => 'Details laden…';

  @override
  String get infoError => 'De details konden niet worden geladen.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 u';
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
  String get playerSkipIntro => 'Intro overslaan';

  @override
  String get playerSkipCredits => 'Aftiteling overslaan';

  @override
  String get playerSkipMenu => 'Intro en aftiteling';

  @override
  String get playerMarkIntroStart => 'Intro begint hier';

  @override
  String get playerMarkIntroEnd => 'Intro eindigt hier';

  @override
  String get playerMarkCredits => 'Aftiteling begint hier';

  @override
  String get playerSkipForget => 'Intro en aftiteling vergeten';

  @override
  String get playerSkipSaved => 'Bewaard voor alle afleveringen van deze serie';

  @override
  String get playerSkipRefused => 'Niet mogelijk op dit punt';

  @override
  String get continueRemove => 'Verwijderen uit Verder kijken';

  @override
  String get settingsFavoritesAZ => 'Favorieten sorteren op naam (A–Z)';

  @override
  String get settingsKeychain => 'Wachtwoorden in de sleutelhanger bewaren';

  @override
  String get settingsKeychainNote =>
      'Uit: wachtwoorden blijven in de privédatabase van de app. Aan: macOS bewaart ze in je inlogsleutelhanger.';

  @override
  String get settingsKeychainFailed =>
      'De sleutelhanger heeft de wachtwoorden niet geaccepteerd. Er is niets gewijzigd.';
}
