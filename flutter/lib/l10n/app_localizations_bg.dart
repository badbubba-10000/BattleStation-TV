// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'На живо';

  @override
  String get tabMovies => 'Филми';

  @override
  String get tabSeries => 'Сериали';

  @override
  String get catAll => 'Всички';

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
  String get catFavorites => 'Любими';

  @override
  String get catContinue => 'Продължи гледането';

  @override
  String get catFilter => 'Филтриране на категориите';

  @override
  String get playlistAll => 'Всички плейлисти';

  @override
  String get playlistLabel => 'Плейлист';

  @override
  String get aboutAcknowledgements => 'Благодарности';

  @override
  String get aboutPrivacy => 'Поверителност';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV не събира никакви данни за вас. Няма акаунт, анализи, реклами или проследяване.\n\nВашите източници, любими и история на гледане остават на това устройство. Приложението се свързва само с адресите, които сами добавяте: сървъра на доставчика, плейлиста, програмата, логата и потоците.\n\nПаролите на доставчика се пазят в iOS Keychain само на това устройство. Те никога не се включват във файл с резервно копие.\n\nBattleStation TV не включва канали, филми или плейлисти. Източника го осигурявате вие.';

  @override
  String get aboutSource => 'Изходен код и лиценз';

  @override
  String get aboutCoffee => 'Купете ми кафе';

  @override
  String get tipsTitle => 'Подкрепете BattleStation TV';

  @override
  String get tipsFooter =>
      'Незадължителни бакшиши чрез Apple. Те не отключват нищо: всички функции остават безплатни за всички.';

  @override
  String get tipsThanks => 'Благодарим ви за подкрепата!';

  @override
  String get tipsPending => 'Изчаква се одобрение.';

  @override
  String get tipsFailed => 'Бакшишът не премина. Опитайте отново по-късно.';

  @override
  String get aboutVersion => 'Версия';

  @override
  String get catTitle => 'Категории';

  @override
  String get commonCancel => 'Отказ';

  @override
  String get emptyContinue => 'Няма какво да се продължи';

  @override
  String get emptyContinueHint =>
      'Филмите и епизодите, които спрете по средата, се появяват тук.';

  @override
  String get emptyFavorites => 'Още няма любими';

  @override
  String get emptyFavoritesHint =>
      'Натиснете и задръжте заглавие, после изберете „Добави в любими“.';

  @override
  String get emptyFavoritesLive =>
      'Плъзнете канал наляво, после докоснете звездата.';

  @override
  String get emptyNone => 'Още няма нищо';

  @override
  String get emptyNoneHint =>
      'Дръпнете надолу за обновяване или проверете източника си в Настройки.';

  @override
  String get fieldServerInvalid =>
      'Този адрес изглежда неправилен. Пример: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Въведете пълната връзка, започваща с http:// или https://';

  @override
  String get infoResume => 'Продължи';

  @override
  String get libraryEmpty => 'Библиотеката ви е празна';

  @override
  String get libraryEmptyHint =>
      'Любимите и заглавията, които сте започнали да гледате, се показват тук.';

  @override
  String get onbNoChannels =>
      'BattleStation TV не включва канали, филми или плейлисти. Добавете източник от доставчик, на който сте абонат.';

  @override
  String get onbPasteHint => 'Копирахте ли връзка към плейлист?';

  @override
  String get onbTestRunning => 'Проверяване…';

  @override
  String passwordBodyIos(String p1) {
    return 'Въведете паролата за „$p1“. Тя се съхранява в iOS Keychain на това устройство.';
  }

  @override
  String get searchRecent => 'Скорошни търсения';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Продължи С$p1 Е$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'С$p1 Е$p2';
  }

  @override
  String get seriesNoEpisodes => 'Няма намерени епизоди';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Пусни С$p1 Е$p2';
  }

  @override
  String get seriesWatched => 'Гледано';

  @override
  String get settingsAbout => 'Относно';

  @override
  String get settingsEditSource => 'Редактиране на източника';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV използва езика на устройството ви. За да ползвате друг език само за това приложение, изберете го в Настройки на iOS.';

  @override
  String get settingsOpenIOS => 'Отвори Настройки на iOS';

  @override
  String get settingsPasswordNote =>
      'Оставете новата парола празна, за да запазите текущата. Паролите се съхраняват в iOS Keychain.';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get sourceDeleteWarn =>
      'Източникът, неговите любими и историята му на гледане се премахват от това устройство. Акаунтът ви при доставчика не се засяга.';

  @override
  String get syncNow => 'Обнови';

  @override
  String get tabLibrary => 'Библиотека';

  @override
  String get scopeCategory => 'В категорията';

  @override
  String get scopeType => 'В раздела';

  @override
  String get scopeEverywhere => 'Навсякъде';

  @override
  String get searchPrompt => 'Търсене';

  @override
  String get syncRunning => 'Синхронизиране…';

  @override
  String get syncFailed => 'Синхронизирането не успя';

  @override
  String get syncNotUpdated => 'Показани са запазените данни';

  @override
  String get emptyResults => 'Няма намерени резултати';

  @override
  String get favAdd => 'Добави в любими';

  @override
  String get favRemove => 'Премахни от любими';

  @override
  String get playerClose => 'Затвори';

  @override
  String get playerSubtitles => 'Субтитри';

  @override
  String get playerAudio => 'Аудио';

  @override
  String get playerOff => 'Изкл.';

  @override
  String get playerAddSubtitle => 'Добави файл със субтитри…';

  @override
  String get playerCatchup => 'Гледай от архива';

  @override
  String get playerFullscreen => 'Цял екран';

  @override
  String get playerError => 'Възпроизвеждането не успя';

  @override
  String get playerRetry => 'Опитай отново';

  @override
  String get playerPip => 'Картина в картината';

  @override
  String get playerPipReturn => 'Обратно към приложението';

  @override
  String get catchupTitle => 'Архив';

  @override
  String get catchupNoEpg => 'Няма програма. Изберете часа ръчно.';

  @override
  String get catchupPick => 'Начален час';

  @override
  String get catchupDuration => 'Продължителност (мин)';

  @override
  String get seriesSeason => 'Сезон';

  @override
  String get onbWelcomeTitle => 'Добре дошли в BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Гледайте канали на живо, филми и сериали от вашия IPTV доставчик. Нека добавим първия източник.';

  @override
  String get onbWhereTitle => 'Къде се въвеждат адресите?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: доставчикът ви дава адрес на сървъра (например http://host:8080), потребителско име и парола. Въведете ги по-долу.';

  @override
  String get onbWhereM3u =>
      'M3U: дайте име на източника и поставете връзката към плейлиста, която сте получили от доставчика.';

  @override
  String get fieldKind => 'Тип';

  @override
  String get fieldName => 'Име';

  @override
  String get fieldServer => 'Адрес на сървъра';

  @override
  String get fieldUsername => 'Потребителско име';

  @override
  String get fieldPassword => 'Парола';

  @override
  String get fieldUrl => 'Връзка към плейлист';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Провери връзката';

  @override
  String get onbTestOk => 'Свързването е успешно';

  @override
  String get onbTestFail => 'Свързването не успя';

  @override
  String get onbNext => 'Напред';

  @override
  String get onbBack => 'Назад';

  @override
  String get onbSave => 'Запази и синхронизирай';

  @override
  String get settingsAccounts => 'Източници';

  @override
  String get settingsLanguageSub => 'Предпочитани езици за субтитри';

  @override
  String get settingsLanguageAudio => 'Предпочитани езици за звук';

  @override
  String get settingsSubscale => 'Размер на субтитрите';

  @override
  String get settingsSubdelay => 'Забавяне на субтитрите (секунди)';

  @override
  String get settingsGuide => 'Покажи ръководството за бърз старт';

  @override
  String get settingsDelete => 'Изтрий';

  @override
  String get accountAdd => 'Добави източник…';

  @override
  String get settingsChangePassword => 'Промяна на паролата…';

  @override
  String get settingsNewPassword => 'Нова парола';

  @override
  String updateAvailable(String p1) {
    return 'Налична е версия $p1';
  }

  @override
  String get updateNow => 'Обнови сега';

  @override
  String get updateNotes => 'Какво е новото';

  @override
  String get updateLater => 'По-късно';

  @override
  String get updateDownloading => 'Изтегляне на актуализацията…';

  @override
  String updateReady(String p1) {
    return 'Версия $p1 е готова за инсталиране';
  }

  @override
  String get updateRestart => 'Рестартирай за обновяване';

  @override
  String get updateFailed => 'Актуализацията не успя';

  @override
  String get updateManual => 'Изтегли ръчно';

  @override
  String get updateCheckNow => 'Провери за актуализации';

  @override
  String get updateAuto => 'Проверявай за актуализации автоматично';

  @override
  String get updateAutoInstall => 'Изтегляй актуализациите автоматично';

  @override
  String get updateUpToDate => 'Имате най-новата версия';

  @override
  String get updateDevBuild =>
      'Актуализациите са налични само в инсталираното приложение';

  @override
  String updateCurrent(String p1) {
    return 'Текуща версия: $p1';
  }

  @override
  String get playerBack => 'Назад';

  @override
  String get playerErrorHint =>
      'Ако проблемът продължава, проверете паролата на източника в Настройки.';

  @override
  String get passwordTitle => 'Нужна е парола';

  @override
  String passwordBody(String p1) {
    return 'Въведете паролата за „$p1“. Тя се съхранява поверително на този Mac.';
  }

  @override
  String get passwordNone => 'Продължи без парола';

  @override
  String get playerSpeed => 'Скорост на възпроизвеждане';

  @override
  String get playerSpeedNormal => 'Нормална';

  @override
  String get playerSpeedReset => 'Нормална скорост';

  @override
  String get settingsSeekPreview =>
      'Преглед с миниатюри върху лентата за превъртане';

  @override
  String get settingsSeekPreviewNote =>
      'Отваря втора връзка към вашия доставчик. Изключете го, ако възпроизвеждането спре или доставчикът ви позволява само една връзка.';

  @override
  String get playerSeekBar => 'Позиция на възпроизвеждане';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 от $p2';
  }

  @override
  String get playerLive => 'На живо';

  @override
  String get playerChannelPrev => 'Предишен канал';

  @override
  String get playerChannelNext => 'Следващ канал';

  @override
  String get playerScaleFit => 'Побиране';

  @override
  String get playerScaleFill => 'Запълване';

  @override
  String get playerScaleStretch => 'Разтягане';

  @override
  String get playerSubtitleAdjust => 'Настройка на субтитрите…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Яркост';

  @override
  String get playerVolume => 'Сила на звука';

  @override
  String get playerReplay => 'Пусни отново';

  @override
  String get settingsClock => 'Показвай часа в плейъра';

  @override
  String get settingsSeekStep =>
      'Стъпка на превъртане (клавиши със стрелки и бутони за превъртане)';

  @override
  String get settingsBarsHide => 'Скривай контролите след';

  @override
  String get settingsNever => 'Никога';

  @override
  String get settingsVideoScale => 'Мащаб на видеото';

  @override
  String get settingsScaleFit => 'Побиране (черни ленти)';

  @override
  String get settingsScaleFill => 'Запълване (изрязва краищата)';

  @override
  String get settingsScaleStretch => 'Разтягане';

  @override
  String get settingsVideoScaleHint =>
      'Натиснете A в плейъра, за да превключвате между трите режима.';

  @override
  String get settingsBuffer => 'Мрежов буфер';

  @override
  String get settingsBufferSmall => 'Малък';

  @override
  String get settingsBufferNormal => 'Нормален';

  @override
  String get settingsBufferLarge => 'Голям';

  @override
  String get settingsBufferHint =>
      'По-големият буфер помага при бавна или нестабилна връзка.';

  @override
  String unitSeconds(int p1) {
    return '$p1 с';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 мин';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 мин';
  }

  @override
  String playerSkipBack(String p1) {
    return 'Назад с $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Напред с $p1';
  }

  @override
  String get playerSleep => 'Таймер за заспиване';

  @override
  String get downloadsTitle => 'Изтегляния';

  @override
  String get downloadsAdd => 'Изтегли';

  @override
  String get downloadsSeason => 'Изтегли сезона';

  @override
  String get downloadsChooseFolder =>
      'Изберете къде да се запазват изтеглените филми и епизоди';

  @override
  String get downloadsChoose => 'Избери';

  @override
  String get downloadsNotChosen => 'Ще се попита при първото изтегляне';

  @override
  String get downloadsChange => 'Смени папката…';

  @override
  String get downloadsPause => 'Пауза';

  @override
  String get downloadsResume => 'Продължи';

  @override
  String get downloadsCancel => 'Отказ';

  @override
  String get downloadsPlay => 'Пусни';

  @override
  String get downloadsReveal => 'Покажи във Finder';

  @override
  String get downloadsDelete => 'Изтрий файла';

  @override
  String get downloadsEmpty => 'Още няма изтегляния';

  @override
  String get downloadsQueued => 'Изчаква';

  @override
  String get downloadsDone => 'Готово';

  @override
  String get downloadsHint =>
      'Изтеглянията се изпълняват едно по едно. Много доставчици позволяват само една връзка, затова възпроизвеждането по време на изтегляне може да не успее. Незавършените изтегляния не се запазват при изход от приложението.';

  @override
  String get epgNow => 'Сега';

  @override
  String get epgNext => 'Следва';

  @override
  String get settingsFullscreen =>
      'Отваряй възпроизвеждането на цял екран (контролите са скрити, докато не помръднете мишката)';

  @override
  String get nextTitle => 'Следващ епизод';

  @override
  String nextIn(int p1) {
    return 'Възпроизвеждане след $p1 с';
  }

  @override
  String get nextNow => 'Пусни сега';

  @override
  String get nextCancel => 'Отказ';

  @override
  String get settingsAutoNext => 'Пускай автоматично следващия епизод';

  @override
  String get downloadsNoSpace => 'Няма достатъчно свободно място на диска';

  @override
  String get dbErrorTitle =>
      'BattleStation TV не може да отвори базата си данни';

  @override
  String get dbErrorBody =>
      'Ако е стартирано друго копие на BattleStation TV, затворете го и опитайте отново.';

  @override
  String get dbRecoveredTitle => 'Базата данни беше повредена';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV стартира с нова база данни (добавете източника отново). Повреденият файл е запазен тук:\n$p1';
  }

  @override
  String get menuShowWindow => 'Покажи прозореца';

  @override
  String get settingsTabGeneral => 'Общи';

  @override
  String get settingsTabPlayer => 'Плейър';

  @override
  String get settingsTabPlaylists => 'Плейлисти';

  @override
  String get settingsAppearance => 'Външен вид';

  @override
  String get settingsSystem => 'Системен';

  @override
  String get appearanceLight => 'Светъл';

  @override
  String get appearanceDark => 'Тъмен';

  @override
  String get settingsInterfaceLanguage => 'Език на интерфейса';

  @override
  String get settingsLanguageRestart =>
      'Влиза в сила след рестартиране на BattleStation TV.';

  @override
  String get settingsHideCategories => 'Скриване на категории';

  @override
  String get settingsHideCategoriesWords => 'Думи за скриване';

  @override
  String get settingsHideCategoriesNote =>
      'Скривай категории, чието име съдържа тези думи (разделяйте ги със запетаи). Каналите, филмите и сериалите им също изчезват от търсенето, любимите и „Продължи гледането“. Това е обикновен филтър, а не родителски контрол: всеки може да го промени тук.';

  @override
  String get settingsRefresh => 'Обновяване на плейлистите';

  @override
  String get settingsRefresh0 => 'Само при отваряне на приложението';

  @override
  String get settingsRefresh6 => 'На всеки 6 ч';

  @override
  String get settingsRefresh12 => 'На всеки 12 ч';

  @override
  String get settingsRefresh24 => 'На всеки 24 ч';

  @override
  String get settingsBackup => 'Резервно копие и възстановяване';

  @override
  String get backupExport => 'Експортирай резервно копие…';

  @override
  String get backupImport => 'Импортирай резервно копие…';

  @override
  String get backupWarn =>
      'Файлът с резервно копие съдържа списък на плейлистите ви с техните адреси, които могат да включват данни за вход, затова го пазете в тайна. Паролите на източниците Xtream не се записват в него. Импортирането добавя към текущите източници и не изтрива нищо.';

  @override
  String get backupExported => 'Резервното копие беше запазено.';

  @override
  String get backupImported => 'Резервното копие беше импортирано.';

  @override
  String get backupErrorInvalid =>
      'Това не е файл с резервно копие на BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'Това резервно копие е от друга версия на BattleStation TV и не може да бъде прочетено.';

  @override
  String get backupErrorTooLarge =>
      'Файлът е твърде голям, за да бъде резервно копие.';

  @override
  String get backupFailed => 'Резервното копиране не успя';

  @override
  String get settingsClearData => 'Изчистване на данни';

  @override
  String get clearHistory => 'Изчисти историята на гледане';

  @override
  String get clearFavorites => 'Изчисти любимите';

  @override
  String get clearImages => 'Изчисти кеша на изображенията';

  @override
  String get clearConfirm => 'Изчисти';

  @override
  String get clearHistoryWarn =>
      'Позициите за продължаване и списъците „Продължи гледането“ на всички източници ще бъдат изтрити. Това действие не може да бъде отменено.';

  @override
  String get clearFavoritesWarn =>
      'Любимите във всички източници ще бъдат премахнати. Това действие не може да бъде отменено.';

  @override
  String get clearImagesWarn =>
      'Запазените лога и плакати се премахват и при нужда се изтеглят отново.';

  @override
  String get infoDetails => 'Подробности';

  @override
  String get infoPlot => 'Сюжет';

  @override
  String get infoCast => 'В ролите';

  @override
  String get infoDirector => 'Режисьор';

  @override
  String get infoGenre => 'Жанр';

  @override
  String get infoYear => 'Година на излизане';

  @override
  String get infoRating => 'Рейтинг';

  @override
  String get infoDuration => 'Продължителност';

  @override
  String get infoCountry => 'Държава';

  @override
  String get infoTrailer => 'Трейлър';

  @override
  String get infoPlay => 'Пусни';

  @override
  String get infoEmpty => 'Вашият доставчик няма подробности за това заглавие.';

  @override
  String get infoLoading => 'Зареждане на подробности…';

  @override
  String get infoError => 'Подробностите не можаха да се заредят.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 ч';
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
  String get playerSkipIntro => 'Пропусни началото';

  @override
  String get playerSkipCredits => 'Пропусни надписите';

  @override
  String get playerSkipMenu => 'Начало и надписи';

  @override
  String get playerMarkIntroStart => 'Началната песен започва тук';

  @override
  String get playerMarkIntroEnd => 'Началната песен свършва тук';

  @override
  String get playerMarkCredits => 'Надписите започват тук';

  @override
  String get playerSkipForget => 'Забрави началото и надписите';

  @override
  String get playerSkipSaved => 'Запазено за всички епизоди на сериала';

  @override
  String get playerSkipRefused => 'Невъзможно в този момент';

  @override
  String get continueRemove => 'Премахни от Продължи гледането';

  @override
  String get settingsFavoritesAZ => 'Подреждане на любимите по име (А–Я)';

  @override
  String get settingsKeychain => 'Пази паролите в Keychain';

  @override
  String get settingsKeychainNote =>
      'Изключено: паролите остават в личната база данни на приложението. Включено: macOS ги пази във вашия Keychain за вход.';

  @override
  String get settingsKeychainFailed =>
      'Keychain не прие паролите. Нищо не е променено.';
}
