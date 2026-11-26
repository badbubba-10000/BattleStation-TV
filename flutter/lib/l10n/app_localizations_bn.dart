// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'লাইভ';

  @override
  String get tabMovies => 'সিনেমা';

  @override
  String get tabSeries => 'সিরিজ';

  @override
  String get catAll => 'সব';

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
  String get catFavorites => 'প্রিয়';

  @override
  String get catContinue => 'দেখা চালিয়ে যান';

  @override
  String get catFilter => 'ক্যাটাগরি ফিল্টার করুন';

  @override
  String get playlistAll => 'সব প্লেলিস্ট';

  @override
  String get playlistLabel => 'প্লেলিস্ট';

  @override
  String get aboutAcknowledgements => 'কৃতজ্ঞতা';

  @override
  String get aboutPrivacy => 'গোপনীয়তা';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV আপনার সম্পর্কে কোনো ডেটা সংগ্রহ করে না। এতে কোনো অ্যাকাউন্ট, অ্যানালিটিক্স, বিজ্ঞাপন বা ট্র্যাকিং নেই।\n\nআপনার সোর্স, প্রিয় তালিকা ও দেখার ইতিহাস এই ডিভাইসেই থাকে। অ্যাপটি শুধু সেই ঠিকানাগুলোতে সংযোগ করে যেগুলো আপনি নিজে যোগ করেন: আপনার প্রদানকারীর সার্ভার, প্লেলিস্ট, প্রোগ্রাম গাইড, লোগো ও স্ট্রিম।\n\nপ্রদানকারীর পাসওয়ার্ড শুধু এই ডিভাইসের iOS Keychain-এ রাখা হয়। এগুলো কখনও ব্যাকআপ ফাইলে অন্তর্ভুক্ত হয় না।\n\nBattleStation TV-এর সঙ্গে কোনো চ্যানেল, সিনেমা বা প্লেলিস্ট আসে না। সোর্স আপনাকেই আনতে হবে।';

  @override
  String get aboutSource => 'সোর্স কোড ও লাইসেন্স';

  @override
  String get aboutCoffee => 'আমাকে একটি কফি কিনে দিন';

  @override
  String get tipsTitle => 'BattleStation TV-কে সমর্থন করুন';

  @override
  String get tipsFooter =>
      'Apple-এর মাধ্যমে ঐচ্ছিক টিপ। এগুলো কিছুই আনলক করে না: সব ফিচার সবার জন্য বিনামূল্যে থাকে।';

  @override
  String get tipsThanks => 'আপনার সমর্থনের জন্য ধন্যবাদ!';

  @override
  String get tipsPending => 'অনুমোদনের অপেক্ষায়।';

  @override
  String get tipsFailed => 'টিপটি সম্পন্ন হয়নি। পরে আবার চেষ্টা করুন।';

  @override
  String get aboutVersion => 'ভার্সন';

  @override
  String get catTitle => 'ক্যাটাগরি';

  @override
  String get commonCancel => 'বাতিল';

  @override
  String get emptyContinue => 'চালিয়ে যাওয়ার মতো কিছু নেই';

  @override
  String get emptyContinueHint =>
      'যে সিনেমা ও পর্ব মাঝপথে থামিয়েছেন সেগুলো এখানে দেখা যাবে।';

  @override
  String get emptyFavorites => 'এখনও কোনো প্রিয় নেই';

  @override
  String get emptyFavoritesHint =>
      'কোনো শিরোনামে চেপে ধরে রাখুন, তারপর “প্রিয়তে যোগ করুন” বেছে নিন।';

  @override
  String get emptyFavoritesLive =>
      'চ্যানেলটি বাঁ দিকে সোয়াইপ করুন, তারপর তারায় ট্যাপ করুন।';

  @override
  String get emptyNone => 'এখানে এখনও কিছু নেই';

  @override
  String get emptyNoneHint =>
      'রিফ্রেশ করতে নিচে টানুন, অথবা সেটিংসে আপনার সোর্স দেখে নিন।';

  @override
  String get fieldServerInvalid =>
      'এই ঠিকানাটি ঠিক মনে হচ্ছে না। উদাহরণ: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'http:// বা https:// দিয়ে শুরু করে পুরো লিংকটি লিখুন';

  @override
  String get infoResume => 'চালিয়ে যান';

  @override
  String get libraryEmpty => 'আপনার লাইব্রেরি খালি';

  @override
  String get libraryEmptyHint =>
      'প্রিয় তালিকা এবং যেগুলো দেখা শুরু করেছেন সেগুলো এখানে দেখা যাবে।';

  @override
  String get onbNoChannels =>
      'BattleStation TV-এর সঙ্গে কোনো চ্যানেল, সিনেমা বা প্লেলিস্ট আসে না। আপনার সাবস্ক্রাইব করা প্রদানকারীর কাছ থেকে একটি সোর্স যোগ করুন।';

  @override
  String get onbPasteHint => 'প্লেলিস্টের লিংক কপি করেছেন?';

  @override
  String get onbTestRunning => 'পরীক্ষা হচ্ছে…';

  @override
  String passwordBodyIos(String p1) {
    return '“$p1”-এর পাসওয়ার্ড লিখুন। এটি এই ডিভাইসের iOS Keychain-এ সংরক্ষিত থাকে।';
  }

  @override
  String get searchRecent => 'সাম্প্রতিক অনুসন্ধান';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'চালিয়ে যান সি$p1 প$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'সি$p1 প$p2';
  }

  @override
  String get seriesNoEpisodes => 'কোনো পর্ব পাওয়া যায়নি';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'চালান সি$p1 প$p2';
  }

  @override
  String get seriesWatched => 'দেখা হয়েছে';

  @override
  String get settingsAbout => 'সম্পর্কে';

  @override
  String get settingsEditSource => 'সোর্স সম্পাদনা করুন';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV আপনার ডিভাইসের ভাষা ব্যবহার করে। শুধু এই অ্যাপের জন্য অন্য ভাষা ব্যবহার করতে iOS সেটিংসে সেটি বেছে নিন।';

  @override
  String get settingsOpenIOS => 'iOS সেটিংস খুলুন';

  @override
  String get settingsPasswordNote =>
      'বর্তমান পাসওয়ার্ড রাখতে নতুন পাসওয়ার্ডের ঘরটি খালি রাখুন। পাসওয়ার্ড iOS Keychain-এ সংরক্ষিত হয়।';

  @override
  String get settingsTitle => 'সেটিংস';

  @override
  String get sourceDeleteWarn =>
      'সোর্স, তার প্রিয় তালিকা ও দেখার ইতিহাস এই ডিভাইস থেকে সরিয়ে ফেলা হয়। আপনার প্রদানকারীর অ্যাকাউন্টে কোনো প্রভাব পড়ে না।';

  @override
  String get syncNow => 'রিফ্রেশ করুন';

  @override
  String get tabLibrary => 'লাইব্রেরি';

  @override
  String get scopeCategory => 'ক্যাটাগরিতে';

  @override
  String get scopeType => 'বিভাগে';

  @override
  String get scopeEverywhere => 'সব জায়গায়';

  @override
  String get searchPrompt => 'অনুসন্ধান';

  @override
  String get syncRunning => 'সিঙ্ক হচ্ছে…';

  @override
  String get syncFailed => 'সিঙ্ক ব্যর্থ হয়েছে';

  @override
  String get syncNotUpdated => 'সংরক্ষিত ডেটা দেখানো হচ্ছে';

  @override
  String get emptyResults => 'কিছু পাওয়া যায়নি';

  @override
  String get favAdd => 'প্রিয়তে যোগ করুন';

  @override
  String get favRemove => 'প্রিয় থেকে সরান';

  @override
  String get playerClose => 'বন্ধ করুন';

  @override
  String get playerSubtitles => 'সাবটাইটেল';

  @override
  String get playerAudio => 'অডিও';

  @override
  String get playerOff => 'বন্ধ';

  @override
  String get playerAddSubtitle => 'সাবটাইটেল ফাইল যোগ করুন…';

  @override
  String get playerCatchup => 'আগের অনুষ্ঠান দেখুন';

  @override
  String get playerFullscreen => 'পূর্ণ স্ক্রিন';

  @override
  String get playerError => 'প্লেব্যাক ব্যর্থ হয়েছে';

  @override
  String get playerRetry => 'আবার চেষ্টা করুন';

  @override
  String get playerPip => 'পিকচার ইন পিকচার';

  @override
  String get playerPipReturn => 'অ্যাপে ফিরে যান';

  @override
  String get catchupTitle => 'ক্যাচ-আপ';

  @override
  String get catchupNoEpg => 'প্রোগ্রাম গাইড নেই। নিজে সময় বেছে নিন।';

  @override
  String get catchupPick => 'শুরুর সময়';

  @override
  String get catchupDuration => 'মিনিট';

  @override
  String get seriesSeason => 'সিজন';

  @override
  String get onbWelcomeTitle => 'BattleStation TV-এ স্বাগতম';

  @override
  String get onbWelcomeBody =>
      'আপনার IPTV প্রদানকারীর লাইভ চ্যানেল, সিনেমা ও সিরিজ দেখুন। চলুন আপনার প্রথম সোর্স যোগ করি।';

  @override
  String get onbWhereTitle => 'ঠিকানাগুলো কোথায় দেবেন?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: আপনার প্রদানকারী আপনাকে একটি সার্ভার ঠিকানা (যেমন http://host:8080), একটি ইউজারনেম ও একটি পাসওয়ার্ড দেয়। সেগুলো নিচে লিখুন।';

  @override
  String get onbWhereM3u =>
      'M3U: সোর্সের একটি নাম দিন এবং প্রদানকারীর দেওয়া প্লেলিস্ট লিংকটি পেস্ট করুন।';

  @override
  String get fieldKind => 'ধরন';

  @override
  String get fieldName => 'নাম';

  @override
  String get fieldServer => 'সার্ভার ঠিকানা';

  @override
  String get fieldUsername => 'ইউজারনেম';

  @override
  String get fieldPassword => 'পাসওয়ার্ড';

  @override
  String get fieldUrl => 'প্লেলিস্ট লিংক';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'সংযোগ পরীক্ষা করুন';

  @override
  String get onbTestOk => 'সফলভাবে সংযুক্ত হয়েছে';

  @override
  String get onbTestFail => 'সংযোগ ব্যর্থ হয়েছে';

  @override
  String get onbNext => 'পরবর্তী';

  @override
  String get onbBack => 'পেছনে';

  @override
  String get onbSave => 'সংরক্ষণ ও সিঙ্ক করুন';

  @override
  String get settingsAccounts => 'সোর্স';

  @override
  String get settingsLanguageSub => 'পছন্দের সাবটাইটেল ভাষা';

  @override
  String get settingsLanguageAudio => 'পছন্দের অডিও ভাষা';

  @override
  String get settingsSubscale => 'সাবটাইটেলের আকার';

  @override
  String get settingsSubdelay => 'সাবটাইটেলের বিলম্ব (সেকেন্ড)';

  @override
  String get settingsGuide => 'দ্রুত শুরুর নির্দেশিকা দেখান';

  @override
  String get settingsDelete => 'মুছুন';

  @override
  String get accountAdd => 'সোর্স যোগ করুন…';

  @override
  String get settingsChangePassword => 'পাসওয়ার্ড পরিবর্তন করুন…';

  @override
  String get settingsNewPassword => 'নতুন পাসওয়ার্ড';

  @override
  String updateAvailable(String p1) {
    return 'ভার্সন $p1 পাওয়া যাচ্ছে';
  }

  @override
  String get updateNow => 'এখনই আপডেট করুন';

  @override
  String get updateNotes => 'নতুন কী আছে';

  @override
  String get updateLater => 'পরে';

  @override
  String get updateDownloading => 'আপডেট ডাউনলোড হচ্ছে…';

  @override
  String updateReady(String p1) {
    return 'ভার্সন $p1 ইনস্টলের জন্য প্রস্তুত';
  }

  @override
  String get updateRestart => 'আপডেটের জন্য রিস্টার্ট করুন';

  @override
  String get updateFailed => 'আপডেট ব্যর্থ হয়েছে';

  @override
  String get updateManual => 'নিজে ডাউনলোড করুন';

  @override
  String get updateCheckNow => 'আপডেট খুঁজুন';

  @override
  String get updateAuto => 'স্বয়ংক্রিয়ভাবে আপডেট খুঁজুন';

  @override
  String get updateAutoInstall => 'স্বয়ংক্রিয়ভাবে আপডেট ডাউনলোড করুন';

  @override
  String get updateUpToDate => 'আপনার কাছে সর্বশেষ ভার্সন আছে';

  @override
  String get updateDevBuild => 'আপডেট শুধু ইনস্টল করা অ্যাপে পাওয়া যায়';

  @override
  String updateCurrent(String p1) {
    return 'বর্তমান ভার্সন: $p1';
  }

  @override
  String get playerBack => 'পেছনে';

  @override
  String get playerErrorHint =>
      'এটি বারবার হলে সেটিংসে সোর্সের পাসওয়ার্ড দেখে নিন।';

  @override
  String get passwordTitle => 'পাসওয়ার্ড দরকার';

  @override
  String passwordBody(String p1) {
    return '“$p1”-এর পাসওয়ার্ড লিখুন। এটি এই Mac-এ গোপনে সংরক্ষিত থাকে।';
  }

  @override
  String get passwordNone => 'পাসওয়ার্ড ছাড়া চালিয়ে যান';

  @override
  String get playerSpeed => 'প্লেব্যাকের গতি';

  @override
  String get playerSpeedNormal => 'স্বাভাবিক';

  @override
  String get playerSpeedReset => 'স্বাভাবিক গতি';

  @override
  String get settingsSeekPreview => 'সিক বারে থাম্বনেইল প্রিভিউ';

  @override
  String get settingsSeekPreviewNote =>
      'আপনার প্রদানকারীর সঙ্গে দ্বিতীয় একটি সংযোগ খোলে। প্লেব্যাক বন্ধ হয়ে গেলে বা আপনার প্রদানকারী শুধু একটি সংযোগের অনুমতি দিলে এটি বন্ধ করুন।';

  @override
  String get playerSeekBar => 'প্লেব্যাকের অবস্থান';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 / $p2';
  }

  @override
  String get playerLive => 'লাইভ';

  @override
  String get playerChannelPrev => 'আগের চ্যানেল';

  @override
  String get playerChannelNext => 'পরের চ্যানেল';

  @override
  String get playerScaleFit => 'ফিট';

  @override
  String get playerScaleFill => 'ভরাট';

  @override
  String get playerScaleStretch => 'প্রসারিত';

  @override
  String get playerSubtitleAdjust => 'সাবটাইটেল সামঞ্জস্য…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'উজ্জ্বলতা';

  @override
  String get playerVolume => 'ভলিউম';

  @override
  String get playerReplay => 'আবার চালান';

  @override
  String get settingsClock => 'প্লেয়ারে সময় দেখান';

  @override
  String get settingsSeekStep => 'স্কিপের ধাপ (অ্যারো কী ও স্কিপ বোতাম)';

  @override
  String get settingsBarsHide => 'এত সময় পরে কন্ট্রোল লুকান';

  @override
  String get settingsNever => 'কখনো না';

  @override
  String get settingsVideoScale => 'ভিডিওর স্কেল';

  @override
  String get settingsScaleFit => 'ফিট (কালো পট্টি সহ)';

  @override
  String get settingsScaleFill => 'ভরাট (প্রান্ত কেটে যায়)';

  @override
  String get settingsScaleStretch => 'টানা';

  @override
  String get settingsVideoScaleHint => 'তিনটির মধ্যে বদলাতে প্লেয়ারে A চাপুন।';

  @override
  String get settingsBuffer => 'নেটওয়ার্ক বাফার';

  @override
  String get settingsBufferSmall => 'ছোট';

  @override
  String get settingsBufferNormal => 'স্বাভাবিক';

  @override
  String get settingsBufferLarge => 'বড়';

  @override
  String get settingsBufferHint =>
      'ধীর বা অস্থির সংযোগে বড় বাফার সাহায্য করে।';

  @override
  String unitSeconds(int p1) {
    return '$p1 সেকেন্ড';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 মিনিট';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 মি.';
  }

  @override
  String playerSkipBack(String p1) {
    return '$p1 পেছনে';
  }

  @override
  String playerSkipForward(String p1) {
    return '$p1 সামনে';
  }

  @override
  String get playerSleep => 'স্লিপ টাইমার';

  @override
  String get downloadsTitle => 'ডাউনলোড';

  @override
  String get downloadsAdd => 'ডাউনলোড';

  @override
  String get downloadsSeason => 'সিজন ডাউনলোড করুন';

  @override
  String get downloadsChooseFolder =>
      'ডাউনলোড করা সিনেমা ও পর্ব কোথায় সংরক্ষণ হবে তা বেছে নিন';

  @override
  String get downloadsChoose => 'বেছে নিন';

  @override
  String get downloadsNotChosen => 'প্রথম ডাউনলোডের সময় জিজ্ঞেস করা হবে';

  @override
  String get downloadsChange => 'ফোল্ডার পরিবর্তন করুন…';

  @override
  String get downloadsPause => 'বিরতি';

  @override
  String get downloadsResume => 'আবার শুরু করুন';

  @override
  String get downloadsCancel => 'বাতিল';

  @override
  String get downloadsPlay => 'চালান';

  @override
  String get downloadsReveal => 'Finder-এ দেখান';

  @override
  String get downloadsDelete => 'ফাইল মুছুন';

  @override
  String get downloadsEmpty => 'এখনও কোনো ডাউনলোড নেই';

  @override
  String get downloadsQueued => 'অপেক্ষায়';

  @override
  String get downloadsDone => 'সম্পন্ন';

  @override
  String get downloadsHint =>
      'ডাউনলোড একটির পর একটি চলে। অনেক প্রদানকারী শুধু একটি সংযোগের অনুমতি দেয়, তাই ডাউনলোডের সময় চালালে প্লেব্যাক ব্যর্থ হতে পারে। অ্যাপ বন্ধ হলে অসম্পূর্ণ ডাউনলোড রাখা হয় না।';

  @override
  String get epgNow => 'এখন';

  @override
  String get epgNext => 'পরবর্তী';

  @override
  String get settingsFullscreen =>
      'প্লেব্যাক পূর্ণ স্ক্রিনে খুলুন (মাউস না নাড়ানো পর্যন্ত কন্ট্রোল লুকানো থাকে)';

  @override
  String get nextTitle => 'পরবর্তী পর্ব';

  @override
  String nextIn(int p1) {
    return '$p1 সেকেন্ডে চলবে';
  }

  @override
  String get nextNow => 'এখনই চালান';

  @override
  String get nextCancel => 'বাতিল';

  @override
  String get settingsAutoNext => 'পরবর্তী পর্ব স্বয়ংক্রিয়ভাবে চালান';

  @override
  String get downloadsNoSpace => 'ডিস্কে পর্যাপ্ত খালি জায়গা নেই';

  @override
  String get dbErrorTitle => 'BattleStation TV তার ডেটাবেস খুলতে পারছে না';

  @override
  String get dbErrorBody =>
      'BattleStation TV-এর অন্য কোনো কপি চললে সেটি বন্ধ করে আবার চেষ্টা করুন।';

  @override
  String get dbRecoveredTitle => 'ডেটাবেস ক্ষতিগ্রস্ত হয়েছিল';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV একটি নতুন ডেটাবেস নিয়ে চালু হয়েছে (আপনার সোর্স আবার যোগ করুন)। ক্ষতিগ্রস্ত ফাইলটি এখানে রাখা হয়েছে:\n$p1';
  }

  @override
  String get menuShowWindow => 'উইন্ডো দেখান';

  @override
  String get settingsTabGeneral => 'সাধারণ';

  @override
  String get settingsTabPlayer => 'প্লেয়ার';

  @override
  String get settingsTabPlaylists => 'প্লেলিস্ট';

  @override
  String get settingsAppearance => 'চেহারা';

  @override
  String get settingsSystem => 'সিস্টেম';

  @override
  String get appearanceLight => 'হালকা';

  @override
  String get appearanceDark => 'গাঢ়';

  @override
  String get settingsInterfaceLanguage => 'ইন্টারফেসের ভাষা';

  @override
  String get settingsLanguageRestart =>
      'BattleStation TV রিস্টার্ট করার পরে কার্যকর হবে।';

  @override
  String get settingsHideCategories => 'ক্যাটাগরি লুকান';

  @override
  String get settingsHideCategoriesWords => 'লুকানোর শব্দ';

  @override
  String get settingsHideCategoriesNote =>
      'যে ক্যাটাগরির নামে এই শব্দগুলো আছে সেগুলো লুকান (কমা দিয়ে আলাদা করুন)। সেগুলোর চ্যানেল, সিনেমা ও সিরিজও অনুসন্ধান, প্রিয় এবং দেখা চালিয়ে যান থেকে সরে যায়। এটি শুধু একটি সাধারণ ফিল্টার, প্যারেন্টাল লক নয়: যে কেউ এখানে এটি বদলাতে পারে।';

  @override
  String get settingsRefresh => 'প্লেলিস্ট আপডেট করুন';

  @override
  String get settingsRefresh0 => 'শুধু অ্যাপ খোলার সময়';

  @override
  String get settingsRefresh6 => 'প্রতি 6 ঘণ্টায়';

  @override
  String get settingsRefresh12 => 'প্রতি 12 ঘণ্টায়';

  @override
  String get settingsRefresh24 => 'প্রতি 24 ঘণ্টায়';

  @override
  String get settingsBackup => 'ব্যাকআপ ও রিস্টোর';

  @override
  String get backupExport => 'ব্যাকআপ এক্সপোর্ট করুন…';

  @override
  String get backupImport => 'ব্যাকআপ ইমপোর্ট করুন…';

  @override
  String get backupWarn =>
      'ব্যাকআপ ফাইলে আপনার প্লেলিস্ট তাদের ঠিকানাসহ থাকে, যেখানে লগইনের তথ্যও থাকতে পারে, তাই এটি গোপন রাখুন। Xtream সোর্সের পাসওয়ার্ড এতে সংরক্ষিত হয় না। ইমপোর্ট করলে আপনার বর্তমান সোর্সের সঙ্গে যোগ হয় এবং কিছু মুছে যায় না।';

  @override
  String get backupExported => 'ব্যাকআপ সংরক্ষণ করা হয়েছে।';

  @override
  String get backupImported => 'ব্যাকআপ ইমপোর্ট করা হয়েছে।';

  @override
  String get backupErrorInvalid => 'এটি BattleStation TV-এর ব্যাকআপ ফাইল নয়।';

  @override
  String get backupErrorVersion =>
      'এই ব্যাকআপ BattleStation TV-এর অন্য ভার্সনের এবং পড়া যাচ্ছে না।';

  @override
  String get backupErrorTooLarge => 'ব্যাকআপ হওয়ার জন্য এই ফাইলটি অনেক বড়।';

  @override
  String get backupFailed => 'ব্যাকআপ ব্যর্থ হয়েছে';

  @override
  String get settingsClearData => 'ডেটা মুছুন';

  @override
  String get clearHistory => 'দেখার ইতিহাস মুছুন';

  @override
  String get clearFavorites => 'প্রিয় মুছুন';

  @override
  String get clearImages => 'ইমেজ ক্যাশ মুছুন';

  @override
  String get clearConfirm => 'মুছুন';

  @override
  String get clearHistoryWarn =>
      'সব সোর্সের থেমে যাওয়া অবস্থান ও দেখা চালিয়ে যান তালিকা মুছে যাবে। এটি আগের অবস্থায় ফেরানো যাবে না।';

  @override
  String get clearFavoritesWarn =>
      'সব সোর্সে আপনার প্রিয় তালিকা সরিয়ে ফেলা হবে। এটি আগের অবস্থায় ফেরানো যাবে না।';

  @override
  String get clearImagesWarn =>
      'সংরক্ষিত লোগো ও পোস্টার সরিয়ে ফেলা হয় এবং প্রয়োজনে আবার ডাউনলোড হয়।';

  @override
  String get infoDetails => 'বিবরণ';

  @override
  String get infoPlot => 'গল্প';

  @override
  String get infoCast => 'অভিনেতা';

  @override
  String get infoDirector => 'পরিচালক';

  @override
  String get infoGenre => 'ধরন';

  @override
  String get infoYear => 'মুক্তির বছর';

  @override
  String get infoRating => 'রেটিং';

  @override
  String get infoDuration => 'সময়কাল';

  @override
  String get infoCountry => 'দেশ';

  @override
  String get infoTrailer => 'ট্রেলার';

  @override
  String get infoPlay => 'চালান';

  @override
  String get infoEmpty => 'আপনার প্রদানকারীর কাছে এই শিরোনামের কোনো তথ্য নেই।';

  @override
  String get infoLoading => 'বিবরণ লোড হচ্ছে…';

  @override
  String get infoError => 'বিবরণ লোড করা যায়নি।';

  @override
  String unitHoursShort(int p1) {
    return '$p1 ঘ.';
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
  String get playerSkipIntro => 'ইন্ট্রো এড়িয়ে যান';

  @override
  String get playerSkipCredits => 'ক্রেডিট এড়িয়ে যান';

  @override
  String get playerSkipMenu => 'ইন্ট্রো ও ক্রেডিট';

  @override
  String get playerMarkIntroStart => 'ইন্ট্রো এখানে শুরু';

  @override
  String get playerMarkIntroEnd => 'ইন্ট্রো এখানে শেষ';

  @override
  String get playerMarkCredits => 'ক্রেডিট এখানে শুরু';

  @override
  String get playerSkipForget => 'ইন্ট্রো ও ক্রেডিট ভুলে যান';

  @override
  String get playerSkipSaved => 'এই সিরিজের সব পর্বের জন্য সংরক্ষিত';

  @override
  String get playerSkipRefused => 'এই মুহূর্তে সম্ভব নয়';

  @override
  String get continueRemove => 'দেখা চালিয়ে যাওয়া থেকে সরান';

  @override
  String get settingsFavoritesAZ => 'পছন্দের তালিকা নামের ক্রমে সাজান (A–Z)';

  @override
  String get settingsKeychain => 'পাসওয়ার্ড Keychain-এ রাখুন';

  @override
  String get settingsKeychainNote =>
      'বন্ধ: পাসওয়ার্ড অ্যাপের নিজস্ব ডেটাবেসে থাকে। চালু: macOS সেগুলো আপনার লগইন Keychain-এ রাখে।';

  @override
  String get settingsKeychainFailed =>
      'Keychain পাসওয়ার্ড গ্রহণ করেনি। কিছুই বদলায়নি।';
}
