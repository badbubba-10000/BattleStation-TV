// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Live';

  @override
  String get tabMovies => 'Filme';

  @override
  String get tabSeries => 'Serien';

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
  String get catFavorites => 'Favoriten';

  @override
  String get catContinue => 'Weiterschauen';

  @override
  String get catFilter => 'Kategorien filtern';

  @override
  String get playlistAll => 'Alle Playlists';

  @override
  String get playlistLabel => 'Playlist';

  @override
  String get aboutAcknowledgements => 'Danksagungen';

  @override
  String get aboutPrivacy => 'Datenschutz';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV erhebt keine Daten über dich. Es gibt kein Konto, keine Analyse, keine Werbung und kein Tracking.\n\nDeine Quellen, Favoriten und dein Wiedergabeverlauf bleiben auf diesem Gerät. Die App verbindet sich nur mit den Adressen, die du selbst hinzufügst: dem Server deines Anbieters, der Playlist, dem TV-Programm, den Logos und den Streams.\n\nPasswörter von Anbietern werden nur auf diesem Gerät im iOS Keychain gespeichert. Sie sind nie in einer Sicherungsdatei enthalten.\n\nBattleStation TV enthält keine Sender, Filme oder Playlists. Die Quelle bringst du selbst mit.';

  @override
  String get aboutSource => 'Quellcode und Lizenz';

  @override
  String get aboutCoffee => 'Spendier mir einen Kaffee';

  @override
  String get tipsTitle => 'BattleStation TV unterstützen';

  @override
  String get tipsFooter =>
      'Freiwilliges Trinkgeld über Apple. Es schaltet nichts frei: Alle Funktionen bleiben für alle kostenlos.';

  @override
  String get tipsThanks => 'Danke für deine Unterstützung!';

  @override
  String get tipsPending => 'Warten auf Freigabe.';

  @override
  String get tipsFailed =>
      'Das Trinkgeld ist nicht durchgegangen. Versuch es später noch einmal.';

  @override
  String get aboutVersion => 'Version';

  @override
  String get catTitle => 'Kategorien';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get emptyContinue => 'Nichts zum Weiterschauen';

  @override
  String get emptyContinueHint =>
      'Filme und Episoden, die du mittendrin stoppst, erscheinen hier.';

  @override
  String get emptyFavorites => 'Noch keine Favoriten';

  @override
  String get emptyFavoritesHint =>
      'Halte einen Titel gedrückt und wähle „Zu Favoriten hinzufügen“.';

  @override
  String get emptyFavoritesLive =>
      'Wische einen Sender nach links und tippe dann auf den Stern.';

  @override
  String get emptyNone => 'Hier ist noch nichts';

  @override
  String get emptyNoneHint =>
      'Zum Aktualisieren nach unten ziehen oder deine Quelle in den Einstellungen prüfen.';

  @override
  String get fieldServerInvalid =>
      'Diese Adresse sieht nicht richtig aus. Beispiel: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Gib den vollständigen Link ein, beginnend mit http:// oder https://';

  @override
  String get infoResume => 'Fortsetzen';

  @override
  String get libraryEmpty => 'Deine Mediathek ist leer';

  @override
  String get libraryEmptyHint =>
      'Favoriten und Titel, die du angefangen hast, erscheinen hier.';

  @override
  String get onbNoChannels =>
      'BattleStation TV enthält keine Sender, Filme oder Playlists. Füge eine Quelle von einem Anbieter hinzu, bei dem du ein Abo hast.';

  @override
  String get onbPasteHint => 'Playlist-Link kopiert?';

  @override
  String get onbTestRunning => 'Test läuft…';

  @override
  String passwordBodyIos(String p1) {
    return 'Gib das Passwort für „$p1“ ein. Es wird auf diesem Gerät im iOS Keychain gespeichert.';
  }

  @override
  String get searchRecent => 'Letzte Suchanfragen';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Weiter mit S$p1 F$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'S$p1 F$p2';
  }

  @override
  String get seriesNoEpisodes => 'Keine Episoden gefunden';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'S$p1 F$p2 abspielen';
  }

  @override
  String get seriesWatched => 'Gesehen';

  @override
  String get settingsAbout => 'Info';

  @override
  String get settingsEditSource => 'Quelle bearbeiten';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV verwendet die Sprache deines Geräts. Um für diese App nur eine andere Sprache zu verwenden, wähle sie in den iOS-Einstellungen.';

  @override
  String get settingsOpenIOS => 'iOS-Einstellungen öffnen';

  @override
  String get settingsPasswordNote =>
      'Lass das neue Passwort leer, um das aktuelle zu behalten. Passwörter werden im iOS Keychain gespeichert.';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get sourceDeleteWarn =>
      'Die Quelle, ihre Favoriten und ihr Wiedergabeverlauf werden von diesem Gerät entfernt. Dein Konto beim Anbieter bleibt unberührt.';

  @override
  String get syncNow => 'Aktualisieren';

  @override
  String get tabLibrary => 'Mediathek';

  @override
  String get scopeCategory => 'In Kategorie';

  @override
  String get scopeType => 'In Bereich';

  @override
  String get scopeEverywhere => 'Überall';

  @override
  String get searchPrompt => 'Suchen';

  @override
  String get syncRunning => 'Synchronisieren…';

  @override
  String get syncFailed => 'Synchronisierung fehlgeschlagen';

  @override
  String get syncNotUpdated => 'Gespeicherte Daten werden angezeigt';

  @override
  String get emptyResults => 'Nichts gefunden';

  @override
  String get favAdd => 'Zu Favoriten hinzufügen';

  @override
  String get favRemove => 'Aus Favoriten entfernen';

  @override
  String get playerClose => 'Schließen';

  @override
  String get playerSubtitles => 'Untertitel';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerOff => 'Aus';

  @override
  String get playerAddSubtitle => 'Untertiteldatei hinzufügen…';

  @override
  String get playerCatchup => 'Zeitversetzt ansehen';

  @override
  String get playerFullscreen => 'Vollbild';

  @override
  String get playerError => 'Wiedergabe fehlgeschlagen';

  @override
  String get playerRetry => 'Erneut versuchen';

  @override
  String get playerPip => 'Bild-in-Bild';

  @override
  String get playerPipReturn => 'Zurück zur App';

  @override
  String get catchupTitle => 'Zeitversetzt';

  @override
  String get catchupNoEpg => 'Kein TV-Programm vorhanden. Zeit manuell wählen.';

  @override
  String get catchupPick => 'Startzeit';

  @override
  String get catchupDuration => 'Minuten';

  @override
  String get seriesSeason => 'Staffel';

  @override
  String get onbWelcomeTitle => 'Willkommen bei BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Sieh dir Live-Sender, Filme und Serien deines IPTV-Anbieters an. Fügen wir deine erste Quelle hinzu.';

  @override
  String get onbWhereTitle => 'Wohin kommen die Adressen?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: Dein Anbieter gibt dir eine Serveradresse (z. B. http://host:8080), einen Benutzernamen und ein Passwort. Gib sie unten ein.';

  @override
  String get onbWhereM3u =>
      'M3U: Gib der Quelle einen Namen und füge den Playlist-Link ein, den dir dein Anbieter gegeben hat.';

  @override
  String get fieldKind => 'Typ';

  @override
  String get fieldName => 'Name';

  @override
  String get fieldServer => 'Serveradresse';

  @override
  String get fieldUsername => 'Benutzername';

  @override
  String get fieldPassword => 'Passwort';

  @override
  String get fieldUrl => 'Playlist-Link';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Verbindung testen';

  @override
  String get onbTestOk => 'Erfolgreich verbunden';

  @override
  String get onbTestFail => 'Verbindung fehlgeschlagen';

  @override
  String get onbNext => 'Weiter';

  @override
  String get onbBack => 'Zurück';

  @override
  String get onbSave => 'Sichern und synchronisieren';

  @override
  String get settingsAccounts => 'Quellen';

  @override
  String get settingsLanguageSub => 'Bevorzugte Untertitelsprachen';

  @override
  String get settingsLanguageAudio => 'Bevorzugte Audiosprachen';

  @override
  String get settingsSubscale => 'Untertitelgröße';

  @override
  String get settingsSubdelay => 'Untertitelverzögerung (Sekunden)';

  @override
  String get settingsGuide => 'Kurzanleitung anzeigen';

  @override
  String get settingsDelete => 'Löschen';

  @override
  String get accountAdd => 'Quelle hinzufügen…';

  @override
  String get settingsChangePassword => 'Passwort ändern…';

  @override
  String get settingsNewPassword => 'Neues Passwort';

  @override
  String updateAvailable(String p1) {
    return 'Version $p1 ist verfügbar';
  }

  @override
  String get updateNow => 'Jetzt aktualisieren';

  @override
  String get updateNotes => 'Neuerungen';

  @override
  String get updateLater => 'Später';

  @override
  String get updateDownloading => 'Update wird geladen…';

  @override
  String updateReady(String p1) {
    return 'Version $p1 ist bereit zur Installation';
  }

  @override
  String get updateRestart => 'Zum Aktualisieren neu starten';

  @override
  String get updateFailed => 'Update fehlgeschlagen';

  @override
  String get updateManual => 'Manuell laden';

  @override
  String get updateCheckNow => 'Nach Updates suchen';

  @override
  String get updateAuto => 'Automatisch nach Updates suchen';

  @override
  String get updateAutoInstall => 'Updates automatisch laden';

  @override
  String get updateUpToDate => 'Du hast die neueste Version';

  @override
  String get updateDevBuild =>
      'Updates sind nur in der installierten App verfügbar';

  @override
  String updateCurrent(String p1) {
    return 'Aktuelle Version: $p1';
  }

  @override
  String get playerBack => 'Zurück';

  @override
  String get playerErrorHint =>
      'Falls das weiterhin passiert, prüfe das Passwort der Quelle in den Einstellungen.';

  @override
  String get passwordTitle => 'Passwort erforderlich';

  @override
  String passwordBody(String p1) {
    return 'Gib das Passwort für „$p1“ ein. Es wird privat auf diesem Mac gespeichert.';
  }

  @override
  String get passwordNone => 'Ohne Passwort fortfahren';

  @override
  String get playerSpeed => 'Wiedergabegeschwindigkeit';

  @override
  String get playerSpeedNormal => 'Normal';

  @override
  String get playerSpeedReset => 'Normale Geschwindigkeit';

  @override
  String get settingsSeekPreview => 'Vorschaubilder in der Zeitleiste';

  @override
  String get settingsSeekPreviewNote =>
      'Öffnet eine zweite Verbindung zu deinem Anbieter. Schalte die Option aus, wenn die Wiedergabe stoppt oder dein Anbieter nur eine Verbindung erlaubt.';

  @override
  String get playerSeekBar => 'Wiedergabeposition';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 von $p2';
  }

  @override
  String get playerLive => 'Live';

  @override
  String get playerChannelPrev => 'Vorheriger Sender';

  @override
  String get playerChannelNext => 'Nächster Sender';

  @override
  String get playerScaleFit => 'Einpassen';

  @override
  String get playerScaleFill => 'Füllen';

  @override
  String get playerScaleStretch => 'Strecken';

  @override
  String get playerSubtitleAdjust => 'Untertitel anpassen…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Helligkeit';

  @override
  String get playerVolume => 'Lautstärke';

  @override
  String get playerReplay => 'Erneut abspielen';

  @override
  String get settingsClock => 'Uhrzeit im Player anzeigen';

  @override
  String get settingsSeekStep => 'Sprungweite (Pfeiltasten und Sprungtasten)';

  @override
  String get settingsBarsHide => 'Steuerelemente ausblenden nach';

  @override
  String get settingsNever => 'Nie';

  @override
  String get settingsVideoScale => 'Videoskalierung';

  @override
  String get settingsScaleFit => 'Einpassen (schwarze Balken)';

  @override
  String get settingsScaleFill => 'Füllen (beschneidet die Ränder)';

  @override
  String get settingsScaleStretch => 'Strecken';

  @override
  String get settingsVideoScaleHint =>
      'Drücke im Player die Taste A, um zwischen den drei Optionen zu wechseln.';

  @override
  String get settingsBuffer => 'Netzwerkpuffer';

  @override
  String get settingsBufferSmall => 'Klein';

  @override
  String get settingsBufferNormal => 'Normal';

  @override
  String get settingsBufferLarge => 'Groß';

  @override
  String get settingsBufferHint =>
      'Ein größerer Puffer hilft bei langsamer oder instabiler Verbindung.';

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
    return '$p1 zurück';
  }

  @override
  String playerSkipForward(String p1) {
    return '$p1 vor';
  }

  @override
  String get playerSleep => 'Einschlaftimer';

  @override
  String get downloadsTitle => 'Downloads';

  @override
  String get downloadsAdd => 'Herunterladen';

  @override
  String get downloadsSeason => 'Staffel herunterladen';

  @override
  String get downloadsChooseFolder =>
      'Wähle, wo heruntergeladene Filme und Episoden gespeichert werden';

  @override
  String get downloadsChoose => 'Auswählen';

  @override
  String get downloadsNotChosen => 'Wird beim ersten Download abgefragt';

  @override
  String get downloadsChange => 'Ordner ändern…';

  @override
  String get downloadsPause => 'Pausieren';

  @override
  String get downloadsResume => 'Fortsetzen';

  @override
  String get downloadsCancel => 'Abbrechen';

  @override
  String get downloadsPlay => 'Abspielen';

  @override
  String get downloadsReveal => 'Im Finder zeigen';

  @override
  String get downloadsDelete => 'Datei löschen';

  @override
  String get downloadsEmpty => 'Noch keine Downloads';

  @override
  String get downloadsQueued => 'Wartet';

  @override
  String get downloadsDone => 'Fertig';

  @override
  String get downloadsHint =>
      'Downloads laufen nacheinander. Viele Anbieter erlauben nur eine Verbindung, daher kann das Abspielen während eines Downloads fehlschlagen. Unvollständige Downloads werden beim Beenden der App nicht behalten.';

  @override
  String get epgNow => 'Jetzt';

  @override
  String get epgNext => 'Danach';

  @override
  String get settingsFullscreen =>
      'Wiedergabe im Vollbild öffnen (die Steuerelemente bleiben ausgeblendet, bis du die Maus bewegst)';

  @override
  String get nextTitle => 'Als Nächstes';

  @override
  String nextIn(int p1) {
    return 'Wiedergabe in $p1 s';
  }

  @override
  String get nextNow => 'Jetzt abspielen';

  @override
  String get nextCancel => 'Abbrechen';

  @override
  String get settingsAutoNext => 'Nächste Episode automatisch abspielen';

  @override
  String get downloadsNoSpace => 'Nicht genug freier Speicherplatz';

  @override
  String get dbErrorTitle =>
      'BattleStation TV kann seine Datenbank nicht öffnen';

  @override
  String get dbErrorBody =>
      'Falls eine andere Kopie von BattleStation TV läuft, beende sie und versuche es erneut.';

  @override
  String get dbRecoveredTitle => 'Die Datenbank war beschädigt';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV wurde mit einer neuen Datenbank gestartet (füge deine Quelle erneut hinzu). Die beschädigte Datei wurde hier aufbewahrt:\n$p1';
  }

  @override
  String get menuShowWindow => 'Fenster einblenden';

  @override
  String get settingsTabGeneral => 'Allgemein';

  @override
  String get settingsTabPlayer => 'Player';

  @override
  String get settingsTabPlaylists => 'Playlists';

  @override
  String get settingsAppearance => 'Erscheinungsbild';

  @override
  String get settingsSystem => 'System';

  @override
  String get appearanceLight => 'Hell';

  @override
  String get appearanceDark => 'Dunkel';

  @override
  String get settingsInterfaceLanguage => 'Sprache der Benutzeroberfläche';

  @override
  String get settingsLanguageRestart =>
      'Wird nach einem Neustart von BattleStation TV wirksam.';

  @override
  String get settingsHideCategories => 'Kategorien ausblenden';

  @override
  String get settingsHideCategoriesWords => 'Auszublendende Wörter';

  @override
  String get settingsHideCategoriesNote =>
      'Blendet Kategorien aus, deren Name eines dieser Wörter enthält (durch Kommas trennen). Ihre Sender, Filme und Serien verschwinden auch aus Suche, Favoriten und Weiterschauen. Das ist ein einfacher Filter, keine Kindersicherung: Jeder kann ihn hier ändern.';

  @override
  String get settingsRefresh => 'Playlists aktualisieren';

  @override
  String get settingsRefresh0 => 'Nur beim Öffnen der App';

  @override
  String get settingsRefresh6 => 'Alle 6 Stunden';

  @override
  String get settingsRefresh12 => 'Alle 12 Stunden';

  @override
  String get settingsRefresh24 => 'Alle 24 Stunden';

  @override
  String get settingsBackup => 'Sicherung und Wiederherstellung';

  @override
  String get backupExport => 'Sicherung exportieren…';

  @override
  String get backupImport => 'Sicherung importieren…';

  @override
  String get backupWarn =>
      'Die Sicherungsdatei enthält deine Playlists mit ihren Adressen, die Zugangsdaten enthalten können. Bewahre sie daher privat auf. Passwörter von Xtream-Quellen werden darin nicht gespeichert. Beim Importieren wird zu deinen aktuellen Quellen hinzugefügt, es wird nichts gelöscht.';

  @override
  String get backupExported => 'Die Sicherung wurde gespeichert.';

  @override
  String get backupImported => 'Die Sicherung wurde importiert.';

  @override
  String get backupErrorInvalid =>
      'Dies ist keine BattleStation TV-Sicherungsdatei.';

  @override
  String get backupErrorVersion =>
      'Diese Sicherung stammt von einer anderen Version von BattleStation TV und kann nicht gelesen werden.';

  @override
  String get backupErrorTooLarge =>
      'Diese Datei ist zu groß für eine Sicherung.';

  @override
  String get backupFailed => 'Die Sicherung ist fehlgeschlagen';

  @override
  String get settingsClearData => 'Daten löschen';

  @override
  String get clearHistory => 'Wiedergabeverlauf löschen';

  @override
  String get clearFavorites => 'Favoriten löschen';

  @override
  String get clearImages => 'Bildcache leeren';

  @override
  String get clearConfirm => 'Löschen';

  @override
  String get clearHistoryWarn =>
      'Wiedergabepositionen und die Weiterschauen-Listen aller Quellen werden gelöscht. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get clearFavoritesWarn =>
      'Deine Favoriten in allen Quellen werden entfernt. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get clearImagesWarn =>
      'Gespeicherte Logos und Poster werden entfernt und bei Bedarf erneut geladen.';

  @override
  String get infoDetails => 'Details';

  @override
  String get infoPlot => 'Handlung';

  @override
  String get infoCast => 'Besetzung';

  @override
  String get infoDirector => 'Regie';

  @override
  String get infoGenre => 'Genre';

  @override
  String get infoYear => 'Erscheinungsjahr';

  @override
  String get infoRating => 'Bewertung';

  @override
  String get infoDuration => 'Dauer';

  @override
  String get infoCountry => 'Land';

  @override
  String get infoTrailer => 'Trailer';

  @override
  String get infoPlay => 'Abspielen';

  @override
  String get infoEmpty => 'Dein Anbieter hat keine Details zu diesem Titel.';

  @override
  String get infoLoading => 'Details werden geladen…';

  @override
  String get infoError => 'Die Details konnten nicht geladen werden.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 Std.';
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
  String get playerSkipIntro => 'Intro überspringen';

  @override
  String get playerSkipCredits => 'Abspann überspringen';

  @override
  String get playerSkipMenu => 'Intro und Abspann';

  @override
  String get playerMarkIntroStart => 'Intro beginnt hier';

  @override
  String get playerMarkIntroEnd => 'Intro endet hier';

  @override
  String get playerMarkCredits => 'Abspann beginnt hier';

  @override
  String get playerSkipForget => 'Intro und Abspann vergessen';

  @override
  String get playerSkipSaved => 'Für alle Folgen dieser Serie gespeichert';

  @override
  String get playerSkipRefused => 'An dieser Stelle nicht möglich';

  @override
  String get continueRemove => 'Aus „Weiterschauen“ entfernen';

  @override
  String get settingsFavoritesAZ => 'Favoriten nach Name sortieren (A–Z)';

  @override
  String get settingsKeychain => 'Passwörter im Schlüsselbund speichern';

  @override
  String get settingsKeychainNote =>
      'Aus: Passwörter bleiben in der privaten Datenbank der App. Ein: macOS bewahrt sie in deinem Anmelde-Schlüsselbund auf.';

  @override
  String get settingsKeychainFailed =>
      'Der Schlüsselbund hat die Passwörter nicht angenommen. Nichts wurde geändert.';
}
