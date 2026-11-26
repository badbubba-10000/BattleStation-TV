// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'În direct';

  @override
  String get tabMovies => 'Filme';

  @override
  String get tabSeries => 'Seriale';

  @override
  String get catAll => 'Toate';

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
  String get catFavorites => 'Favorite';

  @override
  String get catContinue => 'Continuă vizionarea';

  @override
  String get catFilter => 'Filtrează categoriile';

  @override
  String get playlistAll => 'Toate listele de redare';

  @override
  String get playlistLabel => 'Listă de redare';

  @override
  String get aboutAcknowledgements => 'Mulțumiri';

  @override
  String get aboutPrivacy => 'Confidențialitate';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV nu colectează nicio dată despre tine. Nu are cont, analize, publicitate sau urmărire.\n\nSursele, favoritele și istoricul vizionărilor rămân pe acest dispozitiv. Aplicația se conectează doar la adresele pe care le adaugi tu: serverul furnizorului, lista de redare, ghidul de programe, logourile și fluxurile.\n\nParolele furnizorilor sunt păstrate în iOS Keychain numai pe acest dispozitiv. Ele nu sunt incluse niciodată într-un fișier de rezervă.\n\nBattleStation TV nu include canale, filme sau liste de redare. Sursa o aduci tu.';

  @override
  String get aboutSource => 'Cod sursă și licență';

  @override
  String get aboutCoffee => 'Cumpără-mi o cafea';

  @override
  String get tipsTitle => 'Susține BattleStation TV';

  @override
  String get tipsFooter =>
      'Bacșiș opțional prin Apple. Nu deblochează nimic: toate funcțiile rămân gratuite pentru toată lumea.';

  @override
  String get tipsThanks => 'Mulțumim pentru sprijin!';

  @override
  String get tipsPending => 'Se așteaptă aprobarea.';

  @override
  String get tipsFailed => 'Bacșișul nu a trecut. Încearcă din nou mai târziu.';

  @override
  String get aboutVersion => 'Versiune';

  @override
  String get catTitle => 'Categorii';

  @override
  String get commonCancel => 'Anulează';

  @override
  String get emptyContinue => 'Nimic de continuat';

  @override
  String get emptyContinueHint =>
      'Filmele și episoadele pe care le oprești la jumătate apar aici.';

  @override
  String get emptyFavorites => 'Încă nu ai favorite';

  @override
  String get emptyFavoritesHint =>
      'Ține apăsat pe un titlu, apoi alege Adaugă la favorite.';

  @override
  String get emptyFavoritesLive =>
      'Glisează un canal spre stânga, apoi atinge steaua.';

  @override
  String get emptyNone => 'Încă nu e nimic aici';

  @override
  String get emptyNoneHint =>
      'Trage în jos pentru a reîmprospăta sau verifică sursa în Setări.';

  @override
  String get fieldServerInvalid =>
      'Această adresă nu pare corectă. Exemplu: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Introdu linkul complet, care începe cu http:// sau https://';

  @override
  String get infoResume => 'Reia';

  @override
  String get libraryEmpty => 'Biblioteca ta este goală';

  @override
  String get libraryEmptyHint => 'Favoritele și titlurile începute apar aici.';

  @override
  String get onbNoChannels =>
      'BattleStation TV nu include canale, filme sau liste de redare. Adaugă o sursă de la un furnizor la care ești abonat.';

  @override
  String get onbPasteHint => 'Ai copiat un link de listă de redare?';

  @override
  String get onbTestRunning => 'Se testează…';

  @override
  String passwordBodyIos(String p1) {
    return 'Introdu parola pentru „$p1”. Este stocată în iOS Keychain pe acest dispozitiv.';
  }

  @override
  String get searchRecent => 'Căutări recente';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Continuă S$p1 Ep. $p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'S$p1 Ep. $p2';
  }

  @override
  String get seriesNoEpisodes => 'Nu s-au găsit episoade';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Redă S$p1 Ep. $p2';
  }

  @override
  String get seriesWatched => 'Vizionat';

  @override
  String get settingsAbout => 'Despre';

  @override
  String get settingsEditSource => 'Editează sursa';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV folosește limba dispozitivului tău. Pentru a folosi altă limbă doar pentru această aplicație, alege-o în Setările iOS.';

  @override
  String get settingsOpenIOS => 'Deschide Setările iOS';

  @override
  String get settingsPasswordNote =>
      'Lasă parola nouă goală pentru a o păstra pe cea curentă. Parolele sunt stocate în iOS Keychain.';

  @override
  String get settingsTitle => 'Setări';

  @override
  String get sourceDeleteWarn =>
      'Sursa, favoritele și istoricul ei de vizionări sunt eliminate de pe acest dispozitiv. Contul tău la furnizor nu este afectat.';

  @override
  String get syncNow => 'Reîmprospătează';

  @override
  String get tabLibrary => 'Bibliotecă';

  @override
  String get scopeCategory => 'În categorie';

  @override
  String get scopeType => 'În secțiune';

  @override
  String get scopeEverywhere => 'Peste tot';

  @override
  String get searchPrompt => 'Caută';

  @override
  String get syncRunning => 'Se sincronizează…';

  @override
  String get syncFailed => 'Sincronizarea a eșuat';

  @override
  String get syncNotUpdated => 'Se afișează datele salvate';

  @override
  String get emptyResults => 'Nu s-a găsit nimic';

  @override
  String get favAdd => 'Adaugă la favorite';

  @override
  String get favRemove => 'Elimină din favorite';

  @override
  String get playerClose => 'Închide';

  @override
  String get playerSubtitles => 'Subtitrări';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerOff => 'Dezactivat';

  @override
  String get playerAddSubtitle => 'Adaugă fișier de subtitrare…';

  @override
  String get playerCatchup => 'Vizionează din arhivă';

  @override
  String get playerFullscreen => 'Ecran complet';

  @override
  String get playerError => 'Redarea a eșuat';

  @override
  String get playerRetry => 'Încearcă din nou';

  @override
  String get playerPip => 'Imagine în imagine';

  @override
  String get playerPipReturn => 'Înapoi la aplicație';

  @override
  String get catchupTitle => 'Arhivă';

  @override
  String get catchupNoEpg => 'Nu există ghid de programe. Alege ora manual.';

  @override
  String get catchupPick => 'Ora de început';

  @override
  String get catchupDuration => 'Durată (min)';

  @override
  String get seriesSeason => 'Sezon';

  @override
  String get onbWelcomeTitle => 'Bun venit în BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Urmărește canale în direct, filme și seriale de la furnizorul tău IPTV. Hai să adăugăm prima sursă.';

  @override
  String get onbWhereTitle => 'Unde se introduc adresele?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: furnizorul îți oferă adresa serverului (de exemplu http://host:8080), un nume de utilizator și o parolă. Introdu-le mai jos.';

  @override
  String get onbWhereM3u =>
      'M3U: dă un nume sursei și lipește linkul listei de redare primit de la furnizor.';

  @override
  String get fieldKind => 'Tip';

  @override
  String get fieldName => 'Nume';

  @override
  String get fieldServer => 'Adresa serverului';

  @override
  String get fieldUsername => 'Nume de utilizator';

  @override
  String get fieldPassword => 'Parolă';

  @override
  String get fieldUrl => 'Link listă de redare';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Testează conexiunea';

  @override
  String get onbTestOk => 'Conectat cu succes';

  @override
  String get onbTestFail => 'Conectarea a eșuat';

  @override
  String get onbNext => 'Continuă';

  @override
  String get onbBack => 'Înapoi';

  @override
  String get onbSave => 'Salvează și sincronizează';

  @override
  String get settingsAccounts => 'Surse';

  @override
  String get settingsLanguageSub => 'Limbi preferate pentru subtitrări';

  @override
  String get settingsLanguageAudio => 'Limbi preferate pentru audio';

  @override
  String get settingsSubscale => 'Dimensiunea subtitrărilor';

  @override
  String get settingsSubdelay => 'Întârzierea subtitrărilor (secunde)';

  @override
  String get settingsGuide => 'Afișează ghidul de pornire rapidă';

  @override
  String get settingsDelete => 'Șterge';

  @override
  String get accountAdd => 'Adaugă sursă…';

  @override
  String get settingsChangePassword => 'Schimbă parola…';

  @override
  String get settingsNewPassword => 'Parolă nouă';

  @override
  String updateAvailable(String p1) {
    return 'Versiunea $p1 este disponibilă';
  }

  @override
  String get updateNow => 'Actualizează acum';

  @override
  String get updateNotes => 'Noutăți';

  @override
  String get updateLater => 'Mai târziu';

  @override
  String get updateDownloading => 'Se descarcă actualizarea…';

  @override
  String updateReady(String p1) {
    return 'Versiunea $p1 este gata de instalare';
  }

  @override
  String get updateRestart => 'Repornește pentru actualizare';

  @override
  String get updateFailed => 'Actualizarea a eșuat';

  @override
  String get updateManual => 'Descarcă manual';

  @override
  String get updateCheckNow => 'Caută actualizări';

  @override
  String get updateAuto => 'Caută actualizări automat';

  @override
  String get updateAutoInstall => 'Descarcă actualizările automat';

  @override
  String get updateUpToDate => 'Ai cea mai recentă versiune';

  @override
  String get updateDevBuild =>
      'Actualizările sunt disponibile doar în aplicația instalată';

  @override
  String updateCurrent(String p1) {
    return 'Versiunea curentă: $p1';
  }

  @override
  String get playerBack => 'Înapoi';

  @override
  String get playerErrorHint =>
      'Dacă problema persistă, verifică parola sursei în Setări.';

  @override
  String get passwordTitle => 'Este necesară parola';

  @override
  String passwordBody(String p1) {
    return 'Introdu parola pentru „$p1”. Este stocată privat pe acest Mac.';
  }

  @override
  String get passwordNone => 'Continuă fără parolă';

  @override
  String get playerSpeed => 'Viteza de redare';

  @override
  String get playerSpeedNormal => 'Normală';

  @override
  String get playerSpeedReset => 'Viteză normală';

  @override
  String get settingsSeekPreview =>
      'Miniaturi de previzualizare pe bara de progres';

  @override
  String get settingsSeekPreviewNote =>
      'Deschide o a doua conexiune către furnizorul tău. Dezactivează opțiunea dacă redarea se oprește sau dacă furnizorul tău permite o singură conexiune.';

  @override
  String get playerSeekBar => 'Poziția de redare';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 din $p2';
  }

  @override
  String get playerLive => 'Live';

  @override
  String get playerChannelPrev => 'Canalul anterior';

  @override
  String get playerChannelNext => 'Canalul următor';

  @override
  String get playerScaleFit => 'Potrivire';

  @override
  String get playerScaleFill => 'Umplere';

  @override
  String get playerScaleStretch => 'Întindere';

  @override
  String get playerSubtitleAdjust => 'Reglează subtitrările…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Luminozitate';

  @override
  String get playerVolume => 'Volum';

  @override
  String get playerReplay => 'Redă din nou';

  @override
  String get settingsClock => 'Afișează ora în player';

  @override
  String get settingsSeekStep =>
      'Pasul de salt (tastele săgeți și butoanele de salt)';

  @override
  String get settingsBarsHide => 'Ascunde controalele după';

  @override
  String get settingsNever => 'Niciodată';

  @override
  String get settingsVideoScale => 'Scalarea video';

  @override
  String get settingsScaleFit => 'Potrivire (benzi negre)';

  @override
  String get settingsScaleFill => 'Umplere (taie marginile)';

  @override
  String get settingsScaleStretch => 'Întindere';

  @override
  String get settingsVideoScaleHint =>
      'Apasă A în player pentru a comuta între cele trei moduri.';

  @override
  String get settingsBuffer => 'Buffer de rețea';

  @override
  String get settingsBufferSmall => 'Mic';

  @override
  String get settingsBufferNormal => 'Normal';

  @override
  String get settingsBufferLarge => 'Mare';

  @override
  String get settingsBufferHint =>
      'Un buffer mai mare ajută la o conexiune lentă sau instabilă.';

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
    return 'Înapoi $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Înainte $p1';
  }

  @override
  String get playerSleep => 'Temporizator de oprire';

  @override
  String get downloadsTitle => 'Descărcări';

  @override
  String get downloadsAdd => 'Descarcă';

  @override
  String get downloadsSeason => 'Descarcă sezonul';

  @override
  String get downloadsChooseFolder =>
      'Alege unde se salvează filmele și episoadele descărcate';

  @override
  String get downloadsChoose => 'Alege';

  @override
  String get downloadsNotChosen => 'Se va cere la prima descărcare';

  @override
  String get downloadsChange => 'Schimbă folderul…';

  @override
  String get downloadsPause => 'Pauză';

  @override
  String get downloadsResume => 'Reia';

  @override
  String get downloadsCancel => 'Anulează';

  @override
  String get downloadsPlay => 'Redă';

  @override
  String get downloadsReveal => 'Afișează în Finder';

  @override
  String get downloadsDelete => 'Șterge fișierul';

  @override
  String get downloadsEmpty => 'Nicio descărcare încă';

  @override
  String get downloadsQueued => 'În așteptare';

  @override
  String get downloadsDone => 'Finalizat';

  @override
  String get downloadsHint =>
      'Descărcările rulează pe rând. Mulți furnizori permit o singură conexiune, deci redarea în timpul descărcării poate eșua. Descărcările neterminate nu se păstrează la închiderea aplicației.';

  @override
  String get epgNow => 'Acum';

  @override
  String get epgNext => 'Urmează';

  @override
  String get settingsFullscreen =>
      'Deschide redarea pe ecran complet (controalele rămân ascunse până miști mouse-ul)';

  @override
  String get nextTitle => 'Episodul următor';

  @override
  String nextIn(int p1) {
    return 'Redare în $p1 s';
  }

  @override
  String get nextNow => 'Redă acum';

  @override
  String get nextCancel => 'Anulează';

  @override
  String get settingsAutoNext => 'Redă automat episodul următor';

  @override
  String get downloadsNoSpace => 'Spațiu liber insuficient pe disc';

  @override
  String get dbErrorTitle => 'BattleStation TV nu poate deschide baza de date';

  @override
  String get dbErrorBody =>
      'Dacă rulează o altă copie a BattleStation TV, închide-o și încearcă din nou.';

  @override
  String get dbRecoveredTitle => 'Baza de date a fost deteriorată';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV a pornit cu o bază de date nouă (adaugă din nou sursa). Fișierul deteriorat a fost păstrat aici:\n$p1';
  }

  @override
  String get menuShowWindow => 'Afișează fereastra';

  @override
  String get settingsTabGeneral => 'General';

  @override
  String get settingsTabPlayer => 'Player';

  @override
  String get settingsTabPlaylists => 'Liste de redare';

  @override
  String get settingsAppearance => 'Aspect';

  @override
  String get settingsSystem => 'Sistem';

  @override
  String get appearanceLight => 'Luminos';

  @override
  String get appearanceDark => 'Întunecat';

  @override
  String get settingsInterfaceLanguage => 'Limba interfeței';

  @override
  String get settingsLanguageRestart =>
      'Se aplică după repornirea BattleStation TV.';

  @override
  String get settingsHideCategories => 'Ascunde categorii';

  @override
  String get settingsHideCategoriesWords => 'Cuvinte de ascuns';

  @override
  String get settingsHideCategoriesNote =>
      'Ascunde categoriile al căror nume conține aceste cuvinte (separă-le prin virgule). Canalele, filmele și serialele lor dispar și din căutare, favorite și din „Continuă vizionarea”. Este un simplu filtru, nu un control parental: oricine îl poate modifica aici.';

  @override
  String get settingsRefresh => 'Actualizare liste de redare';

  @override
  String get settingsRefresh0 => 'Doar la deschiderea aplicației';

  @override
  String get settingsRefresh6 => 'La fiecare 6 h';

  @override
  String get settingsRefresh12 => 'La fiecare 12 h';

  @override
  String get settingsRefresh24 => 'La fiecare 24 h';

  @override
  String get settingsBackup => 'Copie de rezervă și restaurare';

  @override
  String get backupExport => 'Exportă copia de rezervă…';

  @override
  String get backupImport => 'Importă copia de rezervă…';

  @override
  String get backupWarn =>
      'Fișierul de rezervă enumeră listele tale de redare împreună cu adresele lor, care pot include date de autentificare, așa că păstrează-l privat. Parolele surselor Xtream nu sunt salvate în el. Importul se adaugă la sursele curente și nu șterge nimic.';

  @override
  String get backupExported => 'Copia de rezervă a fost salvată.';

  @override
  String get backupImported => 'Copia de rezervă a fost importată.';

  @override
  String get backupErrorInvalid =>
      'Acesta nu este un fișier de rezervă BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'Această copie de rezervă provine dintr-o altă versiune a BattleStation TV și nu poate fi citită.';

  @override
  String get backupErrorTooLarge =>
      'Fișierul este prea mare pentru a fi o copie de rezervă.';

  @override
  String get backupFailed => 'Copierea de rezervă a eșuat';

  @override
  String get settingsClearData => 'Șterge datele';

  @override
  String get clearHistory => 'Șterge istoricul vizionărilor';

  @override
  String get clearFavorites => 'Șterge favoritele';

  @override
  String get clearImages => 'Șterge memoria cache a imaginilor';

  @override
  String get clearConfirm => 'Șterge';

  @override
  String get clearHistoryWarn =>
      'Pozițiile de reluare și listele „Continuă vizionarea” ale tuturor surselor vor fi șterse. Această acțiune nu poate fi anulată.';

  @override
  String get clearFavoritesWarn =>
      'Favoritele din toate sursele vor fi eliminate. Această acțiune nu poate fi anulată.';

  @override
  String get clearImagesWarn =>
      'Logourile și afișele salvate sunt eliminate și descărcate din nou când este nevoie.';

  @override
  String get infoDetails => 'Detalii';

  @override
  String get infoPlot => 'Intriga';

  @override
  String get infoCast => 'Distribuție';

  @override
  String get infoDirector => 'Regizor';

  @override
  String get infoGenre => 'Gen';

  @override
  String get infoYear => 'Anul apariției';

  @override
  String get infoRating => 'Evaluare';

  @override
  String get infoDuration => 'Durată';

  @override
  String get infoCountry => 'Țara';

  @override
  String get infoTrailer => 'Trailer';

  @override
  String get infoPlay => 'Redă';

  @override
  String get infoEmpty => 'Furnizorul tău nu are detalii despre acest titlu.';

  @override
  String get infoLoading => 'Se încarcă detaliile…';

  @override
  String get infoError => 'Detaliile nu au putut fi încărcate.';

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
  String get playerSkipIntro => 'Sari peste generic';

  @override
  String get playerSkipCredits => 'Sari peste final';

  @override
  String get playerSkipMenu => 'Generic și final';

  @override
  String get playerMarkIntroStart => 'Genericul începe aici';

  @override
  String get playerMarkIntroEnd => 'Genericul se termină aici';

  @override
  String get playerMarkCredits => 'Finalul începe aici';

  @override
  String get playerSkipForget => 'Uită genericul și finalul';

  @override
  String get playerSkipSaved => 'Salvat pentru toate episoadele acestui serial';

  @override
  String get playerSkipRefused => 'Nu este posibil în acest punct';

  @override
  String get continueRemove => 'Elimină din Continuă vizionarea';

  @override
  String get settingsFavoritesAZ => 'Sortează favoritele după nume (A–Z)';

  @override
  String get settingsKeychain => 'Păstrează parolele în Keychain';

  @override
  String get settingsKeychainNote =>
      'Dezactivat: parolele rămân în baza de date privată a aplicației. Activat: macOS le păstrează în keychain-ul tău de autentificare.';

  @override
  String get settingsKeychainFailed =>
      'Keychain nu a acceptat parolele. Nu s-a schimbat nimic.';
}
