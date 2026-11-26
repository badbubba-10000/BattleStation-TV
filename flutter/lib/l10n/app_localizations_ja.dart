// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'ライブ';

  @override
  String get tabMovies => '映画';

  @override
  String get tabSeries => 'シリーズ';

  @override
  String get catAll => 'すべて';

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
  String get catFavorites => 'お気に入り';

  @override
  String get catContinue => '続きを見る';

  @override
  String get catFilter => 'カテゴリを絞り込む';

  @override
  String get playlistAll => 'すべてのプレイリスト';

  @override
  String get playlistLabel => 'プレイリスト';

  @override
  String get aboutAcknowledgements => '謝辞';

  @override
  String get aboutPrivacy => 'プライバシー';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TVは、あなたに関するデータを一切収集しません。アカウント、解析、広告、トラッキングはありません。\n\nソース、お気に入り、視聴履歴はこのデバイスに保存されたままです。アプリが接続するのは、ご自身で追加したアドレス（プロバイダのサーバ、プレイリスト、番組表、ロゴ、ストリーム）のみです。\n\nプロバイダのパスワードは、このデバイスのiOS Keychainにのみ保存され、バックアップファイルには含まれません。\n\nBattleStation TVにはチャンネル、映画、プレイリストは含まれていません。ソースはご自身でご用意ください。';

  @override
  String get aboutSource => 'ソースコードとライセンス';

  @override
  String get aboutCoffee => 'コーヒーをおごる';

  @override
  String get tipsTitle => 'BattleStation TVを応援する';

  @override
  String get tipsFooter => 'Apple経由の任意のチップです。何も解除されません。すべての機能は誰でも無料のままです。';

  @override
  String get tipsThanks => 'ご支援ありがとうございます！';

  @override
  String get tipsPending => '承認待ちです。';

  @override
  String get tipsFailed => 'チップを送れませんでした。後でもう一度お試しください。';

  @override
  String get aboutVersion => 'バージョン';

  @override
  String get catTitle => 'カテゴリ';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get emptyContinue => '続きから見る作品はありません';

  @override
  String get emptyContinueHint => '途中でやめた映画やエピソードがここに表示されます。';

  @override
  String get emptyFavorites => 'お気に入りはまだありません';

  @override
  String get emptyFavoritesHint => 'タイトルを長押しして、「お気に入りに追加」を選びます。';

  @override
  String get emptyFavoritesLive => 'チャンネルを左にスワイプして、星をタップします。';

  @override
  String get emptyNone => 'まだ何もありません';

  @override
  String get emptyNoneHint => '下に引っ張って更新するか、設定でソースを確認してください。';

  @override
  String get fieldServerInvalid => 'このアドレスは正しくないようです。例：http://host:8080';

  @override
  String get fieldUrlInvalid => 'http://またはhttps://で始まる完全なリンクを入力してください';

  @override
  String get infoResume => '続きから再生';

  @override
  String get libraryEmpty => 'ライブラリは空です';

  @override
  String get libraryEmptyHint => 'お気に入りと、視聴を始めたタイトルがここに表示されます。';

  @override
  String get onbNoChannels =>
      'BattleStation TVにはチャンネル、映画、プレイリストは含まれていません。契約しているプロバイダのソースを追加してください。';

  @override
  String get onbPasteHint => 'プレイリストのリンクをコピーしましたか？';

  @override
  String get onbTestRunning => 'テスト中…';

  @override
  String passwordBodyIos(String p1) {
    return '「$p1」のパスワードを入力してください。パスワードはこのデバイスのiOS Keychainに保存されます。';
  }

  @override
  String get searchRecent => '最近の検索';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'S$p1 第$p2話の続き';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'S$p1 第$p2話';
  }

  @override
  String get seriesNoEpisodes => 'エピソードが見つかりません';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'S$p1 第$p2話を再生';
  }

  @override
  String get seriesWatched => '視聴済み';

  @override
  String get settingsAbout => 'このアプリについて';

  @override
  String get settingsEditSource => 'ソースを編集';

  @override
  String get settingsLanguageNote =>
      'BattleStation TVはデバイスの言語を使用します。このアプリだけ別の言語にするには、iOSの設定で選択してください。';

  @override
  String get settingsOpenIOS => 'iOSの設定を開く';

  @override
  String get settingsPasswordNote =>
      '現在のパスワードを変更しない場合は、新しいパスワードを空欄のままにしてください。パスワードはiOS Keychainに保存されます。';

  @override
  String get settingsTitle => '設定';

  @override
  String get sourceDeleteWarn =>
      'ソース、そのお気に入り、視聴履歴がこのデバイスから削除されます。プロバイダのアカウントには影響しません。';

  @override
  String get syncNow => '更新';

  @override
  String get tabLibrary => 'ライブラリ';

  @override
  String get scopeCategory => 'カテゴリ内';

  @override
  String get scopeType => 'セクション内';

  @override
  String get scopeEverywhere => 'すべて';

  @override
  String get searchPrompt => '検索';

  @override
  String get syncRunning => '同期中…';

  @override
  String get syncFailed => '同期に失敗しました';

  @override
  String get syncNotUpdated => '保存済みのデータを表示中';

  @override
  String get emptyResults => '見つかりませんでした';

  @override
  String get favAdd => 'お気に入りに追加';

  @override
  String get favRemove => 'お気に入りから削除';

  @override
  String get playerClose => '閉じる';

  @override
  String get playerSubtitles => '字幕';

  @override
  String get playerAudio => '音声';

  @override
  String get playerOff => 'オフ';

  @override
  String get playerAddSubtitle => '字幕ファイルを追加…';

  @override
  String get playerCatchup => '見逃し視聴';

  @override
  String get playerFullscreen => 'フルスクリーン';

  @override
  String get playerError => '再生できませんでした';

  @override
  String get playerRetry => '再試行';

  @override
  String get playerPip => 'ピクチャインピクチャ';

  @override
  String get playerPipReturn => 'アプリに戻る';

  @override
  String get catchupTitle => '見逃し視聴';

  @override
  String get catchupNoEpg => '番組表がありません。時刻を手動で選んでください。';

  @override
  String get catchupPick => '開始時刻';

  @override
  String get catchupDuration => '分';

  @override
  String get seriesSeason => 'シーズン';

  @override
  String get onbWelcomeTitle => 'BattleStation TVへようこそ';

  @override
  String get onbWelcomeBody =>
      'IPTVプロバイダのライブチャンネル、映画、シリーズを視聴できます。まず最初のソースを追加しましょう。';

  @override
  String get onbWhereTitle => 'アドレスはどこに入力しますか？';

  @override
  String get onbWhereXtream =>
      'Xtream Codes：プロバイダからサーバアドレス（例：http://host:8080）、ユーザ名、パスワードが提供されます。下に入力してください。';

  @override
  String get onbWhereM3u => 'M3U：ソースに名前を付けて、プロバイダから提供されたプレイリストのリンクをペーストしてください。';

  @override
  String get fieldKind => '種類';

  @override
  String get fieldName => '名前';

  @override
  String get fieldServer => 'サーバアドレス';

  @override
  String get fieldUsername => 'ユーザ名';

  @override
  String get fieldPassword => 'パスワード';

  @override
  String get fieldUrl => 'プレイリストのリンク';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => '接続をテスト';

  @override
  String get onbTestOk => '接続に成功しました';

  @override
  String get onbTestFail => '接続に失敗しました';

  @override
  String get onbNext => '次へ';

  @override
  String get onbBack => '戻る';

  @override
  String get onbSave => '保存して同期';

  @override
  String get settingsAccounts => 'ソース';

  @override
  String get settingsLanguageSub => '優先する字幕の言語';

  @override
  String get settingsLanguageAudio => '優先する音声の言語';

  @override
  String get settingsSubscale => '字幕のサイズ';

  @override
  String get settingsSubdelay => '字幕の遅延（秒）';

  @override
  String get settingsGuide => 'クイックスタートガイドを表示';

  @override
  String get settingsDelete => '削除';

  @override
  String get accountAdd => 'ソースを追加…';

  @override
  String get settingsChangePassword => 'パスワードを変更…';

  @override
  String get settingsNewPassword => '新しいパスワード';

  @override
  String updateAvailable(String p1) {
    return 'バージョン $p1 が利用可能です';
  }

  @override
  String get updateNow => '今すぐアップデート';

  @override
  String get updateNotes => '新機能';

  @override
  String get updateLater => 'あとで';

  @override
  String get updateDownloading => 'アップデートをダウンロード中…';

  @override
  String updateReady(String p1) {
    return 'バージョン $p1 をインストールする準備ができました';
  }

  @override
  String get updateRestart => '再起動してアップデート';

  @override
  String get updateFailed => 'アップデートに失敗しました';

  @override
  String get updateManual => '手動でダウンロード';

  @override
  String get updateCheckNow => 'アップデートを確認';

  @override
  String get updateAuto => 'アップデートを自動的に確認';

  @override
  String get updateAutoInstall => 'アップデートを自動的にダウンロード';

  @override
  String get updateUpToDate => '最新バージョンです';

  @override
  String get updateDevBuild => 'アップデートはインストール済みのアプリでのみ利用できます';

  @override
  String updateCurrent(String p1) {
    return '現在のバージョン：$p1';
  }

  @override
  String get playerBack => '戻る';

  @override
  String get playerErrorHint => 'この問題が続く場合は、設定でソースのパスワードを確認してください。';

  @override
  String get passwordTitle => 'パスワードが必要です';

  @override
  String passwordBody(String p1) {
    return '「$p1」のパスワードを入力してください。パスワードはこのMac内に非公開で保存されます。';
  }

  @override
  String get passwordNone => 'パスワードなしで続ける';

  @override
  String get playerSpeed => '再生速度';

  @override
  String get playerSpeedNormal => '標準';

  @override
  String get playerSpeedReset => '標準速度';

  @override
  String get settingsSeekPreview => 'シークバーにサムネイルを表示';

  @override
  String get settingsSeekPreviewNote =>
      'プロバイダへの2つ目の接続を開きます。再生が止まる場合や、プロバイダが接続を1つしか許可していない場合は、オフにしてください。';

  @override
  String get playerSeekBar => '再生位置';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 / $p2';
  }

  @override
  String get playerLive => 'ライブ';

  @override
  String get playerChannelPrev => '前のチャンネル';

  @override
  String get playerChannelNext => '次のチャンネル';

  @override
  String get playerScaleFit => 'フィット';

  @override
  String get playerScaleFill => '塗りつぶし';

  @override
  String get playerScaleStretch => '引き伸ばし';

  @override
  String get playerSubtitleAdjust => '字幕を調整…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => '明るさ';

  @override
  String get playerVolume => '音量';

  @override
  String get playerReplay => 'もう一度再生';

  @override
  String get settingsClock => 'プレーヤーに時刻を表示';

  @override
  String get settingsSeekStep => 'スキップ間隔（矢印キーとスキップボタン）';

  @override
  String get settingsBarsHide => 'コントロールを自動的に隠すまでの時間';

  @override
  String get settingsNever => 'しない';

  @override
  String get settingsVideoScale => 'ビデオのスケール';

  @override
  String get settingsScaleFit => 'フィット（黒帯あり）';

  @override
  String get settingsScaleFill => '塗りつぶし（端が切れます）';

  @override
  String get settingsScaleStretch => '引き伸ばし';

  @override
  String get settingsVideoScaleHint => 'プレーヤーでAキーを押すと、3つのモードを切り替えられます。';

  @override
  String get settingsBuffer => 'ネットワークバッファ';

  @override
  String get settingsBufferSmall => '小';

  @override
  String get settingsBufferNormal => '標準';

  @override
  String get settingsBufferLarge => '大';

  @override
  String get settingsBufferHint => '接続が遅い、または不安定な場合は、バッファを大きくすると改善されます。';

  @override
  String unitSeconds(int p1) {
    return '$p1秒';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1分';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1分';
  }

  @override
  String playerSkipBack(String p1) {
    return '$p1戻る';
  }

  @override
  String playerSkipForward(String p1) {
    return '$p1進む';
  }

  @override
  String get playerSleep => 'スリープタイマー';

  @override
  String get downloadsTitle => 'ダウンロード';

  @override
  String get downloadsAdd => 'ダウンロード';

  @override
  String get downloadsSeason => 'シーズンをダウンロード';

  @override
  String get downloadsChooseFolder => 'ダウンロードした映画とエピソードの保存先を選択してください';

  @override
  String get downloadsChoose => '選択';

  @override
  String get downloadsNotChosen => '最初のダウンロード時に確認します';

  @override
  String get downloadsChange => 'フォルダを変更…';

  @override
  String get downloadsPause => '一時停止';

  @override
  String get downloadsResume => '再開';

  @override
  String get downloadsCancel => 'キャンセル';

  @override
  String get downloadsPlay => '再生';

  @override
  String get downloadsReveal => 'Finderで表示';

  @override
  String get downloadsDelete => 'ファイルを削除';

  @override
  String get downloadsEmpty => 'ダウンロードはまだありません';

  @override
  String get downloadsQueued => '待機中';

  @override
  String get downloadsDone => '完了';

  @override
  String get downloadsHint =>
      'ダウンロードは1つずつ実行されます。多くのプロバイダは接続を1つしか許可しないため、ダウンロード中の再生は失敗することがあります。未完了のダウンロードは、アプリを終了すると保持されません。';

  @override
  String get epgNow => '放送中';

  @override
  String get epgNext => '次の番組';

  @override
  String get settingsFullscreen => '再生をフルスクリーンで開く（マウスを動かすまでコントロールは非表示）';

  @override
  String get nextTitle => '次に再生';

  @override
  String nextIn(int p1) {
    return '$p1秒後に再生';
  }

  @override
  String get nextNow => '今すぐ再生';

  @override
  String get nextCancel => 'キャンセル';

  @override
  String get settingsAutoNext => '次のエピソードを自動的に再生';

  @override
  String get downloadsNoSpace => 'ディスクの空き容量が足りません';

  @override
  String get dbErrorTitle => 'BattleStation TVがデータベースを開けません';

  @override
  String get dbErrorBody => 'BattleStation TVの別のコピーが実行中の場合は、終了してからもう一度お試しください。';

  @override
  String get dbRecoveredTitle => 'データベースが破損していました';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TVは新しいデータベースで起動しました（ソースをもう一度追加してください）。破損したファイルはここに保存されています：\n$p1';
  }

  @override
  String get menuShowWindow => 'ウインドウを表示';

  @override
  String get settingsTabGeneral => '一般';

  @override
  String get settingsTabPlayer => 'プレーヤー';

  @override
  String get settingsTabPlaylists => 'プレイリスト';

  @override
  String get settingsAppearance => '外観';

  @override
  String get settingsSystem => 'システム';

  @override
  String get appearanceLight => 'ライト';

  @override
  String get appearanceDark => 'ダーク';

  @override
  String get settingsInterfaceLanguage => 'インターフェイスの言語';

  @override
  String get settingsLanguageRestart => 'BattleStation TVを再起動すると反映されます。';

  @override
  String get settingsHideCategories => 'カテゴリを非表示';

  @override
  String get settingsHideCategoriesWords => '非表示にする単語';

  @override
  String get settingsHideCategoriesNote =>
      '名前にこれらの単語を含むカテゴリを非表示にします（カンマで区切ります）。それらのチャンネル、映画、シリーズも、検索、お気に入り、続きを見るから消えます。これは単なるフィルタであり、ペアレンタルコントロールではありません。誰でもここで変更できます。';

  @override
  String get settingsRefresh => 'プレイリストを更新';

  @override
  String get settingsRefresh0 => 'アプリを開いたときのみ';

  @override
  String get settingsRefresh6 => '6時間ごと';

  @override
  String get settingsRefresh12 => '12時間ごと';

  @override
  String get settingsRefresh24 => '24時間ごと';

  @override
  String get settingsBackup => 'バックアップと復元';

  @override
  String get backupExport => 'バックアップを書き出す…';

  @override
  String get backupImport => 'バックアップを読み込む…';

  @override
  String get backupWarn =>
      'バックアップファイルにはプレイリストとそのアドレスが含まれ、ログイン情報が含まれる場合があるため、他人に見られないよう管理してください。Xtreamソースのパスワードは保存されません。読み込みでは現在のソースに追加され、何も削除されません。';

  @override
  String get backupExported => 'バックアップを保存しました。';

  @override
  String get backupImported => 'バックアップを読み込みました。';

  @override
  String get backupErrorInvalid => 'BattleStation TVのバックアップファイルではありません。';

  @override
  String get backupErrorVersion =>
      'このバックアップは別のバージョンのBattleStation TVのもので、読み込めません。';

  @override
  String get backupErrorTooLarge => 'ファイルが大きすぎるため、バックアップではありません。';

  @override
  String get backupFailed => 'バックアップに失敗しました';

  @override
  String get settingsClearData => 'データを消去';

  @override
  String get clearHistory => '視聴履歴を消去';

  @override
  String get clearFavorites => 'お気に入りを消去';

  @override
  String get clearImages => '画像キャッシュを消去';

  @override
  String get clearConfirm => '消去';

  @override
  String get clearHistoryWarn => 'すべてのソースの再開位置と「続きを見る」リストが消去されます。この操作は取り消せません。';

  @override
  String get clearFavoritesWarn => 'すべてのソースのお気に入りが削除されます。この操作は取り消せません。';

  @override
  String get clearImagesWarn => '保存されたロゴとポスターが削除され、必要に応じて再ダウンロードされます。';

  @override
  String get infoDetails => '詳細';

  @override
  String get infoPlot => 'あらすじ';

  @override
  String get infoCast => 'キャスト';

  @override
  String get infoDirector => '監督';

  @override
  String get infoGenre => 'ジャンル';

  @override
  String get infoYear => '公開年';

  @override
  String get infoRating => '評価';

  @override
  String get infoDuration => '再生時間';

  @override
  String get infoCountry => '国';

  @override
  String get infoTrailer => '予告編';

  @override
  String get infoPlay => '再生';

  @override
  String get infoEmpty => 'プロバイダーにこの作品の詳細情報はありません。';

  @override
  String get infoLoading => '詳細を読み込み中…';

  @override
  String get infoError => '詳細を読み込めませんでした。';

  @override
  String unitHoursShort(int p1) {
    return '$p1時間';
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
  String get playerSkipIntro => 'イントロをスキップ';

  @override
  String get playerSkipCredits => 'クレジットをスキップ';

  @override
  String get playerSkipMenu => 'イントロとクレジット';

  @override
  String get playerMarkIntroStart => 'ここからイントロ';

  @override
  String get playerMarkIntroEnd => 'ここでイントロ終了';

  @override
  String get playerMarkCredits => 'ここからクレジット';

  @override
  String get playerSkipForget => 'イントロとクレジットを削除';

  @override
  String get playerSkipSaved => 'このシリーズの全エピソードに保存しました';

  @override
  String get playerSkipRefused => 'この位置では設定できません';

  @override
  String get continueRemove => '「続きを見る」から削除';

  @override
  String get settingsFavoritesAZ => 'お気に入りを名前順に並べる (A–Z)';

  @override
  String get settingsKeychain => 'パスワードをキーチェーンに保存';

  @override
  String get settingsKeychainNote =>
      'オフ：パスワードはアプリ専用のデータベースに保存されます。オン：macOS がログインキーチェーンに保存します。';

  @override
  String get settingsKeychainFailed => 'キーチェーンがパスワードを受け付けませんでした。何も変更されていません。';
}
