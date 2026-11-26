// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'שידור חי';

  @override
  String get tabMovies => 'סרטים';

  @override
  String get tabSeries => 'סדרות';

  @override
  String get catAll => 'הכול';

  @override
  String get catAllLive => 'כל הערוצים';

  @override
  String get catAllMovies => 'כל הסרטים';

  @override
  String get catAllSeries => 'כל הסדרות';

  @override
  String downloadsEta(String p1) {
    return 'נשארו $p1';
  }

  @override
  String get catFavorites => 'מועדפים';

  @override
  String get catContinue => 'המשך צפייה';

  @override
  String get catFilter => 'סינון קטגוריות';

  @override
  String get playlistAll => 'כל הרשימות';

  @override
  String get playlistLabel => 'רשימה';

  @override
  String get aboutAcknowledgements => 'תודות';

  @override
  String get aboutPrivacy => 'פרטיות';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV לא אוספת שום מידע עליך. אין בה חשבון, ניתוח שימוש, פרסומות או מעקב.\n\nהמקורות, המועדפים והיסטוריית הצפייה שלך נשארים במכשיר הזה. האפליקציה מתחברת רק לכתובות שאתה מוסיף בעצמך: השרת של הספק, הרשימה, מדריך התוכניות, הלוגואים והשידורים.\n\nסיסמאות של ספקים נשמרות ב-iOS Keychain במכשיר הזה בלבד, ולעולם לא נכללות בקובץ גיבוי.\n\nBattleStation TV לא כוללת ערוצים, סרטים או רשימות. את המקור אתה מביא בעצמך.';

  @override
  String get aboutSource => 'קוד מקור ורישיון';

  @override
  String get aboutCoffee => 'קנו לי קפה';

  @override
  String get tipsTitle => 'תמיכה ב-BattleStation TV';

  @override
  String get tipsFooter =>
      'טיפ מרצון דרך Apple. הוא לא פותח שום דבר: כל היכולות נשארות חינמיות לכולם.';

  @override
  String get tipsThanks => 'תודה על התמיכה!';

  @override
  String get tipsPending => 'ממתין לאישור.';

  @override
  String get tipsFailed => 'הטיפ לא עבר. נסו שוב מאוחר יותר.';

  @override
  String get aboutVersion => 'גרסה';

  @override
  String get catTitle => 'קטגוריות';

  @override
  String get commonCancel => 'בטל';

  @override
  String get emptyContinue => 'אין מה להמשיך';

  @override
  String get emptyContinueHint => 'סרטים ופרקים שעצרת באמצע יופיעו כאן.';

  @override
  String get emptyFavorites => 'אין מועדפים עדיין';

  @override
  String get emptyFavoritesHint =>
      'לחץ לחיצה ארוכה על כותר ובחר “הוסף למועדפים”.';

  @override
  String get emptyFavoritesLive => 'החלק ערוץ הצידה ואז הקש על הכוכב.';

  @override
  String get emptyNone => 'אין כאן כלום עדיין';

  @override
  String get emptyNoneHint => 'משוך למטה כדי לרענן, או בדוק את המקור בהגדרות.';

  @override
  String get fieldServerInvalid =>
      'הכתובת לא נראית תקינה. לדוגמה: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'הקלד את הקישור המלא, שמתחיל ב-http:// או ב-https://';

  @override
  String get infoResume => 'המשך';

  @override
  String get libraryEmpty => 'הספרייה שלך ריקה';

  @override
  String get libraryEmptyHint => 'מועדפים וכותרים שהתחלת לצפות בהם יופיעו כאן.';

  @override
  String get onbNoChannels =>
      'BattleStation TV לא כוללת ערוצים, סרטים או רשימות. הוסף מקור מספק שאתה מנוי עליו.';

  @override
  String get onbPasteHint => 'העתקת קישור לרשימה?';

  @override
  String get onbTestRunning => 'בודק…';

  @override
  String passwordBodyIos(String p1) {
    return 'הקלד את הסיסמה של “$p1”. היא נשמרת ב-iOS Keychain במכשיר הזה.';
  }

  @override
  String get searchRecent => 'חיפושים אחרונים';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'המשך ע׳$p1 פ׳$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'ע׳$p1 פ׳$p2';
  }

  @override
  String get seriesNoEpisodes => 'לא נמצאו פרקים';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'נגן ע׳$p1 פ׳$p2';
  }

  @override
  String get seriesWatched => 'נצפה';

  @override
  String get settingsAbout => 'אודות';

  @override
  String get settingsEditSource => 'ערוך מקור';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV משתמשת בשפת המכשיר שלך. כדי להשתמש בשפה אחרת באפליקציה הזו בלבד, בחר אותה בהגדרות iOS.';

  @override
  String get settingsOpenIOS => 'פתח את הגדרות iOS';

  @override
  String get settingsPasswordNote =>
      'השאר את הסיסמה החדשה ריקה כדי לשמור את הנוכחית. סיסמאות נשמרות ב-iOS Keychain.';

  @override
  String get settingsTitle => 'הגדרות';

  @override
  String get sourceDeleteWarn =>
      'המקור, המועדפים שלו והיסטוריית הצפייה שלו יוסרו מהמכשיר הזה. החשבון שלך אצל הספק לא ישתנה.';

  @override
  String get syncNow => 'רענן';

  @override
  String get tabLibrary => 'ספרייה';

  @override
  String get scopeCategory => 'בקטגוריה';

  @override
  String get scopeType => 'בחלק הנוכחי';

  @override
  String get scopeEverywhere => 'בכל מקום';

  @override
  String get searchPrompt => 'חיפוש';

  @override
  String get syncRunning => 'מסנכרן…';

  @override
  String get syncFailed => 'הסנכרון נכשל';

  @override
  String get syncNotUpdated => 'מוצגים נתונים שמורים';

  @override
  String get emptyResults => 'לא נמצא כלום';

  @override
  String get favAdd => 'הוסף למועדפים';

  @override
  String get favRemove => 'הסר מהמועדפים';

  @override
  String get playerClose => 'סגור';

  @override
  String get playerSubtitles => 'כתוביות';

  @override
  String get playerAudio => 'שמע';

  @override
  String get playerOff => 'כבוי';

  @override
  String get playerAddSubtitle => 'הוסף קובץ כתוביות…';

  @override
  String get playerCatchup => 'צפייה בהיסטוריה';

  @override
  String get playerFullscreen => 'מסך מלא';

  @override
  String get playerError => 'ההשמעה נכשלה';

  @override
  String get playerRetry => 'נסה שוב';

  @override
  String get playerPip => 'תמונה בתוך תמונה';

  @override
  String get playerPipReturn => 'חזרה לאפליקציה';

  @override
  String get catchupTitle => 'צפייה בהיסטוריה';

  @override
  String get catchupNoEpg => 'אין מדריך תוכניות. בחר זמן ידנית.';

  @override
  String get catchupPick => 'זמן התחלה';

  @override
  String get catchupDuration => 'דקות';

  @override
  String get seriesSeason => 'עונה';

  @override
  String get onbWelcomeTitle => 'ברוך הבא ל-BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'צפה בערוצים חיים, סרטים וסדרות מספק ה-IPTV שלך. נוסיף עכשיו את המקור הראשון.';

  @override
  String get onbWhereTitle => 'איפה מניחים את הכתובות?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: הספק נותן לך כתובת שרת (כמו http://host:8080), שם משתמש וסיסמה. מלא אותם למטה.';

  @override
  String get onbWhereM3u =>
      'M3U: תן למקור שם והדבק את קישור הרשימה שקיבלת מהספק.';

  @override
  String get fieldKind => 'סוג';

  @override
  String get fieldName => 'שם';

  @override
  String get fieldServer => 'כתובת שרת';

  @override
  String get fieldUsername => 'שם משתמש';

  @override
  String get fieldPassword => 'סיסמה';

  @override
  String get fieldUrl => 'קישור לרשימה';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'בדוק חיבור';

  @override
  String get onbTestOk => 'החיבור הצליח';

  @override
  String get onbTestFail => 'החיבור נכשל';

  @override
  String get onbNext => 'הבא';

  @override
  String get onbBack => 'חזרה';

  @override
  String get onbSave => 'שמור וסנכרן';

  @override
  String get settingsAccounts => 'מקורות';

  @override
  String get settingsLanguageSub => 'שפות כתוביות מועדפות';

  @override
  String get settingsLanguageAudio => 'שפות שמע מועדפות';

  @override
  String get settingsSubscale => 'גודל כתוביות';

  @override
  String get settingsSubdelay => 'עיכוב כתוביות (שניות)';

  @override
  String get settingsGuide => 'הצג מדריך התחלה מהירה';

  @override
  String get settingsDelete => 'מחק';

  @override
  String get accountAdd => 'הוסף מקור…';

  @override
  String get settingsChangePassword => 'שנה סיסמה…';

  @override
  String get settingsNewPassword => 'סיסמה חדשה';

  @override
  String updateAvailable(String p1) {
    return 'גרסה $p1 זמינה';
  }

  @override
  String get updateNow => 'עדכן עכשיו';

  @override
  String get updateNotes => 'מה חדש';

  @override
  String get updateLater => 'אחר כך';

  @override
  String get updateDownloading => 'מוריד עדכון…';

  @override
  String updateReady(String p1) {
    return 'גרסה $p1 מוכנה להתקנה';
  }

  @override
  String get updateRestart => 'הפעל מחדש כדי לעדכן';

  @override
  String get updateFailed => 'העדכון נכשל';

  @override
  String get updateManual => 'הורד ידנית';

  @override
  String get updateCheckNow => 'בדוק עדכונים';

  @override
  String get updateAuto => 'בדוק עדכונים אוטומטית';

  @override
  String get updateAutoInstall => 'הורד עדכונים אוטומטית';

  @override
  String get updateUpToDate => 'זו הגרסה העדכנית ביותר';

  @override
  String get updateDevBuild => 'עדכונים זמינים רק באפליקציה המותקנת';

  @override
  String updateCurrent(String p1) {
    return 'גרסה נוכחית: $p1';
  }

  @override
  String get playerBack => 'חזרה';

  @override
  String get playerErrorHint => 'אם זה ממשיך, בדוק את סיסמת המקור בהגדרות.';

  @override
  String get passwordTitle => 'נדרשת סיסמה';

  @override
  String passwordBody(String p1) {
    return 'הקלד את הסיסמה של “$p1”. היא נשמרת באופן פרטי במחשב הזה.';
  }

  @override
  String get passwordNone => 'המשך בלי סיסמה';

  @override
  String get playerSpeed => 'מהירות ניגון';

  @override
  String get playerSpeedNormal => 'רגילה';

  @override
  String get playerSpeedReset => 'מהירות רגילה';

  @override
  String get settingsSeekPreview => 'תצוגה מקדימה בסרגל ההתקדמות';

  @override
  String get settingsSeekPreviewNote =>
      'פותח חיבור שני אל הספק שלך. כבה אם ההפעלה נעצרת או אם הספק שלך מאפשר חיבור אחד בלבד.';

  @override
  String get playerSeekBar => 'מיקום ההפעלה';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 מתוך $p2';
  }

  @override
  String get playerLive => 'שידור חי';

  @override
  String get playerChannelPrev => 'ערוץ קודם';

  @override
  String get playerChannelNext => 'ערוץ הבא';

  @override
  String get playerScaleFit => 'התאמה';

  @override
  String get playerScaleFill => 'מילוי';

  @override
  String get playerScaleStretch => 'מתיחה';

  @override
  String get playerSubtitleAdjust => 'התאמת כתוביות…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'בהירות';

  @override
  String get playerVolume => 'עוצמת שמע';

  @override
  String get playerReplay => 'נגן שוב';

  @override
  String get settingsClock => 'הצג את השעה בנגן';

  @override
  String get settingsSeekStep => 'גודל הדילוג (מקשי החצים וכפתורי הדילוג)';

  @override
  String get settingsBarsHide => 'הסתר את הבקרים אחרי';

  @override
  String get settingsNever => 'אף פעם';

  @override
  String get settingsVideoScale => 'התאמת הווידאו למסך';

  @override
  String get settingsScaleFit => 'התאמה (עם פסים שחורים)';

  @override
  String get settingsScaleFill => 'מילוי (חותך את הקצוות)';

  @override
  String get settingsScaleStretch => 'מתיחה';

  @override
  String get settingsVideoScaleHint =>
      'לחיצה על A בנגן מחליפה בין שלושת המצבים.';

  @override
  String get settingsBuffer => 'מאגר רשת';

  @override
  String get settingsBufferSmall => 'קטן';

  @override
  String get settingsBufferNormal => 'רגיל';

  @override
  String get settingsBufferLarge => 'גדול';

  @override
  String get settingsBufferHint =>
      'מאגר גדול יותר עוזר בחיבור איטי או לא יציב.';

  @override
  String unitSeconds(int p1) {
    return '$p1 שניות';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 דקות';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 ד׳';
  }

  @override
  String playerSkipBack(String p1) {
    return 'אחורה $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'קדימה $p1';
  }

  @override
  String get playerSleep => 'טיימר שינה';

  @override
  String get downloadsTitle => 'הורדות';

  @override
  String get downloadsAdd => 'הורד';

  @override
  String get downloadsSeason => 'הורד עונה';

  @override
  String get downloadsChooseFolder => 'בחר איפה לשמור סרטים ופרקים שהורדו';

  @override
  String get downloadsChoose => 'בחר';

  @override
  String get downloadsNotChosen => 'תישאל בהורדה הראשונה';

  @override
  String get downloadsChange => 'שנה תיקייה…';

  @override
  String get downloadsPause => 'השהה';

  @override
  String get downloadsResume => 'המשך';

  @override
  String get downloadsCancel => 'בטל';

  @override
  String get downloadsPlay => 'נגן';

  @override
  String get downloadsReveal => 'הצג ב-Finder';

  @override
  String get downloadsDelete => 'מחק קובץ';

  @override
  String get downloadsEmpty => 'אין הורדות עדיין';

  @override
  String get downloadsQueued => 'ממתין';

  @override
  String get downloadsDone => 'הושלם';

  @override
  String get downloadsHint =>
      'ההורדות רצות אחת בכל פעם. אצל ספקים רבים מותר חיבור אחד בלבד, ולכן צפייה בזמן הורדה עלולה להיכשל. הורדות שלא הסתיימו לא נשמרות כשהאפליקציה נסגרת.';

  @override
  String get epgNow => 'עכשיו';

  @override
  String get epgNext => 'אחר כך';

  @override
  String get settingsFullscreen =>
      'פתח צפייה במסך מלא (הבקרים נעלמים עד שמזיזים את העכבר)';

  @override
  String get nextTitle => 'הפרק הבא';

  @override
  String nextIn(int p1) {
    return 'מתחיל בעוד $p1 שניות';
  }

  @override
  String get nextNow => 'נגן עכשיו';

  @override
  String get nextCancel => 'בטל';

  @override
  String get settingsAutoNext => 'מעבר אוטומטי לפרק הבא';

  @override
  String get downloadsNoSpace => 'אין מספיק מקום פנוי בדיסק';

  @override
  String get dbErrorTitle => 'BattleStation TV לא מצליחה לפתוח את מסד הנתונים';

  @override
  String get dbErrorBody =>
      'אם עותק אחר של BattleStation TV פתוח, סגור אותו ונסה שוב.';

  @override
  String get dbRecoveredTitle => 'מסד הנתונים ניזוק';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV התחילה עם מסד נתונים חדש (הוסף את המקור מחדש). הקובץ הפגום נשמר כאן:\n$p1';
  }

  @override
  String get menuShowWindow => 'הצג חלון';

  @override
  String get settingsTabGeneral => 'כללי';

  @override
  String get settingsTabPlayer => 'נגן';

  @override
  String get settingsTabPlaylists => 'רשימות';

  @override
  String get settingsAppearance => 'מראה';

  @override
  String get settingsSystem => 'לפי המערכת';

  @override
  String get appearanceLight => 'בהיר';

  @override
  String get appearanceDark => 'כהה';

  @override
  String get settingsInterfaceLanguage => 'שפת הממשק';

  @override
  String get settingsLanguageRestart =>
      'ייכנס לתוקף אחרי הפעלה מחדש של BattleStation TV.';

  @override
  String get settingsHideCategories => 'הסתרת קטגוריות';

  @override
  String get settingsHideCategoriesWords => 'מילים להסתרה';

  @override
  String get settingsHideCategoriesNote =>
      'הסתר קטגוריות ששמן מכיל את המילים האלה (מופרדות בפסיקים). הערוצים, הסרטים והסדרות שלהן נעלמים גם מהחיפוש, מהמועדפים וממסך “המשך צפייה”. זה מסנן פשוט ולא נעילת הורים: כל אחד יכול לשנות אותו כאן.';

  @override
  String get settingsRefresh => 'עדכון רשימות';

  @override
  String get settingsRefresh0 => 'רק כשהאפליקציה נפתחת';

  @override
  String get settingsRefresh6 => 'כל 6 שעות';

  @override
  String get settingsRefresh12 => 'כל 12 שעות';

  @override
  String get settingsRefresh24 => 'כל 24 שעות';

  @override
  String get settingsBackup => 'גיבוי ושחזור';

  @override
  String get backupExport => 'ייצוא גיבוי…';

  @override
  String get backupImport => 'ייבוא גיבוי…';

  @override
  String get backupWarn =>
      'קובץ הגיבוי כולל את הרשימות שלך עם הכתובות שלהן, ולפעמים יש בהן גם פרטי התחברות, ולכן כדאי לשמור אותו במקום פרטי. סיסמאות של מקורות Xtream לא נשמרות בו. הייבוא מוסיף למקורות הקיימים ולא מוחק כלום.';

  @override
  String get backupExported => 'הגיבוי נשמר.';

  @override
  String get backupImported => 'הגיבוי יובא.';

  @override
  String get backupErrorInvalid => 'זה לא קובץ גיבוי של BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'הגיבוי נוצר בגרסה אחרת של BattleStation TV ואי אפשר לקרוא אותו.';

  @override
  String get backupErrorTooLarge => 'הקובץ גדול מדי בשביל להיות גיבוי.';

  @override
  String get backupFailed => 'הגיבוי נכשל';

  @override
  String get settingsClearData => 'מחיקת נתונים';

  @override
  String get clearHistory => 'מחק היסטוריית צפייה';

  @override
  String get clearFavorites => 'מחק מועדפים';

  @override
  String get clearImages => 'נקה מטמון תמונות';

  @override
  String get clearConfirm => 'מחק';

  @override
  String get clearHistoryWarn =>
      'נקודות ההמשך והיסטוריית הצפייה של כל המקורות יימחקו. אי אפשר לבטל את הפעולה.';

  @override
  String get clearFavoritesWarn =>
      'המועדפים בכל המקורות יימחקו. אי אפשר לבטל את הפעולה.';

  @override
  String get clearImagesWarn =>
      'לוגואים ופוסטרים שנשמרו יוסרו ויורדו שוב לפי הצורך.';

  @override
  String get infoDetails => 'פרטים';

  @override
  String get infoPlot => 'תקציר';

  @override
  String get infoCast => 'שחקנים';

  @override
  String get infoDirector => 'במאי';

  @override
  String get infoGenre => 'ז׳אנר';

  @override
  String get infoYear => 'שנת יציאה';

  @override
  String get infoRating => 'דירוג';

  @override
  String get infoDuration => 'משך';

  @override
  String get infoCountry => 'מדינה';

  @override
  String get infoTrailer => 'טריילר';

  @override
  String get infoPlay => 'נגן';

  @override
  String get infoEmpty => 'הספק שלך לא מסר פרטים על הכותר הזה.';

  @override
  String get infoLoading => 'טוען פרטים…';

  @override
  String get infoError => 'לא ניתן לטעון את הפרטים.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 שע׳';
  }

  @override
  String subExpires(String p1) {
    return 'תוקף עד $p1';
  }

  @override
  String subExpired(String p1) {
    return 'פג תוקף ב-$p1';
  }

  @override
  String subDaysLeft(int p1) {
    return 'ימים שנותרו: $p1';
  }

  @override
  String get onbWelcomeRights => 'השתמשו רק במקורות שיש לכם הרשאה לגשת אליהם.';

  @override
  String get playerSkipIntro => 'דלג על הפתיח';

  @override
  String get playerSkipCredits => 'דלג על הקרדיטים';

  @override
  String get playerSkipMenu => 'פתיח וקרדיטים';

  @override
  String get playerMarkIntroStart => 'הפתיח מתחיל כאן';

  @override
  String get playerMarkIntroEnd => 'הפתיח נגמר כאן';

  @override
  String get playerMarkCredits => 'הקרדיטים מתחילים כאן';

  @override
  String get playerSkipForget => 'שכח פתיח וקרדיטים';

  @override
  String get playerSkipSaved => 'נשמר לכל הפרקים של הסדרה';

  @override
  String get playerSkipRefused => 'לא אפשרי ברגע הזה';

  @override
  String get continueRemove => 'הסר מהמשך צפייה';

  @override
  String get settingsFavoritesAZ => 'מיון המועדפים לפי שם (א–ת)';

  @override
  String get settingsKeychain => 'שמור סיסמאות ב-Keychain';

  @override
  String get settingsKeychainNote =>
      'כבוי: הסיסמאות נשמרות במסד הנתונים הפרטי של האפליקציה. פעיל: macOS שומר אותן ב-Keychain של המשתמש.';

  @override
  String get settingsKeychainFailed =>
      'ה-Keychain לא קיבל את הסיסמאות. דבר לא שונה.';
}
