// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'लाइव';

  @override
  String get tabMovies => 'फ़िल्में';

  @override
  String get tabSeries => 'सीरीज़';

  @override
  String get catAll => 'सभी';

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
  String get catFavorites => 'पसंदीदा';

  @override
  String get catContinue => 'देखना जारी रखें';

  @override
  String get catFilter => 'श्रेणियाँ फ़िल्टर करें';

  @override
  String get playlistAll => 'सभी प्लेलिस्ट';

  @override
  String get playlistLabel => 'प्लेलिस्ट';

  @override
  String get aboutAcknowledgements => 'आभार';

  @override
  String get aboutPrivacy => 'गोपनीयता';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV आपके बारे में कोई डेटा इकट्ठा नहीं करता। इसमें कोई खाता, एनालिटिक्स, विज्ञापन या ट्रैकिंग नहीं है।\n\nआपके सोर्स, पसंदीदा और देखने का इतिहास इसी डिवाइस पर रहते हैं। ऐप केवल उन्हीं पतों से कनेक्ट होता है जो आप खुद जोड़ते हैं: आपके प्रदाता का सर्वर, प्लेलिस्ट, प्रोग्राम गाइड, लोगो और स्ट्रीम।\n\nप्रदाता के पासवर्ड केवल इसी डिवाइस पर iOS Keychain में रखे जाते हैं। वे बैकअप फ़ाइल में कभी शामिल नहीं होते।\n\nBattleStation TV में कोई चैनल, फ़िल्म या प्लेलिस्ट शामिल नहीं है। सोर्स आपको खुद लाना होगा।';

  @override
  String get aboutSource => 'सोर्स कोड और लाइसेंस';

  @override
  String get aboutCoffee => 'मुझे एक कॉफ़ी पिलाएँ';

  @override
  String get tipsTitle => 'BattleStation TV का समर्थन करें';

  @override
  String get tipsFooter =>
      'Apple के ज़रिए वैकल्पिक टिप। इनसे कुछ भी अनलॉक नहीं होता: सभी सुविधाएँ सबके लिए मुफ़्त रहती हैं।';

  @override
  String get tipsThanks => 'आपके समर्थन के लिए धन्यवाद!';

  @override
  String get tipsPending => 'मंज़ूरी का इंतज़ार है।';

  @override
  String get tipsFailed => 'टिप पूरी नहीं हुई। बाद में फिर से कोशिश करें।';

  @override
  String get aboutVersion => 'वर्शन';

  @override
  String get catTitle => 'श्रेणियाँ';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get emptyContinue => 'जारी रखने के लिए कुछ नहीं';

  @override
  String get emptyContinueHint =>
      'जो फ़िल्में और एपिसोड आप बीच में छोड़ देते हैं, वे यहाँ दिखते हैं।';

  @override
  String get emptyFavorites => 'अभी कोई पसंदीदा नहीं';

  @override
  String get emptyFavoritesHint =>
      'किसी शीर्षक को देर तक दबाएँ, फिर “पसंदीदा में जोड़ें” चुनें।';

  @override
  String get emptyFavoritesLive =>
      'किसी चैनल को बाईं ओर स्वाइप करें, फिर सितारे पर टैप करें।';

  @override
  String get emptyNone => 'यहाँ अभी कुछ नहीं है';

  @override
  String get emptyNoneHint =>
      'रीफ़्रेश करने के लिए नीचे खींचें, या सेटिंग में अपना सोर्स जाँचें।';

  @override
  String get fieldServerInvalid =>
      'यह पता सही नहीं लग रहा। उदाहरण: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'पूरा लिंक दर्ज करें, जो http:// या https:// से शुरू हो';

  @override
  String get infoResume => 'जारी रखें';

  @override
  String get libraryEmpty => 'आपकी लाइब्रेरी खाली है';

  @override
  String get libraryEmptyHint =>
      'पसंदीदा और जो शीर्षक आपने देखना शुरू किए हैं, वे यहाँ दिखते हैं।';

  @override
  String get onbNoChannels =>
      'BattleStation TV में कोई चैनल, फ़िल्म या प्लेलिस्ट शामिल नहीं है। जिस प्रदाता के आप सदस्य हैं, उसका सोर्स जोड़ें।';

  @override
  String get onbPasteHint => 'प्लेलिस्ट लिंक कॉपी किया है?';

  @override
  String get onbTestRunning => 'जाँच हो रही है…';

  @override
  String passwordBodyIos(String p1) {
    return '“$p1” का पासवर्ड दर्ज करें। यह इस डिवाइस पर iOS Keychain में सहेजा जाता है।';
  }

  @override
  String get searchRecent => 'हाल की खोजें';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'सी$p1 ए$p2 जारी रखें';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'सी$p1 ए$p2';
  }

  @override
  String get seriesNoEpisodes => 'कोई एपिसोड नहीं मिला';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'सी$p1 ए$p2 चलाएँ';
  }

  @override
  String get seriesWatched => 'देखा गया';

  @override
  String get settingsAbout => 'इसके बारे में';

  @override
  String get settingsEditSource => 'सोर्स संपादित करें';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV आपके डिवाइस की भाषा का उपयोग करता है। केवल इस ऐप के लिए कोई दूसरी भाषा चुनने के लिए, उसे iOS सेटिंग में चुनें।';

  @override
  String get settingsOpenIOS => 'iOS सेटिंग खोलें';

  @override
  String get settingsPasswordNote =>
      'मौजूदा पासवर्ड रखने के लिए नया पासवर्ड खाली छोड़ें। पासवर्ड iOS Keychain में सहेजे जाते हैं।';

  @override
  String get settingsTitle => 'सेटिंग';

  @override
  String get sourceDeleteWarn =>
      'सोर्स, उसके पसंदीदा और उसका देखने का इतिहास इस डिवाइस से हटा दिए जाएँगे। आपके प्रदाता के खाते पर कोई असर नहीं पड़ेगा।';

  @override
  String get syncNow => 'रीफ़्रेश करें';

  @override
  String get tabLibrary => 'लाइब्रेरी';

  @override
  String get scopeCategory => 'श्रेणी में';

  @override
  String get scopeType => 'अनुभाग में';

  @override
  String get scopeEverywhere => 'हर जगह';

  @override
  String get searchPrompt => 'खोजें';

  @override
  String get syncRunning => 'सिंक हो रहा है…';

  @override
  String get syncFailed => 'सिंक विफल रहा';

  @override
  String get syncNotUpdated => 'सहेजा गया डेटा दिखाया जा रहा है';

  @override
  String get emptyResults => 'कुछ नहीं मिला';

  @override
  String get favAdd => 'पसंदीदा में जोड़ें';

  @override
  String get favRemove => 'पसंदीदा से हटाएँ';

  @override
  String get playerClose => 'बंद करें';

  @override
  String get playerSubtitles => 'उपशीर्षक';

  @override
  String get playerAudio => 'ऑडियो';

  @override
  String get playerOff => 'बंद';

  @override
  String get playerAddSubtitle => 'उपशीर्षक फ़ाइल जोड़ें…';

  @override
  String get playerCatchup => 'पिछला प्रसारण देखें';

  @override
  String get playerFullscreen => 'पूर्ण स्क्रीन';

  @override
  String get playerError => 'प्लेबैक विफल रहा';

  @override
  String get playerRetry => 'फिर कोशिश करें';

  @override
  String get playerPip => 'पिक्चर इन पिक्चर';

  @override
  String get playerPipReturn => 'ऐप पर वापस जाएँ';

  @override
  String get catchupTitle => 'कैच-अप';

  @override
  String get catchupNoEpg => 'प्रोग्राम गाइड उपलब्ध नहीं है। समय खुद चुनें।';

  @override
  String get catchupPick => 'शुरू होने का समय';

  @override
  String get catchupDuration => 'मिनट';

  @override
  String get seriesSeason => 'सीज़न';

  @override
  String get onbWelcomeTitle => 'BattleStation TV में आपका स्वागत है';

  @override
  String get onbWelcomeBody =>
      'अपने IPTV प्रदाता के लाइव चैनल, फ़िल्में और सीरीज़ देखें। आइए आपका पहला सोर्स जोड़ें।';

  @override
  String get onbWhereTitle => 'पते कहाँ डालने हैं?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: आपका प्रदाता आपको एक सर्वर पता (जैसे http://host:8080), एक उपयोगकर्ता नाम और एक पासवर्ड देता है। उन्हें नीचे दर्ज करें।';

  @override
  String get onbWhereM3u =>
      'M3U: सोर्स को एक नाम दें और अपने प्रदाता से मिला प्लेलिस्ट लिंक चिपकाएँ।';

  @override
  String get fieldKind => 'प्रकार';

  @override
  String get fieldName => 'नाम';

  @override
  String get fieldServer => 'सर्वर पता';

  @override
  String get fieldUsername => 'उपयोगकर्ता नाम';

  @override
  String get fieldPassword => 'पासवर्ड';

  @override
  String get fieldUrl => 'प्लेलिस्ट लिंक';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'कनेक्शन जाँचें';

  @override
  String get onbTestOk => 'सफलतापूर्वक कनेक्ट हो गया';

  @override
  String get onbTestFail => 'कनेक्शन विफल रहा';

  @override
  String get onbNext => 'आगे';

  @override
  String get onbBack => 'पीछे';

  @override
  String get onbSave => 'सहेजें और सिंक करें';

  @override
  String get settingsAccounts => 'सोर्स';

  @override
  String get settingsLanguageSub => 'पसंदीदा उपशीर्षक भाषाएँ';

  @override
  String get settingsLanguageAudio => 'पसंदीदा ऑडियो भाषाएँ';

  @override
  String get settingsSubscale => 'उपशीर्षक का आकार';

  @override
  String get settingsSubdelay => 'उपशीर्षक में देरी (सेकंड)';

  @override
  String get settingsGuide => 'त्वरित शुरुआत गाइड दिखाएँ';

  @override
  String get settingsDelete => 'हटाएँ';

  @override
  String get accountAdd => 'सोर्स जोड़ें…';

  @override
  String get settingsChangePassword => 'पासवर्ड बदलें…';

  @override
  String get settingsNewPassword => 'नया पासवर्ड';

  @override
  String updateAvailable(String p1) {
    return 'वर्शन $p1 उपलब्ध है';
  }

  @override
  String get updateNow => 'अभी अपडेट करें';

  @override
  String get updateNotes => 'नया क्या है';

  @override
  String get updateLater => 'बाद में';

  @override
  String get updateDownloading => 'अपडेट डाउनलोड हो रहा है…';

  @override
  String updateReady(String p1) {
    return 'वर्शन $p1 इंस्टॉल के लिए तैयार है';
  }

  @override
  String get updateRestart => 'अपडेट के लिए रीस्टार्ट करें';

  @override
  String get updateFailed => 'अपडेट विफल रहा';

  @override
  String get updateManual => 'खुद डाउनलोड करें';

  @override
  String get updateCheckNow => 'अपडेट जाँचें';

  @override
  String get updateAuto => 'अपडेट अपने-आप जाँचें';

  @override
  String get updateAutoInstall => 'अपडेट अपने-आप डाउनलोड करें';

  @override
  String get updateUpToDate => 'आपके पास नवीनतम वर्शन है';

  @override
  String get updateDevBuild => 'अपडेट केवल इंस्टॉल किए गए ऐप में उपलब्ध हैं';

  @override
  String updateCurrent(String p1) {
    return 'मौजूदा वर्शन: $p1';
  }

  @override
  String get playerBack => 'पीछे';

  @override
  String get playerErrorHint =>
      'अगर यह बार-बार हो, तो सेटिंग में सोर्स का पासवर्ड जाँचें।';

  @override
  String get passwordTitle => 'पासवर्ड ज़रूरी है';

  @override
  String passwordBody(String p1) {
    return '“$p1” का पासवर्ड दर्ज करें। यह इस Mac पर निजी रूप से सहेजा जाता है।';
  }

  @override
  String get passwordNone => 'बिना पासवर्ड के जारी रखें';

  @override
  String get playerSpeed => 'प्लेबैक गति';

  @override
  String get playerSpeedNormal => 'सामान्य';

  @override
  String get playerSpeedReset => 'सामान्य गति';

  @override
  String get settingsSeekPreview => 'प्रोग्रेस बार पर थंबनेल पूर्वावलोकन';

  @override
  String get settingsSeekPreviewNote =>
      'आपके प्रदाता से दूसरा कनेक्शन खोलता है। प्लेबैक रुक जाए या आपका प्रदाता केवल एक कनेक्शन की अनुमति देता हो, तो इसे बंद कर दें।';

  @override
  String get playerSeekBar => 'प्लेबैक की स्थिति';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 / $p2';
  }

  @override
  String get playerLive => 'लाइव';

  @override
  String get playerChannelPrev => 'पिछला चैनल';

  @override
  String get playerChannelNext => 'अगला चैनल';

  @override
  String get playerScaleFit => 'फ़िट';

  @override
  String get playerScaleFill => 'भरें';

  @override
  String get playerScaleStretch => 'खींचें';

  @override
  String get playerSubtitleAdjust => 'उपशीर्षक समायोजित करें…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'चमक';

  @override
  String get playerVolume => 'वॉल्यूम';

  @override
  String get playerReplay => 'फिर से चलाएँ';

  @override
  String get settingsClock => 'प्लेयर में समय दिखाएँ';

  @override
  String get settingsSeekStep => 'स्किप स्टेप (ऐरो कीज़ और स्किप बटन)';

  @override
  String get settingsBarsHide => 'इतने समय बाद कंट्रोल छिपाएँ';

  @override
  String get settingsNever => 'कभी नहीं';

  @override
  String get settingsVideoScale => 'वीडियो स्केल';

  @override
  String get settingsScaleFit => 'फ़िट (काली पट्टियों के साथ)';

  @override
  String get settingsScaleFill => 'भरें (किनारे कट जाते हैं)';

  @override
  String get settingsScaleStretch => 'खींचें';

  @override
  String get settingsVideoScaleHint =>
      'तीनों के बीच बदलने के लिए प्लेयर में A दबाएँ।';

  @override
  String get settingsBuffer => 'नेटवर्क बफ़र';

  @override
  String get settingsBufferSmall => 'छोटा';

  @override
  String get settingsBufferNormal => 'सामान्य';

  @override
  String get settingsBufferLarge => 'बड़ा';

  @override
  String get settingsBufferHint =>
      'धीमे या अस्थिर कनेक्शन पर बड़ा बफ़र मदद करता है।';

  @override
  String unitSeconds(int p1) {
    return '$p1 सेकंड';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 मिनट';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 मि.';
  }

  @override
  String playerSkipBack(String p1) {
    return '$p1 पीछे';
  }

  @override
  String playerSkipForward(String p1) {
    return '$p1 आगे';
  }

  @override
  String get playerSleep => 'स्लीप टाइमर';

  @override
  String get downloadsTitle => 'डाउनलोड';

  @override
  String get downloadsAdd => 'डाउनलोड';

  @override
  String get downloadsSeason => 'सीज़न डाउनलोड करें';

  @override
  String get downloadsChooseFolder =>
      'चुनें कि डाउनलोड की गई फ़िल्में और एपिसोड कहाँ सहेजे जाएँ';

  @override
  String get downloadsChoose => 'चुनें';

  @override
  String get downloadsNotChosen => 'पहले डाउनलोड पर पूछा जाएगा';

  @override
  String get downloadsChange => 'फ़ोल्डर बदलें…';

  @override
  String get downloadsPause => 'रोकें';

  @override
  String get downloadsResume => 'फिर शुरू करें';

  @override
  String get downloadsCancel => 'रद्द करें';

  @override
  String get downloadsPlay => 'चलाएँ';

  @override
  String get downloadsReveal => 'Finder में दिखाएँ';

  @override
  String get downloadsDelete => 'फ़ाइल हटाएँ';

  @override
  String get downloadsEmpty => 'अभी कोई डाउनलोड नहीं';

  @override
  String get downloadsQueued => 'प्रतीक्षा में';

  @override
  String get downloadsDone => 'पूरा हुआ';

  @override
  String get downloadsHint =>
      'डाउनलोड एक-एक करके चलते हैं। कई प्रदाता केवल एक कनेक्शन की अनुमति देते हैं, इसलिए डाउनलोड के दौरान चलाने पर प्लेबैक विफल हो सकता है। ऐप बंद होने पर अधूरे डाउनलोड नहीं रखे जाते।';

  @override
  String get epgNow => 'अभी';

  @override
  String get epgNext => 'अगला';

  @override
  String get settingsFullscreen =>
      'प्लेबैक पूर्ण स्क्रीन में खोलें (माउस हिलाने तक कंट्रोल छिपे रहते हैं)';

  @override
  String get nextTitle => 'अगला एपिसोड';

  @override
  String nextIn(int p1) {
    return '$p1 सेकंड में चलेगा';
  }

  @override
  String get nextNow => 'अभी चलाएँ';

  @override
  String get nextCancel => 'रद्द करें';

  @override
  String get settingsAutoNext => 'अगला एपिसोड अपने-आप चलाएँ';

  @override
  String get downloadsNoSpace => 'डिस्क पर पर्याप्त खाली जगह नहीं है';

  @override
  String get dbErrorTitle => 'BattleStation TV अपना डेटाबेस नहीं खोल पा रहा';

  @override
  String get dbErrorBody =>
      'अगर BattleStation TV की कोई और कॉपी चल रही है, तो उसे बंद करके दोबारा कोशिश करें।';

  @override
  String get dbRecoveredTitle => 'डेटाबेस क्षतिग्रस्त हो गया था';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV नए डेटाबेस के साथ शुरू हुआ (अपना सोर्स फिर से जोड़ें)। क्षतिग्रस्त फ़ाइल यहाँ रखी गई है:\n$p1';
  }

  @override
  String get menuShowWindow => 'विंडो दिखाएँ';

  @override
  String get settingsTabGeneral => 'सामान्य';

  @override
  String get settingsTabPlayer => 'प्लेयर';

  @override
  String get settingsTabPlaylists => 'प्लेलिस्ट';

  @override
  String get settingsAppearance => 'दिखावट';

  @override
  String get settingsSystem => 'सिस्टम';

  @override
  String get appearanceLight => 'हल्का';

  @override
  String get appearanceDark => 'गहरा';

  @override
  String get settingsInterfaceLanguage => 'इंटरफ़ेस की भाषा';

  @override
  String get settingsLanguageRestart =>
      'BattleStation TV को रीस्टार्ट करने के बाद लागू होगा।';

  @override
  String get settingsHideCategories => 'श्रेणियाँ छिपाएँ';

  @override
  String get settingsHideCategoriesWords => 'छिपाने के शब्द';

  @override
  String get settingsHideCategoriesNote =>
      'जिन श्रेणियों के नाम में ये शब्द हों उन्हें छिपाएँ (कॉमा से अलग करें)। उनके चैनल, फ़िल्में और सीरीज़ भी खोज, पसंदीदा और देखना जारी रखें से गायब हो जाती हैं। यह सिर्फ़ एक सामान्य फ़िल्टर है, पैरेंटल लॉक नहीं: कोई भी इसे यहाँ बदल सकता है।';

  @override
  String get settingsRefresh => 'प्लेलिस्ट अपडेट करें';

  @override
  String get settingsRefresh0 => 'केवल ऐप खुलने पर';

  @override
  String get settingsRefresh6 => 'हर 6 घंटे में';

  @override
  String get settingsRefresh12 => 'हर 12 घंटे में';

  @override
  String get settingsRefresh24 => 'हर 24 घंटे में';

  @override
  String get settingsBackup => 'बैकअप और रीस्टोर';

  @override
  String get backupExport => 'बैकअप एक्सपोर्ट करें…';

  @override
  String get backupImport => 'बैकअप इंपोर्ट करें…';

  @override
  String get backupWarn =>
      'बैकअप फ़ाइल में आपकी प्लेलिस्ट उनके पतों के साथ दर्ज होती हैं, जिनमें लॉगिन की जानकारी शामिल हो सकती है, इसलिए इसे निजी रखें। Xtream सोर्स के पासवर्ड इसमें सहेजे नहीं जाते। इंपोर्ट करने से आपके मौजूदा सोर्स में जुड़ता है और कुछ भी नहीं हटता।';

  @override
  String get backupExported => 'बैकअप सहेज लिया गया।';

  @override
  String get backupImported => 'बैकअप इंपोर्ट हो गया।';

  @override
  String get backupErrorInvalid =>
      'यह BattleStation TV की बैकअप फ़ाइल नहीं है।';

  @override
  String get backupErrorVersion =>
      'यह बैकअप BattleStation TV के किसी दूसरे वर्शन का है और पढ़ा नहीं जा सकता।';

  @override
  String get backupErrorTooLarge => 'यह फ़ाइल बैकअप होने के लिए बहुत बड़ी है।';

  @override
  String get backupFailed => 'बैकअप विफल रहा';

  @override
  String get settingsClearData => 'डेटा साफ़ करें';

  @override
  String get clearHistory => 'देखने का इतिहास साफ़ करें';

  @override
  String get clearFavorites => 'पसंदीदा साफ़ करें';

  @override
  String get clearImages => 'इमेज कैश साफ़ करें';

  @override
  String get clearConfirm => 'साफ़ करें';

  @override
  String get clearHistoryWarn =>
      'सभी सोर्स की रुकी हुई जगहें और देखना जारी रखें की सूचियाँ मिटा दी जाएँगी। इसे पहले जैसा नहीं किया जा सकता।';

  @override
  String get clearFavoritesWarn =>
      'सभी सोर्स में आपके पसंदीदा हटा दिए जाएँगे। इसे पहले जैसा नहीं किया जा सकता।';

  @override
  String get clearImagesWarn =>
      'सहेजे गए लोगो और पोस्टर हटा दिए जाते हैं और ज़रूरत पड़ने पर दोबारा डाउनलोड होते हैं।';

  @override
  String get infoDetails => 'विवरण';

  @override
  String get infoPlot => 'कहानी';

  @override
  String get infoCast => 'कलाकार';

  @override
  String get infoDirector => 'निर्देशक';

  @override
  String get infoGenre => 'शैली';

  @override
  String get infoYear => 'रिलीज़ का वर्ष';

  @override
  String get infoRating => 'रेटिंग';

  @override
  String get infoDuration => 'अवधि';

  @override
  String get infoCountry => 'देश';

  @override
  String get infoTrailer => 'ट्रेलर';

  @override
  String get infoPlay => 'चलाएँ';

  @override
  String get infoEmpty =>
      'आपके प्रदाता के पास इस शीर्षक की कोई जानकारी नहीं है।';

  @override
  String get infoLoading => 'विवरण लोड हो रहा है…';

  @override
  String get infoError => 'विवरण लोड नहीं हो सका।';

  @override
  String unitHoursShort(int p1) {
    return '$p1 घं.';
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
  String get playerSkipIntro => 'इंट्रो छोड़ें';

  @override
  String get playerSkipCredits => 'क्रेडिट छोड़ें';

  @override
  String get playerSkipMenu => 'इंट्रो और क्रेडिट';

  @override
  String get playerMarkIntroStart => 'इंट्रो यहाँ से शुरू';

  @override
  String get playerMarkIntroEnd => 'इंट्रो यहाँ खत्म';

  @override
  String get playerMarkCredits => 'क्रेडिट यहाँ से शुरू';

  @override
  String get playerSkipForget => 'इंट्रो और क्रेडिट भूलें';

  @override
  String get playerSkipSaved => 'इस सीरीज़ के सभी एपिसोड के लिए सहेजा गया';

  @override
  String get playerSkipRefused => 'इस जगह यह संभव नहीं है';

  @override
  String get continueRemove => 'देखना जारी रखें से हटाएँ';

  @override
  String get settingsFavoritesAZ => 'पसंदीदा को नाम के क्रम में लगाएँ (A–Z)';

  @override
  String get settingsKeychain => 'पासवर्ड Keychain में सहेजें';

  @override
  String get settingsKeychainNote =>
      'बंद: पासवर्ड ऐप के निजी डेटाबेस में रहते हैं। चालू: macOS उन्हें आपकी लॉगिन Keychain में रखता है।';

  @override
  String get settingsKeychainFailed =>
      'Keychain ने पासवर्ड स्वीकार नहीं किए। कुछ नहीं बदला।';
}
