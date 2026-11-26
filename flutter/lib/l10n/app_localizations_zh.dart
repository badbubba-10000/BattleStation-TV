// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => '直播';

  @override
  String get tabMovies => '电影';

  @override
  String get tabSeries => '剧集';

  @override
  String get catAll => '全部';

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
  String get catFavorites => '收藏';

  @override
  String get catContinue => '继续观看';

  @override
  String get catFilter => '筛选分类';

  @override
  String get playlistAll => '所有播放列表';

  @override
  String get playlistLabel => '播放列表';

  @override
  String get aboutAcknowledgements => '致谢';

  @override
  String get aboutPrivacy => '隐私';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV 不会收集任何关于你的数据。它没有账户、没有分析、没有广告，也没有跟踪。\n\n你的播放源、收藏和观看记录都只保存在这台设备上。App 只会连接你自己添加的地址：服务商的服务器、播放列表、节目指南、台标和视频流。\n\n服务商密码仅保存在这台设备的 iOS Keychain 中，绝不会包含在备份文件里。\n\nBattleStation TV 不包含任何频道、电影或播放列表，播放源需要你自己提供。';

  @override
  String get aboutSource => '源代码与许可证';

  @override
  String get aboutCoffee => '请我喝杯咖啡';

  @override
  String get tipsTitle => '支持 BattleStation TV';

  @override
  String get tipsFooter => '通过 Apple 的自愿打赏。打赏不会解锁任何内容：所有功能对所有人都保持免费。';

  @override
  String get tipsThanks => '感谢你的支持！';

  @override
  String get tipsPending => '正在等待批准。';

  @override
  String get tipsFailed => '打赏未成功。请稍后再试。';

  @override
  String get aboutVersion => '版本';

  @override
  String get catTitle => '分类';

  @override
  String get commonCancel => '取消';

  @override
  String get emptyContinue => '没有可继续观看的内容';

  @override
  String get emptyContinueHint => '看到一半的电影和剧集会显示在这里。';

  @override
  String get emptyFavorites => '还没有收藏';

  @override
  String get emptyFavoritesHint => '按住某个片名，然后选择“添加到收藏”。';

  @override
  String get emptyFavoritesLive => '向左滑动频道，然后点按星标。';

  @override
  String get emptyNone => '这里还没有内容';

  @override
  String get emptyNoneHint => '下拉即可刷新，或在“设置”中检查你的播放源。';

  @override
  String get fieldServerInvalid => '这个地址看起来不正确。示例：http://host:8080';

  @override
  String get fieldUrlInvalid => '请输入完整链接，以 http:// 或 https:// 开头';

  @override
  String get infoResume => '继续播放';

  @override
  String get libraryEmpty => '你的资料库是空的';

  @override
  String get libraryEmptyHint => '收藏和你开始观看的内容会显示在这里。';

  @override
  String get onbNoChannels =>
      'BattleStation TV 不包含任何频道、电影或播放列表。请添加你所订阅服务商提供的播放源。';

  @override
  String get onbPasteHint => '复制了播放列表链接吗？';

  @override
  String get onbTestRunning => '正在测试…';

  @override
  String passwordBodyIos(String p1) {
    return '请输入“$p1”的密码。密码存储在这台设备的 iOS Keychain 中。';
  }

  @override
  String get searchRecent => '最近搜索';

  @override
  String seriesContinueEp(int p1, int p2) {
    return '继续观看 第$p1季第$p2集';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return '第$p1季第$p2集';
  }

  @override
  String get seriesNoEpisodes => '没有找到分集';

  @override
  String seriesPlayEp(int p1, int p2) {
    return '播放 第$p1季第$p2集';
  }

  @override
  String get seriesWatched => '已观看';

  @override
  String get settingsAbout => '关于';

  @override
  String get settingsEditSource => '编辑播放源';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV 使用你设备的语言。若只想为此 App 使用其他语言，请在 iOS 设置中选择。';

  @override
  String get settingsOpenIOS => '打开 iOS 设置';

  @override
  String get settingsPasswordNote => '新密码留空则保留当前密码。密码存储在 iOS Keychain 中。';

  @override
  String get settingsTitle => '设置';

  @override
  String get sourceDeleteWarn => '该播放源及其收藏和观看记录将从这台设备中移除，你的服务商账户不受影响。';

  @override
  String get syncNow => '刷新';

  @override
  String get tabLibrary => '资料库';

  @override
  String get scopeCategory => '在分类中';

  @override
  String get scopeType => '在当前栏目中';

  @override
  String get scopeEverywhere => '所有位置';

  @override
  String get searchPrompt => '搜索';

  @override
  String get syncRunning => '正在同步…';

  @override
  String get syncFailed => '同步失败';

  @override
  String get syncNotUpdated => '显示已保存的数据';

  @override
  String get emptyResults => '没有找到结果';

  @override
  String get favAdd => '添加到收藏';

  @override
  String get favRemove => '从收藏中移除';

  @override
  String get playerClose => '关闭';

  @override
  String get playerSubtitles => '字幕';

  @override
  String get playerAudio => '音频';

  @override
  String get playerOff => '关闭';

  @override
  String get playerAddSubtitle => '添加字幕文件…';

  @override
  String get playerCatchup => '回看';

  @override
  String get playerFullscreen => '全屏';

  @override
  String get playerError => '播放失败';

  @override
  String get playerRetry => '重试';

  @override
  String get playerPip => '画中画';

  @override
  String get playerPipReturn => '返回 App';

  @override
  String get catchupTitle => '回看';

  @override
  String get catchupNoEpg => '没有节目指南。请手动选择时间。';

  @override
  String get catchupPick => '开始时间';

  @override
  String get catchupDuration => '分钟';

  @override
  String get seriesSeason => '季';

  @override
  String get onbWelcomeTitle => '欢迎使用 BattleStation TV';

  @override
  String get onbWelcomeBody => '观看 IPTV 服务商提供的直播频道、电影和剧集。先来添加你的第一个播放源吧。';

  @override
  String get onbWhereTitle => '地址填在哪里？';

  @override
  String get onbWhereXtream =>
      'Xtream Codes：服务商会提供服务器地址（如 http://host:8080）、用户名和密码，请在下方输入。';

  @override
  String get onbWhereM3u => 'M3U：为播放源命名，然后粘贴服务商提供的播放列表链接。';

  @override
  String get fieldKind => '类型';

  @override
  String get fieldName => '名称';

  @override
  String get fieldServer => '服务器地址';

  @override
  String get fieldUsername => '用户名';

  @override
  String get fieldPassword => '密码';

  @override
  String get fieldUrl => '播放列表链接';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => '测试连接';

  @override
  String get onbTestOk => '连接成功';

  @override
  String get onbTestFail => '连接失败';

  @override
  String get onbNext => '下一步';

  @override
  String get onbBack => '上一步';

  @override
  String get onbSave => '保存并同步';

  @override
  String get settingsAccounts => '播放源';

  @override
  String get settingsLanguageSub => '首选字幕语言';

  @override
  String get settingsLanguageAudio => '首选音频语言';

  @override
  String get settingsSubscale => '字幕大小';

  @override
  String get settingsSubdelay => '字幕延迟（秒）';

  @override
  String get settingsGuide => '显示快速入门指南';

  @override
  String get settingsDelete => '删除';

  @override
  String get accountAdd => '添加播放源…';

  @override
  String get settingsChangePassword => '更改密码…';

  @override
  String get settingsNewPassword => '新密码';

  @override
  String updateAvailable(String p1) {
    return '新版本 $p1 现已可用';
  }

  @override
  String get updateNow => '立即更新';

  @override
  String get updateNotes => '更新内容';

  @override
  String get updateLater => '稍后';

  @override
  String get updateDownloading => '正在下载更新…';

  @override
  String updateReady(String p1) {
    return '版本 $p1 已准备好安装';
  }

  @override
  String get updateRestart => '重新启动以更新';

  @override
  String get updateFailed => '更新失败';

  @override
  String get updateManual => '手动下载';

  @override
  String get updateCheckNow => '检查更新';

  @override
  String get updateAuto => '自动检查更新';

  @override
  String get updateAutoInstall => '自动下载更新';

  @override
  String get updateUpToDate => '已是最新版本';

  @override
  String get updateDevBuild => '更新仅适用于已安装的 App';

  @override
  String updateCurrent(String p1) {
    return '当前版本：$p1';
  }

  @override
  String get playerBack => '返回';

  @override
  String get playerErrorHint => '如果问题持续出现，请在“设置”中检查该播放源的密码。';

  @override
  String get passwordTitle => '需要密码';

  @override
  String passwordBody(String p1) {
    return '请输入“$p1”的密码。密码会私密存储在这台 Mac 上。';
  }

  @override
  String get passwordNone => '不使用密码继续';

  @override
  String get playerSpeed => '播放速度';

  @override
  String get playerSpeedNormal => '正常';

  @override
  String get playerSpeedReset => '正常速度';

  @override
  String get settingsSeekPreview => '在进度条上显示缩略图预览';

  @override
  String get settingsSeekPreviewNote =>
      '会向服务商打开第二个连接。如果播放中断，或服务商只允许一个连接，请关闭此选项。';

  @override
  String get playerSeekBar => '播放位置';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 / $p2';
  }

  @override
  String get playerLive => '直播';

  @override
  String get playerChannelPrev => '上一个频道';

  @override
  String get playerChannelNext => '下一个频道';

  @override
  String get playerScaleFit => '适应';

  @override
  String get playerScaleFill => '填充';

  @override
  String get playerScaleStretch => '拉伸';

  @override
  String get playerSubtitleAdjust => '调整字幕…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => '亮度';

  @override
  String get playerVolume => '音量';

  @override
  String get playerReplay => '重新播放';

  @override
  String get settingsClock => '在播放器中显示时间';

  @override
  String get settingsSeekStep => '跳转步长（方向键和跳转按钮）';

  @override
  String get settingsBarsHide => '无操作后隐藏控制栏';

  @override
  String get settingsNever => '永不';

  @override
  String get settingsVideoScale => '视频缩放';

  @override
  String get settingsScaleFit => '适应（显示黑边）';

  @override
  String get settingsScaleFill => '填充（裁剪边缘）';

  @override
  String get settingsScaleStretch => '拉伸';

  @override
  String get settingsVideoScaleHint => '在播放器中按 A 键可在这三种模式间切换。';

  @override
  String get settingsBuffer => '网络缓冲';

  @override
  String get settingsBufferSmall => '小';

  @override
  String get settingsBufferNormal => '标准';

  @override
  String get settingsBufferLarge => '大';

  @override
  String get settingsBufferHint => '网络较慢或不稳定时，增大缓冲会有帮助。';

  @override
  String unitSeconds(int p1) {
    return '$p1 秒';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 分钟';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 分';
  }

  @override
  String playerSkipBack(String p1) {
    return '快退 $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return '快进 $p1';
  }

  @override
  String get playerSleep => '睡眠定时';

  @override
  String get downloadsTitle => '下载';

  @override
  String get downloadsAdd => '下载';

  @override
  String get downloadsSeason => '下载本季';

  @override
  String get downloadsChooseFolder => '选择电影和剧集的下载保存位置';

  @override
  String get downloadsChoose => '选取';

  @override
  String get downloadsNotChosen => '首次下载时询问';

  @override
  String get downloadsChange => '更改文件夹…';

  @override
  String get downloadsPause => '暂停';

  @override
  String get downloadsResume => '继续';

  @override
  String get downloadsCancel => '取消';

  @override
  String get downloadsPlay => '播放';

  @override
  String get downloadsReveal => '在访达中显示';

  @override
  String get downloadsDelete => '删除文件';

  @override
  String get downloadsEmpty => '还没有下载内容';

  @override
  String get downloadsQueued => '等待中';

  @override
  String get downloadsDone => '已完成';

  @override
  String get downloadsHint =>
      '下载按顺序逐个进行。许多服务商只允许一个连接，因此边下载边播放可能会失败。退出 App 时，未完成的下载不会保留。';

  @override
  String get epgNow => '正在播出';

  @override
  String get epgNext => '接下来';

  @override
  String get settingsFullscreen => '以全屏方式打开播放（移动鼠标前控制栏会隐藏）';

  @override
  String get nextTitle => '接下来播放';

  @override
  String nextIn(int p1) {
    return '$p1 秒后播放';
  }

  @override
  String get nextNow => '立即播放';

  @override
  String get nextCancel => '取消';

  @override
  String get settingsAutoNext => '自动播放下一集';

  @override
  String get downloadsNoSpace => '可用磁盘空间不足';

  @override
  String get dbErrorTitle => 'BattleStation TV 无法打开其数据库';

  @override
  String get dbErrorBody => '如果 BattleStation TV 的另一个副本正在运行，请退出后重试。';

  @override
  String get dbRecoveredTitle => '数据库已损坏';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV 已使用全新的数据库启动（请重新添加播放源）。损坏的文件保存在这里：\n$p1';
  }

  @override
  String get menuShowWindow => '显示窗口';

  @override
  String get settingsTabGeneral => '通用';

  @override
  String get settingsTabPlayer => '播放器';

  @override
  String get settingsTabPlaylists => '播放列表';

  @override
  String get settingsAppearance => '外观';

  @override
  String get settingsSystem => '跟随系统';

  @override
  String get appearanceLight => '浅色';

  @override
  String get appearanceDark => '深色';

  @override
  String get settingsInterfaceLanguage => '界面语言';

  @override
  String get settingsLanguageRestart => '重新启动 BattleStation TV 后生效。';

  @override
  String get settingsHideCategories => '隐藏分类';

  @override
  String get settingsHideCategoriesWords => '要隐藏的关键词';

  @override
  String get settingsHideCategoriesNote =>
      '隐藏名称包含这些词的分类（用逗号分隔）。这些分类下的频道、电影和剧集也会从搜索、收藏和继续观看中消失。这只是一个普通过滤器，并非家长控制：任何人都可以在此处更改。';

  @override
  String get settingsRefresh => '更新播放列表';

  @override
  String get settingsRefresh0 => '仅在打开 App 时';

  @override
  String get settingsRefresh6 => '每 6 小时';

  @override
  String get settingsRefresh12 => '每 12 小时';

  @override
  String get settingsRefresh24 => '每 24 小时';

  @override
  String get settingsBackup => '备份与恢复';

  @override
  String get backupExport => '导出备份…';

  @override
  String get backupImport => '导入备份…';

  @override
  String get backupWarn =>
      '备份文件会列出你的播放列表及其地址，其中可能包含登录信息，请妥善保管。Xtream 播放源的密码不会保存在其中。导入只会添加到当前的播放源，不会删除任何内容。';

  @override
  String get backupExported => '备份已保存。';

  @override
  String get backupImported => '备份已导入。';

  @override
  String get backupErrorInvalid => '这不是 BattleStation TV 备份文件。';

  @override
  String get backupErrorVersion => '此备份来自不同版本的 BattleStation TV，无法读取。';

  @override
  String get backupErrorTooLarge => '此文件过大，不可能是备份文件。';

  @override
  String get backupFailed => '备份失败';

  @override
  String get settingsClearData => '清除数据';

  @override
  String get clearHistory => '清除观看记录';

  @override
  String get clearFavorites => '清除收藏';

  @override
  String get clearImages => '清除图片缓存';

  @override
  String get clearConfirm => '清除';

  @override
  String get clearHistoryWarn => '所有播放源的续播位置和继续观看列表都将被清除。此操作无法撤销。';

  @override
  String get clearFavoritesWarn => '所有播放源中的收藏都将被移除。此操作无法撤销。';

  @override
  String get clearImagesWarn => '已保存的台标和海报将被移除，并在需要时重新下载。';

  @override
  String get infoDetails => '详情';

  @override
  String get infoPlot => '剧情简介';

  @override
  String get infoCast => '演员';

  @override
  String get infoDirector => '导演';

  @override
  String get infoGenre => '类型';

  @override
  String get infoYear => '上映年份';

  @override
  String get infoRating => '评分';

  @override
  String get infoDuration => '时长';

  @override
  String get infoCountry => '国家/地区';

  @override
  String get infoTrailer => '预告片';

  @override
  String get infoPlay => '播放';

  @override
  String get infoEmpty => '你的服务商没有这部作品的详细信息。';

  @override
  String get infoLoading => '正在加载详情…';

  @override
  String get infoError => '无法加载详情。';

  @override
  String unitHoursShort(int p1) {
    return '$p1 小时';
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
  String get playerSkipIntro => '跳过片头';

  @override
  String get playerSkipCredits => '跳过片尾';

  @override
  String get playerSkipMenu => '片头和片尾';

  @override
  String get playerMarkIntroStart => '片头从这里开始';

  @override
  String get playerMarkIntroEnd => '片头到这里结束';

  @override
  String get playerMarkCredits => '片尾从这里开始';

  @override
  String get playerSkipForget => '清除片头和片尾';

  @override
  String get playerSkipSaved => '已为该剧所有剧集保存';

  @override
  String get playerSkipRefused => '此处无法设置';

  @override
  String get continueRemove => '从“继续观看”中移除';

  @override
  String get settingsFavoritesAZ => '按名称排序收藏 (A–Z)';

  @override
  String get settingsKeychain => '将密码存储在钥匙串中';

  @override
  String get settingsKeychainNote =>
      '关闭：密码保存在应用的私有数据库中。打开：macOS 将其保存在你的登录钥匙串中。';

  @override
  String get settingsKeychainFailed => '钥匙串未接受这些密码。未做任何更改。';
}

/// The translations for Chinese, using the Han script (`zh_Hans`).
class AppLocalizationsZhHans extends AppLocalizationsZh {
  AppLocalizationsZhHans() : super('zh_Hans');

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => '直播';

  @override
  String get tabMovies => '电影';

  @override
  String get tabSeries => '剧集';

  @override
  String get catAll => '全部';

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
  String get catFavorites => '收藏';

  @override
  String get catContinue => '继续观看';

  @override
  String get catFilter => '筛选分类';

  @override
  String get playlistAll => '所有播放列表';

  @override
  String get playlistLabel => '播放列表';

  @override
  String get aboutAcknowledgements => '致谢';

  @override
  String get aboutPrivacy => '隐私';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV 不会收集任何关于你的数据。它没有账户、没有分析、没有广告，也没有跟踪。\n\n你的播放源、收藏和观看记录都只保存在这台设备上。App 只会连接你自己添加的地址：服务商的服务器、播放列表、节目指南、台标和视频流。\n\n服务商密码仅保存在这台设备的 iOS Keychain 中，绝不会包含在备份文件里。\n\nBattleStation TV 不包含任何频道、电影或播放列表，播放源需要你自己提供。';

  @override
  String get aboutSource => '源代码与许可证';

  @override
  String get aboutCoffee => '请我喝杯咖啡';

  @override
  String get tipsTitle => '支持 BattleStation TV';

  @override
  String get tipsFooter => '通过 Apple 的自愿打赏。打赏不会解锁任何内容：所有功能对所有人都保持免费。';

  @override
  String get tipsThanks => '感谢你的支持！';

  @override
  String get tipsPending => '正在等待批准。';

  @override
  String get tipsFailed => '打赏未成功。请稍后再试。';

  @override
  String get aboutVersion => '版本';

  @override
  String get catTitle => '分类';

  @override
  String get commonCancel => '取消';

  @override
  String get emptyContinue => '没有可继续观看的内容';

  @override
  String get emptyContinueHint => '看到一半的电影和剧集会显示在这里。';

  @override
  String get emptyFavorites => '还没有收藏';

  @override
  String get emptyFavoritesHint => '按住某个片名，然后选择“添加到收藏”。';

  @override
  String get emptyFavoritesLive => '向左滑动频道，然后点按星标。';

  @override
  String get emptyNone => '这里还没有内容';

  @override
  String get emptyNoneHint => '下拉即可刷新，或在“设置”中检查你的播放源。';

  @override
  String get fieldServerInvalid => '这个地址看起来不正确。示例：http://host:8080';

  @override
  String get fieldUrlInvalid => '请输入完整链接，以 http:// 或 https:// 开头';

  @override
  String get infoResume => '继续播放';

  @override
  String get libraryEmpty => '你的资料库是空的';

  @override
  String get libraryEmptyHint => '收藏和你开始观看的内容会显示在这里。';

  @override
  String get onbNoChannels =>
      'BattleStation TV 不包含任何频道、电影或播放列表。请添加你所订阅服务商提供的播放源。';

  @override
  String get onbPasteHint => '复制了播放列表链接吗？';

  @override
  String get onbTestRunning => '正在测试…';

  @override
  String passwordBodyIos(String p1) {
    return '请输入“$p1”的密码。密码存储在这台设备的 iOS Keychain 中。';
  }

  @override
  String get searchRecent => '最近搜索';

  @override
  String seriesContinueEp(int p1, int p2) {
    return '继续观看 第$p1季第$p2集';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return '第$p1季第$p2集';
  }

  @override
  String get seriesNoEpisodes => '没有找到分集';

  @override
  String seriesPlayEp(int p1, int p2) {
    return '播放 第$p1季第$p2集';
  }

  @override
  String get seriesWatched => '已观看';

  @override
  String get settingsAbout => '关于';

  @override
  String get settingsEditSource => '编辑播放源';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV 使用你设备的语言。若只想为此 App 使用其他语言，请在 iOS 设置中选择。';

  @override
  String get settingsOpenIOS => '打开 iOS 设置';

  @override
  String get settingsPasswordNote => '新密码留空则保留当前密码。密码存储在 iOS Keychain 中。';

  @override
  String get settingsTitle => '设置';

  @override
  String get sourceDeleteWarn => '该播放源及其收藏和观看记录将从这台设备中移除，你的服务商账户不受影响。';

  @override
  String get syncNow => '刷新';

  @override
  String get tabLibrary => '资料库';

  @override
  String get scopeCategory => '在分类中';

  @override
  String get scopeType => '在当前栏目中';

  @override
  String get scopeEverywhere => '所有位置';

  @override
  String get searchPrompt => '搜索';

  @override
  String get syncRunning => '正在同步…';

  @override
  String get syncFailed => '同步失败';

  @override
  String get syncNotUpdated => '显示已保存的数据';

  @override
  String get emptyResults => '没有找到结果';

  @override
  String get favAdd => '添加到收藏';

  @override
  String get favRemove => '从收藏中移除';

  @override
  String get playerClose => '关闭';

  @override
  String get playerSubtitles => '字幕';

  @override
  String get playerAudio => '音频';

  @override
  String get playerOff => '关闭';

  @override
  String get playerAddSubtitle => '添加字幕文件…';

  @override
  String get playerCatchup => '回看';

  @override
  String get playerFullscreen => '全屏';

  @override
  String get playerError => '播放失败';

  @override
  String get playerRetry => '重试';

  @override
  String get playerPip => '画中画';

  @override
  String get playerPipReturn => '返回 App';

  @override
  String get catchupTitle => '回看';

  @override
  String get catchupNoEpg => '没有节目指南。请手动选择时间。';

  @override
  String get catchupPick => '开始时间';

  @override
  String get catchupDuration => '分钟';

  @override
  String get seriesSeason => '季';

  @override
  String get onbWelcomeTitle => '欢迎使用 BattleStation TV';

  @override
  String get onbWelcomeBody => '观看 IPTV 服务商提供的直播频道、电影和剧集。先来添加你的第一个播放源吧。';

  @override
  String get onbWhereTitle => '地址填在哪里？';

  @override
  String get onbWhereXtream =>
      'Xtream Codes：服务商会提供服务器地址（如 http://host:8080）、用户名和密码，请在下方输入。';

  @override
  String get onbWhereM3u => 'M3U：为播放源命名，然后粘贴服务商提供的播放列表链接。';

  @override
  String get fieldKind => '类型';

  @override
  String get fieldName => '名称';

  @override
  String get fieldServer => '服务器地址';

  @override
  String get fieldUsername => '用户名';

  @override
  String get fieldPassword => '密码';

  @override
  String get fieldUrl => '播放列表链接';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => '测试连接';

  @override
  String get onbTestOk => '连接成功';

  @override
  String get onbTestFail => '连接失败';

  @override
  String get onbNext => '下一步';

  @override
  String get onbBack => '上一步';

  @override
  String get onbSave => '保存并同步';

  @override
  String get settingsAccounts => '播放源';

  @override
  String get settingsLanguageSub => '首选字幕语言';

  @override
  String get settingsLanguageAudio => '首选音频语言';

  @override
  String get settingsSubscale => '字幕大小';

  @override
  String get settingsSubdelay => '字幕延迟（秒）';

  @override
  String get settingsGuide => '显示快速入门指南';

  @override
  String get settingsDelete => '删除';

  @override
  String get accountAdd => '添加播放源…';

  @override
  String get settingsChangePassword => '更改密码…';

  @override
  String get settingsNewPassword => '新密码';

  @override
  String updateAvailable(String p1) {
    return '新版本 $p1 现已可用';
  }

  @override
  String get updateNow => '立即更新';

  @override
  String get updateNotes => '更新内容';

  @override
  String get updateLater => '稍后';

  @override
  String get updateDownloading => '正在下载更新…';

  @override
  String updateReady(String p1) {
    return '版本 $p1 已准备好安装';
  }

  @override
  String get updateRestart => '重新启动以更新';

  @override
  String get updateFailed => '更新失败';

  @override
  String get updateManual => '手动下载';

  @override
  String get updateCheckNow => '检查更新';

  @override
  String get updateAuto => '自动检查更新';

  @override
  String get updateAutoInstall => '自动下载更新';

  @override
  String get updateUpToDate => '已是最新版本';

  @override
  String get updateDevBuild => '更新仅适用于已安装的 App';

  @override
  String updateCurrent(String p1) {
    return '当前版本：$p1';
  }

  @override
  String get playerBack => '返回';

  @override
  String get playerErrorHint => '如果问题持续出现，请在“设置”中检查该播放源的密码。';

  @override
  String get passwordTitle => '需要密码';

  @override
  String passwordBody(String p1) {
    return '请输入“$p1”的密码。密码会私密存储在这台 Mac 上。';
  }

  @override
  String get passwordNone => '不使用密码继续';

  @override
  String get playerSpeed => '播放速度';

  @override
  String get playerSpeedNormal => '正常';

  @override
  String get playerSpeedReset => '正常速度';

  @override
  String get settingsSeekPreview => '在进度条上显示缩略图预览';

  @override
  String get settingsSeekPreviewNote =>
      '会向服务商打开第二个连接。如果播放中断，或服务商只允许一个连接，请关闭此选项。';

  @override
  String get playerSeekBar => '播放位置';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 / $p2';
  }

  @override
  String get playerLive => '直播';

  @override
  String get playerChannelPrev => '上一个频道';

  @override
  String get playerChannelNext => '下一个频道';

  @override
  String get playerScaleFit => '适应';

  @override
  String get playerScaleFill => '填充';

  @override
  String get playerScaleStretch => '拉伸';

  @override
  String get playerSubtitleAdjust => '调整字幕…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => '亮度';

  @override
  String get playerVolume => '音量';

  @override
  String get playerReplay => '重新播放';

  @override
  String get settingsClock => '在播放器中显示时间';

  @override
  String get settingsSeekStep => '跳转步长（方向键和跳转按钮）';

  @override
  String get settingsBarsHide => '无操作后隐藏控制栏';

  @override
  String get settingsNever => '永不';

  @override
  String get settingsVideoScale => '视频缩放';

  @override
  String get settingsScaleFit => '适应（显示黑边）';

  @override
  String get settingsScaleFill => '填充（裁剪边缘）';

  @override
  String get settingsScaleStretch => '拉伸';

  @override
  String get settingsVideoScaleHint => '在播放器中按 A 键可在这三种模式间切换。';

  @override
  String get settingsBuffer => '网络缓冲';

  @override
  String get settingsBufferSmall => '小';

  @override
  String get settingsBufferNormal => '标准';

  @override
  String get settingsBufferLarge => '大';

  @override
  String get settingsBufferHint => '网络较慢或不稳定时，增大缓冲会有帮助。';

  @override
  String unitSeconds(int p1) {
    return '$p1 秒';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 分钟';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 分';
  }

  @override
  String playerSkipBack(String p1) {
    return '快退 $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return '快进 $p1';
  }

  @override
  String get playerSleep => '睡眠定时';

  @override
  String get downloadsTitle => '下载';

  @override
  String get downloadsAdd => '下载';

  @override
  String get downloadsSeason => '下载本季';

  @override
  String get downloadsChooseFolder => '选择电影和剧集的下载保存位置';

  @override
  String get downloadsChoose => '选取';

  @override
  String get downloadsNotChosen => '首次下载时询问';

  @override
  String get downloadsChange => '更改文件夹…';

  @override
  String get downloadsPause => '暂停';

  @override
  String get downloadsResume => '继续';

  @override
  String get downloadsCancel => '取消';

  @override
  String get downloadsPlay => '播放';

  @override
  String get downloadsReveal => '在访达中显示';

  @override
  String get downloadsDelete => '删除文件';

  @override
  String get downloadsEmpty => '还没有下载内容';

  @override
  String get downloadsQueued => '等待中';

  @override
  String get downloadsDone => '已完成';

  @override
  String get downloadsHint =>
      '下载按顺序逐个进行。许多服务商只允许一个连接，因此边下载边播放可能会失败。退出 App 时，未完成的下载不会保留。';

  @override
  String get epgNow => '正在播出';

  @override
  String get epgNext => '接下来';

  @override
  String get settingsFullscreen => '以全屏方式打开播放（移动鼠标前控制栏会隐藏）';

  @override
  String get nextTitle => '接下来播放';

  @override
  String nextIn(int p1) {
    return '$p1 秒后播放';
  }

  @override
  String get nextNow => '立即播放';

  @override
  String get nextCancel => '取消';

  @override
  String get settingsAutoNext => '自动播放下一集';

  @override
  String get downloadsNoSpace => '可用磁盘空间不足';

  @override
  String get dbErrorTitle => 'BattleStation TV 无法打开其数据库';

  @override
  String get dbErrorBody => '如果 BattleStation TV 的另一个副本正在运行，请退出后重试。';

  @override
  String get dbRecoveredTitle => '数据库已损坏';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV 已使用全新的数据库启动（请重新添加播放源）。损坏的文件保存在这里：\n$p1';
  }

  @override
  String get menuShowWindow => '显示窗口';

  @override
  String get settingsTabGeneral => '通用';

  @override
  String get settingsTabPlayer => '播放器';

  @override
  String get settingsTabPlaylists => '播放列表';

  @override
  String get settingsAppearance => '外观';

  @override
  String get settingsSystem => '跟随系统';

  @override
  String get appearanceLight => '浅色';

  @override
  String get appearanceDark => '深色';

  @override
  String get settingsInterfaceLanguage => '界面语言';

  @override
  String get settingsLanguageRestart => '重新启动 BattleStation TV 后生效。';

  @override
  String get settingsHideCategories => '隐藏分类';

  @override
  String get settingsHideCategoriesWords => '要隐藏的关键词';

  @override
  String get settingsHideCategoriesNote =>
      '隐藏名称包含这些词的分类（用逗号分隔）。这些分类下的频道、电影和剧集也会从搜索、收藏和继续观看中消失。这只是一个普通过滤器，并非家长控制：任何人都可以在此处更改。';

  @override
  String get settingsRefresh => '更新播放列表';

  @override
  String get settingsRefresh0 => '仅在打开 App 时';

  @override
  String get settingsRefresh6 => '每 6 小时';

  @override
  String get settingsRefresh12 => '每 12 小时';

  @override
  String get settingsRefresh24 => '每 24 小时';

  @override
  String get settingsBackup => '备份与恢复';

  @override
  String get backupExport => '导出备份…';

  @override
  String get backupImport => '导入备份…';

  @override
  String get backupWarn =>
      '备份文件会列出你的播放列表及其地址，其中可能包含登录信息，请妥善保管。Xtream 播放源的密码不会保存在其中。导入只会添加到当前的播放源，不会删除任何内容。';

  @override
  String get backupExported => '备份已保存。';

  @override
  String get backupImported => '备份已导入。';

  @override
  String get backupErrorInvalid => '这不是 BattleStation TV 备份文件。';

  @override
  String get backupErrorVersion => '此备份来自不同版本的 BattleStation TV，无法读取。';

  @override
  String get backupErrorTooLarge => '此文件过大，不可能是备份文件。';

  @override
  String get backupFailed => '备份失败';

  @override
  String get settingsClearData => '清除数据';

  @override
  String get clearHistory => '清除观看记录';

  @override
  String get clearFavorites => '清除收藏';

  @override
  String get clearImages => '清除图片缓存';

  @override
  String get clearConfirm => '清除';

  @override
  String get clearHistoryWarn => '所有播放源的续播位置和继续观看列表都将被清除。此操作无法撤销。';

  @override
  String get clearFavoritesWarn => '所有播放源中的收藏都将被移除。此操作无法撤销。';

  @override
  String get clearImagesWarn => '已保存的台标和海报将被移除，并在需要时重新下载。';

  @override
  String get infoDetails => '详情';

  @override
  String get infoPlot => '剧情简介';

  @override
  String get infoCast => '演员';

  @override
  String get infoDirector => '导演';

  @override
  String get infoGenre => '类型';

  @override
  String get infoYear => '上映年份';

  @override
  String get infoRating => '评分';

  @override
  String get infoDuration => '时长';

  @override
  String get infoCountry => '国家/地区';

  @override
  String get infoTrailer => '预告片';

  @override
  String get infoPlay => '播放';

  @override
  String get infoEmpty => '你的服务商没有这部作品的详细信息。';

  @override
  String get infoLoading => '正在加载详情…';

  @override
  String get infoError => '无法加载详情。';

  @override
  String unitHoursShort(int p1) {
    return '$p1 小时';
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
  String get playerSkipIntro => '跳过片头';

  @override
  String get playerSkipCredits => '跳过片尾';

  @override
  String get playerSkipMenu => '片头和片尾';

  @override
  String get playerMarkIntroStart => '片头从这里开始';

  @override
  String get playerMarkIntroEnd => '片头到这里结束';

  @override
  String get playerMarkCredits => '片尾从这里开始';

  @override
  String get playerSkipForget => '清除片头和片尾';

  @override
  String get playerSkipSaved => '已为该剧所有剧集保存';

  @override
  String get playerSkipRefused => '此处无法设置';

  @override
  String get continueRemove => '从“继续观看”中移除';

  @override
  String get settingsFavoritesAZ => '按名称排序收藏 (A–Z)';

  @override
  String get settingsKeychain => '将密码存储在钥匙串中';

  @override
  String get settingsKeychainNote =>
      '关闭：密码保存在应用的私有数据库中。打开：macOS 将其保存在你的登录钥匙串中。';

  @override
  String get settingsKeychainFailed => '钥匙串未接受这些密码。未做任何更改。';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => '直播';

  @override
  String get tabMovies => '電影';

  @override
  String get tabSeries => '影集';

  @override
  String get catAll => '全部';

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
  String get catFavorites => '我的最愛';

  @override
  String get catContinue => '繼續觀看';

  @override
  String get catFilter => '篩選類別';

  @override
  String get playlistAll => '所有播放清單';

  @override
  String get playlistLabel => '播放清單';

  @override
  String get aboutAcknowledgements => '致謝';

  @override
  String get aboutPrivacy => '隱私權';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV 不會蒐集任何關於你的資料。它沒有帳號、沒有分析、沒有廣告，也沒有追蹤。\n\n你的來源、我的最愛和觀看紀錄都只會保存在這部裝置上。App 只會連線到你自己加入的位址：供應商的伺服器、播放清單、節目表、頻道標誌和串流。\n\n供應商密碼僅儲存在這部裝置的 iOS Keychain 中，絕不會包含在備份檔案裡。\n\nBattleStation TV 不包含任何頻道、電影或播放清單，來源需要你自己提供。';

  @override
  String get aboutSource => '原始碼與授權';

  @override
  String get aboutCoffee => '請我喝杯咖啡';

  @override
  String get tipsTitle => '支持 BattleStation TV';

  @override
  String get tipsFooter => '透過 Apple 的自願打賞。打賞不會解鎖任何內容：所有功能對所有人都維持免費。';

  @override
  String get tipsThanks => '感謝你的支持！';

  @override
  String get tipsPending => '正在等待核准。';

  @override
  String get tipsFailed => '打賞未成功。請稍後再試。';

  @override
  String get aboutVersion => '版本';

  @override
  String get catTitle => '分類';

  @override
  String get commonCancel => '取消';

  @override
  String get emptyContinue => '沒有可繼續觀看的內容';

  @override
  String get emptyContinueHint => '看到一半的電影和影集會顯示在這裡。';

  @override
  String get emptyFavorites => '尚無我的最愛';

  @override
  String get emptyFavoritesHint => '按住某個片名，然後選擇「加入我的最愛」。';

  @override
  String get emptyFavoritesLive => '向左滑動頻道，然後輕點星號。';

  @override
  String get emptyNone => '這裡還沒有內容';

  @override
  String get emptyNoneHint => '下拉即可重新整理，或在「設定」中檢查你的來源。';

  @override
  String get fieldServerInvalid => '這個位址看起來不正確。範例：http://host:8080';

  @override
  String get fieldUrlInvalid => '請輸入完整連結，以 http:// 或 https:// 開頭';

  @override
  String get infoResume => '繼續播放';

  @override
  String get libraryEmpty => '你的資料庫是空的';

  @override
  String get libraryEmptyHint => '我的最愛和你開始觀看的內容會顯示在這裡。';

  @override
  String get onbNoChannels =>
      'BattleStation TV 不包含任何頻道、電影或播放清單。請加入你所訂閱供應商提供的來源。';

  @override
  String get onbPasteHint => '複製了播放清單連結嗎？';

  @override
  String get onbTestRunning => '正在測試…';

  @override
  String passwordBodyIos(String p1) {
    return '請輸入「$p1」的密碼。密碼儲存在這部裝置的 iOS Keychain 中。';
  }

  @override
  String get searchRecent => '最近搜尋';

  @override
  String seriesContinueEp(int p1, int p2) {
    return '繼續觀看 第$p1季第$p2集';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return '第$p1季第$p2集';
  }

  @override
  String get seriesNoEpisodes => '找不到任何集數';

  @override
  String seriesPlayEp(int p1, int p2) {
    return '播放 第$p1季第$p2集';
  }

  @override
  String get seriesWatched => '已觀看';

  @override
  String get settingsAbout => '關於';

  @override
  String get settingsEditSource => '編輯來源';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV 使用你裝置的語言。若只想為此 App 使用其他語言，請在 iOS 設定中選擇。';

  @override
  String get settingsOpenIOS => '開啟 iOS 設定';

  @override
  String get settingsPasswordNote => '新密碼留空則保留目前的密碼。密碼儲存在 iOS Keychain 中。';

  @override
  String get settingsTitle => '設定';

  @override
  String get sourceDeleteWarn => '該來源及其我的最愛和觀看紀錄將從這部裝置中移除，你的供應商帳號不受影響。';

  @override
  String get syncNow => '重新整理';

  @override
  String get tabLibrary => '資料庫';

  @override
  String get scopeCategory => '在類別中';

  @override
  String get scopeType => '在目前區段中';

  @override
  String get scopeEverywhere => '所有位置';

  @override
  String get searchPrompt => '搜尋';

  @override
  String get syncRunning => '正在同步…';

  @override
  String get syncFailed => '同步失敗';

  @override
  String get syncNotUpdated => '顯示已儲存的資料';

  @override
  String get emptyResults => '找不到任何內容';

  @override
  String get favAdd => '加入我的最愛';

  @override
  String get favRemove => '從我的最愛中移除';

  @override
  String get playerClose => '關閉';

  @override
  String get playerSubtitles => '字幕';

  @override
  String get playerAudio => '音訊';

  @override
  String get playerOff => '關閉';

  @override
  String get playerAddSubtitle => '加入字幕檔案…';

  @override
  String get playerCatchup => '回看';

  @override
  String get playerFullscreen => '全螢幕';

  @override
  String get playerError => '播放失敗';

  @override
  String get playerRetry => '重試';

  @override
  String get playerPip => '子母畫面';

  @override
  String get playerPipReturn => '返回 App';

  @override
  String get catchupTitle => '回看';

  @override
  String get catchupNoEpg => '沒有節目表。請手動選擇時間。';

  @override
  String get catchupPick => '開始時間';

  @override
  String get catchupDuration => '分鐘';

  @override
  String get seriesSeason => '季';

  @override
  String get onbWelcomeTitle => '歡迎使用 BattleStation TV';

  @override
  String get onbWelcomeBody => '觀看 IPTV 供應商提供的直播頻道、電影和影集。先來加入你的第一個來源吧。';

  @override
  String get onbWhereTitle => '位址要填在哪裡？';

  @override
  String get onbWhereXtream =>
      'Xtream Codes：供應商會提供伺服器位址（例如 http://host:8080）、使用者名稱和密碼，請在下方輸入。';

  @override
  String get onbWhereM3u => 'M3U：為來源命名，然後貼上供應商提供的播放清單連結。';

  @override
  String get fieldKind => '類型';

  @override
  String get fieldName => '名稱';

  @override
  String get fieldServer => '伺服器位址';

  @override
  String get fieldUsername => '使用者名稱';

  @override
  String get fieldPassword => '密碼';

  @override
  String get fieldUrl => '播放清單連結';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => '測試連線';

  @override
  String get onbTestOk => '連線成功';

  @override
  String get onbTestFail => '連線失敗';

  @override
  String get onbNext => '下一步';

  @override
  String get onbBack => '上一步';

  @override
  String get onbSave => '儲存並同步';

  @override
  String get settingsAccounts => '來源';

  @override
  String get settingsLanguageSub => '偏好的字幕語言';

  @override
  String get settingsLanguageAudio => '偏好的音訊語言';

  @override
  String get settingsSubscale => '字幕大小';

  @override
  String get settingsSubdelay => '字幕延遲（秒）';

  @override
  String get settingsGuide => '顯示快速入門指南';

  @override
  String get settingsDelete => '刪除';

  @override
  String get accountAdd => '加入來源…';

  @override
  String get settingsChangePassword => '更改密碼…';

  @override
  String get settingsNewPassword => '新密碼';

  @override
  String updateAvailable(String p1) {
    return '有新版本 $p1 可供使用';
  }

  @override
  String get updateNow => '立即更新';

  @override
  String get updateNotes => '更新內容';

  @override
  String get updateLater => '稍後';

  @override
  String get updateDownloading => '正在下載更新…';

  @override
  String updateReady(String p1) {
    return '版本 $p1 已可安裝';
  }

  @override
  String get updateRestart => '重新啟動以更新';

  @override
  String get updateFailed => '更新失敗';

  @override
  String get updateManual => '手動下載';

  @override
  String get updateCheckNow => '檢查更新';

  @override
  String get updateAuto => '自動檢查更新';

  @override
  String get updateAutoInstall => '自動下載更新';

  @override
  String get updateUpToDate => '你已使用最新版本';

  @override
  String get updateDevBuild => '僅已安裝的 App 才能更新';

  @override
  String updateCurrent(String p1) {
    return '目前版本：$p1';
  }

  @override
  String get playerBack => '返回';

  @override
  String get playerErrorHint => '如果持續發生，請在「設定」中檢查來源的密碼。';

  @override
  String get passwordTitle => '需要密碼';

  @override
  String passwordBody(String p1) {
    return '請輸入「$p1」的密碼。密碼會私密儲存在這部 Mac 上。';
  }

  @override
  String get passwordNone => '不使用密碼繼續';

  @override
  String get playerSpeed => '播放速度';

  @override
  String get playerSpeedNormal => '正常';

  @override
  String get playerSpeedReset => '正常速度';

  @override
  String get settingsSeekPreview => '在進度列上顯示縮圖預覽';

  @override
  String get settingsSeekPreviewNote =>
      '會向供應商開啟第二個連線。如果播放中斷，或供應商只允許單一連線，請關閉此選項。';

  @override
  String get playerSeekBar => '播放位置';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 / $p2';
  }

  @override
  String get playerLive => '直播';

  @override
  String get playerChannelPrev => '上一個頻道';

  @override
  String get playerChannelNext => '下一個頻道';

  @override
  String get playerScaleFit => '符合';

  @override
  String get playerScaleFill => '填滿';

  @override
  String get playerScaleStretch => '拉伸';

  @override
  String get playerSubtitleAdjust => '調整字幕…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => '亮度';

  @override
  String get playerVolume => '音量';

  @override
  String get playerReplay => '重新播放';

  @override
  String get settingsClock => '在播放器中顯示時間';

  @override
  String get settingsSeekStep => '跳轉間隔（方向鍵和跳轉按鈕）';

  @override
  String get settingsBarsHide => '無操作後隱藏控制項';

  @override
  String get settingsNever => '永不';

  @override
  String get settingsVideoScale => '影像縮放';

  @override
  String get settingsScaleFit => '符合（顯示黑邊）';

  @override
  String get settingsScaleFill => '填滿（裁切邊緣）';

  @override
  String get settingsScaleStretch => '延展';

  @override
  String get settingsVideoScaleHint => '在播放器中按 A 鍵可在這三種模式間切換。';

  @override
  String get settingsBuffer => '網路緩衝';

  @override
  String get settingsBufferSmall => '小';

  @override
  String get settingsBufferNormal => '標準';

  @override
  String get settingsBufferLarge => '大';

  @override
  String get settingsBufferHint => '網路速度慢或不穩定時，加大緩衝會有幫助。';

  @override
  String unitSeconds(int p1) {
    return '$p1 秒';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 分鐘';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 分';
  }

  @override
  String playerSkipBack(String p1) {
    return '倒轉 $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return '快轉 $p1';
  }

  @override
  String get playerSleep => '睡眠計時器';

  @override
  String get downloadsTitle => '下載項目';

  @override
  String get downloadsAdd => '下載';

  @override
  String get downloadsSeason => '下載本季';

  @override
  String get downloadsChooseFolder => '選擇下載的電影和影集的儲存位置';

  @override
  String get downloadsChoose => '選擇';

  @override
  String get downloadsNotChosen => '第一次下載時詢問';

  @override
  String get downloadsChange => '更改檔案夾…';

  @override
  String get downloadsPause => '暫停';

  @override
  String get downloadsResume => '繼續';

  @override
  String get downloadsCancel => '取消';

  @override
  String get downloadsPlay => '播放';

  @override
  String get downloadsReveal => '在 Finder 中顯示';

  @override
  String get downloadsDelete => '刪除檔案';

  @override
  String get downloadsEmpty => '尚無下載項目';

  @override
  String get downloadsQueued => '等待中';

  @override
  String get downloadsDone => '完成';

  @override
  String get downloadsHint =>
      '下載項目會逐一進行。許多供應商只允許單一連線，因此邊下載邊播放可能會失敗。App 結束時，尚未完成的下載項目不會保留。';

  @override
  String get epgNow => '正在播出';

  @override
  String get epgNext => '接下來';

  @override
  String get settingsFullscreen => '以全螢幕開啟播放（移動滑鼠前，控制項會保持隱藏）';

  @override
  String get nextTitle => '接下來播放';

  @override
  String nextIn(int p1) {
    return '$p1 秒後播放';
  }

  @override
  String get nextNow => '立即播放';

  @override
  String get nextCancel => '取消';

  @override
  String get settingsAutoNext => '自動播放下一集';

  @override
  String get downloadsNoSpace => '磁碟可用空間不足';

  @override
  String get dbErrorTitle => 'BattleStation TV 無法開啟其資料庫';

  @override
  String get dbErrorBody => '如果 BattleStation TV 的另一個複本正在執行，請結束後再試一次。';

  @override
  String get dbRecoveredTitle => '資料庫已損毀';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV 已使用全新的資料庫啟動（請重新加入你的來源）。損毀的檔案保存在這裡：\n$p1';
  }

  @override
  String get menuShowWindow => '顯示視窗';

  @override
  String get settingsTabGeneral => '一般';

  @override
  String get settingsTabPlayer => '播放器';

  @override
  String get settingsTabPlaylists => '播放清單';

  @override
  String get settingsAppearance => '外觀';

  @override
  String get settingsSystem => '跟隨系統';

  @override
  String get appearanceLight => '淺色';

  @override
  String get appearanceDark => '深色';

  @override
  String get settingsInterfaceLanguage => '介面語言';

  @override
  String get settingsLanguageRestart => '重新啟動 BattleStation TV 後生效。';

  @override
  String get settingsHideCategories => '隱藏類別';

  @override
  String get settingsHideCategoriesWords => '要隱藏的字詞';

  @override
  String get settingsHideCategoriesNote =>
      '隱藏名稱包含這些字詞的類別（以逗號分隔）。這些類別中的頻道、電影和影集也會從搜尋、我的最愛和繼續觀看中消失。這只是一般篩選器，並非家長監護功能：任何人都可以在此處更改。';

  @override
  String get settingsRefresh => '更新播放清單';

  @override
  String get settingsRefresh0 => '僅在開啟 App 時';

  @override
  String get settingsRefresh6 => '每 6 小時';

  @override
  String get settingsRefresh12 => '每 12 小時';

  @override
  String get settingsRefresh24 => '每 24 小時';

  @override
  String get settingsBackup => '備份與還原';

  @override
  String get backupExport => '匯出備份…';

  @override
  String get backupImport => '匯入備份…';

  @override
  String get backupWarn =>
      '備份檔案會列出你的播放清單及其位址，其中可能包含登入資訊，請妥善保管。Xtream 來源的密碼不會儲存在其中。匯入只會加入到目前的來源，不會刪除任何內容。';

  @override
  String get backupExported => '備份已儲存。';

  @override
  String get backupImported => '備份已匯入。';

  @override
  String get backupErrorInvalid => '這不是 BattleStation TV 備份檔案。';

  @override
  String get backupErrorVersion => '此備份來自不同版本的 BattleStation TV，無法讀取。';

  @override
  String get backupErrorTooLarge => '此檔案太大，不可能是備份檔案。';

  @override
  String get backupFailed => '備份失敗';

  @override
  String get settingsClearData => '清除資料';

  @override
  String get clearHistory => '清除觀看紀錄';

  @override
  String get clearFavorites => '清除我的最愛';

  @override
  String get clearImages => '清除圖片快取';

  @override
  String get clearConfirm => '清除';

  @override
  String get clearHistoryWarn => '所有來源的續播位置和「繼續觀看」清單都將被清除。此動作無法還原。';

  @override
  String get clearFavoritesWarn => '所有來源中的我的最愛都將被移除。此動作無法還原。';

  @override
  String get clearImagesWarn => '已儲存的頻道圖示和海報將被移除，並在需要時重新下載。';

  @override
  String get infoDetails => '詳細資訊';

  @override
  String get infoPlot => '劇情簡介';

  @override
  String get infoCast => '演員';

  @override
  String get infoDirector => '導演';

  @override
  String get infoGenre => '類型';

  @override
  String get infoYear => '上映年份';

  @override
  String get infoRating => '評分';

  @override
  String get infoDuration => '片長';

  @override
  String get infoCountry => '國家/地區';

  @override
  String get infoTrailer => '預告片';

  @override
  String get infoPlay => '播放';

  @override
  String get infoEmpty => '你的服務供應商沒有這部作品的詳細資訊。';

  @override
  String get infoLoading => '正在載入詳細資訊…';

  @override
  String get infoError => '無法載入詳細資訊。';

  @override
  String unitHoursShort(int p1) {
    return '$p1 小時';
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
  String get playerSkipIntro => '跳過片頭';

  @override
  String get playerSkipCredits => '跳過片尾';

  @override
  String get playerSkipMenu => '片頭與片尾';

  @override
  String get playerMarkIntroStart => '片頭從這裡開始';

  @override
  String get playerMarkIntroEnd => '片頭到這裡結束';

  @override
  String get playerMarkCredits => '片尾從這裡開始';

  @override
  String get playerSkipForget => '清除片頭與片尾';

  @override
  String get playerSkipSaved => '已為此影集所有集數儲存';

  @override
  String get playerSkipRefused => '此處無法設定';

  @override
  String get continueRemove => '從「繼續觀看」中移除';

  @override
  String get settingsFavoritesAZ => '依名稱排序我的最愛 (A–Z)';

  @override
  String get settingsKeychain => '將密碼儲存在鑰匙圈中';

  @override
  String get settingsKeychainNote =>
      '關閉：密碼保存在 App 的私人資料庫中。開啟：macOS 將其保存在你的登入鑰匙圈中。';

  @override
  String get settingsKeychainFailed => '鑰匙圈未接受這些密碼。未做任何變更。';
}
