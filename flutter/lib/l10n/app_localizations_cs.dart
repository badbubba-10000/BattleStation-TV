// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Živě';

  @override
  String get tabMovies => 'Filmy';

  @override
  String get tabSeries => 'Seriály';

  @override
  String get catAll => 'Vše';

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
  String get catFavorites => 'Oblíbené';

  @override
  String get catContinue => 'Pokračovat ve sledování';

  @override
  String get catFilter => 'Filtrovat kategorie';

  @override
  String get playlistAll => 'Všechny playlisty';

  @override
  String get playlistLabel => 'Playlist';

  @override
  String get aboutAcknowledgements => 'Poděkování';

  @override
  String get aboutPrivacy => 'Soukromí';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV o vás neshromažďuje žádná data. Nemá účet, analytiku, reklamy ani sledování.\n\nVaše zdroje, oblíbené a historie sledování zůstávají v tomto zařízení. Aplikace se připojuje jen k adresám, které sami přidáte: k serveru poskytovatele, playlistu, programu, logům a streamům.\n\nHesla poskytovatelů jsou uložena v iOS Keychain jen v tomto zařízení. Nikdy nejsou součástí záložního souboru.\n\nBattleStation TV neobsahuje žádné kanály, filmy ani playlisty. Zdroj si přinášíte sami.';

  @override
  String get aboutSource => 'Zdrojový kód a licence';

  @override
  String get aboutCoffee => 'Kupte mi kávu';

  @override
  String get tipsTitle => 'Podpořte BattleStation TV';

  @override
  String get tipsFooter =>
      'Dobrovolné spropitné přes Apple. Nic neodemyká: všechny funkce zůstávají zdarma pro všechny.';

  @override
  String get tipsThanks => 'Děkujeme za vaši podporu!';

  @override
  String get tipsPending => 'Čeká se na schválení.';

  @override
  String get tipsFailed => 'Spropitné neprošlo. Zkuste to později.';

  @override
  String get aboutVersion => 'Verze';

  @override
  String get catTitle => 'Kategorie';

  @override
  String get commonCancel => 'Zrušit';

  @override
  String get emptyContinue => 'Nic k pokračování';

  @override
  String get emptyContinueHint =>
      'Filmy a epizody, které přerušíte v polovině, se zobrazí tady.';

  @override
  String get emptyFavorites => 'Zatím žádné oblíbené';

  @override
  String get emptyFavoritesHint =>
      'Podržte titul a zvolte „Přidat do oblíbených“.';

  @override
  String get emptyFavoritesLive =>
      'Přejeďte po kanálu doleva a klepněte na hvězdičku.';

  @override
  String get emptyNone => 'Zatím tu nic není';

  @override
  String get emptyNoneHint =>
      'Stažením dolů obnovíte obsah, nebo zkontrolujte zdroj v Nastavení.';

  @override
  String get fieldServerInvalid =>
      'Tato adresa nevypadá správně. Příklad: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Zadejte celý odkaz začínající http:// nebo https://';

  @override
  String get infoResume => 'Pokračovat';

  @override
  String get libraryEmpty => 'Vaše knihovna je prázdná';

  @override
  String get libraryEmptyHint =>
      'Oblíbené a tituly, které jste začali sledovat, se zobrazí tady.';

  @override
  String get onbNoChannels =>
      'BattleStation TV neobsahuje žádné kanály, filmy ani playlisty. Přidejte zdroj od poskytovatele, u kterého máte předplatné.';

  @override
  String get onbPasteHint => 'Zkopírovali jste odkaz na playlist?';

  @override
  String get onbTestRunning => 'Testování…';

  @override
  String passwordBodyIos(String p1) {
    return 'Zadejte heslo pro „$p1“. Je uloženo v iOS Keychain v tomto zařízení.';
  }

  @override
  String get searchRecent => 'Nedávná hledání';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Pokračovat Ř$p1 E$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'Ř$p1 E$p2';
  }

  @override
  String get seriesNoEpisodes => 'Nenalezeny žádné epizody';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Přehrát Ř$p1 E$p2';
  }

  @override
  String get seriesWatched => 'Zhlédnuto';

  @override
  String get settingsAbout => 'O aplikaci';

  @override
  String get settingsEditSource => 'Upravit zdroj';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV používá jazyk vašeho zařízení. Chcete-li pro tuto aplikaci použít jiný jazyk, zvolte ho v Nastavení iOS.';

  @override
  String get settingsOpenIOS => 'Otevřít Nastavení iOS';

  @override
  String get settingsPasswordNote =>
      'Nechte nové heslo prázdné, pokud chcete ponechat stávající. Hesla se ukládají do iOS Keychain.';

  @override
  String get settingsTitle => 'Nastavení';

  @override
  String get sourceDeleteWarn =>
      'Zdroj, jeho oblíbené a historie sledování budou z tohoto zařízení odstraněny. Váš účet u poskytovatele to neovlivní.';

  @override
  String get syncNow => 'Obnovit';

  @override
  String get tabLibrary => 'Knihovna';

  @override
  String get scopeCategory => 'V kategorii';

  @override
  String get scopeType => 'V sekci';

  @override
  String get scopeEverywhere => 'Všude';

  @override
  String get searchPrompt => 'Hledat';

  @override
  String get syncRunning => 'Synchronizace…';

  @override
  String get syncFailed => 'Synchronizace selhala';

  @override
  String get syncNotUpdated => 'Zobrazena uložená data';

  @override
  String get emptyResults => 'Nic nenalezeno';

  @override
  String get favAdd => 'Přidat do oblíbených';

  @override
  String get favRemove => 'Odebrat z oblíbených';

  @override
  String get playerClose => 'Zavřít';

  @override
  String get playerSubtitles => 'Titulky';

  @override
  String get playerAudio => 'Zvuk';

  @override
  String get playerOff => 'Vypnuto';

  @override
  String get playerAddSubtitle => 'Přidat soubor titulků…';

  @override
  String get playerCatchup => 'Přehrát z archivu';

  @override
  String get playerFullscreen => 'Celá obrazovka';

  @override
  String get playerError => 'Přehrávání se nezdařilo';

  @override
  String get playerRetry => 'Zkusit znovu';

  @override
  String get playerPip => 'Obraz v obraze';

  @override
  String get playerPipReturn => 'Zpět do aplikace';

  @override
  String get catchupTitle => 'Archiv';

  @override
  String get catchupNoEpg => 'Program není k dispozici. Zvolte čas ručně.';

  @override
  String get catchupPick => 'Čas začátku';

  @override
  String get catchupDuration => 'Délka (min)';

  @override
  String get seriesSeason => 'Řada';

  @override
  String get onbWelcomeTitle => 'Vítejte v BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Sledujte živé kanály, filmy a seriály od svého poskytovatele IPTV. Přidejme první zdroj.';

  @override
  String get onbWhereTitle => 'Kam zadat adresy?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: poskytovatel vám dá adresu serveru (například http://host:8080), uživatelské jméno a heslo. Zadejte je níže.';

  @override
  String get onbWhereM3u =>
      'M3U: pojmenujte zdroj a vložte odkaz na playlist, který jste dostali od poskytovatele.';

  @override
  String get fieldKind => 'Typ';

  @override
  String get fieldName => 'Název';

  @override
  String get fieldServer => 'Adresa serveru';

  @override
  String get fieldUsername => 'Uživatelské jméno';

  @override
  String get fieldPassword => 'Heslo';

  @override
  String get fieldUrl => 'Odkaz na playlist';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Vyzkoušet připojení';

  @override
  String get onbTestOk => 'Připojení bylo úspěšné';

  @override
  String get onbTestFail => 'Připojení se nezdařilo';

  @override
  String get onbNext => 'Další';

  @override
  String get onbBack => 'Zpět';

  @override
  String get onbSave => 'Uložit a synchronizovat';

  @override
  String get settingsAccounts => 'Zdroje';

  @override
  String get settingsLanguageSub => 'Preferované jazyky titulků';

  @override
  String get settingsLanguageAudio => 'Preferované jazyky zvuku';

  @override
  String get settingsSubscale => 'Velikost titulků';

  @override
  String get settingsSubdelay => 'Zpoždění titulků (sekundy)';

  @override
  String get settingsGuide => 'Zobrazit rychlého průvodce';

  @override
  String get settingsDelete => 'Smazat';

  @override
  String get accountAdd => 'Přidat zdroj…';

  @override
  String get settingsChangePassword => 'Změnit heslo…';

  @override
  String get settingsNewPassword => 'Nové heslo';

  @override
  String updateAvailable(String p1) {
    return 'Je dostupná verze $p1';
  }

  @override
  String get updateNow => 'Aktualizovat';

  @override
  String get updateNotes => 'Co je nového';

  @override
  String get updateLater => 'Později';

  @override
  String get updateDownloading => 'Stahování aktualizace…';

  @override
  String updateReady(String p1) {
    return 'Verze $p1 je připravena k instalaci';
  }

  @override
  String get updateRestart => 'Restartovat a aktualizovat';

  @override
  String get updateFailed => 'Aktualizace se nezdařila';

  @override
  String get updateManual => 'Stáhnout ručně';

  @override
  String get updateCheckNow => 'Zkontrolovat aktualizace';

  @override
  String get updateAuto => 'Automaticky kontrolovat aktualizace';

  @override
  String get updateAutoInstall => 'Automaticky stahovat aktualizace';

  @override
  String get updateUpToDate => 'Máte nejnovější verzi';

  @override
  String get updateDevBuild =>
      'Aktualizace jsou dostupné jen v nainstalované aplikaci';

  @override
  String updateCurrent(String p1) {
    return 'Aktuální verze: $p1';
  }

  @override
  String get playerBack => 'Zpět';

  @override
  String get playerErrorHint =>
      'Pokud se to opakuje, zkontrolujte heslo zdroje v Nastavení.';

  @override
  String get passwordTitle => 'Je potřeba heslo';

  @override
  String passwordBody(String p1) {
    return 'Zadejte heslo pro „$p1“. Je uloženo soukromě v tomto Macu.';
  }

  @override
  String get passwordNone => 'Pokračovat bez hesla';

  @override
  String get playerSpeed => 'Rychlost přehrávání';

  @override
  String get playerSpeedNormal => 'Normální';

  @override
  String get playerSpeedReset => 'Normální rychlost';

  @override
  String get settingsSeekPreview => 'Náhledy na ukazateli průběhu přehrávání';

  @override
  String get settingsSeekPreviewNote =>
      'Otevře druhé připojení k vašemu poskytovateli. Vypněte, pokud se přehrávání zastaví nebo váš poskytovatel povoluje jen jedno připojení.';

  @override
  String get playerSeekBar => 'Pozice přehrávání';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 z $p2';
  }

  @override
  String get playerLive => 'Živě';

  @override
  String get playerChannelPrev => 'Předchozí kanál';

  @override
  String get playerChannelNext => 'Další kanál';

  @override
  String get playerScaleFit => 'Přizpůsobit';

  @override
  String get playerScaleFill => 'Vyplnit';

  @override
  String get playerScaleStretch => 'Roztáhnout';

  @override
  String get playerSubtitleAdjust => 'Upravit titulky…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Jas';

  @override
  String get playerVolume => 'Hlasitost';

  @override
  String get playerReplay => 'Přehrát znovu';

  @override
  String get settingsClock => 'Zobrazovat čas v přehrávači';

  @override
  String get settingsSeekStep => 'Krok přeskoku (šipky a tlačítka přeskoku)';

  @override
  String get settingsBarsHide => 'Skrýt ovládací prvky po';

  @override
  String get settingsNever => 'Nikdy';

  @override
  String get settingsVideoScale => 'Měřítko videa';

  @override
  String get settingsScaleFit => 'Přizpůsobit (černé pruhy)';

  @override
  String get settingsScaleFill => 'Vyplnit (ořízne okraje)';

  @override
  String get settingsScaleStretch => 'Roztáhnout';

  @override
  String get settingsVideoScaleHint =>
      'Stisknutím A v přehrávači přepínáte mezi těmito třemi režimy.';

  @override
  String get settingsBuffer => 'Síťová vyrovnávací paměť';

  @override
  String get settingsBufferSmall => 'Malá';

  @override
  String get settingsBufferNormal => 'Normální';

  @override
  String get settingsBufferLarge => 'Velká';

  @override
  String get settingsBufferHint =>
      'Větší vyrovnávací paměť pomáhá při pomalém nebo nestabilním připojení.';

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
    return 'Zpět o $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Vpřed o $p1';
  }

  @override
  String get playerSleep => 'Časovač vypnutí';

  @override
  String get downloadsTitle => 'Stahování';

  @override
  String get downloadsAdd => 'Stáhnout';

  @override
  String get downloadsSeason => 'Stáhnout řadu';

  @override
  String get downloadsChooseFolder =>
      'Vyberte, kam ukládat stažené filmy a epizody';

  @override
  String get downloadsChoose => 'Vybrat';

  @override
  String get downloadsNotChosen => 'Zeptáme se při prvním stahování';

  @override
  String get downloadsChange => 'Změnit složku…';

  @override
  String get downloadsPause => 'Pozastavit';

  @override
  String get downloadsResume => 'Pokračovat';

  @override
  String get downloadsCancel => 'Zrušit';

  @override
  String get downloadsPlay => 'Přehrát';

  @override
  String get downloadsReveal => 'Zobrazit ve Finderu';

  @override
  String get downloadsDelete => 'Smazat soubor';

  @override
  String get downloadsEmpty => 'Zatím žádná stahování';

  @override
  String get downloadsQueued => 'Čeká';

  @override
  String get downloadsDone => 'Hotovo';

  @override
  String get downloadsHint =>
      'Stahování probíhá po jednom. Mnoho poskytovatelů povoluje jen jedno připojení, takže přehrávání během stahování může selhat. Nedokončená stahování se po ukončení aplikace neuchovají.';

  @override
  String get epgNow => 'Právě teď';

  @override
  String get epgNext => 'Následuje';

  @override
  String get settingsFullscreen =>
      'Spouštět přehrávání na celou obrazovku (ovládací prvky jsou skryté, dokud nepohnete myší)';

  @override
  String get nextTitle => 'Další epizoda';

  @override
  String nextIn(int p1) {
    return 'Přehrávání za $p1 s';
  }

  @override
  String get nextNow => 'Přehrát hned';

  @override
  String get nextCancel => 'Zrušit';

  @override
  String get settingsAutoNext => 'Automaticky přehrát další epizodu';

  @override
  String get downloadsNoSpace => 'Není dost volného místa na disku';

  @override
  String get dbErrorTitle => 'BattleStation TV nemůže otevřít svou databázi';

  @override
  String get dbErrorBody =>
      'Pokud běží jiná kopie BattleStation TV, ukončete ji a zkuste to znovu.';

  @override
  String get dbRecoveredTitle => 'Databáze byla poškozena';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV se spustil s novou databází (přidejte zdroj znovu). Poškozený soubor byl ponechán zde:\n$p1';
  }

  @override
  String get menuShowWindow => 'Zobrazit okno';

  @override
  String get settingsTabGeneral => 'Obecné';

  @override
  String get settingsTabPlayer => 'Přehrávač';

  @override
  String get settingsTabPlaylists => 'Playlisty';

  @override
  String get settingsAppearance => 'Vzhled';

  @override
  String get settingsSystem => 'Systém';

  @override
  String get appearanceLight => 'Světlý';

  @override
  String get appearanceDark => 'Tmavý';

  @override
  String get settingsInterfaceLanguage => 'Jazyk rozhraní';

  @override
  String get settingsLanguageRestart =>
      'Projeví se po restartování BattleStation TV.';

  @override
  String get settingsHideCategories => 'Skrývání kategorií';

  @override
  String get settingsHideCategoriesWords => 'Slova ke skrytí';

  @override
  String get settingsHideCategoriesNote =>
      'Skrýt kategorie, jejichž název obsahuje tato slova (oddělte je čárkami). Jejich kanály, filmy a seriály zmizí také z vyhledávání, oblíbených a z části Pokračovat ve sledování. Je to obyčejný filtr, nikoli rodičovský zámek: kdokoli ho tady může změnit.';

  @override
  String get settingsRefresh => 'Aktualizace playlistů';

  @override
  String get settingsRefresh0 => 'Jen při otevření aplikace';

  @override
  String get settingsRefresh6 => 'Každých 6 h';

  @override
  String get settingsRefresh12 => 'Každých 12 h';

  @override
  String get settingsRefresh24 => 'Každých 24 h';

  @override
  String get settingsBackup => 'Záloha a obnovení';

  @override
  String get backupExport => 'Exportovat zálohu…';

  @override
  String get backupImport => 'Importovat zálohu…';

  @override
  String get backupWarn =>
      'Soubor zálohy obsahuje seznam vašich playlistů s jejich adresami, které mohou obsahovat přihlašovací údaje, proto ho uchovejte v soukromí. Hesla zdrojů Xtream se do něj neukládají. Import přidává data k aktuálním zdrojům a nic nemaže.';

  @override
  String get backupExported => 'Záloha byla uložena.';

  @override
  String get backupImported => 'Záloha byla importována.';

  @override
  String get backupErrorInvalid => 'Toto není záložní soubor BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'Tato záloha pochází z jiné verze BattleStation TV a nelze ji přečíst.';

  @override
  String get backupErrorTooLarge =>
      'Soubor je příliš velký na to, aby byl zálohou.';

  @override
  String get backupFailed => 'Záloha se nezdařila';

  @override
  String get settingsClearData => 'Vymazání dat';

  @override
  String get clearHistory => 'Vymazat historii sledování';

  @override
  String get clearFavorites => 'Vymazat oblíbené';

  @override
  String get clearImages => 'Vymazat mezipaměť obrázků';

  @override
  String get clearConfirm => 'Vymazat';

  @override
  String get clearHistoryWarn =>
      'Pozice pro pokračování a seznamy Pokračovat ve sledování všech zdrojů budou smazány. Tuto akci nelze vrátit zpět.';

  @override
  String get clearFavoritesWarn =>
      'Oblíbené ve všech zdrojích budou odstraněny. Tuto akci nelze vrátit zpět.';

  @override
  String get clearImagesWarn =>
      'Uložená loga a plakáty se odstraní a v případě potřeby se stáhnou znovu.';

  @override
  String get infoDetails => 'Podrobnosti';

  @override
  String get infoPlot => 'Děj';

  @override
  String get infoCast => 'Hrají';

  @override
  String get infoDirector => 'Režie';

  @override
  String get infoGenre => 'Žánr';

  @override
  String get infoYear => 'Rok vydání';

  @override
  String get infoRating => 'Hodnocení';

  @override
  String get infoDuration => 'Délka';

  @override
  String get infoCountry => 'Země';

  @override
  String get infoTrailer => 'Trailer';

  @override
  String get infoPlay => 'Přehrát';

  @override
  String get infoEmpty =>
      'Váš poskytovatel k tomuto titulu nemá žádné podrobnosti.';

  @override
  String get infoLoading => 'Načítání podrobností…';

  @override
  String get infoError => 'Podrobnosti se nepodařilo načíst.';

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
  String get playerSkipIntro => 'Přeskočit úvod';

  @override
  String get playerSkipCredits => 'Přeskočit titulky';

  @override
  String get playerSkipMenu => 'Úvod a titulky';

  @override
  String get playerMarkIntroStart => 'Úvod začíná tady';

  @override
  String get playerMarkIntroEnd => 'Úvod končí tady';

  @override
  String get playerMarkCredits => 'Titulky začínají tady';

  @override
  String get playerSkipForget => 'Zapomenout úvod a titulky';

  @override
  String get playerSkipSaved => 'Uloženo pro všechny epizody tohoto seriálu';

  @override
  String get playerSkipRefused => 'V tomto místě to nejde';

  @override
  String get continueRemove => 'Odebrat z Pokračovat ve sledování';

  @override
  String get settingsFavoritesAZ => 'Řadit oblíbené podle názvu (A–Z)';

  @override
  String get settingsKeychain => 'Ukládat hesla do Klíčenky';

  @override
  String get settingsKeychainNote =>
      'Vyp.: hesla zůstávají v soukromé databázi aplikace. Zap.: macOS je uchovává ve vaší přihlašovací klíčence.';

  @override
  String get settingsKeychainFailed =>
      'Klíčenka hesla nepřijala. Nic se nezměnilo.';
}
