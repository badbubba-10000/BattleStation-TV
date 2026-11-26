// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'بث مباشر';

  @override
  String get tabMovies => 'أفلام';

  @override
  String get tabSeries => 'مسلسلات';

  @override
  String get catAll => 'الكل';

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
  String get catFavorites => 'المفضلة';

  @override
  String get catContinue => 'متابعة المشاهدة';

  @override
  String get catFilter => 'تصفية الفئات';

  @override
  String get playlistAll => 'كل قوائم التشغيل';

  @override
  String get playlistLabel => 'قائمة التشغيل';

  @override
  String get aboutAcknowledgements => 'شكر وتقدير';

  @override
  String get aboutPrivacy => 'الخصوصية';

  @override
  String get aboutPrivacyBody =>
      'لا يجمع BattleStation TV أي بيانات عنك. لا يوجد حساب ولا تحليلات ولا إعلانات ولا تتبّع.\n\nتبقى مصادرك ومفضلتك وسجل مشاهدتك على هذا الجهاز. لا يتصل التطبيق إلا بالعناوين التي تضيفها بنفسك: خادم مزوّدك وقائمة التشغيل ودليل البرامج والشعارات والبث.\n\nتُحفظ كلمات مرور المزوّد في iOS Keychain على هذا الجهاز فقط، ولا تُضمَّن أبدًا في ملف النسخة الاحتياطية.\n\nلا يتضمن BattleStation TV أي قنوات أو أفلام أو قوائم تشغيل. أنت من يوفّر المصدر.';

  @override
  String get aboutSource => 'الشيفرة المصدرية والترخيص';

  @override
  String get aboutCoffee => 'اشترِ لي قهوة';

  @override
  String get tipsTitle => 'ادعم BattleStation TV';

  @override
  String get tipsFooter =>
      'إكراميات اختيارية عبر Apple. لا تفتح أي شيء: كل الميزات تبقى مجانية للجميع.';

  @override
  String get tipsThanks => 'شكرًا لدعمك!';

  @override
  String get tipsPending => 'بانتظار الموافقة.';

  @override
  String get tipsFailed => 'لم تكتمل الإكرامية. حاول مرة أخرى لاحقًا.';

  @override
  String get aboutVersion => 'الإصدار';

  @override
  String get catTitle => 'الفئات';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get emptyContinue => 'لا شيء للمتابعة';

  @override
  String get emptyContinueHint =>
      'الأفلام والحلقات التي توقفت عنها في منتصفها تظهر هنا.';

  @override
  String get emptyFavorites => 'لا توجد مفضلة بعد';

  @override
  String get emptyFavoritesHint =>
      'اضغط مطولًا على عنوان ثم اختر «أضف إلى المفضلة».';

  @override
  String get emptyFavoritesLive => 'اسحب القناة جانبًا ثم المس النجمة.';

  @override
  String get emptyNone => 'لا شيء هنا بعد';

  @override
  String get emptyNoneHint =>
      'اسحب للأسفل للتحديث، أو تحقق من مصدرك في الإعدادات.';

  @override
  String get fieldServerInvalid =>
      'هذا العنوان غير صحيح. مثال: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'أدخل الرابط كاملًا، بدءًا بـ http:// أو https://';

  @override
  String get infoResume => 'متابعة';

  @override
  String get libraryEmpty => 'مكتبتك فارغة';

  @override
  String get libraryEmptyHint =>
      'تظهر هنا المفضلة والعناوين التي بدأت مشاهدتها.';

  @override
  String get onbNoChannels =>
      'لا يتضمن BattleStation TV أي قنوات أو أفلام أو قوائم تشغيل. أضف مصدرًا من مزوّد أنت مشترك لديه.';

  @override
  String get onbPasteHint => 'هل نسخت رابط قائمة تشغيل؟';

  @override
  String get onbTestRunning => 'جارٍ الاختبار…';

  @override
  String passwordBodyIos(String p1) {
    return 'أدخل كلمة المرور لـ “$p1”. يتم حفظها في iOS Keychain على هذا الجهاز.';
  }

  @override
  String get searchRecent => 'عمليات البحث الأخيرة';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'متابعة م$p1 ح$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'م$p1 ح$p2';
  }

  @override
  String get seriesNoEpisodes => 'لم يتم العثور على حلقات';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'تشغيل م$p1 ح$p2';
  }

  @override
  String get seriesWatched => 'تمت المشاهدة';

  @override
  String get settingsAbout => 'حول';

  @override
  String get settingsEditSource => 'تعديل المصدر';

  @override
  String get settingsLanguageNote =>
      'يستخدم BattleStation TV لغة جهازك. لاستخدام لغة أخرى لهذا التطبيق فقط، اخترها في إعدادات iOS.';

  @override
  String get settingsOpenIOS => 'فتح إعدادات iOS';

  @override
  String get settingsPasswordNote =>
      'اترك كلمة المرور الجديدة فارغة للإبقاء على الحالية. تُحفظ كلمات المرور في iOS Keychain.';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get sourceDeleteWarn =>
      'تتم إزالة المصدر ومفضلته وسجل مشاهدته من هذا الجهاز. لا يتأثر حسابك لدى المزوّد.';

  @override
  String get syncNow => 'تحديث';

  @override
  String get tabLibrary => 'المكتبة';

  @override
  String get scopeCategory => 'في الفئة';

  @override
  String get scopeType => 'في القسم';

  @override
  String get scopeEverywhere => 'في كل مكان';

  @override
  String get searchPrompt => 'بحث';

  @override
  String get syncRunning => 'جارٍ المزامنة…';

  @override
  String get syncFailed => 'فشلت المزامنة';

  @override
  String get syncNotUpdated => 'عرض البيانات المحفوظة';

  @override
  String get emptyResults => 'لم يتم العثور على شيء';

  @override
  String get favAdd => 'أضف إلى المفضلة';

  @override
  String get favRemove => 'أزل من المفضلة';

  @override
  String get playerClose => 'إغلاق';

  @override
  String get playerSubtitles => 'الترجمة';

  @override
  String get playerAudio => 'الصوت';

  @override
  String get playerOff => 'إيقاف';

  @override
  String get playerAddSubtitle => 'إضافة ملف ترجمة…';

  @override
  String get playerCatchup => 'مشاهدة من الأرشيف';

  @override
  String get playerFullscreen => 'ملء الشاشة';

  @override
  String get playerError => 'فشل التشغيل';

  @override
  String get playerRetry => 'إعادة المحاولة';

  @override
  String get playerPip => 'صورة داخل صورة';

  @override
  String get playerPipReturn => 'العودة إلى التطبيق';

  @override
  String get catchupTitle => 'الأرشيف';

  @override
  String get catchupNoEpg => 'لا يوجد دليل برامج. اختر الوقت يدويًا.';

  @override
  String get catchupPick => 'وقت البدء';

  @override
  String get catchupDuration => 'دقائق';

  @override
  String get seriesSeason => 'الموسم';

  @override
  String get onbWelcomeTitle => 'مرحبًا بك في BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'شاهد القنوات المباشرة والأفلام والمسلسلات من مزوّد IPTV الخاص بك. لنضف مصدرك الأول.';

  @override
  String get onbWhereTitle => 'أين تُدخل العناوين؟';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: يعطيك المزوّد عنوان خادم (مثل http://host:8080) واسم مستخدم وكلمة مرور. أدخلها أدناه.';

  @override
  String get onbWhereM3u =>
      'M3U: أعطِ المصدر اسمًا والصق رابط القائمة الذي حصلت عليه من المزوّد.';

  @override
  String get fieldKind => 'النوع';

  @override
  String get fieldName => 'الاسم';

  @override
  String get fieldServer => 'عنوان الخادم';

  @override
  String get fieldUsername => 'اسم المستخدم';

  @override
  String get fieldPassword => 'كلمة المرور';

  @override
  String get fieldUrl => 'رابط القائمة';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'اختبار الاتصال';

  @override
  String get onbTestOk => 'تم الاتصال بنجاح';

  @override
  String get onbTestFail => 'فشل الاتصال';

  @override
  String get onbNext => 'التالي';

  @override
  String get onbBack => 'رجوع';

  @override
  String get onbSave => 'حفظ ومزامنة';

  @override
  String get settingsAccounts => 'المصادر';

  @override
  String get settingsLanguageSub => 'لغات الترجمة المفضلة';

  @override
  String get settingsLanguageAudio => 'لغات الصوت المفضلة';

  @override
  String get settingsSubscale => 'حجم الترجمة';

  @override
  String get settingsSubdelay => 'تأخير الترجمة (بالثواني)';

  @override
  String get settingsGuide => 'عرض دليل البدء السريع';

  @override
  String get settingsDelete => 'حذف';

  @override
  String get accountAdd => 'إضافة مصدر…';

  @override
  String get settingsChangePassword => 'تغيير كلمة المرور…';

  @override
  String get settingsNewPassword => 'كلمة المرور الجديدة';

  @override
  String updateAvailable(String p1) {
    return 'الإصدار $p1 متاح';
  }

  @override
  String get updateNow => 'حدّث الآن';

  @override
  String get updateNotes => 'ما الجديد';

  @override
  String get updateLater => 'لاحقًا';

  @override
  String get updateDownloading => 'جارٍ تنزيل التحديث…';

  @override
  String updateReady(String p1) {
    return 'الإصدار $p1 جاهز للتثبيت';
  }

  @override
  String get updateRestart => 'أعد التشغيل للتحديث';

  @override
  String get updateFailed => 'فشل التحديث';

  @override
  String get updateManual => 'نزّل يدويًا';

  @override
  String get updateCheckNow => 'التحقق من التحديثات';

  @override
  String get updateAuto => 'التحقق من التحديثات تلقائيًا';

  @override
  String get updateAutoInstall => 'تنزيل التحديثات تلقائيًا';

  @override
  String get updateUpToDate => 'لديك أحدث إصدار';

  @override
  String get updateDevBuild => 'التحديثات متاحة فقط في التطبيق المثبّت';

  @override
  String updateCurrent(String p1) {
    return 'الإصدار الحالي: $p1';
  }

  @override
  String get playerBack => 'رجوع';

  @override
  String get playerErrorHint =>
      'إذا استمرت المشكلة، تحقق من كلمة مرور المصدر في الإعدادات.';

  @override
  String get passwordTitle => 'كلمة المرور مطلوبة';

  @override
  String passwordBody(String p1) {
    return 'أدخل كلمة المرور لـ “$p1”. يتم حفظها بشكل خاص على هذا الجهاز.';
  }

  @override
  String get passwordNone => 'المتابعة بدون كلمة مرور';

  @override
  String get playerSpeed => 'سرعة التشغيل';

  @override
  String get playerSpeedNormal => 'عادية';

  @override
  String get playerSpeedReset => 'السرعة العادية';

  @override
  String get settingsSeekPreview => 'معاينة مصغّرة على شريط التقدّم';

  @override
  String get settingsSeekPreviewNote =>
      'يفتح اتصالًا ثانيًا بمزوّد الخدمة. أوقفه إذا توقف التشغيل أو إذا كان مزوّد الخدمة يسمح باتصال واحد فقط.';

  @override
  String get playerSeekBar => 'موضع التشغيل';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 من $p2';
  }

  @override
  String get playerLive => 'مباشر';

  @override
  String get playerChannelPrev => 'القناة السابقة';

  @override
  String get playerChannelNext => 'القناة التالية';

  @override
  String get playerScaleFit => 'ملاءمة';

  @override
  String get playerScaleFill => 'ملء';

  @override
  String get playerScaleStretch => 'تمديد';

  @override
  String get playerSubtitleAdjust => 'ضبط الترجمة…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'السطوع';

  @override
  String get playerVolume => 'مستوى الصوت';

  @override
  String get playerReplay => 'إعادة التشغيل';

  @override
  String get settingsClock => 'إظهار الوقت في المشغّل';

  @override
  String get settingsSeekStep => 'مدة التخطي (مفاتيح الأسهم وأزرار التخطي)';

  @override
  String get settingsBarsHide => 'إخفاء عناصر التحكم بعد';

  @override
  String get settingsNever => 'أبدًا';

  @override
  String get settingsVideoScale => 'ملاءمة الفيديو للشاشة';

  @override
  String get settingsScaleFit => 'ملاءمة (مع أشرطة سوداء)';

  @override
  String get settingsScaleFill => 'ملء الإطار (قص الأطراف)';

  @override
  String get settingsScaleStretch => 'تمديد';

  @override
  String get settingsVideoScaleHint =>
      'اضغط A في المشغّل للتبديل بين الأوضاع الثلاثة.';

  @override
  String get settingsBuffer => 'المخزن المؤقت للشبكة';

  @override
  String get settingsBufferSmall => 'صغير';

  @override
  String get settingsBufferNormal => 'عادي';

  @override
  String get settingsBufferLarge => 'كبير';

  @override
  String get settingsBufferHint =>
      'المخزن المؤقت الأكبر يفيد عند بطء الاتصال أو عدم استقراره.';

  @override
  String unitSeconds(int p1) {
    return '$p1 ث';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 دقيقة';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 د';
  }

  @override
  String playerSkipBack(String p1) {
    return 'رجوع $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'تقدّم $p1';
  }

  @override
  String get playerSleep => 'مؤقت النوم';

  @override
  String get downloadsTitle => 'التنزيلات';

  @override
  String get downloadsAdd => 'تنزيل';

  @override
  String get downloadsSeason => 'تنزيل الموسم';

  @override
  String get downloadsChooseFolder => 'اختر مكان حفظ الأفلام والحلقات المنزّلة';

  @override
  String get downloadsChoose => 'اختيار';

  @override
  String get downloadsNotChosen => 'سيتم السؤال عند أول تنزيل';

  @override
  String get downloadsChange => 'تغيير المجلد…';

  @override
  String get downloadsPause => 'إيقاف مؤقت';

  @override
  String get downloadsResume => 'متابعة';

  @override
  String get downloadsCancel => 'إلغاء';

  @override
  String get downloadsPlay => 'تشغيل';

  @override
  String get downloadsReveal => 'إظهار في Finder';

  @override
  String get downloadsDelete => 'حذف الملف';

  @override
  String get downloadsEmpty => 'لا توجد تنزيلات بعد';

  @override
  String get downloadsQueued => 'في الانتظار';

  @override
  String get downloadsDone => 'اكتمل';

  @override
  String get downloadsHint =>
      'تعمل التنزيلات واحدًا تلو الآخر. تسمح كثير من الجهات باتصال واحد فقط، لذا قد يفشل التشغيل أثناء التنزيل. التنزيلات غير المكتملة لا تُحفظ عند إغلاق التطبيق.';

  @override
  String get epgNow => 'الآن';

  @override
  String get epgNext => 'التالي';

  @override
  String get settingsFullscreen =>
      'فتح التشغيل بملء الشاشة (تختفي عناصر التحكم حتى تحرّك الفأرة)';

  @override
  String get nextTitle => 'الحلقة التالية';

  @override
  String nextIn(int p1) {
    return 'يبدأ بعد $p1 ث';
  }

  @override
  String get nextNow => 'تشغيل الآن';

  @override
  String get nextCancel => 'إلغاء';

  @override
  String get settingsAutoNext => 'تشغيل الحلقة التالية تلقائيًا';

  @override
  String get downloadsNoSpace => 'لا توجد مساحة كافية على القرص';

  @override
  String get dbErrorTitle => 'تعذّر على BattleStation TV فتح قاعدة البيانات';

  @override
  String get dbErrorBody =>
      'إذا كانت نسخة أخرى من BattleStation TV قيد التشغيل، أغلقها وحاول مرة أخرى.';

  @override
  String get dbRecoveredTitle => 'قاعدة البيانات تالفة';

  @override
  String dbRecoveredBody(String p1) {
    return 'بدأ BattleStation TV بقاعدة بيانات جديدة (أضف المصدر مرة أخرى). تم الاحتفاظ بالملف التالف هنا:\n$p1';
  }

  @override
  String get menuShowWindow => 'إظهار النافذة';

  @override
  String get settingsTabGeneral => 'عام';

  @override
  String get settingsTabPlayer => 'المشغّل';

  @override
  String get settingsTabPlaylists => 'القوائم';

  @override
  String get settingsAppearance => 'المظهر';

  @override
  String get settingsSystem => 'حسب النظام';

  @override
  String get appearanceLight => 'فاتح';

  @override
  String get appearanceDark => 'داكن';

  @override
  String get settingsInterfaceLanguage => 'لغة الواجهة';

  @override
  String get settingsLanguageRestart =>
      'يسري التغيير بعد إعادة تشغيل BattleStation TV.';

  @override
  String get settingsHideCategories => 'إخفاء الفئات';

  @override
  String get settingsHideCategoriesWords => 'كلمات للإخفاء';

  @override
  String get settingsHideCategoriesNote =>
      'إخفاء الفئات التي يحتوي اسمها على هذه الكلمات (افصل بينها بفواصل). تختفي قنواتها وأفلامها ومسلسلاتها أيضًا من البحث والمفضلة ومتابعة المشاهدة. هذا مرشّح بسيط وليس قفلًا للرقابة الأبوية: يمكن لأي شخص تغييره من هنا.';

  @override
  String get settingsRefresh => 'تحديث القوائم';

  @override
  String get settingsRefresh0 => 'عند فتح التطبيق فقط';

  @override
  String get settingsRefresh6 => 'كل 6 ساعات';

  @override
  String get settingsRefresh12 => 'كل 12 ساعة';

  @override
  String get settingsRefresh24 => 'كل 24 ساعة';

  @override
  String get settingsBackup => 'النسخ الاحتياطي والاستعادة';

  @override
  String get backupExport => 'تصدير نسخة احتياطية…';

  @override
  String get backupImport => 'استيراد نسخة احتياطية…';

  @override
  String get backupWarn =>
      'يحتوي ملف النسخة الاحتياطية على قوائمك مع عناوينها، وقد تتضمن بيانات تسجيل الدخول، لذا احتفظ به في مكان خاص. لا تُحفظ فيه كلمات مرور مصادر Xtream. الاستيراد يضيف إلى مصادرك الحالية ولا يحذف شيئًا.';

  @override
  String get backupExported => 'تم حفظ النسخة الاحتياطية.';

  @override
  String get backupImported => 'تم استيراد النسخة الاحتياطية.';

  @override
  String get backupErrorInvalid =>
      'هذا ليس ملف نسخة احتياطية من BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'هذه النسخة الاحتياطية من إصدار مختلف من BattleStation TV ولا يمكن قراءتها.';

  @override
  String get backupErrorTooLarge => 'هذا الملف أكبر من أن يكون نسخة احتياطية.';

  @override
  String get backupFailed => 'فشلت النسخة الاحتياطية';

  @override
  String get settingsClearData => 'مسح البيانات';

  @override
  String get clearHistory => 'مسح سجل المشاهدة';

  @override
  String get clearFavorites => 'مسح المفضلة';

  @override
  String get clearImages => 'مسح ذاكرة الصور المؤقتة';

  @override
  String get clearConfirm => 'مسح';

  @override
  String get clearHistoryWarn =>
      'سيتم مسح مواضع المتابعة وقوائم متابعة المشاهدة لكل المصادر. لا يمكن التراجع عن ذلك.';

  @override
  String get clearFavoritesWarn =>
      'ستتم إزالة المفضلة في كل المصادر. لا يمكن التراجع عن ذلك.';

  @override
  String get clearImagesWarn =>
      'تتم إزالة الشعارات والملصقات المحفوظة، وتُنزَّل مرة أخرى عند الحاجة.';

  @override
  String get infoDetails => 'التفاصيل';

  @override
  String get infoPlot => 'القصة';

  @override
  String get infoCast => 'الممثلون';

  @override
  String get infoDirector => 'المخرج';

  @override
  String get infoGenre => 'النوع';

  @override
  String get infoYear => 'سنة الإصدار';

  @override
  String get infoRating => 'التقييم';

  @override
  String get infoDuration => 'المدة';

  @override
  String get infoCountry => 'البلد';

  @override
  String get infoTrailer => 'الإعلان الترويجي';

  @override
  String get infoPlay => 'تشغيل';

  @override
  String get infoEmpty => 'لا يوفّر مزوّدك أي تفاصيل لهذا العنوان.';

  @override
  String get infoLoading => 'جارٍ تحميل التفاصيل…';

  @override
  String get infoError => 'تعذّر تحميل التفاصيل.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 س';
  }

  @override
  String subExpires(String p1) {
    return 'ينتهي في $p1';
  }

  @override
  String subExpired(String p1) {
    return 'انتهى في $p1';
  }

  @override
  String subDaysLeft(int p1) {
    return 'الأيام المتبقية: $p1';
  }

  @override
  String get onbWelcomeRights => 'استخدم فقط المصادر المصرّح لك بالوصول إليها.';

  @override
  String get playerSkipIntro => 'تخطي المقدمة';

  @override
  String get playerSkipCredits => 'تخطي شارة النهاية';

  @override
  String get playerSkipMenu => 'المقدمة وشارة النهاية';

  @override
  String get playerMarkIntroStart => 'المقدمة تبدأ هنا';

  @override
  String get playerMarkIntroEnd => 'المقدمة تنتهي هنا';

  @override
  String get playerMarkCredits => 'شارة النهاية تبدأ هنا';

  @override
  String get playerSkipForget => 'نسيان المقدمة وشارة النهاية';

  @override
  String get playerSkipSaved => 'تم الحفظ لجميع حلقات هذا المسلسل';

  @override
  String get playerSkipRefused => 'غير ممكن في هذه اللحظة';

  @override
  String get continueRemove => 'إزالة من متابعة المشاهدة';

  @override
  String get settingsFavoritesAZ => 'ترتيب المفضلة حسب الاسم (أ–ي)';

  @override
  String get settingsKeychain => 'حفظ كلمات المرور في سلسلة المفاتيح';

  @override
  String get settingsKeychainNote =>
      'إيقاف: تبقى كلمات المرور في قاعدة بيانات التطبيق الخاصة. تشغيل: يحفظها macOS في سلسلة مفاتيح تسجيل الدخول.';

  @override
  String get settingsKeychainFailed =>
      'لم تقبل سلسلة المفاتيح كلمات المرور. لم يتغير شيء.';
}
