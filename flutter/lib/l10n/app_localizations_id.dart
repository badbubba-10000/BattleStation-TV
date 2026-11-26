// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Langsung';

  @override
  String get tabMovies => 'Film';

  @override
  String get tabSeries => 'Serial';

  @override
  String get catAll => 'Semua';

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
  String get catFavorites => 'Favorit';

  @override
  String get catContinue => 'Lanjutkan menonton';

  @override
  String get catFilter => 'Filter kategori';

  @override
  String get playlistAll => 'Semua daftar putar';

  @override
  String get playlistLabel => 'Daftar putar';

  @override
  String get aboutAcknowledgements => 'Ucapan terima kasih';

  @override
  String get aboutPrivacy => 'Privasi';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV tidak mengumpulkan data apa pun tentang Anda. Tidak ada akun, analitik, iklan, maupun pelacakan.\n\nSumber, favorit, dan riwayat tontonan Anda tetap berada di perangkat ini. Aplikasi hanya terhubung ke alamat yang Anda tambahkan sendiri: server penyedia, daftar putar, panduan program, logo, dan aliran siaran.\n\nKata sandi penyedia disimpan di iOS Keychain hanya di perangkat ini. Kata sandi tidak pernah disertakan dalam file cadangan.\n\nBattleStation TV tidak menyertakan saluran, film, atau daftar putar. Anda membawa sumber sendiri.';

  @override
  String get aboutSource => 'Kode sumber dan lisensi';

  @override
  String get aboutCoffee => 'Traktir saya kopi';

  @override
  String get tipsTitle => 'Dukung BattleStation TV';

  @override
  String get tipsFooter =>
      'Tip opsional melalui Apple. Tip tidak membuka apa pun: semua fitur tetap gratis untuk semua orang.';

  @override
  String get tipsThanks => 'Terima kasih atas dukungan Anda!';

  @override
  String get tipsPending => 'Menunggu persetujuan.';

  @override
  String get tipsFailed => 'Tip tidak berhasil. Coba lagi nanti.';

  @override
  String get aboutVersion => 'Versi';

  @override
  String get catTitle => 'Kategori';

  @override
  String get commonCancel => 'Batal';

  @override
  String get emptyContinue => 'Tidak ada yang dilanjutkan';

  @override
  String get emptyContinueHint =>
      'Film dan episode yang Anda hentikan di tengah jalan muncul di sini.';

  @override
  String get emptyFavorites => 'Belum ada favorit';

  @override
  String get emptyFavoritesHint =>
      'Tekan dan tahan judul, lalu pilih Tambahkan ke favorit.';

  @override
  String get emptyFavoritesLive => 'Geser saluran ke kiri, lalu ketuk bintang.';

  @override
  String get emptyNone => 'Belum ada apa-apa di sini';

  @override
  String get emptyNoneHint =>
      'Tarik ke bawah untuk menyegarkan, atau periksa sumber Anda di Pengaturan.';

  @override
  String get fieldServerInvalid =>
      'Alamat ini tampaknya tidak benar. Contoh: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Masukkan tautan lengkap, diawali dengan http:// atau https://';

  @override
  String get infoResume => 'Lanjutkan';

  @override
  String get libraryEmpty => 'Pustaka Anda kosong';

  @override
  String get libraryEmptyHint =>
      'Favorit dan judul yang mulai Anda tonton muncul di sini.';

  @override
  String get onbNoChannels =>
      'BattleStation TV tidak menyertakan saluran, film, atau daftar putar. Tambahkan sumber dari penyedia yang Anda langgani.';

  @override
  String get onbPasteHint => 'Sudah menyalin tautan daftar putar?';

  @override
  String get onbTestRunning => 'Menguji…';

  @override
  String passwordBodyIos(String p1) {
    return 'Masukkan kata sandi untuk “$p1”. Kata sandi disimpan di iOS Keychain pada perangkat ini.';
  }

  @override
  String get searchRecent => 'Pencarian terbaru';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Lanjutkan M$p1 E$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'M$p1 E$p2';
  }

  @override
  String get seriesNoEpisodes => 'Episode tidak ditemukan';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Putar M$p1 E$p2';
  }

  @override
  String get seriesWatched => 'Sudah ditonton';

  @override
  String get settingsAbout => 'Tentang';

  @override
  String get settingsEditSource => 'Edit sumber';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV menggunakan bahasa perangkat Anda. Untuk memakai bahasa lain khusus untuk aplikasi ini, pilih di Pengaturan iOS.';

  @override
  String get settingsOpenIOS => 'Buka Pengaturan iOS';

  @override
  String get settingsPasswordNote =>
      'Kosongkan kata sandi baru untuk mempertahankan yang sekarang. Kata sandi disimpan di iOS Keychain.';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get sourceDeleteWarn =>
      'Sumber beserta favorit dan riwayat tontonannya dihapus dari perangkat ini. Akun penyedia Anda tidak terpengaruh.';

  @override
  String get syncNow => 'Segarkan';

  @override
  String get tabLibrary => 'Pustaka';

  @override
  String get scopeCategory => 'Di kategori';

  @override
  String get scopeType => 'Di bagian';

  @override
  String get scopeEverywhere => 'Di mana saja';

  @override
  String get searchPrompt => 'Cari';

  @override
  String get syncRunning => 'Menyinkronkan…';

  @override
  String get syncFailed => 'Sinkronisasi gagal';

  @override
  String get syncNotUpdated => 'Menampilkan data tersimpan';

  @override
  String get emptyResults => 'Tidak ada hasil';

  @override
  String get favAdd => 'Tambahkan ke favorit';

  @override
  String get favRemove => 'Hapus dari favorit';

  @override
  String get playerClose => 'Tutup';

  @override
  String get playerSubtitles => 'Subjudul';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerOff => 'Mati';

  @override
  String get playerAddSubtitle => 'Tambahkan file subjudul…';

  @override
  String get playerCatchup => 'Tonton siaran sebelumnya';

  @override
  String get playerFullscreen => 'Layar penuh';

  @override
  String get playerError => 'Pemutaran gagal';

  @override
  String get playerRetry => 'Coba lagi';

  @override
  String get playerPip => 'Gambar dalam Gambar';

  @override
  String get playerPipReturn => 'Kembali ke app';

  @override
  String get catchupTitle => 'Tayang ulang';

  @override
  String get catchupNoEpg =>
      'Tidak ada panduan program. Pilih waktu secara manual.';

  @override
  String get catchupPick => 'Waktu mulai';

  @override
  String get catchupDuration => 'Menit';

  @override
  String get seriesSeason => 'Musim';

  @override
  String get onbWelcomeTitle => 'Selamat datang di BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Tonton saluran langsung, film, dan serial dari penyedia IPTV Anda. Mari tambahkan sumber pertama Anda.';

  @override
  String get onbWhereTitle => 'Di mana alamat dimasukkan?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: penyedia Anda memberikan alamat server (seperti http://host:8080), nama pengguna, dan kata sandi. Masukkan di bawah.';

  @override
  String get onbWhereM3u =>
      'M3U: beri nama pada sumber dan tempel tautan daftar putar dari penyedia Anda.';

  @override
  String get fieldKind => 'Jenis';

  @override
  String get fieldName => 'Nama';

  @override
  String get fieldServer => 'Alamat server';

  @override
  String get fieldUsername => 'Nama pengguna';

  @override
  String get fieldPassword => 'Kata sandi';

  @override
  String get fieldUrl => 'Tautan daftar putar';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Uji koneksi';

  @override
  String get onbTestOk => 'Berhasil terhubung';

  @override
  String get onbTestFail => 'Koneksi gagal';

  @override
  String get onbNext => 'Berikutnya';

  @override
  String get onbBack => 'Kembali';

  @override
  String get onbSave => 'Simpan dan sinkronkan';

  @override
  String get settingsAccounts => 'Sumber';

  @override
  String get settingsLanguageSub => 'Bahasa subjudul pilihan';

  @override
  String get settingsLanguageAudio => 'Bahasa audio pilihan';

  @override
  String get settingsSubscale => 'Ukuran subjudul';

  @override
  String get settingsSubdelay => 'Jeda subjudul (detik)';

  @override
  String get settingsGuide => 'Tampilkan panduan mulai cepat';

  @override
  String get settingsDelete => 'Hapus';

  @override
  String get accountAdd => 'Tambah sumber…';

  @override
  String get settingsChangePassword => 'Ubah kata sandi…';

  @override
  String get settingsNewPassword => 'Kata sandi baru';

  @override
  String updateAvailable(String p1) {
    return 'Versi $p1 tersedia';
  }

  @override
  String get updateNow => 'Perbarui sekarang';

  @override
  String get updateNotes => 'Yang baru';

  @override
  String get updateLater => 'Nanti';

  @override
  String get updateDownloading => 'Mengunduh pembaruan…';

  @override
  String updateReady(String p1) {
    return 'Versi $p1 siap dipasang';
  }

  @override
  String get updateRestart => 'Mulai ulang untuk memperbarui';

  @override
  String get updateFailed => 'Pembaruan gagal';

  @override
  String get updateManual => 'Unduh manual';

  @override
  String get updateCheckNow => 'Periksa pembaruan';

  @override
  String get updateAuto => 'Periksa pembaruan secara otomatis';

  @override
  String get updateAutoInstall => 'Unduh pembaruan secara otomatis';

  @override
  String get updateUpToDate => 'Anda memakai versi terbaru';

  @override
  String get updateDevBuild => 'Pembaruan hanya tersedia di app yang terpasang';

  @override
  String updateCurrent(String p1) {
    return 'Versi saat ini: $p1';
  }

  @override
  String get playerBack => 'Kembali';

  @override
  String get playerErrorHint =>
      'Jika ini terus terjadi, periksa kata sandi sumber di Pengaturan.';

  @override
  String get passwordTitle => 'Kata sandi diperlukan';

  @override
  String passwordBody(String p1) {
    return 'Masukkan kata sandi untuk “$p1”. Disimpan secara pribadi di Mac ini.';
  }

  @override
  String get passwordNone => 'Lanjutkan tanpa kata sandi';

  @override
  String get playerSpeed => 'Kecepatan pemutaran';

  @override
  String get playerSpeedNormal => 'Normal';

  @override
  String get playerSpeedReset => 'Kecepatan normal';

  @override
  String get settingsSeekPreview => 'Pratinjau gambar mini di bilah progres';

  @override
  String get settingsSeekPreviewNote =>
      'Membuka koneksi kedua ke penyedia Anda. Matikan jika pemutaran berhenti atau penyedia Anda hanya mengizinkan satu koneksi.';

  @override
  String get playerSeekBar => 'Posisi pemutaran';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 dari $p2';
  }

  @override
  String get playerLive => 'Langsung';

  @override
  String get playerChannelPrev => 'Saluran sebelumnya';

  @override
  String get playerChannelNext => 'Saluran berikutnya';

  @override
  String get playerScaleFit => 'Pas';

  @override
  String get playerScaleFill => 'Isi';

  @override
  String get playerScaleStretch => 'Regangkan';

  @override
  String get playerSubtitleAdjust => 'Atur subjudul…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Kecerahan';

  @override
  String get playerVolume => 'Volume';

  @override
  String get playerReplay => 'Putar ulang';

  @override
  String get settingsClock => 'Tampilkan jam di pemutar';

  @override
  String get settingsSeekStep =>
      'Langkah lompat (tombol panah dan tombol lompat)';

  @override
  String get settingsBarsHide => 'Sembunyikan kontrol setelah';

  @override
  String get settingsNever => 'Tidak pernah';

  @override
  String get settingsVideoScale => 'Skala video';

  @override
  String get settingsScaleFit => 'Pas (bilah hitam)';

  @override
  String get settingsScaleFill => 'Isi (tepi dipotong)';

  @override
  String get settingsScaleStretch => 'Regangkan';

  @override
  String get settingsVideoScaleHint =>
      'Tekan A di pemutar untuk beralih di antara ketiganya.';

  @override
  String get settingsBuffer => 'Buffer jaringan';

  @override
  String get settingsBufferSmall => 'Kecil';

  @override
  String get settingsBufferNormal => 'Normal';

  @override
  String get settingsBufferLarge => 'Besar';

  @override
  String get settingsBufferHint =>
      'Buffer yang lebih besar membantu pada koneksi yang lambat atau tidak stabil.';

  @override
  String unitSeconds(int p1) {
    return '$p1 detik';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 menit';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 mnt';
  }

  @override
  String playerSkipBack(String p1) {
    return 'Mundur $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Maju $p1';
  }

  @override
  String get playerSleep => 'Timer tidur';

  @override
  String get downloadsTitle => 'Unduhan';

  @override
  String get downloadsAdd => 'Unduh';

  @override
  String get downloadsSeason => 'Unduh musim';

  @override
  String get downloadsChooseFolder =>
      'Pilih tempat menyimpan film dan episode yang diunduh';

  @override
  String get downloadsChoose => 'Pilih';

  @override
  String get downloadsNotChosen => 'Ditanyakan saat unduhan pertama';

  @override
  String get downloadsChange => 'Ubah folder…';

  @override
  String get downloadsPause => 'Jeda';

  @override
  String get downloadsResume => 'Lanjutkan';

  @override
  String get downloadsCancel => 'Batal';

  @override
  String get downloadsPlay => 'Putar';

  @override
  String get downloadsReveal => 'Tampilkan di Finder';

  @override
  String get downloadsDelete => 'Hapus file';

  @override
  String get downloadsEmpty => 'Belum ada unduhan';

  @override
  String get downloadsQueued => 'Menunggu';

  @override
  String get downloadsDone => 'Selesai';

  @override
  String get downloadsHint =>
      'Unduhan berjalan satu per satu. Banyak penyedia hanya mengizinkan satu koneksi, jadi memutar saat mengunduh bisa gagal. Unduhan yang belum selesai tidak disimpan saat app ditutup.';

  @override
  String get epgNow => 'Sekarang';

  @override
  String get epgNext => 'Berikutnya';

  @override
  String get settingsFullscreen =>
      'Buka pemutaran dalam layar penuh (kontrol disembunyikan sampai Anda menggerakkan mouse)';

  @override
  String get nextTitle => 'Selanjutnya';

  @override
  String nextIn(int p1) {
    return 'Diputar dalam $p1 dtk';
  }

  @override
  String get nextNow => 'Putar sekarang';

  @override
  String get nextCancel => 'Batal';

  @override
  String get settingsAutoNext => 'Putar episode berikutnya secara otomatis';

  @override
  String get downloadsNoSpace => 'Ruang disk kosong tidak cukup';

  @override
  String get dbErrorTitle =>
      'BattleStation TV tidak dapat membuka basis datanya';

  @override
  String get dbErrorBody =>
      'Jika salinan BattleStation TV lain sedang berjalan, tutup lalu coba lagi.';

  @override
  String get dbRecoveredTitle => 'Basis data rusak';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV dimulai dengan basis data baru (tambahkan sumber Anda lagi). File yang rusak disimpan di sini:\n$p1';
  }

  @override
  String get menuShowWindow => 'Tampilkan jendela';

  @override
  String get settingsTabGeneral => 'Umum';

  @override
  String get settingsTabPlayer => 'Pemutar';

  @override
  String get settingsTabPlaylists => 'Daftar putar';

  @override
  String get settingsAppearance => 'Tampilan';

  @override
  String get settingsSystem => 'Sistem';

  @override
  String get appearanceLight => 'Terang';

  @override
  String get appearanceDark => 'Gelap';

  @override
  String get settingsInterfaceLanguage => 'Bahasa antarmuka';

  @override
  String get settingsLanguageRestart =>
      'Berlaku setelah BattleStation TV dimulai ulang.';

  @override
  String get settingsHideCategories => 'Sembunyikan kategori';

  @override
  String get settingsHideCategoriesWords => 'Kata yang disembunyikan';

  @override
  String get settingsHideCategoriesNote =>
      'Sembunyikan kategori yang namanya mengandung kata-kata ini (pisahkan dengan koma). Saluran, film, dan serialnya juga hilang dari pencarian, favorit, dan lanjutkan menonton. Ini hanya filter biasa, bukan kunci orang tua: siapa saja dapat mengubahnya di sini.';

  @override
  String get settingsRefresh => 'Perbarui daftar putar';

  @override
  String get settingsRefresh0 => 'Hanya saat app dibuka';

  @override
  String get settingsRefresh6 => 'Setiap 6 jam';

  @override
  String get settingsRefresh12 => 'Setiap 12 jam';

  @override
  String get settingsRefresh24 => 'Setiap 24 jam';

  @override
  String get settingsBackup => 'Cadangkan dan pulihkan';

  @override
  String get backupExport => 'Ekspor cadangan…';

  @override
  String get backupImport => 'Impor cadangan…';

  @override
  String get backupWarn =>
      'File cadangan memuat daftar putar Anda beserta alamatnya, yang dapat mencakup info login, jadi jaga kerahasiaannya. Kata sandi sumber Xtream tidak disimpan di dalamnya. Impor menambahkan ke sumber Anda saat ini dan tidak menghapus apa pun.';

  @override
  String get backupExported => 'Cadangan telah disimpan.';

  @override
  String get backupImported => 'Cadangan telah diimpor.';

  @override
  String get backupErrorInvalid => 'Ini bukan file cadangan BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'Cadangan ini berasal dari versi BattleStation TV yang berbeda dan tidak dapat dibaca.';

  @override
  String get backupErrorTooLarge =>
      'File ini terlalu besar untuk menjadi cadangan.';

  @override
  String get backupFailed => 'Pencadangan gagal';

  @override
  String get settingsClearData => 'Hapus data';

  @override
  String get clearHistory => 'Hapus riwayat tontonan';

  @override
  String get clearFavorites => 'Hapus favorit';

  @override
  String get clearImages => 'Hapus cache gambar';

  @override
  String get clearConfirm => 'Hapus';

  @override
  String get clearHistoryWarn =>
      'Posisi lanjut dan daftar lanjutkan menonton dari semua sumber akan dihapus. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get clearFavoritesWarn =>
      'Favorit Anda di semua sumber akan dihapus. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get clearImagesWarn =>
      'Logo dan poster yang tersimpan dihapus dan diunduh lagi saat diperlukan.';

  @override
  String get infoDetails => 'Detail';

  @override
  String get infoPlot => 'Sinopsis';

  @override
  String get infoCast => 'Pemeran';

  @override
  String get infoDirector => 'Sutradara';

  @override
  String get infoGenre => 'Genre';

  @override
  String get infoYear => 'Tahun rilis';

  @override
  String get infoRating => 'Rating';

  @override
  String get infoDuration => 'Durasi';

  @override
  String get infoCountry => 'Negara';

  @override
  String get infoTrailer => 'Trailer';

  @override
  String get infoPlay => 'Putar';

  @override
  String get infoEmpty =>
      'Penyedia Anda tidak memiliki detail untuk judul ini.';

  @override
  String get infoLoading => 'Memuat detail…';

  @override
  String get infoError => 'Detail tidak dapat dimuat.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 j';
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
  String get playerSkipIntro => 'Lewati intro';

  @override
  String get playerSkipCredits => 'Lewati kredit';

  @override
  String get playerSkipMenu => 'Intro dan kredit';

  @override
  String get playerMarkIntroStart => 'Intro mulai di sini';

  @override
  String get playerMarkIntroEnd => 'Intro berakhir di sini';

  @override
  String get playerMarkCredits => 'Kredit mulai di sini';

  @override
  String get playerSkipForget => 'Lupakan intro dan kredit';

  @override
  String get playerSkipSaved => 'Disimpan untuk semua episode serial ini';

  @override
  String get playerSkipRefused => 'Tidak bisa di titik ini';

  @override
  String get continueRemove => 'Hapus dari Lanjutkan menonton';

  @override
  String get settingsFavoritesAZ => 'Urutkan favorit menurut nama (A–Z)';

  @override
  String get settingsKeychain => 'Simpan kata sandi di Keychain';

  @override
  String get settingsKeychainNote =>
      'Mati: kata sandi tetap di database pribadi aplikasi. Nyala: macOS menyimpannya di keychain login Anda.';

  @override
  String get settingsKeychainFailed =>
      'Keychain tidak menerima kata sandi. Tidak ada yang diubah.';
}
