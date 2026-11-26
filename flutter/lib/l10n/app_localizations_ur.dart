// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'لائیو';

  @override
  String get tabMovies => 'فلمیں';

  @override
  String get tabSeries => 'سیریز';

  @override
  String get catAll => 'سب';

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
  String get catFavorites => 'پسندیدہ';

  @override
  String get catContinue => 'دیکھنا جاری رکھیں';

  @override
  String get catFilter => 'زمرے فلٹر کریں';

  @override
  String get playlistAll => 'تمام پلے لسٹس';

  @override
  String get playlistLabel => 'پلے لسٹ';

  @override
  String get aboutAcknowledgements => 'اظہارِ تشکر';

  @override
  String get aboutPrivacy => 'رازداری';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV آپ کے بارے میں کوئی ڈیٹا جمع نہیں کرتا۔ اس میں کوئی اکاؤنٹ، اینالٹکس، اشتہارات یا ٹریکنگ نہیں ہے۔\n\nآپ کے ذرائع، پسندیدہ اور دیکھنے کی ہسٹری اسی ڈیوائس پر رہتی ہے۔ ایپ صرف ان پتوں سے جڑتی ہے جو آپ خود شامل کرتے ہیں: آپ کے فراہم کنندہ کا سرور، پلے لسٹ، پروگرام گائیڈ، لوگوز اور اسٹریمز۔\n\nفراہم کنندہ کے پاس ورڈ صرف اسی ڈیوائس پر iOS Keychain میں محفوظ رہتے ہیں۔ وہ بیک اپ فائل میں کبھی شامل نہیں ہوتے۔\n\nBattleStation TV میں کوئی چینل، فلم یا پلے لسٹ شامل نہیں ہے۔ ذریعہ آپ خود لاتے ہیں۔';

  @override
  String get aboutSource => 'سورس کوڈ اور لائسنس';

  @override
  String get aboutCoffee => 'مجھے ایک کافی پلائیں';

  @override
  String get tipsTitle => 'BattleStation TV کی مدد کریں';

  @override
  String get tipsFooter =>
      'Apple کے ذریعے اختیاری ٹپ۔ اس سے کچھ بھی ان لاک نہیں ہوتا: تمام فیچرز سب کے لیے مفت رہتے ہیں۔';

  @override
  String get tipsThanks => 'آپ کی مدد کا شکریہ!';

  @override
  String get tipsPending => 'منظوری کا انتظار ہے۔';

  @override
  String get tipsFailed => 'ٹپ مکمل نہیں ہوئی۔ بعد میں دوبارہ کوشش کریں۔';

  @override
  String get aboutVersion => 'ورژن';

  @override
  String get catTitle => 'زمرے';

  @override
  String get commonCancel => 'منسوخ کریں';

  @override
  String get emptyContinue => 'جاری رکھنے کے لیے کچھ نہیں';

  @override
  String get emptyContinueHint =>
      'جو فلمیں اور اقساط آپ آدھے میں چھوڑ دیں وہ یہاں نظر آتی ہیں۔';

  @override
  String get emptyFavorites => 'ابھی کوئی پسندیدہ نہیں';

  @override
  String get emptyFavoritesHint =>
      'کسی عنوان کو دبائے رکھیں، پھر “پسندیدہ میں شامل کریں” منتخب کریں۔';

  @override
  String get emptyFavoritesLive =>
      'کسی چینل کو دائیں طرف سوائپ کریں، پھر ستارے پر ٹیپ کریں۔';

  @override
  String get emptyNone => 'یہاں ابھی کچھ نہیں';

  @override
  String get emptyNoneHint =>
      'ریفریش کرنے کے لیے نیچے کھینچیں، یا ترتیبات میں اپنا ذریعہ چیک کریں۔';

  @override
  String get fieldServerInvalid =>
      'یہ پتہ درست نہیں لگتا۔ مثال: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'پورا لنک درج کریں، جو http:// یا https:// سے شروع ہو۔';

  @override
  String get infoResume => 'جاری رکھیں';

  @override
  String get libraryEmpty => 'آپ کی لائبریری خالی ہے';

  @override
  String get libraryEmptyHint =>
      'پسندیدہ اور جو عنوان آپ نے دیکھنا شروع کیے وہ یہاں نظر آتے ہیں۔';

  @override
  String get onbNoChannels =>
      'BattleStation TV میں کوئی چینل، فلم یا پلے لسٹ شامل نہیں ہے۔ اپنے سبسکرائب کردہ فراہم کنندہ سے ذریعہ شامل کریں۔';

  @override
  String get onbPasteHint => 'کیا آپ نے پلے لسٹ لنک کاپی کیا ہے؟';

  @override
  String get onbTestRunning => 'آزمایا جا رہا ہے…';

  @override
  String passwordBodyIos(String p1) {
    return '“$p1” کا پاس ورڈ درج کریں۔ یہ اس ڈیوائس پر iOS Keychain میں محفوظ کیا جاتا ہے۔';
  }

  @override
  String get searchRecent => 'حالیہ تلاشیں';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'جاری رکھیں: سیزن $p1 قسط $p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'سیزن $p1 قسط $p2';
  }

  @override
  String get seriesNoEpisodes => 'کوئی قسط نہیں ملی';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'چلائیں: سیزن $p1 قسط $p2';
  }

  @override
  String get seriesWatched => 'دیکھ لیا';

  @override
  String get settingsAbout => 'کے بارے میں';

  @override
  String get settingsEditSource => 'ذریعہ میں ترمیم کریں';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV آپ کی ڈیوائس کی زبان استعمال کرتا ہے۔ صرف اس ایپ کے لیے کوئی دوسری زبان استعمال کرنے کے لیے، اسے iOS ترتیبات میں منتخب کریں۔';

  @override
  String get settingsOpenIOS => 'iOS ترتیبات کھولیں';

  @override
  String get settingsPasswordNote =>
      'موجودہ پاس ورڈ برقرار رکھنے کے لیے نیا پاس ورڈ خالی چھوڑ دیں۔ پاس ورڈ iOS Keychain میں محفوظ کیے جاتے ہیں۔';

  @override
  String get settingsTitle => 'ترتیبات';

  @override
  String get sourceDeleteWarn =>
      'ذریعہ، اس کے پسندیدہ اور دیکھنے کی ہسٹری اس ڈیوائس سے ہٹا دی جاتی ہے۔ آپ کے فراہم کنندہ کے اکاؤنٹ پر کوئی اثر نہیں پڑتا۔';

  @override
  String get syncNow => 'ریفریش کریں';

  @override
  String get tabLibrary => 'لائبریری';

  @override
  String get scopeCategory => 'زمرے میں';

  @override
  String get scopeType => 'حصے میں';

  @override
  String get scopeEverywhere => 'ہر جگہ';

  @override
  String get searchPrompt => 'تلاش';

  @override
  String get syncRunning => 'سنک ہو رہا ہے…';

  @override
  String get syncFailed => 'سنک ناکام ہو گیا';

  @override
  String get syncNotUpdated => 'محفوظ شدہ ڈیٹا دکھایا جا رہا ہے';

  @override
  String get emptyResults => 'کچھ نہیں ملا';

  @override
  String get favAdd => 'پسندیدہ میں شامل کریں';

  @override
  String get favRemove => 'پسندیدہ سے ہٹائیں';

  @override
  String get playerClose => 'بند کریں';

  @override
  String get playerSubtitles => 'سب ٹائٹلز';

  @override
  String get playerAudio => 'آڈیو';

  @override
  String get playerOff => 'بند';

  @override
  String get playerAddSubtitle => 'سب ٹائٹل فائل شامل کریں…';

  @override
  String get playerCatchup => 'ماضی سے دیکھیں';

  @override
  String get playerFullscreen => 'پوری اسکرین';

  @override
  String get playerError => 'پلے بیک ناکام ہو گیا';

  @override
  String get playerRetry => 'دوبارہ کوشش کریں';

  @override
  String get playerPip => 'تصویر میں تصویر';

  @override
  String get playerPipReturn => 'ایپ پر واپس';

  @override
  String get catchupTitle => 'دوبارہ دیکھیں';

  @override
  String get catchupNoEpg => 'پروگرام گائیڈ دستیاب نہیں۔ وقت خود منتخب کریں۔';

  @override
  String get catchupPick => 'آغاز کا وقت';

  @override
  String get catchupDuration => 'منٹ';

  @override
  String get seriesSeason => 'سیزن';

  @override
  String get onbWelcomeTitle => 'BattleStation TV میں خوش آمدید';

  @override
  String get onbWelcomeBody =>
      'اپنے IPTV فراہم کنندہ کے لائیو چینلز، فلمیں اور سیریز دیکھیں۔ آئیے آپ کا پہلا ذریعہ شامل کریں۔';

  @override
  String get onbWhereTitle => 'پتے کہاں درج کرنے ہیں؟';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: آپ کا فراہم کنندہ آپ کو ایک سرور ایڈریس (جیسے http://host:8080)، ایک صارف نام اور ایک پاس ورڈ دیتا ہے۔ انہیں نیچے درج کریں۔';

  @override
  String get onbWhereM3u =>
      'M3U: ذریعے کو ایک نام دیں اور وہ پلے لسٹ لنک پیسٹ کریں جو آپ کے فراہم کنندہ نے دیا ہے۔';

  @override
  String get fieldKind => 'قسم';

  @override
  String get fieldName => 'نام';

  @override
  String get fieldServer => 'سرور ایڈریس';

  @override
  String get fieldUsername => 'صارف نام';

  @override
  String get fieldPassword => 'پاس ورڈ';

  @override
  String get fieldUrl => 'پلے لسٹ لنک';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'کنکشن آزمائیں';

  @override
  String get onbTestOk => 'کامیابی سے منسلک ہو گیا';

  @override
  String get onbTestFail => 'کنکشن ناکام ہو گیا';

  @override
  String get onbNext => 'آگے';

  @override
  String get onbBack => 'پیچھے';

  @override
  String get onbSave => 'محفوظ کریں اور سنک کریں';

  @override
  String get settingsAccounts => 'ذرائع';

  @override
  String get settingsLanguageSub => 'پسندیدہ سب ٹائٹل زبانیں';

  @override
  String get settingsLanguageAudio => 'پسندیدہ آڈیو زبانیں';

  @override
  String get settingsSubscale => 'سب ٹائٹل کا سائز';

  @override
  String get settingsSubdelay => 'سب ٹائٹل میں تاخیر (سیکنڈ)';

  @override
  String get settingsGuide => 'فوری آغاز کی گائیڈ دکھائیں';

  @override
  String get settingsDelete => 'حذف کریں';

  @override
  String get accountAdd => 'ذریعہ شامل کریں…';

  @override
  String get settingsChangePassword => 'پاس ورڈ تبدیل کریں…';

  @override
  String get settingsNewPassword => 'نیا پاس ورڈ';

  @override
  String updateAvailable(String p1) {
    return 'ورژن $p1 دستیاب ہے';
  }

  @override
  String get updateNow => 'ابھی اپ ڈیٹ کریں';

  @override
  String get updateNotes => 'نیا کیا ہے';

  @override
  String get updateLater => 'بعد میں';

  @override
  String get updateDownloading => 'اپ ڈیٹ ڈاؤن لوڈ ہو رہی ہے…';

  @override
  String updateReady(String p1) {
    return 'ورژن $p1 انسٹال کے لیے تیار ہے';
  }

  @override
  String get updateRestart => 'اپ ڈیٹ کے لیے دوبارہ شروع کریں';

  @override
  String get updateFailed => 'اپ ڈیٹ ناکام ہو گئی';

  @override
  String get updateManual => 'خود ڈاؤن لوڈ کریں';

  @override
  String get updateCheckNow => 'اپ ڈیٹس چیک کریں';

  @override
  String get updateAuto => 'اپ ڈیٹس خودکار طور پر چیک کریں';

  @override
  String get updateAutoInstall => 'اپ ڈیٹس خودکار طور پر ڈاؤن لوڈ کریں';

  @override
  String get updateUpToDate => 'آپ کے پاس تازہ ترین ورژن ہے';

  @override
  String get updateDevBuild => 'اپ ڈیٹس صرف انسٹال شدہ ایپ میں دستیاب ہیں';

  @override
  String updateCurrent(String p1) {
    return 'موجودہ ورژن: $p1';
  }

  @override
  String get playerBack => 'پیچھے';

  @override
  String get playerErrorHint =>
      'اگر یہ مسئلہ بار بار ہو تو ترتیبات میں ذریعے کا پاس ورڈ چیک کریں۔';

  @override
  String get passwordTitle => 'پاس ورڈ درکار ہے';

  @override
  String passwordBody(String p1) {
    return '“$p1” کا پاس ورڈ درج کریں۔ یہ اس Mac پر نجی طور پر محفوظ کیا جاتا ہے۔';
  }

  @override
  String get passwordNone => 'پاس ورڈ کے بغیر جاری رکھیں';

  @override
  String get playerSpeed => 'پلے بیک کی رفتار';

  @override
  String get playerSpeedNormal => 'عام';

  @override
  String get playerSpeedReset => 'عام رفتار';

  @override
  String get settingsSeekPreview => 'پروگریس بار پر تھمب نیل پیش منظر';

  @override
  String get settingsSeekPreviewNote =>
      'آپ کے فراہم کنندہ سے دوسرا کنکشن کھولتا ہے۔ اگر پلے بیک رک جائے یا آپ کا فراہم کنندہ صرف ایک کنکشن کی اجازت دیتا ہو تو اسے بند کر دیں۔';

  @override
  String get playerSeekBar => 'پلے بیک کی پوزیشن';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 / $p2';
  }

  @override
  String get playerLive => 'براہِ راست';

  @override
  String get playerChannelPrev => 'پچھلا چینل';

  @override
  String get playerChannelNext => 'اگلا چینل';

  @override
  String get playerScaleFit => 'فٹ';

  @override
  String get playerScaleFill => 'بھریں';

  @override
  String get playerScaleStretch => 'کھینچیں';

  @override
  String get playerSubtitleAdjust => 'سب ٹائٹلز ایڈجسٹ کریں…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'چمک';

  @override
  String get playerVolume => 'آواز';

  @override
  String get playerReplay => 'دوبارہ چلائیں';

  @override
  String get settingsClock => 'پلیئر میں وقت دکھائیں';

  @override
  String get settingsSeekStep => 'چھلانگ کا وقفہ (ایرو کیز اور اسکپ بٹن)';

  @override
  String get settingsBarsHide => 'کنٹرولز چھپائیں اتنی دیر بعد';

  @override
  String get settingsNever => 'کبھی نہیں';

  @override
  String get settingsVideoScale => 'ویڈیو کا پیمانہ';

  @override
  String get settingsScaleFit => 'فٹ (کالی پٹیوں کے ساتھ)';

  @override
  String get settingsScaleFill => 'بھریں (کنارے کٹ جاتے ہیں)';

  @override
  String get settingsScaleStretch => 'کھینچیں';

  @override
  String get settingsVideoScaleHint =>
      'پلیئر میں A دبائیں تاکہ ان تینوں کے درمیان بدل سکیں۔';

  @override
  String get settingsBuffer => 'نیٹ ورک بفر';

  @override
  String get settingsBufferSmall => 'چھوٹا';

  @override
  String get settingsBufferNormal => 'عام';

  @override
  String get settingsBufferLarge => 'بڑا';

  @override
  String get settingsBufferHint =>
      'سست یا غیر مستحکم کنکشن پر بڑا بفر مدد کرتا ہے۔';

  @override
  String unitSeconds(int p1) {
    return '$p1 سیکنڈ';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 منٹ';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 منٹ';
  }

  @override
  String playerSkipBack(String p1) {
    return '$p1 پیچھے';
  }

  @override
  String playerSkipForward(String p1) {
    return '$p1 آگے';
  }

  @override
  String get playerSleep => 'سلیپ ٹائمر';

  @override
  String get downloadsTitle => 'ڈاؤن لوڈز';

  @override
  String get downloadsAdd => 'ڈاؤن لوڈ';

  @override
  String get downloadsSeason => 'سیزن ڈاؤن لوڈ کریں';

  @override
  String get downloadsChooseFolder =>
      'منتخب کریں کہ ڈاؤن لوڈ کی گئی فلمیں اور اقساط کہاں محفوظ ہوں';

  @override
  String get downloadsChoose => 'منتخب کریں';

  @override
  String get downloadsNotChosen => 'پہلے ڈاؤن لوڈ پر پوچھا جائے گا';

  @override
  String get downloadsChange => 'فولڈر تبدیل کریں…';

  @override
  String get downloadsPause => 'روکیں';

  @override
  String get downloadsResume => 'جاری رکھیں';

  @override
  String get downloadsCancel => 'منسوخ کریں';

  @override
  String get downloadsPlay => 'چلائیں';

  @override
  String get downloadsReveal => 'Finder میں دکھائیں';

  @override
  String get downloadsDelete => 'فائل حذف کریں';

  @override
  String get downloadsEmpty => 'ابھی تک کوئی ڈاؤن لوڈ نہیں';

  @override
  String get downloadsQueued => 'انتظار میں';

  @override
  String get downloadsDone => 'مکمل';

  @override
  String get downloadsHint =>
      'ڈاؤن لوڈز ایک وقت میں ایک چلتے ہیں۔ کئی فراہم کنندگان صرف ایک کنکشن کی اجازت دیتے ہیں، اس لیے ڈاؤن لوڈ کے دوران پلے کرنا ناکام ہو سکتا ہے۔ ایپ بند ہونے پر نامکمل ڈاؤن لوڈز محفوظ نہیں رہتے۔';

  @override
  String get epgNow => 'ابھی';

  @override
  String get epgNext => 'اگلا';

  @override
  String get settingsFullscreen =>
      'پلے بیک پوری اسکرین میں کھولیں (ماؤس ہلانے تک کنٹرولز چھپے رہتے ہیں)';

  @override
  String get nextTitle => 'اگلی قسط';

  @override
  String nextIn(int p1) {
    return '$p1 سیکنڈ میں شروع ہوگی';
  }

  @override
  String get nextNow => 'ابھی چلائیں';

  @override
  String get nextCancel => 'منسوخ کریں';

  @override
  String get settingsAutoNext => 'اگلی قسط خودکار طور پر چلائیں';

  @override
  String get downloadsNoSpace => 'ڈسک پر کافی خالی جگہ نہیں';

  @override
  String get dbErrorTitle => 'BattleStation TV اپنا ڈیٹا بیس نہیں کھول سکتا';

  @override
  String get dbErrorBody =>
      'اگر BattleStation TV کی کوئی اور کاپی چل رہی ہے تو اسے بند کریں اور دوبارہ کوشش کریں۔';

  @override
  String get dbRecoveredTitle => 'ڈیٹا بیس خراب ہو گیا تھا';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV ایک نئے ڈیٹا بیس کے ساتھ شروع ہوا (اپنا ذریعہ دوبارہ شامل کریں)۔ خراب فائل یہاں محفوظ رکھی گئی:\n$p1';
  }

  @override
  String get menuShowWindow => 'ونڈو دکھائیں';

  @override
  String get settingsTabGeneral => 'عمومی';

  @override
  String get settingsTabPlayer => 'پلیئر';

  @override
  String get settingsTabPlaylists => 'پلے لسٹس';

  @override
  String get settingsAppearance => 'ظاہری شکل';

  @override
  String get settingsSystem => 'سسٹم';

  @override
  String get appearanceLight => 'روشن';

  @override
  String get appearanceDark => 'گہرا';

  @override
  String get settingsInterfaceLanguage => 'انٹرفیس کی زبان';

  @override
  String get settingsLanguageRestart =>
      'BattleStation TV کو دوبارہ شروع کرنے کے بعد نافذ ہوگا۔';

  @override
  String get settingsHideCategories => 'زمرے چھپائیں';

  @override
  String get settingsHideCategoriesWords => 'چھپانے کے الفاظ';

  @override
  String get settingsHideCategoriesNote =>
      'جن زمروں کے نام میں یہ الفاظ ہوں انہیں چھپائیں (کاما سے الگ کریں)۔ ان کے چینلز، فلمیں اور سیریز بھی تلاش، پسندیدہ اور دیکھنا جاری رکھیں سے غائب ہو جاتی ہیں۔ یہ صرف ایک سادہ فلٹر ہے، پیرنٹل لاک نہیں: کوئی بھی اسے یہاں تبدیل کر سکتا ہے۔';

  @override
  String get settingsRefresh => 'پلے لسٹس اپ ڈیٹ کریں';

  @override
  String get settingsRefresh0 => 'صرف ایپ کھلنے پر';

  @override
  String get settingsRefresh6 => 'ہر 6 گھنٹے بعد';

  @override
  String get settingsRefresh12 => 'ہر 12 گھنٹے بعد';

  @override
  String get settingsRefresh24 => 'ہر 24 گھنٹے بعد';

  @override
  String get settingsBackup => 'بیک اپ اور بحالی';

  @override
  String get backupExport => 'بیک اپ برآمد کریں…';

  @override
  String get backupImport => 'بیک اپ درآمد کریں…';

  @override
  String get backupWarn =>
      'بیک اپ فائل میں آپ کی پلے لسٹس ان کے پتوں کے ساتھ درج ہوتی ہیں، جن میں لاگ اِن کی معلومات شامل ہو سکتی ہیں، اس لیے اسے نجی رکھیں۔ Xtream ذرائع کے پاس ورڈ اس میں محفوظ نہیں ہوتے۔ درآمد کرنے سے آپ کے موجودہ ذرائع میں اضافہ ہوتا ہے اور کچھ حذف نہیں ہوتا۔';

  @override
  String get backupExported => 'بیک اپ محفوظ ہو گیا۔';

  @override
  String get backupImported => 'بیک اپ درآمد ہو گیا۔';

  @override
  String get backupErrorInvalid =>
      'یہ BattleStation TV کی بیک اپ فائل نہیں ہے۔';

  @override
  String get backupErrorVersion =>
      'یہ بیک اپ BattleStation TV کے کسی دوسرے ورژن سے ہے اور پڑھا نہیں جا سکتا۔';

  @override
  String get backupErrorTooLarge => 'یہ فائل بیک اپ ہونے کے لیے بہت بڑی ہے۔';

  @override
  String get backupFailed => 'بیک اپ ناکام ہو گیا';

  @override
  String get settingsClearData => 'ڈیٹا صاف کریں';

  @override
  String get clearHistory => 'دیکھنے کی ہسٹری صاف کریں';

  @override
  String get clearFavorites => 'پسندیدہ صاف کریں';

  @override
  String get clearImages => 'تصاویر کی کیش صاف کریں';

  @override
  String get clearConfirm => 'صاف کریں';

  @override
  String get clearHistoryWarn =>
      'تمام ذرائع کے جاری مقامات اور دیکھنا جاری رکھیں کی فہرستیں مٹا دی جائیں گی۔ اسے واپس نہیں کیا جا سکتا۔';

  @override
  String get clearFavoritesWarn =>
      'تمام ذرائع میں آپ کے پسندیدہ ہٹا دیے جائیں گے۔ اسے واپس نہیں کیا جا سکتا۔';

  @override
  String get clearImagesWarn =>
      'محفوظ شدہ لوگو اور پوسٹرز ہٹا دیے جاتے ہیں اور ضرورت پڑنے پر دوبارہ ڈاؤن لوڈ ہوتے ہیں۔';

  @override
  String get infoDetails => 'تفصیلات';

  @override
  String get infoPlot => 'کہانی';

  @override
  String get infoCast => 'اداکار';

  @override
  String get infoDirector => 'ہدایت کار';

  @override
  String get infoGenre => 'صنف';

  @override
  String get infoYear => 'ریلیز کا سال';

  @override
  String get infoRating => 'ریٹنگ';

  @override
  String get infoDuration => 'دورانیہ';

  @override
  String get infoCountry => 'ملک';

  @override
  String get infoTrailer => 'ٹریلر';

  @override
  String get infoPlay => 'چلائیں';

  @override
  String get infoEmpty =>
      'آپ کے فراہم کنندہ کے پاس اس عنوان کی کوئی تفصیل نہیں ہے۔';

  @override
  String get infoLoading => 'تفصیلات لوڈ ہو رہی ہیں…';

  @override
  String get infoError => 'تفصیلات لوڈ نہیں ہو سکیں۔';

  @override
  String unitHoursShort(int p1) {
    return '$p1 گھنٹے';
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
  String get playerSkipIntro => 'تعارف چھوڑیں';

  @override
  String get playerSkipCredits => 'کریڈٹس چھوڑیں';

  @override
  String get playerSkipMenu => 'تعارف اور کریڈٹس';

  @override
  String get playerMarkIntroStart => 'تعارف یہاں سے شروع';

  @override
  String get playerMarkIntroEnd => 'تعارف یہاں ختم';

  @override
  String get playerMarkCredits => 'کریڈٹس یہاں سے شروع';

  @override
  String get playerSkipForget => 'تعارف اور کریڈٹس بھول جائیں';

  @override
  String get playerSkipSaved => 'اس سیریز کی تمام اقساط کے لیے محفوظ ہو گیا';

  @override
  String get playerSkipRefused => 'اس مقام پر ممکن نہیں';

  @override
  String get continueRemove => 'دیکھنا جاری رکھیں سے ہٹائیں';

  @override
  String get settingsFavoritesAZ => 'پسندیدہ کو نام کے مطابق ترتیب دیں (الف–ے)';

  @override
  String get settingsKeychain => 'پاس ورڈ Keychain میں محفوظ کریں';

  @override
  String get settingsKeychainNote =>
      'بند: پاس ورڈ ایپ کے نجی ڈیٹا بیس میں رہتے ہیں۔ آن: macOS انہیں آپ کی لاگ اِن Keychain میں رکھتا ہے۔';

  @override
  String get settingsKeychainFailed =>
      'Keychain نے پاس ورڈ قبول نہیں کیے۔ کچھ تبدیل نہیں ہوا۔';
}
