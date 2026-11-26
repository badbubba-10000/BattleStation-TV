// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Эфир';

  @override
  String get tabMovies => 'Фильмы';

  @override
  String get tabSeries => 'Сериалы';

  @override
  String get catAll => 'Все';

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
  String get catFavorites => 'Избранное';

  @override
  String get catContinue => 'Продолжить просмотр';

  @override
  String get catFilter => 'Фильтр категорий';

  @override
  String get playlistAll => 'Все плейлисты';

  @override
  String get playlistLabel => 'Плейлист';

  @override
  String get aboutAcknowledgements => 'Благодарности';

  @override
  String get aboutPrivacy => 'Конфиденциальность';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV не собирает никаких данных о вас. В приложении нет учётной записи, аналитики, рекламы и слежения.\n\nВаши источники, избранное и история просмотров остаются на этом устройстве. Приложение подключается только к адресам, которые вы добавили сами: серверу провайдера, плейлисту, телепрограмме, логотипам и потокам.\n\nПароли провайдеров хранятся в iOS Keychain только на этом устройстве. В файл резервной копии они никогда не попадают.\n\nВ BattleStation TV нет каналов, фильмов и плейлистов. Источник вы добавляете сами.';

  @override
  String get aboutSource => 'Исходный код и лицензия';

  @override
  String get aboutCoffee => 'Угостите меня кофе';

  @override
  String get tipsTitle => 'Поддержать BattleStation TV';

  @override
  String get tipsFooter =>
      'Добровольные чаевые через Apple. Они ничего не открывают: все функции остаются бесплатными для всех.';

  @override
  String get tipsThanks => 'Спасибо за поддержку!';

  @override
  String get tipsPending => 'Ожидает одобрения.';

  @override
  String get tipsFailed => 'Чаевые не прошли. Попробуйте позже.';

  @override
  String get aboutVersion => 'Версия';

  @override
  String get catTitle => 'Категории';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get emptyContinue => 'Нечего продолжать';

  @override
  String get emptyContinueHint =>
      'Фильмы и серии, которые вы не досмотрели до конца, появятся здесь.';

  @override
  String get emptyFavorites => 'В избранном пока пусто';

  @override
  String get emptyFavoritesHint =>
      'Нажмите и удерживайте название, затем выберите «Добавить в избранное».';

  @override
  String get emptyFavoritesLive =>
      'Проведите по каналу влево и нажмите на звёздочку.';

  @override
  String get emptyNone => 'Здесь пока ничего нет';

  @override
  String get emptyNoneHint =>
      'Потяните вниз, чтобы обновить, или проверьте источник в настройках.';

  @override
  String get fieldServerInvalid =>
      'Адрес выглядит неверно. Пример: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Введите ссылку целиком, начиная с http:// или https://';

  @override
  String get infoResume => 'Продолжить';

  @override
  String get libraryEmpty => 'Медиатека пуста';

  @override
  String get libraryEmptyHint =>
      'Здесь появятся избранное и то, что вы начали смотреть.';

  @override
  String get onbNoChannels =>
      'В BattleStation TV нет каналов, фильмов и плейлистов. Добавьте источник от провайдера, на услуги которого вы подписаны.';

  @override
  String get onbPasteHint => 'Скопировали ссылку на плейлист?';

  @override
  String get onbTestRunning => 'Проверка…';

  @override
  String passwordBodyIos(String p1) {
    return 'Введите пароль для «$p1». Он хранится в iOS Keychain только на этом устройстве.';
  }

  @override
  String get searchRecent => 'Недавние запросы';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Продолжить: С$p1 Э$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'С$p1 Э$p2';
  }

  @override
  String get seriesNoEpisodes => 'Серии не найдены';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Воспроизвести: С$p1 Э$p2';
  }

  @override
  String get seriesWatched => 'Просмотрено';

  @override
  String get settingsAbout => 'О приложении';

  @override
  String get settingsEditSource => 'Изменить источник';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV использует язык вашего устройства. Чтобы выбрать для этого приложения другой язык, откройте настройки iOS.';

  @override
  String get settingsOpenIOS => 'Открыть настройки iOS';

  @override
  String get settingsPasswordNote =>
      'Оставьте поле нового пароля пустым, чтобы сохранить текущий. Пароли хранятся в iOS Keychain.';

  @override
  String get settingsTitle => 'Настройки';

  @override
  String get sourceDeleteWarn =>
      'Источник, его избранное и история просмотров будут удалены с этого устройства. Ваша учётная запись у провайдера не затрагивается.';

  @override
  String get syncNow => 'Обновить';

  @override
  String get tabLibrary => 'Медиатека';

  @override
  String get scopeCategory => 'В категории';

  @override
  String get scopeType => 'В разделе';

  @override
  String get scopeEverywhere => 'Везде';

  @override
  String get searchPrompt => 'Поиск';

  @override
  String get syncRunning => 'Синхронизация…';

  @override
  String get syncFailed => 'Ошибка синхронизации';

  @override
  String get syncNotUpdated => 'Показаны сохранённые данные';

  @override
  String get emptyResults => 'Ничего не найдено';

  @override
  String get favAdd => 'Добавить в избранное';

  @override
  String get favRemove => 'Удалить из избранного';

  @override
  String get playerClose => 'Закрыть';

  @override
  String get playerSubtitles => 'Субтитры';

  @override
  String get playerAudio => 'Аудио';

  @override
  String get playerOff => 'Выкл.';

  @override
  String get playerAddSubtitle => 'Добавить файл субтитров…';

  @override
  String get playerCatchup => 'Смотреть из архива';

  @override
  String get playerFullscreen => 'На весь экран';

  @override
  String get playerError => 'Не удалось воспроизвести';

  @override
  String get playerRetry => 'Повторить';

  @override
  String get playerPip => 'Картинка в картинке';

  @override
  String get playerPipReturn => 'Вернуться в приложение';

  @override
  String get catchupTitle => 'Архив';

  @override
  String get catchupNoEpg => 'Нет телепрограммы. Выберите время вручную.';

  @override
  String get catchupPick => 'Время начала';

  @override
  String get catchupDuration => 'Длительность (мин)';

  @override
  String get seriesSeason => 'Сезон';

  @override
  String get onbWelcomeTitle => 'Добро пожаловать в BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Смотрите прямые эфиры, фильмы и сериалы от вашего IPTV-провайдера. Добавим первый источник.';

  @override
  String get onbWhereTitle => 'Куда вводить адреса?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: провайдер выдаёт адрес сервера (например, http://host:8080), имя пользователя и пароль. Введите их ниже.';

  @override
  String get onbWhereM3u =>
      'M3U: задайте источнику название и вставьте ссылку на плейлист, которую вам дал провайдер.';

  @override
  String get fieldKind => 'Тип';

  @override
  String get fieldName => 'Название';

  @override
  String get fieldServer => 'Адрес сервера';

  @override
  String get fieldUsername => 'Имя пользователя';

  @override
  String get fieldPassword => 'Пароль';

  @override
  String get fieldUrl => 'Ссылка на плейлист';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Проверить подключение';

  @override
  String get onbTestOk => 'Подключение выполнено';

  @override
  String get onbTestFail => 'Не удалось подключиться';

  @override
  String get onbNext => 'Далее';

  @override
  String get onbBack => 'Назад';

  @override
  String get onbSave => 'Сохранить и синхронизировать';

  @override
  String get settingsAccounts => 'Источники';

  @override
  String get settingsLanguageSub => 'Предпочитаемые языки субтитров';

  @override
  String get settingsLanguageAudio => 'Предпочитаемые языки звука';

  @override
  String get settingsSubscale => 'Размер субтитров';

  @override
  String get settingsSubdelay => 'Задержка субтитров (секунды)';

  @override
  String get settingsGuide => 'Показать краткое руководство';

  @override
  String get settingsDelete => 'Удалить';

  @override
  String get accountAdd => 'Добавить источник…';

  @override
  String get settingsChangePassword => 'Изменить пароль…';

  @override
  String get settingsNewPassword => 'Новый пароль';

  @override
  String updateAvailable(String p1) {
    return 'Доступна версия $p1';
  }

  @override
  String get updateNow => 'Обновить';

  @override
  String get updateNotes => 'Что нового';

  @override
  String get updateLater => 'Позже';

  @override
  String get updateDownloading => 'Загрузка обновления…';

  @override
  String updateReady(String p1) {
    return 'Версия $p1 готова к установке';
  }

  @override
  String get updateRestart => 'Перезапустить для обновления';

  @override
  String get updateFailed => 'Не удалось обновить';

  @override
  String get updateManual => 'Загрузить вручную';

  @override
  String get updateCheckNow => 'Проверить обновления';

  @override
  String get updateAuto => 'Проверять обновления автоматически';

  @override
  String get updateAutoInstall => 'Загружать обновления автоматически';

  @override
  String get updateUpToDate => 'У вас последняя версия';

  @override
  String get updateDevBuild =>
      'Обновления доступны только в установленном приложении';

  @override
  String updateCurrent(String p1) {
    return 'Текущая версия: $p1';
  }

  @override
  String get playerBack => 'Назад';

  @override
  String get playerErrorHint =>
      'Если ошибка повторяется, проверьте пароль источника в настройках.';

  @override
  String get passwordTitle => 'Нужен пароль';

  @override
  String passwordBody(String p1) {
    return 'Введите пароль для «$p1». Он хранится только на этом Mac.';
  }

  @override
  String get passwordNone => 'Продолжить без пароля';

  @override
  String get playerSpeed => 'Скорость воспроизведения';

  @override
  String get playerSpeedNormal => 'Обычная';

  @override
  String get playerSpeedReset => 'Обычная скорость';

  @override
  String get settingsSeekPreview => 'Миниатюры на полосе перемотки';

  @override
  String get settingsSeekPreviewNote =>
      'Открывает второе подключение к вашему провайдеру. Отключите, если воспроизведение останавливается или провайдер разрешает только одно подключение.';

  @override
  String get playerSeekBar => 'Позиция воспроизведения';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 из $p2';
  }

  @override
  String get playerLive => 'В эфире';

  @override
  String get playerChannelPrev => 'Предыдущий канал';

  @override
  String get playerChannelNext => 'Следующий канал';

  @override
  String get playerScaleFit => 'Вписать';

  @override
  String get playerScaleFill => 'Заполнить';

  @override
  String get playerScaleStretch => 'Растянуть';

  @override
  String get playerSubtitleAdjust => 'Настроить субтитры…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Яркость';

  @override
  String get playerVolume => 'Громкость';

  @override
  String get playerReplay => 'Повторить';

  @override
  String get settingsClock => 'Показывать время в плеере';

  @override
  String get settingsSeekStep =>
      'Шаг перемотки (клавиши со стрелками и кнопки перемотки)';

  @override
  String get settingsBarsHide => 'Скрывать элементы управления через';

  @override
  String get settingsNever => 'Никогда';

  @override
  String get settingsVideoScale => 'Масштаб видео';

  @override
  String get settingsScaleFit => 'Вписать (чёрные полосы)';

  @override
  String get settingsScaleFill => 'Заполнить (края обрезаются)';

  @override
  String get settingsScaleStretch => 'Растянуть';

  @override
  String get settingsVideoScaleHint =>
      'Нажмите A в плеере, чтобы переключаться между тремя режимами.';

  @override
  String get settingsBuffer => 'Сетевой буфер';

  @override
  String get settingsBufferSmall => 'Малый';

  @override
  String get settingsBufferNormal => 'Обычный';

  @override
  String get settingsBufferLarge => 'Большой';

  @override
  String get settingsBufferHint =>
      'Больший буфер помогает при медленном или нестабильном соединении.';

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
    return 'Назад на $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Вперёд на $p1';
  }

  @override
  String get playerSleep => 'Таймер сна';

  @override
  String get downloadsTitle => 'Загрузки';

  @override
  String get downloadsAdd => 'Загрузить';

  @override
  String get downloadsSeason => 'Загрузить сезон';

  @override
  String get downloadsChooseFolder =>
      'Выберите, куда сохранять загруженные фильмы и серии';

  @override
  String get downloadsChoose => 'Выбрать';

  @override
  String get downloadsNotChosen => 'Спросим при первой загрузке';

  @override
  String get downloadsChange => 'Изменить папку…';

  @override
  String get downloadsPause => 'Пауза';

  @override
  String get downloadsResume => 'Продолжить';

  @override
  String get downloadsCancel => 'Отменить';

  @override
  String get downloadsPlay => 'Воспроизвести';

  @override
  String get downloadsReveal => 'Показать в Finder';

  @override
  String get downloadsDelete => 'Удалить файл';

  @override
  String get downloadsEmpty => 'Загрузок пока нет';

  @override
  String get downloadsQueued => 'Ожидание';

  @override
  String get downloadsDone => 'Готово';

  @override
  String get downloadsHint =>
      'Загрузки выполняются по одной. Многие провайдеры разрешают только одно подключение, поэтому воспроизведение во время загрузки может не работать. Незавершённые загрузки не сохраняются при выходе из приложения.';

  @override
  String get epgNow => 'Сейчас';

  @override
  String get epgNext => 'Далее';

  @override
  String get settingsFullscreen =>
      'Открывать воспроизведение на весь экран (элементы управления скрыты, пока вы не подвигаете мышь)';

  @override
  String get nextTitle => 'Следующая серия';

  @override
  String nextIn(int p1) {
    return 'Воспроизведение через $p1 с';
  }

  @override
  String get nextNow => 'Смотреть сейчас';

  @override
  String get nextCancel => 'Отмена';

  @override
  String get settingsAutoNext => 'Автоматически включать следующую серию';

  @override
  String get downloadsNoSpace => 'Недостаточно места на диске';

  @override
  String get dbErrorTitle =>
      'BattleStation TV не может открыть свою базу данных';

  @override
  String get dbErrorBody =>
      'Если запущена другая копия BattleStation TV, завершите её и повторите попытку.';

  @override
  String get dbRecoveredTitle => 'База данных была повреждена';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV запущен с новой базой данных (добавьте источник заново). Повреждённый файл сохранён здесь:\n$p1';
  }

  @override
  String get menuShowWindow => 'Показать окно';

  @override
  String get settingsTabGeneral => 'Основные';

  @override
  String get settingsTabPlayer => 'Плеер';

  @override
  String get settingsTabPlaylists => 'Плейлисты';

  @override
  String get settingsAppearance => 'Оформление';

  @override
  String get settingsSystem => 'Системное';

  @override
  String get appearanceLight => 'Светлое';

  @override
  String get appearanceDark => 'Тёмное';

  @override
  String get settingsInterfaceLanguage => 'Язык интерфейса';

  @override
  String get settingsLanguageRestart =>
      'Изменение вступит в силу после перезапуска BattleStation TV.';

  @override
  String get settingsHideCategories => 'Скрытие категорий';

  @override
  String get settingsHideCategoriesWords => 'Слова для скрытия';

  @override
  String get settingsHideCategoriesNote =>
      'Скрывать категории, в названии которых есть эти слова (через запятую). Их каналы, фильмы и сериалы также исчезнут из поиска, избранного и раздела «Продолжить просмотр». Это обычный фильтр, а не родительский контроль: любой может изменить его здесь.';

  @override
  String get settingsRefresh => 'Обновление плейлистов';

  @override
  String get settingsRefresh0 => 'Только при запуске приложения';

  @override
  String get settingsRefresh6 => 'Каждые 6 ч';

  @override
  String get settingsRefresh12 => 'Каждые 12 ч';

  @override
  String get settingsRefresh24 => 'Каждые 24 ч';

  @override
  String get settingsBackup => 'Резервная копия и восстановление';

  @override
  String get backupExport => 'Экспорт резервной копии…';

  @override
  String get backupImport => 'Импорт резервной копии…';

  @override
  String get backupWarn =>
      'Файл резервной копии содержит список ваших плейлистов с их адресами, в которых могут быть логины, поэтому храните его в тайне. Пароли источников Xtream в него не сохраняются. При импорте данные добавляются к текущим источникам, ничего не удаляется.';

  @override
  String get backupExported => 'Резервная копия сохранена.';

  @override
  String get backupImported => 'Резервная копия импортирована.';

  @override
  String get backupErrorInvalid =>
      'Это не файл резервной копии BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'Эта резервная копия создана в другой версии BattleStation TV, и её невозможно прочитать.';

  @override
  String get backupErrorTooLarge => 'Файл слишком велик для резервной копии.';

  @override
  String get backupFailed => 'Ошибка резервного копирования';

  @override
  String get settingsClearData => 'Очистка данных';

  @override
  String get clearHistory => 'Очистить историю просмотров';

  @override
  String get clearFavorites => 'Очистить избранное';

  @override
  String get clearImages => 'Очистить кеш изображений';

  @override
  String get clearConfirm => 'Очистить';

  @override
  String get clearHistoryWarn =>
      'Позиции воспроизведения и списки «Продолжить просмотр» всех источников будут стёрты. Это действие нельзя отменить.';

  @override
  String get clearFavoritesWarn =>
      'Избранное во всех источниках будет удалено. Это действие нельзя отменить.';

  @override
  String get clearImagesWarn =>
      'Сохранённые логотипы и постеры удаляются и при необходимости загружаются снова.';

  @override
  String get infoDetails => 'Подробности';

  @override
  String get infoPlot => 'Сюжет';

  @override
  String get infoCast => 'В ролях';

  @override
  String get infoDirector => 'Режиссёр';

  @override
  String get infoGenre => 'Жанр';

  @override
  String get infoYear => 'Год выхода';

  @override
  String get infoRating => 'Рейтинг';

  @override
  String get infoDuration => 'Длительность';

  @override
  String get infoCountry => 'Страна';

  @override
  String get infoTrailer => 'Трейлер';

  @override
  String get infoPlay => 'Воспроизвести';

  @override
  String get infoEmpty =>
      'У вашего провайдера нет сведений об этом фильме или сериале.';

  @override
  String get infoLoading => 'Загрузка сведений…';

  @override
  String get infoError => 'Не удалось загрузить сведения.';

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
  String get playerSkipIntro => 'Пропустить заставку';

  @override
  String get playerSkipCredits => 'Пропустить титры';

  @override
  String get playerSkipMenu => 'Заставка и титры';

  @override
  String get playerMarkIntroStart => 'Заставка начинается здесь';

  @override
  String get playerMarkIntroEnd => 'Заставка заканчивается здесь';

  @override
  String get playerMarkCredits => 'Титры начинаются здесь';

  @override
  String get playerSkipForget => 'Забыть заставку и титры';

  @override
  String get playerSkipSaved => 'Сохранено для всех серий этого сериала';

  @override
  String get playerSkipRefused => 'В этом месте нельзя';

  @override
  String get continueRemove => 'Убрать из «Продолжить просмотр»';

  @override
  String get settingsFavoritesAZ => 'Сортировать избранное по названию (А–Я)';

  @override
  String get settingsKeychain => 'Хранить пароли в связке ключей';

  @override
  String get settingsKeychainNote =>
      'Выкл.: пароли хранятся в личной базе данных приложения. Вкл.: macOS хранит их в вашей связке ключей входа.';

  @override
  String get settingsKeychainFailed =>
      'Связка ключей не приняла пароли. Ничего не изменено.';
}
