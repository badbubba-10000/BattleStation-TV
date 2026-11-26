// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Élő';

  @override
  String get tabMovies => 'Filmek';

  @override
  String get tabSeries => 'Sorozatok';

  @override
  String get catAll => 'Összes';

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
  String get catFavorites => 'Kedvencek';

  @override
  String get catContinue => 'Nézés folytatása';

  @override
  String get catFilter => 'Kategóriák szűrése';

  @override
  String get playlistAll => 'Összes lejátszási lista';

  @override
  String get playlistLabel => 'Lejátszási lista';

  @override
  String get aboutAcknowledgements => 'Köszönetnyilvánítás';

  @override
  String get aboutPrivacy => 'Adatvédelem';

  @override
  String get aboutPrivacyBody =>
      'Az BattleStation TV nem gyűjt Önről semmilyen adatot. Nincs fiók, nincs analitika, nincs reklám és nincs nyomon követés.\n\nA források, a kedvencek és a megtekintési előzmények ezen az eszközön maradnak. Az alkalmazás csak az Ön által megadott címekhez csatlakozik: a szolgáltató szerveréhez, a lejátszási listához, a műsorújsághoz, a logókhoz és a streamekhez.\n\nA szolgáltatói jelszavak kizárólag ezen az eszközön, az iOS Keychainben vannak tárolva. Biztonsági mentési fájlba soha nem kerülnek bele.\n\nAz BattleStation TV nem tartalmaz csatornákat, filmeket vagy lejátszási listákat. A forrást Önnek kell hoznia.';

  @override
  String get aboutSource => 'Forráskód és licenc';

  @override
  String get aboutCoffee => 'Hívjon meg egy kávéra';

  @override
  String get tipsTitle => 'Támogassa az BattleStation TV-et';

  @override
  String get tipsFooter =>
      'Önkéntes borravaló az Apple-en keresztül. Semmit sem old fel: minden funkció mindenkinek ingyenes marad.';

  @override
  String get tipsThanks => 'Köszönjük a támogatását!';

  @override
  String get tipsPending => 'Jóváhagyásra vár.';

  @override
  String get tipsFailed => 'A borravaló nem ment át. Próbálja újra később.';

  @override
  String get aboutVersion => 'Verzió';

  @override
  String get catTitle => 'Kategóriák';

  @override
  String get commonCancel => 'Mégse';

  @override
  String get emptyContinue => 'Nincs mit folytatni';

  @override
  String get emptyContinueHint =>
      'A félbehagyott filmek és epizódok itt jelennek meg.';

  @override
  String get emptyFavorites => 'Még nincsenek kedvencek';

  @override
  String get emptyFavoritesHint =>
      'Tartson hosszan lenyomva egy címet, majd válassza a Hozzáadás a kedvencekhez lehetőséget.';

  @override
  String get emptyFavoritesLive =>
      'Húzza balra a csatornát, majd koppintson a csillagra.';

  @override
  String get emptyNone => 'Itt még nincs semmi';

  @override
  String get emptyNoneHint =>
      'Húzza lefelé a frissítéshez, vagy ellenőrizze a forrást a Beállításokban.';

  @override
  String get fieldServerInvalid =>
      'Ez a cím nem tűnik helyesnek. Példa: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Adja meg a teljes hivatkozást, http:// vagy https:// kezdettel';

  @override
  String get infoResume => 'Folytatás';

  @override
  String get libraryEmpty => 'A könyvtár üres';

  @override
  String get libraryEmptyHint =>
      'A kedvencek és a megkezdett címek itt jelennek meg.';

  @override
  String get onbNoChannels =>
      'Az BattleStation TV nem tartalmaz csatornákat, filmeket vagy lejátszási listákat. Adjon hozzá egy forrást attól a szolgáltatótól, amelynek előfizetője.';

  @override
  String get onbPasteHint => 'Kimásolt egy lejátszási lista hivatkozását?';

  @override
  String get onbTestRunning => 'Tesztelés…';

  @override
  String passwordBodyIos(String p1) {
    return 'Adja meg a(z) „$p1” jelszavát. A jelszó az iOS Keychainben tárolódik ezen az eszközön.';
  }

  @override
  String get searchRecent => 'Legutóbbi keresések';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Folytatás: É$p1 E$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'É$p1 E$p2';
  }

  @override
  String get seriesNoEpisodes => 'Nem található epizód';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Lejátszás: É$p1 E$p2';
  }

  @override
  String get seriesWatched => 'Megnézve';

  @override
  String get settingsAbout => 'Névjegy';

  @override
  String get settingsEditSource => 'Forrás szerkesztése';

  @override
  String get settingsLanguageNote =>
      'Az BattleStation TV az eszköz nyelvét használja. Ha csak ehhez az alkalmazáshoz szeretne másik nyelvet, válassza ki az iOS Beállításokban.';

  @override
  String get settingsOpenIOS => 'iOS Beállítások megnyitása';

  @override
  String get settingsPasswordNote =>
      'Hagyja üresen az új jelszót a jelenlegi megtartásához. A jelszavak az iOS Keychainben vannak tárolva.';

  @override
  String get settingsTitle => 'Beállítások';

  @override
  String get sourceDeleteWarn =>
      'A forrás, a hozzá tartozó kedvencek és megtekintési előzmények törlődnek erről az eszközről. A szolgáltatói fiókot ez nem érinti.';

  @override
  String get syncNow => 'Frissítés';

  @override
  String get tabLibrary => 'Könyvtár';

  @override
  String get scopeCategory => 'A kategóriában';

  @override
  String get scopeType => 'A szekcióban';

  @override
  String get scopeEverywhere => 'Mindenhol';

  @override
  String get searchPrompt => 'Keresés';

  @override
  String get syncRunning => 'Szinkronizálás…';

  @override
  String get syncFailed => 'A szinkronizálás sikertelen';

  @override
  String get syncNotUpdated => 'Mentett adatok láthatók';

  @override
  String get emptyResults => 'Nincs találat';

  @override
  String get favAdd => 'Hozzáadás a kedvencekhez';

  @override
  String get favRemove => 'Eltávolítás a kedvencekből';

  @override
  String get playerClose => 'Bezárás';

  @override
  String get playerSubtitles => 'Feliratok';

  @override
  String get playerAudio => 'Hang';

  @override
  String get playerOff => 'Ki';

  @override
  String get playerAddSubtitle => 'Feliratfájl hozzáadása…';

  @override
  String get playerCatchup => 'Visszanézés';

  @override
  String get playerFullscreen => 'Teljes képernyő';

  @override
  String get playerError => 'A lejátszás sikertelen';

  @override
  String get playerRetry => 'Újrapróbálkozás';

  @override
  String get playerPip => 'Kép a képben';

  @override
  String get playerPipReturn => 'Vissza az alkalmazáshoz';

  @override
  String get catchupTitle => 'Visszanézés';

  @override
  String get catchupNoEpg =>
      'Nincs műsorújság. Válassza ki az időpontot kézzel.';

  @override
  String get catchupPick => 'Kezdési időpont';

  @override
  String get catchupDuration => 'Percek';

  @override
  String get seriesSeason => 'Évad';

  @override
  String get onbWelcomeTitle => 'Üdvözli az BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Nézzen élő csatornákat, filmeket és sorozatokat IPTV-szolgáltatójától. Adjuk hozzá az első forrást.';

  @override
  String get onbWhereTitle => 'Hová kell beírni a címeket?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: a szolgáltató megad egy szervercímet (például http://host:8080), egy felhasználónevet és egy jelszót. Adja meg őket alább.';

  @override
  String get onbWhereM3u =>
      'M3U: adjon nevet a forrásnak, és illessze be a szolgáltatójától kapott lejátszási lista hivatkozását.';

  @override
  String get fieldKind => 'Típus';

  @override
  String get fieldName => 'Név';

  @override
  String get fieldServer => 'Szervercím';

  @override
  String get fieldUsername => 'Felhasználónév';

  @override
  String get fieldPassword => 'Jelszó';

  @override
  String get fieldUrl => 'Lejátszási lista hivatkozása';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Kapcsolat tesztelése';

  @override
  String get onbTestOk => 'Sikeres csatlakozás';

  @override
  String get onbTestFail => 'A csatlakozás sikertelen';

  @override
  String get onbNext => 'Tovább';

  @override
  String get onbBack => 'Vissza';

  @override
  String get onbSave => 'Mentés és szinkronizálás';

  @override
  String get settingsAccounts => 'Források';

  @override
  String get settingsLanguageSub => 'Előnyben részesített feliratnyelvek';

  @override
  String get settingsLanguageAudio => 'Előnyben részesített hangnyelvek';

  @override
  String get settingsSubscale => 'Felirat mérete';

  @override
  String get settingsSubdelay => 'Felirat késleltetése (másodperc)';

  @override
  String get settingsGuide => 'Gyorsindítási útmutató megjelenítése';

  @override
  String get settingsDelete => 'Törlés';

  @override
  String get accountAdd => 'Forrás hozzáadása…';

  @override
  String get settingsChangePassword => 'Jelszó módosítása…';

  @override
  String get settingsNewPassword => 'Új jelszó';

  @override
  String updateAvailable(String p1) {
    return 'Új verzió érhető el: $p1';
  }

  @override
  String get updateNow => 'Frissítés most';

  @override
  String get updateNotes => 'Újdonságok';

  @override
  String get updateLater => 'Később';

  @override
  String get updateDownloading => 'Frissítés letöltése…';

  @override
  String updateReady(String p1) {
    return 'A frissítés telepítésre kész: $p1';
  }

  @override
  String get updateRestart => 'Újraindítás a frissítéshez';

  @override
  String get updateFailed => 'A frissítés sikertelen';

  @override
  String get updateManual => 'Manuális letöltés';

  @override
  String get updateCheckNow => 'Frissítések keresése';

  @override
  String get updateAuto => 'Frissítések automatikus keresése';

  @override
  String get updateAutoInstall => 'Frissítések automatikus letöltése';

  @override
  String get updateUpToDate => 'A legújabb verziót használja';

  @override
  String get updateDevBuild =>
      'A frissítések csak a telepített alkalmazásban érhetők el';

  @override
  String updateCurrent(String p1) {
    return 'Jelenlegi verzió: $p1';
  }

  @override
  String get playerBack => 'Vissza';

  @override
  String get playerErrorHint =>
      'Ha ez továbbra is előfordul, ellenőrizze a forrás jelszavát a Beállításokban.';

  @override
  String get passwordTitle => 'Jelszó szükséges';

  @override
  String passwordBody(String p1) {
    return 'Adja meg a(z) „$p1” jelszavát. A jelszó privát módon tárolódik ezen a Macen.';
  }

  @override
  String get passwordNone => 'Folytatás jelszó nélkül';

  @override
  String get playerSpeed => 'Lejátszási sebesség';

  @override
  String get playerSpeedNormal => 'Normál';

  @override
  String get playerSpeedReset => 'Normál sebesség';

  @override
  String get settingsSeekPreview => 'Előnézeti kép a keresősávon';

  @override
  String get settingsSeekPreviewNote =>
      'Második kapcsolatot nyit a szolgáltatóhoz. Kapcsolja ki, ha a lejátszás megáll, vagy ha a szolgáltatója csak egy kapcsolatot engedélyez.';

  @override
  String get playerSeekBar => 'Lejátszási pozíció';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 / $p2';
  }

  @override
  String get playerLive => 'Élő';

  @override
  String get playerChannelPrev => 'Előző csatorna';

  @override
  String get playerChannelNext => 'Következő csatorna';

  @override
  String get playerScaleFit => 'Illesztés';

  @override
  String get playerScaleFill => 'Kitöltés';

  @override
  String get playerScaleStretch => 'Nyújtás';

  @override
  String get playerSubtitleAdjust => 'Feliratok beállítása…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Fényerő';

  @override
  String get playerVolume => 'Hangerő';

  @override
  String get playerReplay => 'Lejátszás újra';

  @override
  String get settingsClock => 'Idő megjelenítése a lejátszóban';

  @override
  String get settingsSeekStep =>
      'Ugrás lépésköze (nyílbillentyűk és ugrógombok)';

  @override
  String get settingsBarsHide => 'Vezérlők elrejtése ennyi idő után';

  @override
  String get settingsNever => 'Soha';

  @override
  String get settingsVideoScale => 'Videó méretezése';

  @override
  String get settingsScaleFit => 'Illesztés (fekete sávokkal)';

  @override
  String get settingsScaleFill => 'Kitöltés (levágja a széleket)';

  @override
  String get settingsScaleStretch => 'Nyújtás';

  @override
  String get settingsVideoScaleHint =>
      'Nyomja meg az A billentyűt a lejátszóban a három közötti váltáshoz.';

  @override
  String get settingsBuffer => 'Hálózati puffer';

  @override
  String get settingsBufferSmall => 'Kicsi';

  @override
  String get settingsBufferNormal => 'Normál';

  @override
  String get settingsBufferLarge => 'Nagy';

  @override
  String get settingsBufferHint =>
      'A nagyobb puffer lassú vagy instabil kapcsolat esetén segít.';

  @override
  String unitSeconds(int p1) {
    return '$p1 másodperc';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 perc';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 p';
  }

  @override
  String playerSkipBack(String p1) {
    return 'Vissza $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Előre $p1';
  }

  @override
  String get playerSleep => 'Elalvásidőzítő';

  @override
  String get downloadsTitle => 'Letöltések';

  @override
  String get downloadsAdd => 'Letöltés';

  @override
  String get downloadsSeason => 'Évad letöltése';

  @override
  String get downloadsChooseFolder =>
      'Válassza ki, hová mentse a letöltött filmeket és epizódokat';

  @override
  String get downloadsChoose => 'Kiválasztás';

  @override
  String get downloadsNotChosen => 'Az első letöltéskor kérdez rá';

  @override
  String get downloadsChange => 'Mappa módosítása…';

  @override
  String get downloadsPause => 'Szünet';

  @override
  String get downloadsResume => 'Folytatás';

  @override
  String get downloadsCancel => 'Mégse';

  @override
  String get downloadsPlay => 'Lejátszás';

  @override
  String get downloadsReveal => 'Megjelenítés a Finderben';

  @override
  String get downloadsDelete => 'Fájl törlése';

  @override
  String get downloadsEmpty => 'Még nincsenek letöltések';

  @override
  String get downloadsQueued => 'Várakozik';

  @override
  String get downloadsDone => 'Kész';

  @override
  String get downloadsHint =>
      'A letöltések egyenként futnak. Sok szolgáltató csak egy kapcsolatot engedélyez, ezért letöltés közben a lejátszás meghiúsulhat. A befejezetlen letöltések nem maradnak meg az alkalmazás bezárásakor.';

  @override
  String get epgNow => 'Most';

  @override
  String get epgNext => 'Következő';

  @override
  String get settingsFullscreen =>
      'Lejátszás megnyitása teljes képernyőn (a vezérlők addig rejtve maradnak, amíg meg nem mozdítja az egeret)';

  @override
  String get nextTitle => 'Következik';

  @override
  String nextIn(int p1) {
    return 'Lejátszás $p1 mp múlva';
  }

  @override
  String get nextNow => 'Lejátszás most';

  @override
  String get nextCancel => 'Mégse';

  @override
  String get settingsAutoNext => 'A következő epizód automatikus lejátszása';

  @override
  String get downloadsNoSpace => 'Nincs elég szabad lemezterület';

  @override
  String get dbErrorTitle =>
      'Az BattleStation TV nem tudja megnyitni az adatbázisát';

  @override
  String get dbErrorBody =>
      'Ha az BattleStation TV egy másik példánya fut, lépjen ki belőle, és próbálja újra.';

  @override
  String get dbRecoveredTitle => 'Az adatbázis megsérült';

  @override
  String dbRecoveredBody(String p1) {
    return 'Az BattleStation TV új adatbázissal indult (adja hozzá újra a forrást). A sérült fájl itt maradt meg:\n$p1';
  }

  @override
  String get menuShowWindow => 'Ablak megjelenítése';

  @override
  String get settingsTabGeneral => 'Általános';

  @override
  String get settingsTabPlayer => 'Lejátszó';

  @override
  String get settingsTabPlaylists => 'Lejátszási listák';

  @override
  String get settingsAppearance => 'Megjelenés';

  @override
  String get settingsSystem => 'Rendszer';

  @override
  String get appearanceLight => 'Világos';

  @override
  String get appearanceDark => 'Sötét';

  @override
  String get settingsInterfaceLanguage => 'Felület nyelve';

  @override
  String get settingsLanguageRestart =>
      'Az BattleStation TV újraindítása után lép életbe.';

  @override
  String get settingsHideCategories => 'Kategóriák elrejtése';

  @override
  String get settingsHideCategoriesWords => 'Elrejtendő szavak';

  @override
  String get settingsHideCategoriesNote =>
      'Elrejti azokat a kategóriákat, amelyek neve tartalmazza ezeket a szavakat (vesszővel válassza el őket). A hozzájuk tartozó csatornák, filmek és sorozatok a keresésből, a kedvencekből és a folytatás listáiból is eltűnnek. Ez egyszerű szűrő, nem gyerekzár: bárki módosíthatja itt.';

  @override
  String get settingsRefresh => 'Lejátszási listák frissítése';

  @override
  String get settingsRefresh0 => 'Csak az alkalmazás megnyitásakor';

  @override
  String get settingsRefresh6 => '6 óránként';

  @override
  String get settingsRefresh12 => '12 óránként';

  @override
  String get settingsRefresh24 => '24 óránként';

  @override
  String get settingsBackup => 'Biztonsági mentés és visszaállítás';

  @override
  String get backupExport => 'Biztonsági mentés exportálása…';

  @override
  String get backupImport => 'Biztonsági mentés importálása…';

  @override
  String get backupWarn =>
      'A biztonsági mentés fájlja felsorolja a lejátszási listákat a címeikkel együtt, amelyek bejelentkezési adatokat is tartalmazhatnak, ezért tartsa privátan. Az Xtream források jelszavai nem kerülnek bele. Az importálás hozzáadódik a jelenlegi forrásokhoz, és nem töröl semmit.';

  @override
  String get backupExported => 'A biztonsági mentés elmentve.';

  @override
  String get backupImported => 'A biztonsági mentés importálva.';

  @override
  String get backupErrorInvalid =>
      'Ez nem BattleStation TV biztonsági mentés fájlja.';

  @override
  String get backupErrorVersion =>
      'Ez a biztonsági mentés az BattleStation TV egy másik verziójából származik, és nem olvasható.';

  @override
  String get backupErrorTooLarge =>
      'Ez a fájl túl nagy ahhoz, hogy biztonsági mentés legyen.';

  @override
  String get backupFailed => 'A biztonsági mentés sikertelen';

  @override
  String get settingsClearData => 'Adatok törlése';

  @override
  String get clearHistory => 'Megtekintési előzmények törlése';

  @override
  String get clearFavorites => 'Kedvencek törlése';

  @override
  String get clearImages => 'Képgyorsítótár törlése';

  @override
  String get clearConfirm => 'Törlés';

  @override
  String get clearHistoryWarn =>
      'A folytatási pozíciók és a folytatás listái az összes forrásból törlődnek. Ez nem vonható vissza.';

  @override
  String get clearFavoritesWarn =>
      'Az összes forrás kedvencei törlődnek. Ez nem vonható vissza.';

  @override
  String get clearImagesWarn =>
      'A mentett logók és poszterek törlődnek, és szükség esetén újra letöltődnek.';

  @override
  String get infoDetails => 'Részletek';

  @override
  String get infoPlot => 'Cselekmény';

  @override
  String get infoCast => 'Szereplők';

  @override
  String get infoDirector => 'Rendező';

  @override
  String get infoGenre => 'Műfaj';

  @override
  String get infoYear => 'Megjelenés éve';

  @override
  String get infoRating => 'Értékelés';

  @override
  String get infoDuration => 'Hossz';

  @override
  String get infoCountry => 'Ország';

  @override
  String get infoTrailer => 'Előzetes';

  @override
  String get infoPlay => 'Lejátszás';

  @override
  String get infoEmpty =>
      'Az Ön szolgáltatója nem ad meg részleteket ehhez a címhez.';

  @override
  String get infoLoading => 'Részletek betöltése…';

  @override
  String get infoError => 'A részleteket nem sikerült betölteni.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 ó';
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
  String get playerSkipIntro => 'Intro átugrása';

  @override
  String get playerSkipCredits => 'Stáblista átugrása';

  @override
  String get playerSkipMenu => 'Intro és stáblista';

  @override
  String get playerMarkIntroStart => 'Itt kezdődik az intro';

  @override
  String get playerMarkIntroEnd => 'Itt ér véget az intro';

  @override
  String get playerMarkCredits => 'Itt kezdődik a stáblista';

  @override
  String get playerSkipForget => 'Intro és stáblista elfelejtése';

  @override
  String get playerSkipSaved => 'Mentve a sorozat összes epizódjához';

  @override
  String get playerSkipRefused => 'Ezen a ponton nem lehetséges';

  @override
  String get continueRemove => 'Eltávolítás a Folytatás listáról';

  @override
  String get settingsFavoritesAZ => 'Kedvencek rendezése név szerint (A–Z)';

  @override
  String get settingsKeychain => 'Jelszavak tárolása a Kulcskarikában';

  @override
  String get settingsKeychainNote =>
      'Ki: a jelszavak az app saját adatbázisában maradnak. Be: a macOS a bejelentkezési kulcskarikában tárolja őket.';

  @override
  String get settingsKeychainFailed =>
      'A Kulcskarika nem fogadta el a jelszavakat. Semmi sem változott.';
}
