// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Trực tiếp';

  @override
  String get tabMovies => 'Phim';

  @override
  String get tabSeries => 'Phim bộ';

  @override
  String get catAll => 'Tất cả';

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
  String get catFavorites => 'Yêu thích';

  @override
  String get catContinue => 'Xem tiếp';

  @override
  String get catFilter => 'Lọc danh mục';

  @override
  String get playlistAll => 'Tất cả danh sách phát';

  @override
  String get playlistLabel => 'Danh sách phát';

  @override
  String get aboutAcknowledgements => 'Ghi công';

  @override
  String get aboutPrivacy => 'Quyền riêng tư';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV không thu thập bất kỳ dữ liệu nào về bạn. Ứng dụng không có tài khoản, không phân tích, không quảng cáo và không theo dõi.\n\nCác nguồn, mục yêu thích và lịch sử xem của bạn chỉ nằm trên thiết bị này. Ứng dụng chỉ kết nối đến những địa chỉ do chính bạn thêm vào: máy chủ, danh sách phát, lịch phát sóng, logo và luồng phát của nhà cung cấp.\n\nMật khẩu nhà cung cấp chỉ được lưu trong iOS Keychain trên thiết bị này. Chúng không bao giờ nằm trong tệp sao lưu.\n\nBattleStation TV không có sẵn kênh, phim hay danh sách phát nào. Bạn tự mang nguồn của mình đến.';

  @override
  String get aboutSource => 'Mã nguồn và giấy phép';

  @override
  String get aboutCoffee => 'Mời tôi một ly cà phê';

  @override
  String get tipsTitle => 'Ủng hộ BattleStation TV';

  @override
  String get tipsFooter =>
      'Tiền tip tùy chọn qua Apple. Không mở khóa gì cả: mọi tính năng vẫn miễn phí cho tất cả mọi người.';

  @override
  String get tipsThanks => 'Cảm ơn bạn đã ủng hộ!';

  @override
  String get tipsPending => 'Đang chờ phê duyệt.';

  @override
  String get tipsFailed => 'Khoản tip chưa thành công. Hãy thử lại sau.';

  @override
  String get aboutVersion => 'Phiên bản';

  @override
  String get catTitle => 'Danh mục';

  @override
  String get commonCancel => 'Hủy';

  @override
  String get emptyContinue => 'Chưa có gì để xem tiếp';

  @override
  String get emptyContinueHint => 'Phim và tập bạn xem dở sẽ hiện ở đây.';

  @override
  String get emptyFavorites => 'Chưa có mục yêu thích';

  @override
  String get emptyFavoritesHint =>
      'Nhấn giữ một nội dung, rồi chọn Thêm vào Yêu thích.';

  @override
  String get emptyFavoritesLive =>
      'Vuốt kênh sang trái, rồi chạm vào ngôi sao.';

  @override
  String get emptyNone => 'Ở đây chưa có gì';

  @override
  String get emptyNoneHint =>
      'Kéo xuống để làm mới, hoặc kiểm tra nguồn của bạn trong Cài đặt.';

  @override
  String get fieldServerInvalid =>
      'Địa chỉ này có vẻ chưa đúng. Ví dụ: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Nhập đầy đủ liên kết, bắt đầu bằng http:// hoặc https://';

  @override
  String get infoResume => 'Tiếp tục';

  @override
  String get libraryEmpty => 'Thư viện của bạn trống';

  @override
  String get libraryEmptyHint =>
      'Mục yêu thích và nội dung bạn đã bắt đầu xem sẽ hiện ở đây.';

  @override
  String get onbNoChannels =>
      'BattleStation TV không có sẵn kênh, phim hay danh sách phát nào. Hãy thêm nguồn từ nhà cung cấp mà bạn đăng ký.';

  @override
  String get onbPasteHint => 'Bạn đã sao chép liên kết danh sách phát?';

  @override
  String get onbTestRunning => 'Đang kiểm tra…';

  @override
  String passwordBodyIos(String p1) {
    return 'Nhập mật khẩu cho “$p1”. Mật khẩu được lưu trong iOS Keychain trên thiết bị này.';
  }

  @override
  String get searchRecent => 'Tìm kiếm gần đây';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Xem tiếp Mùa $p1 Tập $p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'Mùa $p1 Tập $p2';
  }

  @override
  String get seriesNoEpisodes => 'Không tìm thấy tập nào';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Phát Mùa $p1 Tập $p2';
  }

  @override
  String get seriesWatched => 'Đã xem';

  @override
  String get settingsAbout => 'Giới thiệu';

  @override
  String get settingsEditSource => 'Sửa nguồn';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV dùng ngôn ngữ của thiết bị. Để dùng ngôn ngữ khác chỉ cho ứng dụng này, hãy chọn trong Cài đặt iOS.';

  @override
  String get settingsOpenIOS => 'Mở Cài đặt iOS';

  @override
  String get settingsPasswordNote =>
      'Để trống mật khẩu mới nếu muốn giữ mật khẩu hiện tại. Mật khẩu được lưu trong iOS Keychain.';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get sourceDeleteWarn =>
      'Nguồn, mục yêu thích và lịch sử xem của nguồn đó sẽ bị xóa khỏi thiết bị này. Tài khoản nhà cung cấp của bạn không bị ảnh hưởng.';

  @override
  String get syncNow => 'Làm mới';

  @override
  String get tabLibrary => 'Thư viện';

  @override
  String get scopeCategory => 'Trong danh mục';

  @override
  String get scopeType => 'Trong mục này';

  @override
  String get scopeEverywhere => 'Mọi nơi';

  @override
  String get searchPrompt => 'Tìm kiếm';

  @override
  String get syncRunning => 'Đang đồng bộ…';

  @override
  String get syncFailed => 'Đồng bộ thất bại';

  @override
  String get syncNotUpdated => 'Đang hiển thị dữ liệu đã lưu';

  @override
  String get emptyResults => 'Không tìm thấy gì';

  @override
  String get favAdd => 'Thêm vào Yêu thích';

  @override
  String get favRemove => 'Xóa khỏi Yêu thích';

  @override
  String get playerClose => 'Đóng';

  @override
  String get playerSubtitles => 'Phụ đề';

  @override
  String get playerAudio => 'Âm thanh';

  @override
  String get playerOff => 'Tắt';

  @override
  String get playerAddSubtitle => 'Thêm tệp phụ đề…';

  @override
  String get playerCatchup => 'Xem lại';

  @override
  String get playerFullscreen => 'Toàn màn hình';

  @override
  String get playerError => 'Không phát được';

  @override
  String get playerRetry => 'Thử lại';

  @override
  String get playerPip => 'Hình trong hình';

  @override
  String get playerPipReturn => 'Quay lại ứng dụng';

  @override
  String get catchupTitle => 'Xem lại';

  @override
  String get catchupNoEpg => 'Không có lịch phát sóng. Hãy chọn giờ thủ công.';

  @override
  String get catchupPick => 'Giờ bắt đầu';

  @override
  String get catchupDuration => 'Phút';

  @override
  String get seriesSeason => 'Mùa';

  @override
  String get onbWelcomeTitle => 'Chào mừng đến với BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Xem kênh truyền hình trực tiếp, phim lẻ và phim bộ từ nhà cung cấp IPTV của bạn. Hãy thêm nguồn đầu tiên nào.';

  @override
  String get onbWhereTitle => 'Nhập địa chỉ ở đâu?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: nhà cung cấp sẽ cho bạn địa chỉ máy chủ (ví dụ http://host:8080), tên người dùng và mật khẩu. Hãy nhập vào bên dưới.';

  @override
  String get onbWhereM3u =>
      'M3U: đặt tên cho nguồn và dán liên kết danh sách phát mà nhà cung cấp đã cung cấp.';

  @override
  String get fieldKind => 'Loại';

  @override
  String get fieldName => 'Tên';

  @override
  String get fieldServer => 'Địa chỉ máy chủ';

  @override
  String get fieldUsername => 'Tên người dùng';

  @override
  String get fieldPassword => 'Mật khẩu';

  @override
  String get fieldUrl => 'Liên kết danh sách phát';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Kiểm tra kết nối';

  @override
  String get onbTestOk => 'Đã kết nối thành công';

  @override
  String get onbTestFail => 'Kết nối thất bại';

  @override
  String get onbNext => 'Tiếp theo';

  @override
  String get onbBack => 'Quay lại';

  @override
  String get onbSave => 'Lưu và đồng bộ';

  @override
  String get settingsAccounts => 'Nguồn';

  @override
  String get settingsLanguageSub => 'Ngôn ngữ phụ đề ưu tiên';

  @override
  String get settingsLanguageAudio => 'Ngôn ngữ âm thanh ưu tiên';

  @override
  String get settingsSubscale => 'Cỡ phụ đề';

  @override
  String get settingsSubdelay => 'Độ trễ phụ đề (giây)';

  @override
  String get settingsGuide => 'Hiển thị hướng dẫn bắt đầu nhanh';

  @override
  String get settingsDelete => 'Xóa';

  @override
  String get accountAdd => 'Thêm nguồn…';

  @override
  String get settingsChangePassword => 'Đổi mật khẩu…';

  @override
  String get settingsNewPassword => 'Mật khẩu mới';

  @override
  String updateAvailable(String p1) {
    return 'Đã có phiên bản $p1';
  }

  @override
  String get updateNow => 'Cập nhật ngay';

  @override
  String get updateNotes => 'Có gì mới';

  @override
  String get updateLater => 'Để sau';

  @override
  String get updateDownloading => 'Đang tải về bản cập nhật…';

  @override
  String updateReady(String p1) {
    return 'Phiên bản $p1 đã sẵn sàng để cài đặt';
  }

  @override
  String get updateRestart => 'Khởi động lại để cập nhật';

  @override
  String get updateFailed => 'Cập nhật thất bại';

  @override
  String get updateManual => 'Tải về thủ công';

  @override
  String get updateCheckNow => 'Kiểm tra cập nhật';

  @override
  String get updateAuto => 'Tự động kiểm tra cập nhật';

  @override
  String get updateAutoInstall => 'Tự động tải về bản cập nhật';

  @override
  String get updateUpToDate => 'Bạn đang dùng phiên bản mới nhất';

  @override
  String get updateDevBuild => 'Chỉ ứng dụng đã cài đặt mới có thể cập nhật';

  @override
  String updateCurrent(String p1) {
    return 'Phiên bản hiện tại: $p1';
  }

  @override
  String get playerBack => 'Quay lại';

  @override
  String get playerErrorHint =>
      'Nếu sự cố cứ lặp lại, hãy kiểm tra mật khẩu của nguồn trong Cài đặt.';

  @override
  String get passwordTitle => 'Cần mật khẩu';

  @override
  String passwordBody(String p1) {
    return 'Nhập mật khẩu cho “$p1”. Mật khẩu được lưu riêng tư trên máy Mac này.';
  }

  @override
  String get passwordNone => 'Tiếp tục không dùng mật khẩu';

  @override
  String get playerSpeed => 'Tốc độ phát';

  @override
  String get playerSpeedNormal => 'Bình thường';

  @override
  String get playerSpeedReset => 'Tốc độ bình thường';

  @override
  String get settingsSeekPreview =>
      'Xem trước hình thu nhỏ trên thanh tiến trình';

  @override
  String get settingsSeekPreviewNote =>
      'Mở kết nối thứ hai tới nhà cung cấp của bạn. Hãy tắt nếu phát bị dừng hoặc nhà cung cấp của bạn chỉ cho phép một kết nối.';

  @override
  String get playerSeekBar => 'Vị trí phát';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 trên $p2';
  }

  @override
  String get playerLive => 'Trực tiếp';

  @override
  String get playerChannelPrev => 'Kênh trước';

  @override
  String get playerChannelNext => 'Kênh tiếp theo';

  @override
  String get playerScaleFit => 'Vừa khít';

  @override
  String get playerScaleFill => 'Lấp đầy';

  @override
  String get playerScaleStretch => 'Kéo giãn';

  @override
  String get playerSubtitleAdjust => 'Điều chỉnh phụ đề…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Độ sáng';

  @override
  String get playerVolume => 'Âm lượng';

  @override
  String get playerReplay => 'Phát lại';

  @override
  String get settingsClock => 'Hiển thị giờ trong trình phát';

  @override
  String get settingsSeekStep => 'Bước tua (phím mũi tên và nút tua)';

  @override
  String get settingsBarsHide => 'Ẩn các nút điều khiển sau';

  @override
  String get settingsNever => 'Không bao giờ';

  @override
  String get settingsVideoScale => 'Tỷ lệ video';

  @override
  String get settingsScaleFit => 'Vừa khít (có viền đen)';

  @override
  String get settingsScaleFill => 'Lấp đầy (cắt các cạnh)';

  @override
  String get settingsScaleStretch => 'Kéo giãn';

  @override
  String get settingsVideoScaleHint =>
      'Nhấn A trong trình phát để chuyển giữa ba chế độ.';

  @override
  String get settingsBuffer => 'Bộ đệm mạng';

  @override
  String get settingsBufferSmall => 'Nhỏ';

  @override
  String get settingsBufferNormal => 'Bình thường';

  @override
  String get settingsBufferLarge => 'Lớn';

  @override
  String get settingsBufferHint =>
      'Bộ đệm lớn hơn giúp ích khi kết nối chậm hoặc không ổn định.';

  @override
  String unitSeconds(int p1) {
    return '$p1 giây';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 phút';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 ph';
  }

  @override
  String playerSkipBack(String p1) {
    return 'Lùi $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Tiến $p1';
  }

  @override
  String get playerSleep => 'Hẹn giờ ngủ';

  @override
  String get downloadsTitle => 'Tải về';

  @override
  String get downloadsAdd => 'Tải về';

  @override
  String get downloadsSeason => 'Tải về cả mùa';

  @override
  String get downloadsChooseFolder => 'Chọn nơi lưu phim và tập đã tải về';

  @override
  String get downloadsChoose => 'Chọn';

  @override
  String get downloadsNotChosen => 'Sẽ hỏi ở lần tải về đầu tiên';

  @override
  String get downloadsChange => 'Đổi thư mục…';

  @override
  String get downloadsPause => 'Tạm dừng';

  @override
  String get downloadsResume => 'Tiếp tục';

  @override
  String get downloadsCancel => 'Hủy';

  @override
  String get downloadsPlay => 'Phát';

  @override
  String get downloadsReveal => 'Hiện trong Finder';

  @override
  String get downloadsDelete => 'Xóa tệp';

  @override
  String get downloadsEmpty => 'Chưa có mục tải về nào';

  @override
  String get downloadsQueued => 'Đang chờ';

  @override
  String get downloadsDone => 'Hoàn tất';

  @override
  String get downloadsHint =>
      'Các mục tải về chạy lần lượt từng mục một. Nhiều nhà cung cấp chỉ cho phép một kết nối, nên phát trong khi đang tải về có thể bị lỗi. Các mục tải về chưa xong sẽ không được giữ lại khi thoát ứng dụng.';

  @override
  String get epgNow => 'Bây giờ';

  @override
  String get epgNext => 'Tiếp theo';

  @override
  String get settingsFullscreen =>
      'Mở phát lại ở chế độ toàn màn hình (các nút điều khiển ẩn cho đến khi bạn di chuyển chuột)';

  @override
  String get nextTitle => 'Phát tiếp theo';

  @override
  String nextIn(int p1) {
    return 'Phát sau $p1 giây';
  }

  @override
  String get nextNow => 'Phát ngay';

  @override
  String get nextCancel => 'Hủy';

  @override
  String get settingsAutoNext => 'Tự động phát tập tiếp theo';

  @override
  String get downloadsNoSpace => 'Không đủ dung lượng đĩa trống';

  @override
  String get dbErrorTitle => 'BattleStation TV không thể mở cơ sở dữ liệu';

  @override
  String get dbErrorBody =>
      'Nếu có bản BattleStation TV khác đang chạy, hãy thoát nó rồi thử lại.';

  @override
  String get dbRecoveredTitle => 'Cơ sở dữ liệu đã bị hỏng';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV đã khởi động với cơ sở dữ liệu mới (hãy thêm lại nguồn của bạn). Tệp bị hỏng được giữ lại tại đây:\n$p1';
  }

  @override
  String get menuShowWindow => 'Hiện cửa sổ';

  @override
  String get settingsTabGeneral => 'Chung';

  @override
  String get settingsTabPlayer => 'Trình phát';

  @override
  String get settingsTabPlaylists => 'Danh sách phát';

  @override
  String get settingsAppearance => 'Giao diện';

  @override
  String get settingsSystem => 'Hệ thống';

  @override
  String get appearanceLight => 'Sáng';

  @override
  String get appearanceDark => 'Tối';

  @override
  String get settingsInterfaceLanguage => 'Ngôn ngữ giao diện';

  @override
  String get settingsLanguageRestart =>
      'Có hiệu lực sau khi khởi động lại BattleStation TV.';

  @override
  String get settingsHideCategories => 'Ẩn danh mục';

  @override
  String get settingsHideCategoriesWords => 'Từ cần ẩn';

  @override
  String get settingsHideCategoriesNote =>
      'Ẩn các danh mục có tên chứa những từ này (phân tách bằng dấu phẩy). Kênh, phim và phim bộ trong đó cũng biến mất khỏi tìm kiếm, mục yêu thích và xem tiếp. Đây chỉ là bộ lọc thông thường, không phải khóa dành cho phụ huynh: ai cũng có thể thay đổi tại đây.';

  @override
  String get settingsRefresh => 'Cập nhật danh sách phát';

  @override
  String get settingsRefresh0 => 'Chỉ khi mở ứng dụng';

  @override
  String get settingsRefresh6 => 'Mỗi 6 giờ';

  @override
  String get settingsRefresh12 => 'Mỗi 12 giờ';

  @override
  String get settingsRefresh24 => 'Mỗi 24 giờ';

  @override
  String get settingsBackup => 'Sao lưu và khôi phục';

  @override
  String get backupExport => 'Xuất bản sao lưu…';

  @override
  String get backupImport => 'Nhập bản sao lưu…';

  @override
  String get backupWarn =>
      'Tệp sao lưu liệt kê các danh sách phát của bạn cùng địa chỉ, có thể bao gồm thông tin đăng nhập, vì vậy hãy giữ kín. Mật khẩu của các nguồn Xtream không được lưu trong đó. Việc nhập sẽ thêm vào các nguồn hiện tại và không xóa gì cả.';

  @override
  String get backupExported => 'Đã lưu bản sao lưu.';

  @override
  String get backupImported => 'Đã nhập bản sao lưu.';

  @override
  String get backupErrorInvalid =>
      'Đây không phải là tệp sao lưu của BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'Bản sao lưu này đến từ một phiên bản BattleStation TV khác và không thể đọc được.';

  @override
  String get backupErrorTooLarge => 'Tệp này quá lớn để là bản sao lưu.';

  @override
  String get backupFailed => 'Sao lưu thất bại';

  @override
  String get settingsClearData => 'Xóa dữ liệu';

  @override
  String get clearHistory => 'Xóa lịch sử xem';

  @override
  String get clearFavorites => 'Xóa mục yêu thích';

  @override
  String get clearImages => 'Xóa bộ nhớ đệm hình ảnh';

  @override
  String get clearConfirm => 'Xóa';

  @override
  String get clearHistoryWarn =>
      'Vị trí xem dở và danh sách xem tiếp của tất cả các nguồn sẽ bị xóa. Không thể hoàn tác thao tác này.';

  @override
  String get clearFavoritesWarn =>
      'Mục yêu thích trong tất cả các nguồn sẽ bị xóa. Không thể hoàn tác thao tác này.';

  @override
  String get clearImagesWarn =>
      'Logo và áp phích đã lưu sẽ bị xóa và được tải về lại khi cần.';

  @override
  String get infoDetails => 'Chi tiết';

  @override
  String get infoPlot => 'Nội dung';

  @override
  String get infoCast => 'Diễn viên';

  @override
  String get infoDirector => 'Đạo diễn';

  @override
  String get infoGenre => 'Thể loại';

  @override
  String get infoYear => 'Năm phát hành';

  @override
  String get infoRating => 'Đánh giá';

  @override
  String get infoDuration => 'Thời lượng';

  @override
  String get infoCountry => 'Quốc gia';

  @override
  String get infoTrailer => 'Trailer';

  @override
  String get infoPlay => 'Phát';

  @override
  String get infoEmpty =>
      'Nhà cung cấp của bạn không có thông tin chi tiết về nội dung này.';

  @override
  String get infoLoading => 'Đang tải chi tiết…';

  @override
  String get infoError => 'Không thể tải chi tiết.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 giờ';
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
  String get playerSkipIntro => 'Bỏ qua phần mở đầu';

  @override
  String get playerSkipCredits => 'Bỏ qua phần giới thiệu cuối';

  @override
  String get playerSkipMenu => 'Mở đầu và phần cuối';

  @override
  String get playerMarkIntroStart => 'Phần mở đầu bắt đầu ở đây';

  @override
  String get playerMarkIntroEnd => 'Phần mở đầu kết thúc ở đây';

  @override
  String get playerMarkCredits => 'Phần cuối bắt đầu ở đây';

  @override
  String get playerSkipForget => 'Xóa phần mở đầu và phần cuối';

  @override
  String get playerSkipSaved => 'Đã lưu cho mọi tập của phim này';

  @override
  String get playerSkipRefused => 'Không thể ở thời điểm này';

  @override
  String get continueRemove => 'Xóa khỏi Xem tiếp';

  @override
  String get settingsFavoritesAZ => 'Sắp xếp mục yêu thích theo tên (A–Z)';

  @override
  String get settingsKeychain => 'Lưu mật khẩu trong Chuỗi khóa';

  @override
  String get settingsKeychainNote =>
      'Tắt: mật khẩu nằm trong cơ sở dữ liệu riêng của ứng dụng. Bật: macOS giữ chúng trong chuỗi khóa đăng nhập của bạn.';

  @override
  String get settingsKeychainFailed =>
      'Chuỗi khóa không nhận mật khẩu. Không có gì thay đổi.';
}
