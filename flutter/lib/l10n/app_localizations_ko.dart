// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => '라이브';

  @override
  String get tabMovies => '영화';

  @override
  String get tabSeries => '시리즈';

  @override
  String get catAll => '전체';

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
  String get catFavorites => '즐겨찾기';

  @override
  String get catContinue => '이어보기';

  @override
  String get catFilter => '카테고리 필터';

  @override
  String get playlistAll => '모든 재생목록';

  @override
  String get playlistLabel => '재생목록';

  @override
  String get aboutAcknowledgements => '감사의 말';

  @override
  String get aboutPrivacy => '개인정보 보호';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV은 사용자에 대한 어떤 데이터도 수집하지 않습니다. 계정, 분석, 광고, 추적이 없습니다.\n\n소스, 즐겨찾기, 시청 기록은 이 기기에만 저장됩니다. 앱은 사용자가 직접 추가한 주소(제공업체의 서버, 재생목록, 편성표, 로고, 스트림)에만 연결합니다.\n\n제공업체 암호는 이 기기의 iOS Keychain에만 보관되며 백업 파일에는 절대 포함되지 않습니다.\n\nBattleStation TV에는 채널, 영화, 재생목록이 포함되어 있지 않습니다. 소스는 직접 준비해야 합니다.';

  @override
  String get aboutSource => '소스 코드 및 라이선스';

  @override
  String get aboutCoffee => '커피 한 잔 사 주기';

  @override
  String get tipsTitle => 'BattleStation TV 후원하기';

  @override
  String get tipsFooter =>
      'Apple을 통한 선택적 팁입니다. 아무것도 잠금 해제되지 않으며, 모든 기능은 누구에게나 무료로 유지됩니다.';

  @override
  String get tipsThanks => '후원해 주셔서 감사합니다!';

  @override
  String get tipsPending => '승인 대기 중입니다.';

  @override
  String get tipsFailed => '팁이 처리되지 않았습니다. 나중에 다시 시도하세요.';

  @override
  String get aboutVersion => '버전';

  @override
  String get catTitle => '카테고리';

  @override
  String get commonCancel => '취소';

  @override
  String get emptyContinue => '이어볼 항목이 없습니다';

  @override
  String get emptyContinueHint => '보다가 멈춘 영화와 에피소드가 여기에 표시됩니다.';

  @override
  String get emptyFavorites => '즐겨찾기가 아직 없습니다';

  @override
  String get emptyFavoritesHint => '제목을 길게 누른 다음 ‘즐겨찾기에 추가’를 선택하세요.';

  @override
  String get emptyFavoritesLive => '채널을 왼쪽으로 쓸어 넘긴 다음 별을 탭하세요.';

  @override
  String get emptyNone => '아직 아무것도 없습니다';

  @override
  String get emptyNoneHint => '아래로 당겨 새로 고치거나 설정에서 소스를 확인하세요.';

  @override
  String get fieldServerInvalid => '이 주소가 올바르지 않은 것 같습니다. 예: http://host:8080';

  @override
  String get fieldUrlInvalid => 'http:// 또는 https://로 시작하는 전체 링크를 입력하세요';

  @override
  String get infoResume => '이어서 재생';

  @override
  String get libraryEmpty => '보관함이 비어 있습니다';

  @override
  String get libraryEmptyHint => '즐겨찾기와 시청을 시작한 제목이 여기에 표시됩니다.';

  @override
  String get onbNoChannels =>
      'BattleStation TV에는 채널, 영화, 재생목록이 포함되어 있지 않습니다. 가입한 제공업체의 소스를 추가하세요.';

  @override
  String get onbPasteHint => '재생목록 링크를 복사하셨나요?';

  @override
  String get onbTestRunning => '테스트 중…';

  @override
  String passwordBodyIos(String p1) {
    return '“$p1”의 암호를 입력하세요. 암호는 이 기기의 iOS Keychain에 저장됩니다.';
  }

  @override
  String get searchRecent => '최근 검색어';

  @override
  String seriesContinueEp(int p1, int p2) {
    return '$p1시즌 $p2화 이어보기';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return '$p1시즌 $p2화';
  }

  @override
  String get seriesNoEpisodes => '에피소드를 찾을 수 없습니다';

  @override
  String seriesPlayEp(int p1, int p2) {
    return '$p1시즌 $p2화 재생';
  }

  @override
  String get seriesWatched => '시청함';

  @override
  String get settingsAbout => '정보';

  @override
  String get settingsEditSource => '소스 편집';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV은 기기의 언어를 사용합니다. 이 앱에만 다른 언어를 쓰려면 iOS 설정에서 선택하세요.';

  @override
  String get settingsOpenIOS => 'iOS 설정 열기';

  @override
  String get settingsPasswordNote =>
      '현재 암호를 유지하려면 새 암호를 비워 두세요. 암호는 iOS Keychain에 저장됩니다.';

  @override
  String get settingsTitle => '설정';

  @override
  String get sourceDeleteWarn =>
      '소스와 해당 즐겨찾기 및 시청 기록이 이 기기에서 삭제됩니다. 제공업체 계정에는 영향이 없습니다.';

  @override
  String get syncNow => '새로 고침';

  @override
  String get tabLibrary => '보관함';

  @override
  String get scopeCategory => '카테고리 내';

  @override
  String get scopeType => '섹션 내';

  @override
  String get scopeEverywhere => '모든 곳';

  @override
  String get searchPrompt => '검색';

  @override
  String get syncRunning => '동기화 중…';

  @override
  String get syncFailed => '동기화 실패';

  @override
  String get syncNotUpdated => '저장된 데이터 표시 중';

  @override
  String get emptyResults => '결과 없음';

  @override
  String get favAdd => '즐겨찾기에 추가';

  @override
  String get favRemove => '즐겨찾기에서 제거';

  @override
  String get playerClose => '닫기';

  @override
  String get playerSubtitles => '자막';

  @override
  String get playerAudio => '오디오';

  @override
  String get playerOff => '끔';

  @override
  String get playerAddSubtitle => '자막 파일 추가…';

  @override
  String get playerCatchup => '지난 방송 보기';

  @override
  String get playerFullscreen => '전체 화면';

  @override
  String get playerError => '재생하지 못했습니다';

  @override
  String get playerRetry => '다시 시도';

  @override
  String get playerPip => '화면 속 화면';

  @override
  String get playerPipReturn => '앱으로 돌아가기';

  @override
  String get catchupTitle => '다시보기';

  @override
  String get catchupNoEpg => '편성표가 없습니다. 시간을 직접 선택하세요.';

  @override
  String get catchupPick => '시작 시간';

  @override
  String get catchupDuration => '분';

  @override
  String get seriesSeason => '시즌';

  @override
  String get onbWelcomeTitle => 'BattleStation TV에 오신 것을 환영합니다';

  @override
  String get onbWelcomeBody =>
      'IPTV 제공업체의 라이브 채널, 영화, 시리즈를 시청하세요. 먼저 첫 번째 소스를 추가해 봅시다.';

  @override
  String get onbWhereTitle => '주소는 어디에 입력하나요?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: 제공업체에서 서버 주소(예: http://host:8080), 사용자 이름, 암호를 알려 줍니다. 아래에 입력하세요.';

  @override
  String get onbWhereM3u => 'M3U: 소스 이름을 지정하고 제공업체에서 받은 재생목록 링크를 붙여넣으세요.';

  @override
  String get fieldKind => '유형';

  @override
  String get fieldName => '이름';

  @override
  String get fieldServer => '서버 주소';

  @override
  String get fieldUsername => '사용자 이름';

  @override
  String get fieldPassword => '암호';

  @override
  String get fieldUrl => '재생목록 링크';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => '연결 테스트';

  @override
  String get onbTestOk => '연결되었습니다';

  @override
  String get onbTestFail => '연결하지 못했습니다';

  @override
  String get onbNext => '다음';

  @override
  String get onbBack => '이전';

  @override
  String get onbSave => '저장 후 동기화';

  @override
  String get settingsAccounts => '소스';

  @override
  String get settingsLanguageSub => '선호하는 자막 언어';

  @override
  String get settingsLanguageAudio => '선호하는 오디오 언어';

  @override
  String get settingsSubscale => '자막 크기';

  @override
  String get settingsSubdelay => '자막 지연(초)';

  @override
  String get settingsGuide => '빠른 시작 가이드 보기';

  @override
  String get settingsDelete => '삭제';

  @override
  String get accountAdd => '소스 추가…';

  @override
  String get settingsChangePassword => '암호 변경…';

  @override
  String get settingsNewPassword => '새 암호';

  @override
  String updateAvailable(String p1) {
    return '새 버전 $p1 사용 가능';
  }

  @override
  String get updateNow => '지금 업데이트';

  @override
  String get updateNotes => '새로운 기능';

  @override
  String get updateLater => '나중에';

  @override
  String get updateDownloading => '업데이트 다운로드 중…';

  @override
  String updateReady(String p1) {
    return '버전 $p1 설치 준비 완료';
  }

  @override
  String get updateRestart => '다시 시작하여 업데이트';

  @override
  String get updateFailed => '업데이트하지 못했습니다';

  @override
  String get updateManual => '직접 다운로드';

  @override
  String get updateCheckNow => '업데이트 확인';

  @override
  String get updateAuto => '업데이트 자동 확인';

  @override
  String get updateAutoInstall => '업데이트 자동 다운로드';

  @override
  String get updateUpToDate => '최신 버전을 사용 중입니다';

  @override
  String get updateDevBuild => '업데이트는 설치된 앱에서만 사용할 수 있습니다';

  @override
  String updateCurrent(String p1) {
    return '현재 버전: $p1';
  }

  @override
  String get playerBack => '뒤로';

  @override
  String get playerErrorHint => '문제가 계속되면 설정에서 소스의 암호를 확인하세요.';

  @override
  String get passwordTitle => '암호 필요';

  @override
  String passwordBody(String p1) {
    return '“$p1”의 암호를 입력하세요. 암호는 이 Mac에 비공개로 저장됩니다.';
  }

  @override
  String get passwordNone => '암호 없이 계속';

  @override
  String get playerSpeed => '재생 속도';

  @override
  String get playerSpeedNormal => '보통';

  @override
  String get playerSpeedReset => '보통 속도';

  @override
  String get settingsSeekPreview => '탐색 막대에 미리보기 썸네일 표시';

  @override
  String get settingsSeekPreviewNote =>
      '제공업체에 두 번째 연결을 엽니다. 재생이 멈추거나 제공업체가 연결을 하나만 허용하면 끄세요.';

  @override
  String get playerSeekBar => '재생 위치';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 / $p2';
  }

  @override
  String get playerLive => '라이브';

  @override
  String get playerChannelPrev => '이전 채널';

  @override
  String get playerChannelNext => '다음 채널';

  @override
  String get playerScaleFit => '맞춤';

  @override
  String get playerScaleFill => '채우기';

  @override
  String get playerScaleStretch => '늘이기';

  @override
  String get playerSubtitleAdjust => '자막 조정…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => '밝기';

  @override
  String get playerVolume => '볼륨';

  @override
  String get playerReplay => '다시 재생';

  @override
  String get settingsClock => '플레이어에 시간 표시';

  @override
  String get settingsSeekStep => '건너뛰기 간격(방향키 및 건너뛰기 버튼)';

  @override
  String get settingsBarsHide => '컨트롤 자동 숨김 시간';

  @override
  String get settingsNever => '안 함';

  @override
  String get settingsVideoScale => '비디오 크기 조절';

  @override
  String get settingsScaleFit => '맞춤(검은 막대 표시)';

  @override
  String get settingsScaleFill => '채우기(가장자리 잘림)';

  @override
  String get settingsScaleStretch => '늘이기';

  @override
  String get settingsVideoScaleHint => '플레이어에서 A 키를 누르면 세 가지 방식 간에 전환됩니다.';

  @override
  String get settingsBuffer => '네트워크 버퍼';

  @override
  String get settingsBufferSmall => '작음';

  @override
  String get settingsBufferNormal => '보통';

  @override
  String get settingsBufferLarge => '큼';

  @override
  String get settingsBufferHint => '연결이 느리거나 불안정할 때는 버퍼를 크게 하면 도움이 됩니다.';

  @override
  String unitSeconds(int p1) {
    return '$p1초';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1분';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1분';
  }

  @override
  String playerSkipBack(String p1) {
    return '$p1 뒤로';
  }

  @override
  String playerSkipForward(String p1) {
    return '$p1 앞으로';
  }

  @override
  String get playerSleep => '잠자기 타이머';

  @override
  String get downloadsTitle => '다운로드';

  @override
  String get downloadsAdd => '다운로드';

  @override
  String get downloadsSeason => '시즌 다운로드';

  @override
  String get downloadsChooseFolder => '다운로드한 영화와 에피소드를 저장할 위치를 선택하세요';

  @override
  String get downloadsChoose => '선택';

  @override
  String get downloadsNotChosen => '첫 다운로드 시 묻습니다';

  @override
  String get downloadsChange => '폴더 변경…';

  @override
  String get downloadsPause => '일시 정지';

  @override
  String get downloadsResume => '재개';

  @override
  String get downloadsCancel => '취소';

  @override
  String get downloadsPlay => '재생';

  @override
  String get downloadsReveal => 'Finder에서 보기';

  @override
  String get downloadsDelete => '파일 삭제';

  @override
  String get downloadsEmpty => '다운로드 항목 없음';

  @override
  String get downloadsQueued => '대기 중';

  @override
  String get downloadsDone => '완료';

  @override
  String get downloadsHint =>
      '다운로드는 한 번에 하나씩 진행됩니다. 많은 제공업체가 연결을 하나만 허용하므로 다운로드 중에 재생하면 실패할 수 있습니다. 완료되지 않은 다운로드는 앱을 종료하면 유지되지 않습니다.';

  @override
  String get epgNow => '지금';

  @override
  String get epgNext => '다음';

  @override
  String get settingsFullscreen => '재생을 전체 화면으로 열기(마우스를 움직일 때까지 컨트롤 숨김)';

  @override
  String get nextTitle => '다음 재생';

  @override
  String nextIn(int p1) {
    return '$p1초 후 재생';
  }

  @override
  String get nextNow => '지금 재생';

  @override
  String get nextCancel => '취소';

  @override
  String get settingsAutoNext => '다음 에피소드 자동 재생';

  @override
  String get downloadsNoSpace => '디스크 여유 공간이 부족합니다';

  @override
  String get dbErrorTitle => 'BattleStation TV에서 데이터베이스를 열 수 없습니다';

  @override
  String get dbErrorBody => 'BattleStation TV의 다른 사본이 실행 중이면 종료한 후 다시 시도하세요.';

  @override
  String get dbRecoveredTitle => '데이터베이스가 손상되었습니다';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV이 새 데이터베이스로 시작되었습니다(소스를 다시 추가하세요). 손상된 파일은 여기에 보관되어 있습니다:\n$p1';
  }

  @override
  String get menuShowWindow => '윈도우 보기';

  @override
  String get settingsTabGeneral => '일반';

  @override
  String get settingsTabPlayer => '플레이어';

  @override
  String get settingsTabPlaylists => '재생목록';

  @override
  String get settingsAppearance => '외관';

  @override
  String get settingsSystem => '시스템';

  @override
  String get appearanceLight => '라이트';

  @override
  String get appearanceDark => '다크';

  @override
  String get settingsInterfaceLanguage => '인터페이스 언어';

  @override
  String get settingsLanguageRestart => 'BattleStation TV을 다시 시작하면 적용됩니다.';

  @override
  String get settingsHideCategories => '카테고리 숨기기';

  @override
  String get settingsHideCategoriesWords => '숨길 단어';

  @override
  String get settingsHideCategoriesNote =>
      '이름에 이 단어가 포함된 카테고리를 숨깁니다(쉼표로 구분). 해당 채널, 영화, 시리즈도 검색, 즐겨찾기, 이어보기에서 사라집니다. 이는 단순한 필터이며 자녀 보호 기능이 아닙니다. 누구나 여기에서 변경할 수 있습니다.';

  @override
  String get settingsRefresh => '재생목록 업데이트';

  @override
  String get settingsRefresh0 => '앱을 열 때만';

  @override
  String get settingsRefresh6 => '6시간마다';

  @override
  String get settingsRefresh12 => '12시간마다';

  @override
  String get settingsRefresh24 => '24시간마다';

  @override
  String get settingsBackup => '백업 및 복원';

  @override
  String get backupExport => '백업 내보내기…';

  @override
  String get backupImport => '백업 가져오기…';

  @override
  String get backupWarn =>
      '백업 파일에는 재생목록과 해당 주소가 포함되며 로그인 정보가 들어 있을 수 있으므로 비공개로 보관하세요. Xtream 소스의 암호는 포함되지 않습니다. 가져오기는 현재 소스에 추가되며 아무것도 삭제하지 않습니다.';

  @override
  String get backupExported => '백업이 저장되었습니다.';

  @override
  String get backupImported => '백업을 가져왔습니다.';

  @override
  String get backupErrorInvalid => 'BattleStation TV 백업 파일이 아닙니다.';

  @override
  String get backupErrorVersion =>
      '이 백업은 다른 버전의 BattleStation TV에서 만들어져 읽을 수 없습니다.';

  @override
  String get backupErrorTooLarge => '이 파일은 백업 파일로 보기에는 너무 큽니다.';

  @override
  String get backupFailed => '백업 실패';

  @override
  String get settingsClearData => '데이터 지우기';

  @override
  String get clearHistory => '시청 기록 지우기';

  @override
  String get clearFavorites => '즐겨찾기 지우기';

  @override
  String get clearImages => '이미지 캐시 지우기';

  @override
  String get clearConfirm => '지우기';

  @override
  String get clearHistoryWarn =>
      '모든 소스의 이어보기 위치와 이어보기 목록이 삭제됩니다. 이 동작은 실행 취소할 수 없습니다.';

  @override
  String get clearFavoritesWarn => '모든 소스의 즐겨찾기가 제거됩니다. 이 동작은 실행 취소할 수 없습니다.';

  @override
  String get clearImagesWarn => '저장된 로고와 포스터가 제거되며 필요할 때 다시 다운로드됩니다.';

  @override
  String get infoDetails => '상세 정보';

  @override
  String get infoPlot => '줄거리';

  @override
  String get infoCast => '출연';

  @override
  String get infoDirector => '감독';

  @override
  String get infoGenre => '장르';

  @override
  String get infoYear => '개봉 연도';

  @override
  String get infoRating => '평점';

  @override
  String get infoDuration => '재생 시간';

  @override
  String get infoCountry => '국가';

  @override
  String get infoTrailer => '예고편';

  @override
  String get infoPlay => '재생';

  @override
  String get infoEmpty => '제공업체에 이 작품의 상세 정보가 없습니다.';

  @override
  String get infoLoading => '상세 정보를 불러오는 중…';

  @override
  String get infoError => '상세 정보를 불러오지 못했습니다.';

  @override
  String unitHoursShort(int p1) {
    return '$p1시간';
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
  String get playerSkipIntro => '인트로 건너뛰기';

  @override
  String get playerSkipCredits => '크레딧 건너뛰기';

  @override
  String get playerSkipMenu => '인트로와 크레딧';

  @override
  String get playerMarkIntroStart => '여기서 인트로 시작';

  @override
  String get playerMarkIntroEnd => '여기서 인트로 끝';

  @override
  String get playerMarkCredits => '여기서 크레딧 시작';

  @override
  String get playerSkipForget => '인트로와 크레딧 지우기';

  @override
  String get playerSkipSaved => '이 시리즈의 모든 에피소드에 저장됨';

  @override
  String get playerSkipRefused => '이 위치에서는 할 수 없습니다';

  @override
  String get continueRemove => '계속 시청에서 삭제';

  @override
  String get settingsFavoritesAZ => '즐겨찾기를 이름순으로 정렬 (가–힣)';

  @override
  String get settingsKeychain => '암호를 키체인에 저장';

  @override
  String get settingsKeychainNote =>
      '끔: 암호는 앱의 비공개 데이터베이스에 남습니다. 켬: macOS가 로그인 키체인에 보관합니다.';

  @override
  String get settingsKeychainFailed => '키체인이 암호를 받지 않았습니다. 변경된 것이 없습니다.';
}
