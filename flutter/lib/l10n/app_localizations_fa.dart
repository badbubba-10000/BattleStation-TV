// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'زنده';

  @override
  String get tabMovies => 'فیلم‌ها';

  @override
  String get tabSeries => 'سریال‌ها';

  @override
  String get catAll => 'همه';

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
  String get catFavorites => 'علاقه‌مندی‌ها';

  @override
  String get catContinue => 'ادامهٔ تماشا';

  @override
  String get catFilter => 'فیلتر دسته‌ها';

  @override
  String get playlistAll => 'همهٔ فهرست‌های پخش';

  @override
  String get playlistLabel => 'فهرست پخش';

  @override
  String get aboutAcknowledgements => 'قدردانی';

  @override
  String get aboutPrivacy => 'حریم خصوصی';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV هیچ داده‌ای از شما جمع‌آوری نمی‌کند. حساب کاربری، ابزار تحلیل، تبلیغات و ردیابی ندارد.\n\nمنابع، علاقه‌مندی‌ها و سابقهٔ تماشای شما روی همین دستگاه می‌مانند. برنامه فقط به نشانی‌هایی متصل می‌شود که خودتان اضافه می‌کنید: سرور ارائه‌دهنده، فهرست پخش، راهنمای برنامه‌ها، لوگوها و جریان‌های پخش.\n\nگذرواژه‌های ارائه‌دهنده فقط روی همین دستگاه در iOS Keychain ذخیره می‌شوند و هرگز در فایل پشتیبان قرار نمی‌گیرند.\n\nBattleStation TV هیچ کانال، فیلم یا فهرست پخشی ندارد. منبع را خودتان تهیه می‌کنید.';

  @override
  String get aboutSource => 'کد منبع و مجوز';

  @override
  String get aboutCoffee => 'برایم یک قهوه بخرید';

  @override
  String get tipsTitle => 'از BattleStation TV حمایت کنید';

  @override
  String get tipsFooter =>
      'انعام اختیاری از طریق Apple. چیزی را باز نمی‌کند: همه قابلیت‌ها برای همه رایگان می‌مانند.';

  @override
  String get tipsThanks => 'از حمایت شما سپاسگزاریم!';

  @override
  String get tipsPending => 'در انتظار تأیید.';

  @override
  String get tipsFailed => 'انعام انجام نشد. بعداً دوباره امتحان کنید.';

  @override
  String get aboutVersion => 'نسخه';

  @override
  String get catTitle => 'دسته‌ها';

  @override
  String get commonCancel => 'لغو';

  @override
  String get emptyContinue => 'چیزی برای ادامه نیست';

  @override
  String get emptyContinueHint =>
      'فیلم‌ها و قسمت‌هایی که نیمه‌کاره رها می‌کنید اینجا نمایش داده می‌شوند.';

  @override
  String get emptyFavorites => 'هنوز علاقه‌مندی‌ای نیست';

  @override
  String get emptyFavoritesHint =>
      'روی یک عنوان نگه دارید و «افزودن به علاقه‌مندی‌ها» را انتخاب کنید.';

  @override
  String get emptyFavoritesLive => 'کانال را به کنار بکشید و روی ستاره بزنید.';

  @override
  String get emptyNone => 'هنوز چیزی اینجا نیست';

  @override
  String get emptyNoneHint =>
      'برای به‌روزرسانی به پایین بکشید یا منبع خود را در تنظیمات بررسی کنید.';

  @override
  String get fieldServerInvalid =>
      'این نشانی درست به نظر نمی‌رسد. نمونه: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'پیوند را کامل و با http:// یا https:// وارد کنید';

  @override
  String get infoResume => 'ادامه';

  @override
  String get libraryEmpty => 'کتابخانهٔ شما خالی است';

  @override
  String get libraryEmptyHint =>
      'علاقه‌مندی‌ها و عنوان‌هایی که تماشایشان را شروع کرده‌اید اینجا نمایش داده می‌شوند.';

  @override
  String get onbNoChannels =>
      'BattleStation TV هیچ کانال، فیلم یا فهرست پخشی ندارد. منبعی را از ارائه‌دهنده‌ای که مشترک آن هستید اضافه کنید.';

  @override
  String get onbPasteHint => 'پیوند فهرست پخش را کپی کرده‌اید؟';

  @override
  String get onbTestRunning => 'در حال آزمایش…';

  @override
  String passwordBodyIos(String p1) {
    return 'گذرواژهٔ «$p1» را وارد کنید. این گذرواژه در iOS Keychain روی این دستگاه ذخیره می‌شود.';
  }

  @override
  String get searchRecent => 'جستجوهای اخیر';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'ادامهٔ ف$p1 ق$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'ف$p1 ق$p2';
  }

  @override
  String get seriesNoEpisodes => 'قسمتی پیدا نشد';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'پخش ف$p1 ق$p2';
  }

  @override
  String get seriesWatched => 'تماشا شد';

  @override
  String get settingsAbout => 'درباره';

  @override
  String get settingsEditSource => 'ویرایش منبع';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV از زبان دستگاه شما استفاده می‌کند. برای استفاده از زبان دیگر فقط در این برنامه، آن را در تنظیمات iOS انتخاب کنید.';

  @override
  String get settingsOpenIOS => 'باز کردن تنظیمات iOS';

  @override
  String get settingsPasswordNote =>
      'برای نگه داشتن گذرواژهٔ فعلی، گذرواژهٔ جدید را خالی بگذارید. گذرواژه‌ها در iOS Keychain ذخیره می‌شوند.';

  @override
  String get settingsTitle => 'تنظیمات';

  @override
  String get sourceDeleteWarn =>
      'منبع، علاقه‌مندی‌ها و سابقهٔ تماشای آن از این دستگاه حذف می‌شوند. حساب شما نزد ارائه‌دهنده تحت‌تأثیر قرار نمی‌گیرد.';

  @override
  String get syncNow => 'تازه‌سازی';

  @override
  String get tabLibrary => 'کتابخانه';

  @override
  String get scopeCategory => 'در دسته';

  @override
  String get scopeType => 'در بخش';

  @override
  String get scopeEverywhere => 'همه‌جا';

  @override
  String get searchPrompt => 'جستجو';

  @override
  String get syncRunning => 'در حال همگام‌سازی…';

  @override
  String get syncFailed => 'همگام‌سازی ناموفق بود';

  @override
  String get syncNotUpdated => 'نمایش داده‌های ذخیره‌شده';

  @override
  String get emptyResults => 'چیزی پیدا نشد';

  @override
  String get favAdd => 'افزودن به علاقه‌مندی‌ها';

  @override
  String get favRemove => 'حذف از علاقه‌مندی‌ها';

  @override
  String get playerClose => 'بستن';

  @override
  String get playerSubtitles => 'زیرنویس';

  @override
  String get playerAudio => 'صدا';

  @override
  String get playerOff => 'خاموش';

  @override
  String get playerAddSubtitle => 'افزودن فایل زیرنویس…';

  @override
  String get playerCatchup => 'تماشای برنامه‌های گذشته';

  @override
  String get playerFullscreen => 'تمام‌صفحه';

  @override
  String get playerError => 'پخش ناموفق بود';

  @override
  String get playerRetry => 'تلاش دوباره';

  @override
  String get playerPip => 'تصویر در تصویر';

  @override
  String get playerPipReturn => 'بازگشت به برنامه';

  @override
  String get catchupTitle => 'بازپخش';

  @override
  String get catchupNoEpg =>
      'راهنمای برنامه‌ها موجود نیست. زمان را دستی انتخاب کنید.';

  @override
  String get catchupPick => 'زمان شروع';

  @override
  String get catchupDuration => 'دقیقه';

  @override
  String get seriesSeason => 'فصل';

  @override
  String get onbWelcomeTitle => 'به BattleStation TV خوش آمدید';

  @override
  String get onbWelcomeBody =>
      'کانال‌های زنده، فیلم‌ها و سریال‌های ارائه‌دهندهٔ IPTV خود را تماشا کنید. بیایید اولین منبع شما را اضافه کنیم.';

  @override
  String get onbWhereTitle => 'نشانی‌ها را کجا وارد کنم؟';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: ارائه‌دهندهٔ شما یک نشانی سرور (مانند http://host:8080)، یک نام کاربری و یک گذرواژه به شما می‌دهد. آن‌ها را در زیر وارد کنید.';

  @override
  String get onbWhereM3u =>
      'M3U: برای منبع یک نام بگذارید و پیوند فهرست پخشی را که ارائه‌دهنده به شما داده است جای‌گذاری کنید.';

  @override
  String get fieldKind => 'نوع';

  @override
  String get fieldName => 'نام';

  @override
  String get fieldServer => 'نشانی سرور';

  @override
  String get fieldUsername => 'نام کاربری';

  @override
  String get fieldPassword => 'گذرواژه';

  @override
  String get fieldUrl => 'پیوند فهرست پخش';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'آزمایش اتصال';

  @override
  String get onbTestOk => 'اتصال با موفقیت برقرار شد';

  @override
  String get onbTestFail => 'اتصال ناموفق بود';

  @override
  String get onbNext => 'بعدی';

  @override
  String get onbBack => 'بازگشت';

  @override
  String get onbSave => 'ذخیره و همگام‌سازی';

  @override
  String get settingsAccounts => 'منابع';

  @override
  String get settingsLanguageSub => 'زبان‌های دلخواه زیرنویس';

  @override
  String get settingsLanguageAudio => 'زبان‌های دلخواه صدا';

  @override
  String get settingsSubscale => 'اندازهٔ زیرنویس';

  @override
  String get settingsSubdelay => 'تأخیر زیرنویس (ثانیه)';

  @override
  String get settingsGuide => 'نمایش راهنمای شروع سریع';

  @override
  String get settingsDelete => 'حذف';

  @override
  String get accountAdd => 'افزودن منبع…';

  @override
  String get settingsChangePassword => 'تغییر گذرواژه…';

  @override
  String get settingsNewPassword => 'گذرواژهٔ جدید';

  @override
  String updateAvailable(String p1) {
    return 'نسخهٔ $p1 در دسترس است';
  }

  @override
  String get updateNow => 'به‌روزرسانی';

  @override
  String get updateNotes => 'تازه‌ها';

  @override
  String get updateLater => 'بعداً';

  @override
  String get updateDownloading => 'در حال دانلود به‌روزرسانی…';

  @override
  String updateReady(String p1) {
    return 'نسخهٔ $p1 آمادهٔ نصب است';
  }

  @override
  String get updateRestart => 'راه‌اندازی مجدد برای به‌روزرسانی';

  @override
  String get updateFailed => 'به‌روزرسانی ناموفق بود';

  @override
  String get updateManual => 'دانلود دستی';

  @override
  String get updateCheckNow => 'بررسی به‌روزرسانی‌ها';

  @override
  String get updateAuto => 'بررسی خودکار به‌روزرسانی‌ها';

  @override
  String get updateAutoInstall => 'دانلود خودکار به‌روزرسانی‌ها';

  @override
  String get updateUpToDate => 'شما جدیدترین نسخه را دارید';

  @override
  String get updateDevBuild =>
      'به‌روزرسانی‌ها فقط در برنامهٔ نصب‌شده در دسترس هستند';

  @override
  String updateCurrent(String p1) {
    return 'نسخهٔ فعلی: $p1';
  }

  @override
  String get playerBack => 'بازگشت';

  @override
  String get playerErrorHint =>
      'اگر این مشکل ادامه داشت، گذرواژهٔ منبع را در تنظیمات بررسی کنید.';

  @override
  String get passwordTitle => 'گذرواژه لازم است';

  @override
  String passwordBody(String p1) {
    return 'گذرواژهٔ «$p1» را وارد کنید. این گذرواژه به‌صورت خصوصی روی این Mac ذخیره می‌شود.';
  }

  @override
  String get passwordNone => 'ادامه بدون گذرواژه';

  @override
  String get playerSpeed => 'سرعت پخش';

  @override
  String get playerSpeedNormal => 'عادی';

  @override
  String get playerSpeedReset => 'سرعت عادی';

  @override
  String get settingsSeekPreview => 'پیش‌نمایش تصویری روی نوار پیشرفت';

  @override
  String get settingsSeekPreviewNote =>
      'یک اتصال دوم به ارائه‌دهنده شما باز می‌کند. اگر پخش متوقف شد یا ارائه‌دهنده شما فقط یک اتصال را مجاز می‌داند، آن را خاموش کنید.';

  @override
  String get playerSeekBar => 'موقعیت پخش';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 از $p2';
  }

  @override
  String get playerLive => 'زنده';

  @override
  String get playerChannelPrev => 'کانال قبلی';

  @override
  String get playerChannelNext => 'کانال بعدی';

  @override
  String get playerScaleFit => 'جا شدن';

  @override
  String get playerScaleFill => 'پر کردن';

  @override
  String get playerScaleStretch => 'کشیدن';

  @override
  String get playerSubtitleAdjust => 'تنظیم زیرنویس…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'روشنایی';

  @override
  String get playerVolume => 'میزان صدا';

  @override
  String get playerReplay => 'پخش دوباره';

  @override
  String get settingsClock => 'نمایش ساعت در پخش‌کننده';

  @override
  String get settingsSeekStep => 'گام پرش (کلیدهای جهت‌نما و دکمه‌های پرش)';

  @override
  String get settingsBarsHide => 'پنهان کردن کنترل‌ها پس از';

  @override
  String get settingsNever => 'هرگز';

  @override
  String get settingsVideoScale => 'مقیاس ویدیو';

  @override
  String get settingsScaleFit => 'جاگیری (با نوارهای سیاه)';

  @override
  String get settingsScaleFill => 'پر کردن (لبه‌ها بریده می‌شوند)';

  @override
  String get settingsScaleStretch => 'کشیدن';

  @override
  String get settingsVideoScaleHint =>
      'در پخش‌کننده کلید A را فشار دهید تا بین این سه حالت جابه‌جا شوید.';

  @override
  String get settingsBuffer => 'بافر شبکه';

  @override
  String get settingsBufferSmall => 'کوچک';

  @override
  String get settingsBufferNormal => 'عادی';

  @override
  String get settingsBufferLarge => 'بزرگ';

  @override
  String get settingsBufferHint =>
      'بافر بزرگ‌تر در اتصال کند یا ناپایدار کمک می‌کند.';

  @override
  String unitSeconds(int p1) {
    return '$p1 ثانیه';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 دقیقه';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 دقیقه';
  }

  @override
  String playerSkipBack(String p1) {
    return '$p1 به عقب';
  }

  @override
  String playerSkipForward(String p1) {
    return '$p1 به جلو';
  }

  @override
  String get playerSleep => 'زمان‌سنج خواب';

  @override
  String get downloadsTitle => 'دانلودها';

  @override
  String get downloadsAdd => 'دانلود';

  @override
  String get downloadsSeason => 'دانلود فصل';

  @override
  String get downloadsChooseFolder =>
      'محل ذخیرهٔ فیلم‌ها و قسمت‌های دانلودشده را انتخاب کنید';

  @override
  String get downloadsChoose => 'انتخاب';

  @override
  String get downloadsNotChosen => 'در اولین دانلود پرسیده می‌شود';

  @override
  String get downloadsChange => 'تغییر پوشه…';

  @override
  String get downloadsPause => 'مکث';

  @override
  String get downloadsResume => 'ادامه';

  @override
  String get downloadsCancel => 'لغو';

  @override
  String get downloadsPlay => 'پخش';

  @override
  String get downloadsReveal => 'نمایش در Finder';

  @override
  String get downloadsDelete => 'حذف فایل';

  @override
  String get downloadsEmpty => 'هنوز دانلودی وجود ندارد';

  @override
  String get downloadsQueued => 'در انتظار';

  @override
  String get downloadsDone => 'تمام شد';

  @override
  String get downloadsHint =>
      'دانلودها یکی‌یکی انجام می‌شوند. بسیاری از ارائه‌دهندگان فقط یک اتصال را مجاز می‌دانند، بنابراین پخش هنگام دانلود ممکن است ناموفق باشد. دانلودهای ناتمام با بسته شدن برنامه نگه داشته نمی‌شوند.';

  @override
  String get epgNow => 'اکنون';

  @override
  String get epgNext => 'بعدی';

  @override
  String get settingsFullscreen =>
      'باز کردن پخش در حالت تمام‌صفحه (کنترل‌ها تا حرکت دادن ماوس پنهان می‌مانند)';

  @override
  String get nextTitle => 'قسمت بعدی';

  @override
  String nextIn(int p1) {
    return 'پخش تا $p1 ثانیهٔ دیگر';
  }

  @override
  String get nextNow => 'پخش اکنون';

  @override
  String get nextCancel => 'لغو';

  @override
  String get settingsAutoNext => 'پخش خودکار قسمت بعدی';

  @override
  String get downloadsNoSpace => 'فضای خالی دیسک کافی نیست';

  @override
  String get dbErrorTitle =>
      'BattleStation TV نمی‌تواند پایگاه دادهٔ خود را باز کند';

  @override
  String get dbErrorBody =>
      'اگر نسخهٔ دیگری از BattleStation TV در حال اجراست، آن را ببندید و دوباره تلاش کنید.';

  @override
  String get dbRecoveredTitle => 'پایگاه داده آسیب دیده بود';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV با یک پایگاه دادهٔ تازه شروع شد (منبع خود را دوباره اضافه کنید). فایل آسیب‌دیده اینجا نگه داشته شد:\n$p1';
  }

  @override
  String get menuShowWindow => 'نمایش پنجره';

  @override
  String get settingsTabGeneral => 'عمومی';

  @override
  String get settingsTabPlayer => 'پخش‌کننده';

  @override
  String get settingsTabPlaylists => 'فهرست‌های پخش';

  @override
  String get settingsAppearance => 'ظاهر';

  @override
  String get settingsSystem => 'سیستم';

  @override
  String get appearanceLight => 'روشن';

  @override
  String get appearanceDark => 'تیره';

  @override
  String get settingsInterfaceLanguage => 'زبان رابط';

  @override
  String get settingsLanguageRestart =>
      'پس از راه‌اندازی مجدد BattleStation TV اعمال می‌شود.';

  @override
  String get settingsHideCategories => 'پنهان کردن دسته‌ها';

  @override
  String get settingsHideCategoriesWords => 'واژه‌های پنهان‌شونده';

  @override
  String get settingsHideCategoriesNote =>
      'دسته‌هایی را که نامشان شامل این واژه‌هاست پنهان کنید (با ویرگول جدا کنید). کانال‌ها، فیلم‌ها و سریال‌های آن‌ها نیز از جستجو، علاقه‌مندی‌ها و ادامهٔ تماشا ناپدید می‌شوند. این فقط یک فیلتر ساده است، نه قفل کنترل والدین: هر کسی می‌تواند آن را اینجا تغییر دهد.';

  @override
  String get settingsRefresh => 'به‌روزرسانی فهرست‌های پخش';

  @override
  String get settingsRefresh0 => 'فقط هنگام باز شدن برنامه';

  @override
  String get settingsRefresh6 => 'هر 6 ساعت';

  @override
  String get settingsRefresh12 => 'هر 12 ساعت';

  @override
  String get settingsRefresh24 => 'هر 24 ساعت';

  @override
  String get settingsBackup => 'پشتیبان‌گیری و بازیابی';

  @override
  String get backupExport => 'صادر کردن پشتیبان…';

  @override
  String get backupImport => 'وارد کردن پشتیبان…';

  @override
  String get backupWarn =>
      'فایل پشتیبان فهرست‌های پخش شما را همراه با نشانی‌هایشان نگه می‌دارد که ممکن است شامل اطلاعات ورود باشد؛ پس آن را خصوصی نگه دارید. گذرواژهٔ منابع Xtream در آن ذخیره نمی‌شود. وارد کردن پشتیبان به منابع فعلی شما اضافه می‌کند و چیزی را حذف نمی‌کند.';

  @override
  String get backupExported => 'پشتیبان ذخیره شد.';

  @override
  String get backupImported => 'پشتیبان وارد شد.';

  @override
  String get backupErrorInvalid => 'این فایل، پشتیبان BattleStation TV نیست.';

  @override
  String get backupErrorVersion =>
      'این پشتیبان از نسخهٔ دیگری از BattleStation TV است و خوانده نمی‌شود.';

  @override
  String get backupErrorTooLarge =>
      'این فایل بزرگ‌تر از آن است که یک پشتیبان باشد.';

  @override
  String get backupFailed => 'پشتیبان‌گیری ناموفق بود';

  @override
  String get settingsClearData => 'پاک کردن داده‌ها';

  @override
  String get clearHistory => 'پاک کردن سابقهٔ تماشا';

  @override
  String get clearFavorites => 'پاک کردن علاقه‌مندی‌ها';

  @override
  String get clearImages => 'پاک کردن حافظهٔ نهان تصاویر';

  @override
  String get clearConfirm => 'پاک کردن';

  @override
  String get clearHistoryWarn =>
      'جایگاه‌های ادامهٔ پخش و فهرست‌های ادامهٔ تماشای همهٔ منابع پاک می‌شوند. این کار قابل بازگشت نیست.';

  @override
  String get clearFavoritesWarn =>
      'علاقه‌مندی‌های شما در همهٔ منابع حذف می‌شوند. این کار قابل بازگشت نیست.';

  @override
  String get clearImagesWarn =>
      'لوگوها و پوسترهای ذخیره‌شده حذف می‌شوند و در صورت نیاز دوباره دانلود می‌شوند.';

  @override
  String get infoDetails => 'جزئیات';

  @override
  String get infoPlot => 'خلاصه داستان';

  @override
  String get infoCast => 'بازیگران';

  @override
  String get infoDirector => 'کارگردان';

  @override
  String get infoGenre => 'ژانر';

  @override
  String get infoYear => 'سال انتشار';

  @override
  String get infoRating => 'امتیاز';

  @override
  String get infoDuration => 'مدت';

  @override
  String get infoCountry => 'کشور';

  @override
  String get infoTrailer => 'تریلر';

  @override
  String get infoPlay => 'پخش';

  @override
  String get infoEmpty => 'ارائه‌دهنده شما جزئیاتی درباره این عنوان ندارد.';

  @override
  String get infoLoading => 'در حال بارگذاری جزئیات…';

  @override
  String get infoError => 'بارگذاری جزئیات ممکن نشد.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 ساعت';
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
  String get playerSkipIntro => 'رد کردن تیتراژ ابتدایی';

  @override
  String get playerSkipCredits => 'رد کردن تیتراژ پایانی';

  @override
  String get playerSkipMenu => 'تیتراژ ابتدایی و پایانی';

  @override
  String get playerMarkIntroStart => 'تیتراژ ابتدایی از اینجا شروع می‌شود';

  @override
  String get playerMarkIntroEnd => 'تیتراژ ابتدایی اینجا تمام می‌شود';

  @override
  String get playerMarkCredits => 'تیتراژ پایانی از اینجا شروع می‌شود';

  @override
  String get playerSkipForget => 'فراموش کردن تیتراژها';

  @override
  String get playerSkipSaved => 'برای همهٔ قسمت‌های این سریال ذخیره شد';

  @override
  String get playerSkipRefused => 'در این نقطه ممکن نیست';

  @override
  String get continueRemove => 'حذف از ادامهٔ تماشا';

  @override
  String get settingsFavoritesAZ =>
      'مرتب‌سازی علاقه‌مندی‌ها بر اساس نام (الف–ی)';

  @override
  String get settingsKeychain => 'ذخیره گذرواژه‌ها در Keychain';

  @override
  String get settingsKeychainNote =>
      'خاموش: گذرواژه‌ها در پایگاه داده خصوصی برنامه می‌مانند. روشن: macOS آن‌ها را در Keychain ورود شما نگه می‌دارد.';

  @override
  String get settingsKeychainFailed =>
      'Keychain گذرواژه‌ها را نپذیرفت. چیزی تغییر نکرد.';
}
