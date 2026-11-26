// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Na żywo';

  @override
  String get tabMovies => 'Filmy';

  @override
  String get tabSeries => 'Seriale';

  @override
  String get catAll => 'Wszystkie';

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
  String get catFavorites => 'Ulubione';

  @override
  String get catContinue => 'Kontynuuj oglądanie';

  @override
  String get catFilter => 'Filtruj kategorie';

  @override
  String get playlistAll => 'Wszystkie playlisty';

  @override
  String get playlistLabel => 'Playlista';

  @override
  String get aboutAcknowledgements => 'Podziękowania';

  @override
  String get aboutPrivacy => 'Prywatność';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV nie zbiera żadnych danych o Tobie. Nie ma konta, analityki, reklam ani śledzenia.\n\nTwoje źródła, ulubione i historia oglądania zostają na tym urządzeniu. Aplikacja łączy się tylko z adresami, które dodajesz samodzielnie: serwerem dostawcy, playlistą, przewodnikiem po programach, logo i strumieniami.\n\nHasła dostawców są przechowywane w iOS Keychain wyłącznie na tym urządzeniu. Nigdy nie trafiają do pliku kopii zapasowej.\n\nBattleStation TV nie zawiera kanałów, filmów ani playlist. Źródło musisz mieć własne.';

  @override
  String get aboutSource => 'Kod źródłowy i licencja';

  @override
  String get aboutCoffee => 'Postaw mi kawę';

  @override
  String get tipsTitle => 'Wesprzyj BattleStation TV';

  @override
  String get tipsFooter =>
      'Dobrowolne napiwki przez Apple. Niczego nie odblokowują: wszystkie funkcje pozostają bezpłatne dla wszystkich.';

  @override
  String get tipsThanks => 'Dziękujemy za wsparcie!';

  @override
  String get tipsPending => 'Oczekiwanie na zatwierdzenie.';

  @override
  String get tipsFailed => 'Napiwek nie przeszedł. Spróbuj ponownie później.';

  @override
  String get aboutVersion => 'Wersja';

  @override
  String get catTitle => 'Kategorie';

  @override
  String get commonCancel => 'Anuluj';

  @override
  String get emptyContinue => 'Nic do kontynuowania';

  @override
  String get emptyContinueHint =>
      'Filmy i odcinki, które przerwiesz w połowie, pojawią się tutaj.';

  @override
  String get emptyFavorites => 'Brak ulubionych';

  @override
  String get emptyFavoritesHint =>
      'Dotknij tytuł i przytrzymaj, a następnie wybierz Dodaj do ulubionych.';

  @override
  String get emptyFavoritesLive =>
      'Przesuń kanał w lewo, a potem dotknij gwiazdki.';

  @override
  String get emptyNone => 'Na razie nic tu nie ma';

  @override
  String get emptyNoneHint =>
      'Pociągnij w dół, aby odświeżyć, lub sprawdź źródło w Ustawieniach.';

  @override
  String get fieldServerInvalid =>
      'Ten adres wygląda nieprawidłowo. Przykład: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Wpisz pełny link zaczynający się od http:// lub https://';

  @override
  String get infoResume => 'Wznów';

  @override
  String get libraryEmpty => 'Twoja biblioteka jest pusta';

  @override
  String get libraryEmptyHint =>
      'Ulubione i rozpoczęte tytuły pojawią się tutaj.';

  @override
  String get onbNoChannels =>
      'BattleStation TV nie zawiera kanałów, filmów ani playlist. Dodaj źródło od dostawcy, u którego masz abonament.';

  @override
  String get onbPasteHint => 'Masz link do playlisty w schowku?';

  @override
  String get onbTestRunning => 'Testowanie…';

  @override
  String passwordBodyIos(String p1) {
    return 'Wpisz hasło do „$p1”. Jest przechowywane w iOS Keychain na tym urządzeniu.';
  }

  @override
  String get searchRecent => 'Ostatnie wyszukiwania';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Kontynuuj S$p1 O$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'S$p1 O$p2';
  }

  @override
  String get seriesNoEpisodes => 'Nie znaleziono odcinków';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Odtwórz S$p1 O$p2';
  }

  @override
  String get seriesWatched => 'Obejrzane';

  @override
  String get settingsAbout => 'Informacje';

  @override
  String get settingsEditSource => 'Edytuj źródło';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV używa języka Twojego urządzenia. Aby używać innego języka tylko w tej aplikacji, wybierz go w Ustawieniach iOS.';

  @override
  String get settingsOpenIOS => 'Otwórz Ustawienia iOS';

  @override
  String get settingsPasswordNote =>
      'Zostaw nowe hasło puste, aby zachować obecne. Hasła są przechowywane w iOS Keychain.';

  @override
  String get settingsTitle => 'Ustawienia';

  @override
  String get sourceDeleteWarn =>
      'Źródło, jego ulubione i historia oglądania zostaną usunięte z tego urządzenia. Twoje konto u dostawcy nie ulegnie zmianie.';

  @override
  String get syncNow => 'Odśwież';

  @override
  String get tabLibrary => 'Biblioteka';

  @override
  String get scopeCategory => 'W kategorii';

  @override
  String get scopeType => 'W sekcji';

  @override
  String get scopeEverywhere => 'Wszędzie';

  @override
  String get searchPrompt => 'Szukaj';

  @override
  String get syncRunning => 'Synchronizowanie…';

  @override
  String get syncFailed => 'Synchronizacja nie powiodła się';

  @override
  String get syncNotUpdated => 'Wyświetlane są zapisane dane';

  @override
  String get emptyResults => 'Nic nie znaleziono';

  @override
  String get favAdd => 'Dodaj do ulubionych';

  @override
  String get favRemove => 'Usuń z ulubionych';

  @override
  String get playerClose => 'Zamknij';

  @override
  String get playerSubtitles => 'Napisy';

  @override
  String get playerAudio => 'Dźwięk';

  @override
  String get playerOff => 'Wyłączone';

  @override
  String get playerAddSubtitle => 'Dodaj plik napisów…';

  @override
  String get playerCatchup => 'Oglądaj z archiwum';

  @override
  String get playerFullscreen => 'Pełny ekran';

  @override
  String get playerError => 'Odtwarzanie nie powiodło się';

  @override
  String get playerRetry => 'Spróbuj ponownie';

  @override
  String get playerPip => 'Obraz w obrazie';

  @override
  String get playerPipReturn => 'Wróć do aplikacji';

  @override
  String get catchupTitle => 'Archiwum';

  @override
  String get catchupNoEpg =>
      'Brak programu telewizyjnego. Wybierz godzinę ręcznie.';

  @override
  String get catchupPick => 'Godzina rozpoczęcia';

  @override
  String get catchupDuration => 'Czas trwania (min)';

  @override
  String get seriesSeason => 'Sezon';

  @override
  String get onbWelcomeTitle => 'Witamy w BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Oglądaj kanały na żywo, filmy i seriale od swojego dostawcy IPTV. Dodajmy pierwsze źródło.';

  @override
  String get onbWhereTitle => 'Gdzie wpisać adresy?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: dostawca podaje adres serwera (np. http://host:8080), nazwę użytkownika i hasło. Wpisz je poniżej.';

  @override
  String get onbWhereM3u =>
      'M3U: nadaj źródłu nazwę i wklej link do playlisty otrzymany od dostawcy.';

  @override
  String get fieldKind => 'Typ';

  @override
  String get fieldName => 'Nazwa';

  @override
  String get fieldServer => 'Adres serwera';

  @override
  String get fieldUsername => 'Nazwa użytkownika';

  @override
  String get fieldPassword => 'Hasło';

  @override
  String get fieldUrl => 'Link do playlisty';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Przetestuj połączenie';

  @override
  String get onbTestOk => 'Połączono pomyślnie';

  @override
  String get onbTestFail => 'Nie udało się połączyć';

  @override
  String get onbNext => 'Dalej';

  @override
  String get onbBack => 'Wstecz';

  @override
  String get onbSave => 'Zapisz i synchronizuj';

  @override
  String get settingsAccounts => 'Źródła';

  @override
  String get settingsLanguageSub => 'Preferowane języki napisów';

  @override
  String get settingsLanguageAudio => 'Preferowane języki dźwięku';

  @override
  String get settingsSubscale => 'Rozmiar napisów';

  @override
  String get settingsSubdelay => 'Opóźnienie napisów (sekundy)';

  @override
  String get settingsGuide => 'Pokaż krótki przewodnik';

  @override
  String get settingsDelete => 'Usuń';

  @override
  String get accountAdd => 'Dodaj źródło…';

  @override
  String get settingsChangePassword => 'Zmień hasło…';

  @override
  String get settingsNewPassword => 'Nowe hasło';

  @override
  String updateAvailable(String p1) {
    return 'Dostępna jest wersja $p1';
  }

  @override
  String get updateNow => 'Zaktualizuj teraz';

  @override
  String get updateNotes => 'Co nowego';

  @override
  String get updateLater => 'Później';

  @override
  String get updateDownloading => 'Pobieranie aktualizacji…';

  @override
  String updateReady(String p1) {
    return 'Wersja $p1 jest gotowa do instalacji';
  }

  @override
  String get updateRestart => 'Uruchom ponownie, aby zaktualizować';

  @override
  String get updateFailed => 'Aktualizacja nie powiodła się';

  @override
  String get updateManual => 'Pobierz ręcznie';

  @override
  String get updateCheckNow => 'Sprawdź aktualizacje';

  @override
  String get updateAuto => 'Sprawdzaj aktualizacje automatycznie';

  @override
  String get updateAutoInstall => 'Pobieraj aktualizacje automatycznie';

  @override
  String get updateUpToDate => 'Masz najnowszą wersję';

  @override
  String get updateDevBuild =>
      'Aktualizacje są dostępne tylko w zainstalowanej aplikacji';

  @override
  String updateCurrent(String p1) {
    return 'Bieżąca wersja: $p1';
  }

  @override
  String get playerBack => 'Wstecz';

  @override
  String get playerErrorHint =>
      'Jeśli problem się powtarza, sprawdź hasło źródła w Ustawieniach.';

  @override
  String get passwordTitle => 'Wymagane hasło';

  @override
  String passwordBody(String p1) {
    return 'Wpisz hasło do „$p1”. Jest przechowywane prywatnie na tym Macu.';
  }

  @override
  String get passwordNone => 'Kontynuuj bez hasła';

  @override
  String get playerSpeed => 'Szybkość odtwarzania';

  @override
  String get playerSpeedNormal => 'Normalna';

  @override
  String get playerSpeedReset => 'Normalna szybkość';

  @override
  String get settingsSeekPreview => 'Miniatury podglądu na pasku postępu';

  @override
  String get settingsSeekPreviewNote =>
      'Otwiera drugie połączenie z dostawcą. Wyłącz, jeśli odtwarzanie się zatrzymuje lub dostawca zezwala tylko na jedno połączenie.';

  @override
  String get playerSeekBar => 'Pozycja odtwarzania';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 z $p2';
  }

  @override
  String get playerLive => 'Na żywo';

  @override
  String get playerChannelPrev => 'Poprzedni kanał';

  @override
  String get playerChannelNext => 'Następny kanał';

  @override
  String get playerScaleFit => 'Dopasuj';

  @override
  String get playerScaleFill => 'Wypełnij';

  @override
  String get playerScaleStretch => 'Rozciągnij';

  @override
  String get playerSubtitleAdjust => 'Dostosuj napisy…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Jasność';

  @override
  String get playerVolume => 'Głośność';

  @override
  String get playerReplay => 'Odtwórz ponownie';

  @override
  String get settingsClock => 'Pokazuj czas w odtwarzaczu';

  @override
  String get settingsSeekStep =>
      'Krok przewijania (klawisze strzałek i przyciski przewijania)';

  @override
  String get settingsBarsHide => 'Ukrywaj elementy sterujące po';

  @override
  String get settingsNever => 'Nigdy';

  @override
  String get settingsVideoScale => 'Skalowanie wideo';

  @override
  String get settingsScaleFit => 'Dopasuj (czarne pasy)';

  @override
  String get settingsScaleFill => 'Wypełnij (przycina krawędzie)';

  @override
  String get settingsScaleStretch => 'Rozciągnij';

  @override
  String get settingsVideoScaleHint =>
      'Naciśnij A w odtwarzaczu, aby przełączać między trzema trybami.';

  @override
  String get settingsBuffer => 'Bufor sieciowy';

  @override
  String get settingsBufferSmall => 'Mały';

  @override
  String get settingsBufferNormal => 'Normalny';

  @override
  String get settingsBufferLarge => 'Duży';

  @override
  String get settingsBufferHint =>
      'Większy bufor pomaga przy wolnym lub niestabilnym połączeniu.';

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
    return 'Wstecz o $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Do przodu o $p1';
  }

  @override
  String get playerSleep => 'Wyłącznik czasowy';

  @override
  String get downloadsTitle => 'Pobrane';

  @override
  String get downloadsAdd => 'Pobierz';

  @override
  String get downloadsSeason => 'Pobierz sezon';

  @override
  String get downloadsChooseFolder =>
      'Wybierz, gdzie zapisywać pobrane filmy i odcinki';

  @override
  String get downloadsChoose => 'Wybierz';

  @override
  String get downloadsNotChosen => 'Zapytamy przy pierwszym pobieraniu';

  @override
  String get downloadsChange => 'Zmień folder…';

  @override
  String get downloadsPause => 'Wstrzymaj';

  @override
  String get downloadsResume => 'Wznów';

  @override
  String get downloadsCancel => 'Anuluj';

  @override
  String get downloadsPlay => 'Odtwórz';

  @override
  String get downloadsReveal => 'Pokaż w Finderze';

  @override
  String get downloadsDelete => 'Usuń plik';

  @override
  String get downloadsEmpty => 'Brak pobranych plików';

  @override
  String get downloadsQueued => 'Oczekuje';

  @override
  String get downloadsDone => 'Gotowe';

  @override
  String get downloadsHint =>
      'Pobieranie odbywa się po jednym pliku naraz. Wielu dostawców zezwala tylko na jedno połączenie, więc odtwarzanie podczas pobierania może się nie udać. Niedokończone pobierania nie są zachowywane po zamknięciu aplikacji.';

  @override
  String get epgNow => 'Teraz';

  @override
  String get epgNext => 'Następne';

  @override
  String get settingsFullscreen =>
      'Otwieraj odtwarzanie na pełnym ekranie (elementy sterujące są ukryte, dopóki nie poruszysz myszą)';

  @override
  String get nextTitle => 'Następny odcinek';

  @override
  String nextIn(int p1) {
    return 'Odtwarzanie za $p1 s';
  }

  @override
  String get nextNow => 'Odtwórz teraz';

  @override
  String get nextCancel => 'Anuluj';

  @override
  String get settingsAutoNext => 'Automatycznie odtwarzaj następny odcinek';

  @override
  String get downloadsNoSpace => 'Za mało wolnego miejsca na dysku';

  @override
  String get dbErrorTitle =>
      'BattleStation TV nie może otworzyć swojej bazy danych';

  @override
  String get dbErrorBody =>
      'Jeśli działa inna kopia BattleStation TV, zamknij ją i spróbuj ponownie.';

  @override
  String get dbRecoveredTitle => 'Baza danych została uszkodzona';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV uruchomił się z nową bazą danych (dodaj źródło ponownie). Uszkodzony plik zachowano tutaj:\n$p1';
  }

  @override
  String get menuShowWindow => 'Pokaż okno';

  @override
  String get settingsTabGeneral => 'Ogólne';

  @override
  String get settingsTabPlayer => 'Odtwarzacz';

  @override
  String get settingsTabPlaylists => 'Playlisty';

  @override
  String get settingsAppearance => 'Wygląd';

  @override
  String get settingsSystem => 'Systemowy';

  @override
  String get appearanceLight => 'Jasny';

  @override
  String get appearanceDark => 'Ciemny';

  @override
  String get settingsInterfaceLanguage => 'Język interfejsu';

  @override
  String get settingsLanguageRestart =>
      'Zmiana zacznie obowiązywać po ponownym uruchomieniu BattleStation TV.';

  @override
  String get settingsHideCategories => 'Ukrywanie kategorii';

  @override
  String get settingsHideCategoriesWords => 'Słowa do ukrycia';

  @override
  String get settingsHideCategoriesNote =>
      'Ukrywaj kategorie, których nazwa zawiera te słowa (oddziel je przecinkami). Ich kanały, filmy i seriale znikną też z wyszukiwania, ulubionych i sekcji „Kontynuuj oglądanie”. To zwykły filtr, a nie blokada rodzicielska: każdy może go tutaj zmienić.';

  @override
  String get settingsRefresh => 'Aktualizacja playlist';

  @override
  String get settingsRefresh0 => 'Tylko po otwarciu aplikacji';

  @override
  String get settingsRefresh6 => 'Co 6 godz.';

  @override
  String get settingsRefresh12 => 'Co 12 godz.';

  @override
  String get settingsRefresh24 => 'Co 24 godz.';

  @override
  String get settingsBackup => 'Kopia zapasowa i przywracanie';

  @override
  String get backupExport => 'Eksportuj kopię zapasową…';

  @override
  String get backupImport => 'Importuj kopię zapasową…';

  @override
  String get backupWarn =>
      'Plik kopii zapasowej zawiera listę Twoich playlist wraz z adresami, które mogą zawierać dane logowania, więc zachowaj go dla siebie. Hasła źródeł Xtream nie są w nim zapisywane. Import dodaje dane do bieżących źródeł i niczego nie usuwa.';

  @override
  String get backupExported => 'Kopia zapasowa została zapisana.';

  @override
  String get backupImported => 'Kopia zapasowa została zaimportowana.';

  @override
  String get backupErrorInvalid =>
      'To nie jest plik kopii zapasowej BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'Ta kopia zapasowa pochodzi z innej wersji BattleStation TV i nie można jej odczytać.';

  @override
  String get backupErrorTooLarge =>
      'Ten plik jest zbyt duży, aby być kopią zapasową.';

  @override
  String get backupFailed => 'Błąd kopii zapasowej';

  @override
  String get settingsClearData => 'Czyszczenie danych';

  @override
  String get clearHistory => 'Wyczyść historię oglądania';

  @override
  String get clearFavorites => 'Wyczyść ulubione';

  @override
  String get clearImages => 'Wyczyść pamięć podręczną obrazów';

  @override
  String get clearConfirm => 'Wyczyść';

  @override
  String get clearHistoryWarn =>
      'Pozycje wznawiania i listy „Kontynuuj oglądanie” wszystkich źródeł zostaną usunięte. Tej czynności nie można cofnąć.';

  @override
  String get clearFavoritesWarn =>
      'Ulubione we wszystkich źródłach zostaną usunięte. Tej czynności nie można cofnąć.';

  @override
  String get clearImagesWarn =>
      'Zapisane logo i plakaty zostaną usunięte i w razie potrzeby pobrane ponownie.';

  @override
  String get infoDetails => 'Szczegóły';

  @override
  String get infoPlot => 'Fabuła';

  @override
  String get infoCast => 'Obsada';

  @override
  String get infoDirector => 'Reżyseria';

  @override
  String get infoGenre => 'Gatunek';

  @override
  String get infoYear => 'Rok premiery';

  @override
  String get infoRating => 'Ocena';

  @override
  String get infoDuration => 'Czas trwania';

  @override
  String get infoCountry => 'Kraj';

  @override
  String get infoTrailer => 'Zwiastun';

  @override
  String get infoPlay => 'Odtwórz';

  @override
  String get infoEmpty => 'Twój dostawca nie ma informacji o tym tytule.';

  @override
  String get infoLoading => 'Wczytywanie szczegółów…';

  @override
  String get infoError => 'Nie udało się wczytać szczegółów.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 godz.';
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
  String get playerSkipIntro => 'Pomiń intro';

  @override
  String get playerSkipCredits => 'Pomiń napisy końcowe';

  @override
  String get playerSkipMenu => 'Intro i napisy końcowe';

  @override
  String get playerMarkIntroStart => 'Tu zaczyna się intro';

  @override
  String get playerMarkIntroEnd => 'Tu kończy się intro';

  @override
  String get playerMarkCredits => 'Tu zaczynają się napisy końcowe';

  @override
  String get playerSkipForget => 'Zapomnij intro i napisy końcowe';

  @override
  String get playerSkipSaved => 'Zapisano dla wszystkich odcinków tego serialu';

  @override
  String get playerSkipRefused => 'Nie można w tym miejscu';

  @override
  String get continueRemove => 'Usuń z Kontynuuj oglądanie';

  @override
  String get settingsFavoritesAZ => 'Sortuj ulubione według nazwy (A–Z)';

  @override
  String get settingsKeychain => 'Przechowuj hasła w pęku kluczy';

  @override
  String get settingsKeychainNote =>
      'Wył.: hasła zostają w prywatnej bazie danych aplikacji. Wł.: macOS trzyma je w Twoim pęku kluczy logowania.';

  @override
  String get settingsKeychainFailed =>
      'Pęk kluczy nie przyjął haseł. Nic nie zostało zmienione.';
}
