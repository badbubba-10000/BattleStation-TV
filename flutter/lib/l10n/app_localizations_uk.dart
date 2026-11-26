// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Ефір';

  @override
  String get tabMovies => 'Фільми';

  @override
  String get tabSeries => 'Серіали';

  @override
  String get catAll => 'Усі';

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
  String get catFavorites => 'Вибране';

  @override
  String get catContinue => 'Продовжити перегляд';

  @override
  String get catFilter => 'Фільтр категорій';

  @override
  String get playlistAll => 'Усі плейлисти';

  @override
  String get playlistLabel => 'Плейлист';

  @override
  String get aboutAcknowledgements => 'Подяки';

  @override
  String get aboutPrivacy => 'Конфіденційність';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV не збирає жодних даних про вас. У програмі немає облікового запису, аналітики, реклами та стеження.\n\nВаші джерела, вибране й історія переглядів залишаються на цьому пристрої. Програма підключається лише до адрес, які ви додали самі: сервера провайдера, плейлиста, телепрограми, логотипів і потоків.\n\nПаролі провайдерів зберігаються в iOS Keychain лише на цьому пристрої. До файлу резервної копії вони ніколи не потрапляють.\n\nУ BattleStation TV немає каналів, фільмів і плейлистів. Джерело ви додаєте самі.';

  @override
  String get aboutSource => 'Вихідний код і ліцензія';

  @override
  String get aboutCoffee => 'Пригостіть мене кавою';

  @override
  String get tipsTitle => 'Підтримати BattleStation TV';

  @override
  String get tipsFooter =>
      'Добровільні чайові через Apple. Вони нічого не відкривають: усі функції залишаються безкоштовними для всіх.';

  @override
  String get tipsThanks => 'Дякуємо за підтримку!';

  @override
  String get tipsPending => 'Очікує схвалення.';

  @override
  String get tipsFailed => 'Чайові не пройшли. Спробуйте пізніше.';

  @override
  String get aboutVersion => 'Версія';

  @override
  String get catTitle => 'Категорії';

  @override
  String get commonCancel => 'Скасувати';

  @override
  String get emptyContinue => 'Нічого продовжувати';

  @override
  String get emptyContinueHint =>
      'Фільми й серії, які ви не додивилися до кінця, з’являться тут.';

  @override
  String get emptyFavorites => 'У вибраному поки порожньо';

  @override
  String get emptyFavoritesHint =>
      'Натисніть і утримуйте назву, а потім виберіть «Додати до вибраного».';

  @override
  String get emptyFavoritesLive =>
      'Проведіть по каналу вліво й торкніться зірочки.';

  @override
  String get emptyNone => 'Тут поки нічого немає';

  @override
  String get emptyNoneHint =>
      'Потягніть вниз, щоб оновити, або перевірте джерело в налаштуваннях.';

  @override
  String get fieldServerInvalid =>
      'Адреса виглядає неправильно. Приклад: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Введіть посилання повністю, починаючи з http:// або https://';

  @override
  String get infoResume => 'Продовжити';

  @override
  String get libraryEmpty => 'Медіатека порожня';

  @override
  String get libraryEmptyHint =>
      'Тут з’являться вибране та те, що ви почали дивитися.';

  @override
  String get onbNoChannels =>
      'У BattleStation TV немає каналів, фільмів і плейлистів. Додайте джерело від провайдера, на послуги якого ви підписані.';

  @override
  String get onbPasteHint => 'Скопіювали посилання на плейлист?';

  @override
  String get onbTestRunning => 'Перевірка…';

  @override
  String passwordBodyIos(String p1) {
    return 'Введіть пароль для «$p1». Він зберігається в iOS Keychain лише на цьому пристрої.';
  }

  @override
  String get searchRecent => 'Нещодавні пошуки';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Продовжити: С$p1 Е$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'С$p1 Е$p2';
  }

  @override
  String get seriesNoEpisodes => 'Серій не знайдено';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Відтворити: С$p1 Е$p2';
  }

  @override
  String get seriesWatched => 'Переглянуто';

  @override
  String get settingsAbout => 'Про програму';

  @override
  String get settingsEditSource => 'Редагувати джерело';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV використовує мову вашого пристрою. Щоб вибрати для цієї програми іншу мову, відкрийте налаштування iOS.';

  @override
  String get settingsOpenIOS => 'Відкрити налаштування iOS';

  @override
  String get settingsPasswordNote =>
      'Залиште поле нового пароля порожнім, щоб зберегти поточний. Паролі зберігаються в iOS Keychain.';

  @override
  String get settingsTitle => 'Налаштування';

  @override
  String get sourceDeleteWarn =>
      'Джерело, його вибране та історію переглядів буде видалено з цього пристрою. Ваш обліковий запис у провайдера це не зачепить.';

  @override
  String get syncNow => 'Оновити';

  @override
  String get tabLibrary => 'Медіатека';

  @override
  String get scopeCategory => 'У категорії';

  @override
  String get scopeType => 'У розділі';

  @override
  String get scopeEverywhere => 'Скрізь';

  @override
  String get searchPrompt => 'Пошук';

  @override
  String get syncRunning => 'Синхронізація…';

  @override
  String get syncFailed => 'Помилка синхронізації';

  @override
  String get syncNotUpdated => 'Показано збережені дані';

  @override
  String get emptyResults => 'Нічого не знайдено';

  @override
  String get favAdd => 'Додати до вибраного';

  @override
  String get favRemove => 'Видалити з вибраного';

  @override
  String get playerClose => 'Закрити';

  @override
  String get playerSubtitles => 'Субтитри';

  @override
  String get playerAudio => 'Аудіо';

  @override
  String get playerOff => 'Вимк.';

  @override
  String get playerAddSubtitle => 'Додати файл субтитрів…';

  @override
  String get playerCatchup => 'Дивитися з архіву';

  @override
  String get playerFullscreen => 'На весь екран';

  @override
  String get playerError => 'Не вдалося відтворити';

  @override
  String get playerRetry => 'Повторити';

  @override
  String get playerPip => 'Картинка в картинці';

  @override
  String get playerPipReturn => 'Повернутися до програми';

  @override
  String get catchupTitle => 'Архів';

  @override
  String get catchupNoEpg => 'Немає телепрограми. Виберіть час вручну.';

  @override
  String get catchupPick => 'Час початку';

  @override
  String get catchupDuration => 'Тривалість (хв)';

  @override
  String get seriesSeason => 'Сезон';

  @override
  String get onbWelcomeTitle => 'Ласкаво просимо до BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Дивіться прямі ефіри, фільми й серіали від вашого IPTV-провайдера. Додамо перше джерело.';

  @override
  String get onbWhereTitle => 'Куди вводити адреси?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: провайдер надає адресу сервера (наприклад, http://host:8080), ім’я користувача та пароль. Введіть їх нижче.';

  @override
  String get onbWhereM3u =>
      'M3U: дайте джерелу назву й вставте посилання на плейлист, яке вам надав провайдер.';

  @override
  String get fieldKind => 'Тип';

  @override
  String get fieldName => 'Назва';

  @override
  String get fieldServer => 'Адреса сервера';

  @override
  String get fieldUsername => 'Ім’я користувача';

  @override
  String get fieldPassword => 'Пароль';

  @override
  String get fieldUrl => 'Посилання на плейлист';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Перевірити з’єднання';

  @override
  String get onbTestOk => 'З’єднання встановлено';

  @override
  String get onbTestFail => 'Не вдалося з’єднатися';

  @override
  String get onbNext => 'Далі';

  @override
  String get onbBack => 'Назад';

  @override
  String get onbSave => 'Зберегти й синхронізувати';

  @override
  String get settingsAccounts => 'Джерела';

  @override
  String get settingsLanguageSub => 'Бажані мови субтитрів';

  @override
  String get settingsLanguageAudio => 'Бажані мови звуку';

  @override
  String get settingsSubscale => 'Розмір субтитрів';

  @override
  String get settingsSubdelay => 'Затримка субтитрів (секунди)';

  @override
  String get settingsGuide => 'Показати короткий посібник';

  @override
  String get settingsDelete => 'Видалити';

  @override
  String get accountAdd => 'Додати джерело…';

  @override
  String get settingsChangePassword => 'Змінити пароль…';

  @override
  String get settingsNewPassword => 'Новий пароль';

  @override
  String updateAvailable(String p1) {
    return 'Доступна версія $p1';
  }

  @override
  String get updateNow => 'Оновити';

  @override
  String get updateNotes => 'Що нового';

  @override
  String get updateLater => 'Пізніше';

  @override
  String get updateDownloading => 'Завантаження оновлення…';

  @override
  String updateReady(String p1) {
    return 'Версія $p1 готова до встановлення';
  }

  @override
  String get updateRestart => 'Перезапустити для оновлення';

  @override
  String get updateFailed => 'Не вдалося оновити';

  @override
  String get updateManual => 'Завантажити вручну';

  @override
  String get updateCheckNow => 'Перевірити оновлення';

  @override
  String get updateAuto => 'Перевіряти оновлення автоматично';

  @override
  String get updateAutoInstall => 'Завантажувати оновлення автоматично';

  @override
  String get updateUpToDate => 'У вас остання версія';

  @override
  String get updateDevBuild =>
      'Оновлення доступні лише в установленій програмі';

  @override
  String updateCurrent(String p1) {
    return 'Поточна версія: $p1';
  }

  @override
  String get playerBack => 'Назад';

  @override
  String get playerErrorHint =>
      'Якщо помилка повторюється, перевірте пароль джерела в налаштуваннях.';

  @override
  String get passwordTitle => 'Потрібен пароль';

  @override
  String passwordBody(String p1) {
    return 'Введіть пароль для «$p1». Він зберігається лише на цьому Mac.';
  }

  @override
  String get passwordNone => 'Продовжити без пароля';

  @override
  String get playerSpeed => 'Швидкість відтворення';

  @override
  String get playerSpeedNormal => 'Звичайна';

  @override
  String get playerSpeedReset => 'Звичайна швидкість';

  @override
  String get settingsSeekPreview => 'Мініатюри на смузі перемотування';

  @override
  String get settingsSeekPreviewNote =>
      'Відкриває друге з’єднання з вашим провайдером. Вимкніть, якщо відтворення зупиняється або провайдер дозволяє лише одне з’єднання.';

  @override
  String get playerSeekBar => 'Позиція відтворення';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 з $p2';
  }

  @override
  String get playerLive => 'Наживо';

  @override
  String get playerChannelPrev => 'Попередній канал';

  @override
  String get playerChannelNext => 'Наступний канал';

  @override
  String get playerScaleFit => 'Вписати';

  @override
  String get playerScaleFill => 'Заповнити';

  @override
  String get playerScaleStretch => 'Розтягнути';

  @override
  String get playerSubtitleAdjust => 'Налаштувати субтитри…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Яскравість';

  @override
  String get playerVolume => 'Гучність';

  @override
  String get playerReplay => 'Відтворити знову';

  @override
  String get settingsClock => 'Показувати час у програвачі';

  @override
  String get settingsSeekStep =>
      'Крок перемотування (клавіші зі стрілками та кнопки перемотування)';

  @override
  String get settingsBarsHide => 'Ховати елементи керування через';

  @override
  String get settingsNever => 'Ніколи';

  @override
  String get settingsVideoScale => 'Масштаб відео';

  @override
  String get settingsScaleFit => 'Вписати (чорні смуги)';

  @override
  String get settingsScaleFill => 'Заповнити (краї обрізаються)';

  @override
  String get settingsScaleStretch => 'Розтягнути';

  @override
  String get settingsVideoScaleHint =>
      'Натисніть A у програвачі, щоб перемикатися між трьома режимами.';

  @override
  String get settingsBuffer => 'Мережевий буфер';

  @override
  String get settingsBufferSmall => 'Малий';

  @override
  String get settingsBufferNormal => 'Звичайний';

  @override
  String get settingsBufferLarge => 'Великий';

  @override
  String get settingsBufferHint =>
      'Більший буфер допомагає за повільного або нестабільного з’єднання.';

  @override
  String unitSeconds(int p1) {
    return '$p1 с';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 хв';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 хв';
  }

  @override
  String playerSkipBack(String p1) {
    return 'Назад на $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Уперед на $p1';
  }

  @override
  String get playerSleep => 'Таймер сну';

  @override
  String get downloadsTitle => 'Завантаження';

  @override
  String get downloadsAdd => 'Завантажити';

  @override
  String get downloadsSeason => 'Завантажити сезон';

  @override
  String get downloadsChooseFolder =>
      'Виберіть, куди зберігати завантажені фільми та серії';

  @override
  String get downloadsChoose => 'Вибрати';

  @override
  String get downloadsNotChosen => 'Запитаємо під час першого завантаження';

  @override
  String get downloadsChange => 'Змінити папку…';

  @override
  String get downloadsPause => 'Призупинити';

  @override
  String get downloadsResume => 'Продовжити';

  @override
  String get downloadsCancel => 'Скасувати';

  @override
  String get downloadsPlay => 'Відтворити';

  @override
  String get downloadsReveal => 'Показати у Finder';

  @override
  String get downloadsDelete => 'Видалити файл';

  @override
  String get downloadsEmpty => 'Завантажень поки немає';

  @override
  String get downloadsQueued => 'Очікування';

  @override
  String get downloadsDone => 'Готово';

  @override
  String get downloadsHint =>
      'Завантаження виконуються по одному. Багато провайдерів дозволяють лише одне з’єднання, тому відтворення під час завантаження може не працювати. Незавершені завантаження не зберігаються після виходу з програми.';

  @override
  String get epgNow => 'Зараз';

  @override
  String get epgNext => 'Далі';

  @override
  String get settingsFullscreen =>
      'Відкривати відтворення на весь екран (елементи керування ховаються, доки ви не поворухнете мишею)';

  @override
  String get nextTitle => 'Наступна серія';

  @override
  String nextIn(int p1) {
    return 'Відтворення через $p1 с';
  }

  @override
  String get nextNow => 'Дивитися зараз';

  @override
  String get nextCancel => 'Скасувати';

  @override
  String get settingsAutoNext => 'Автоматично вмикати наступну серію';

  @override
  String get downloadsNoSpace => 'Недостатньо вільного місця на диску';

  @override
  String get dbErrorTitle =>
      'BattleStation TV не може відкрити свою базу даних';

  @override
  String get dbErrorBody =>
      'Якщо запущено іншу копію BattleStation TV, закрийте її та спробуйте ще раз.';

  @override
  String get dbRecoveredTitle => 'Базу даних було пошкоджено';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV запустився з новою базою даних (додайте джерело знову). Пошкоджений файл збережено тут:\n$p1';
  }

  @override
  String get menuShowWindow => 'Показати вікно';

  @override
  String get settingsTabGeneral => 'Загальні';

  @override
  String get settingsTabPlayer => 'Програвач';

  @override
  String get settingsTabPlaylists => 'Плейлисти';

  @override
  String get settingsAppearance => 'Вигляд';

  @override
  String get settingsSystem => 'Системний';

  @override
  String get appearanceLight => 'Світлий';

  @override
  String get appearanceDark => 'Темний';

  @override
  String get settingsInterfaceLanguage => 'Мова інтерфейсу';

  @override
  String get settingsLanguageRestart =>
      'Набуде чинності після перезапуску BattleStation TV.';

  @override
  String get settingsHideCategories => 'Приховування категорій';

  @override
  String get settingsHideCategoriesWords => 'Слова для приховування';

  @override
  String get settingsHideCategoriesNote =>
      'Приховувати категорії, назва яких містить ці слова (через кому). Їхні канали, фільми й серіали також зникнуть із пошуку, вибраного та розділу «Продовжити перегляд». Це звичайний фільтр, а не батьківський контроль: будь-хто може змінити його тут.';

  @override
  String get settingsRefresh => 'Оновлення плейлистів';

  @override
  String get settingsRefresh0 => 'Лише під час запуску програми';

  @override
  String get settingsRefresh6 => 'Кожні 6 год';

  @override
  String get settingsRefresh12 => 'Кожні 12 год';

  @override
  String get settingsRefresh24 => 'Кожні 24 год';

  @override
  String get settingsBackup => 'Резервна копія та відновлення';

  @override
  String get backupExport => 'Експортувати резервну копію…';

  @override
  String get backupImport => 'Імпортувати резервну копію…';

  @override
  String get backupWarn =>
      'Файл резервної копії містить список ваших плейлистів з їхніми адресами, які можуть містити логіни, тому зберігайте його в безпеці. Паролі джерел Xtream до нього не потрапляють. Під час імпорту дані додаються до поточних джерел, нічого не видаляється.';

  @override
  String get backupExported => 'Резервну копію збережено.';

  @override
  String get backupImported => 'Резервну копію імпортовано.';

  @override
  String get backupErrorInvalid =>
      'Це не файл резервної копії BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'Ця резервна копія створена в іншій версії BattleStation TV і не може бути прочитана.';

  @override
  String get backupErrorTooLarge => 'Файл завеликий для резервної копії.';

  @override
  String get backupFailed => 'Помилка резервного копіювання';

  @override
  String get settingsClearData => 'Очищення даних';

  @override
  String get clearHistory => 'Очистити історію переглядів';

  @override
  String get clearFavorites => 'Очистити вибране';

  @override
  String get clearImages => 'Очистити кеш зображень';

  @override
  String get clearConfirm => 'Очистити';

  @override
  String get clearHistoryWarn =>
      'Позиції відтворення та списки «Продовжити перегляд» усіх джерел буде стерто. Цю дію не можна скасувати.';

  @override
  String get clearFavoritesWarn =>
      'Вибране в усіх джерелах буде видалено. Цю дію не можна скасувати.';

  @override
  String get clearImagesWarn =>
      'Збережені логотипи й постери видаляються та за потреби завантажуються знову.';

  @override
  String get infoDetails => 'Подробиці';

  @override
  String get infoPlot => 'Сюжет';

  @override
  String get infoCast => 'У ролях';

  @override
  String get infoDirector => 'Режисер';

  @override
  String get infoGenre => 'Жанр';

  @override
  String get infoYear => 'Рік випуску';

  @override
  String get infoRating => 'Рейтинг';

  @override
  String get infoDuration => 'Тривалість';

  @override
  String get infoCountry => 'Країна';

  @override
  String get infoTrailer => 'Трейлер';

  @override
  String get infoPlay => 'Відтворити';

  @override
  String get infoEmpty =>
      'У вашого провайдера немає відомостей про цей фільм чи серіал.';

  @override
  String get infoLoading => 'Завантаження подробиць…';

  @override
  String get infoError => 'Не вдалося завантажити подробиці.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 год';
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
  String get playerSkipIntro => 'Пропустити заставку';

  @override
  String get playerSkipCredits => 'Пропустити титри';

  @override
  String get playerSkipMenu => 'Заставка і титри';

  @override
  String get playerMarkIntroStart => 'Заставка починається тут';

  @override
  String get playerMarkIntroEnd => 'Заставка закінчується тут';

  @override
  String get playerMarkCredits => 'Титри починаються тут';

  @override
  String get playerSkipForget => 'Забути заставку і титри';

  @override
  String get playerSkipSaved => 'Збережено для всіх серій цього серіалу';

  @override
  String get playerSkipRefused => 'У цьому місці неможливо';

  @override
  String get continueRemove => 'Прибрати з «Продовжити перегляд»';

  @override
  String get settingsFavoritesAZ => 'Сортувати обране за назвою (А–Я)';

  @override
  String get settingsKeychain => 'Зберігати паролі у в\'язці ключів';

  @override
  String get settingsKeychainNote =>
      'Вимк.: паролі зберігаються в приватній базі даних застосунку. Увімк.: macOS зберігає їх у вашій в\'язці ключів входу.';

  @override
  String get settingsKeychainFailed =>
      'В\'язка ключів не прийняла паролі. Нічого не змінено.';
}
