// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Canlı';

  @override
  String get tabMovies => 'Filmler';

  @override
  String get tabSeries => 'Diziler';

  @override
  String get catAll => 'Tümü';

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
  String get catFavorites => 'Favoriler';

  @override
  String get catContinue => 'İzlemeye devam et';

  @override
  String get catFilter => 'Kategorileri filtrele';

  @override
  String get playlistAll => 'Tüm oynatma listeleri';

  @override
  String get playlistLabel => 'Oynatma listesi';

  @override
  String get aboutAcknowledgements => 'Teşekkürler';

  @override
  String get aboutPrivacy => 'Gizlilik';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV hakkınızda hiçbir veri toplamaz. Hesap, analiz, reklam ve izleme yoktur.\n\nKaynaklarınız, favorileriniz ve izleme geçmişiniz bu cihazda kalır. Uygulama yalnızca sizin eklediğiniz adreslere bağlanır: sağlayıcınızın sunucusu, oynatma listesi, program rehberi, logolar ve yayınlar.\n\nSağlayıcı parolaları yalnızca bu cihazdaki iOS Keychain’de saklanır. Hiçbir zaman yedek dosyasına dahil edilmez.\n\nBattleStation TV kanal, film veya oynatma listesi içermez. Kaynağı siz getirirsiniz.';

  @override
  String get aboutSource => 'Kaynak kodu ve lisans';

  @override
  String get aboutCoffee => 'Bana bir kahve ısmarlayın';

  @override
  String get tipsTitle => 'BattleStation TV\'i destekleyin';

  @override
  String get tipsFooter =>
      'Apple üzerinden isteğe bağlı bahşiş. Hiçbir şeyin kilidini açmaz: tüm özellikler herkes için ücretsiz kalır.';

  @override
  String get tipsThanks => 'Desteğiniz için teşekkürler!';

  @override
  String get tipsPending => 'Onay bekleniyor.';

  @override
  String get tipsFailed => 'Bahşiş gerçekleşmedi. Daha sonra tekrar deneyin.';

  @override
  String get aboutVersion => 'Sürüm';

  @override
  String get catTitle => 'Kategoriler';

  @override
  String get commonCancel => 'İptal';

  @override
  String get emptyContinue => 'Devam edilecek bir şey yok';

  @override
  String get emptyContinueHint =>
      'Yarıda bıraktığınız filmler ve bölümler burada görünür.';

  @override
  String get emptyFavorites => 'Henüz favori yok';

  @override
  String get emptyFavoritesHint =>
      'Bir yapıma dokunup basılı tutun, ardından Favorilere ekle’yi seçin.';

  @override
  String get emptyFavoritesLive =>
      'Bir kanalı sola kaydırın, ardından yıldıza dokunun.';

  @override
  String get emptyNone => 'Burada henüz bir şey yok';

  @override
  String get emptyNoneHint =>
      'Yenilemek için aşağı çekin veya Ayarlar’dan kaynağınızı kontrol edin.';

  @override
  String get fieldServerInvalid =>
      'Bu adres doğru görünmüyor. Örnek: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Bağlantının tamamını girin; http:// veya https:// ile başlamalıdır.';

  @override
  String get infoResume => 'Devam et';

  @override
  String get libraryEmpty => 'Kitaplığınız boş';

  @override
  String get libraryEmptyHint =>
      'Favoriler ve izlemeye başladığınız yapımlar burada görünür.';

  @override
  String get onbNoChannels =>
      'BattleStation TV kanal, film veya oynatma listesi içermez. Abone olduğunuz bir sağlayıcıdan kaynak ekleyin.';

  @override
  String get onbPasteHint => 'Bir oynatma listesi bağlantısı mı kopyaladınız?';

  @override
  String get onbTestRunning => 'Test ediliyor…';

  @override
  String passwordBodyIos(String p1) {
    return '“$p1” için parolayı girin. Bu cihazdaki iOS Keychain’de saklanır.';
  }

  @override
  String get searchRecent => 'Son aramalar';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Devam et: S$p1 B$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'S$p1 B$p2';
  }

  @override
  String get seriesNoEpisodes => 'Bölüm bulunamadı';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Oynat: S$p1 B$p2';
  }

  @override
  String get seriesWatched => 'İzlendi';

  @override
  String get settingsAbout => 'Hakkında';

  @override
  String get settingsEditSource => 'Kaynağı düzenle';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV cihazınızın dilini kullanır. Yalnızca bu uygulama için başka bir dil kullanmak istiyorsanız iOS Ayarları’ndan seçin.';

  @override
  String get settingsOpenIOS => 'iOS Ayarları’nı aç';

  @override
  String get settingsPasswordNote =>
      'Mevcut parolayı korumak için yeni parolayı boş bırakın. Parolalar iOS Keychain’de saklanır.';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get sourceDeleteWarn =>
      'Kaynak, favorileri ve izleme geçmişi bu cihazdan kaldırılır. Sağlayıcı hesabınız etkilenmez.';

  @override
  String get syncNow => 'Yenile';

  @override
  String get tabLibrary => 'Kitaplık';

  @override
  String get scopeCategory => 'Kategoride';

  @override
  String get scopeType => 'Bölümde';

  @override
  String get scopeEverywhere => 'Her yerde';

  @override
  String get searchPrompt => 'Ara';

  @override
  String get syncRunning => 'Senkronize ediliyor…';

  @override
  String get syncFailed => 'Senkronizasyon başarısız';

  @override
  String get syncNotUpdated => 'Kayıtlı veriler gösteriliyor';

  @override
  String get emptyResults => 'Hiçbir şey bulunamadı';

  @override
  String get favAdd => 'Favorilere ekle';

  @override
  String get favRemove => 'Favorilerden kaldır';

  @override
  String get playerClose => 'Kapat';

  @override
  String get playerSubtitles => 'Altyazılar';

  @override
  String get playerAudio => 'Ses';

  @override
  String get playerOff => 'Kapalı';

  @override
  String get playerAddSubtitle => 'Altyazı dosyası ekle…';

  @override
  String get playerCatchup => 'Geçmiş yayını izle';

  @override
  String get playerFullscreen => 'Tam ekran';

  @override
  String get playerError => 'Oynatma başarısız';

  @override
  String get playerRetry => 'Tekrar dene';

  @override
  String get playerPip => 'Pencere içinde pencere';

  @override
  String get playerPipReturn => 'Uygulamaya dön';

  @override
  String get catchupTitle => 'Geriye dönük izleme';

  @override
  String get catchupNoEpg => 'Program rehberi yok. Saati elle seçin.';

  @override
  String get catchupPick => 'Başlangıç saati';

  @override
  String get catchupDuration => 'Dakika';

  @override
  String get seriesSeason => 'Sezon';

  @override
  String get onbWelcomeTitle => 'BattleStation TV’e hoş geldiniz';

  @override
  String get onbWelcomeBody =>
      'IPTV sağlayıcınızdan canlı kanalları, filmleri ve dizileri izleyin. İlk kaynağınızı ekleyelim.';

  @override
  String get onbWhereTitle => 'Adresler nereye girilir?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: sağlayıcınız size bir sunucu adresi (örneğin http://host:8080), bir kullanıcı adı ve bir parola verir. Bunları aşağıya girin.';

  @override
  String get onbWhereM3u =>
      'M3U: kaynağa bir ad verin ve sağlayıcınızın size verdiği oynatma listesi bağlantısını yapıştırın.';

  @override
  String get fieldKind => 'Tür';

  @override
  String get fieldName => 'Ad';

  @override
  String get fieldServer => 'Sunucu adresi';

  @override
  String get fieldUsername => 'Kullanıcı adı';

  @override
  String get fieldPassword => 'Parola';

  @override
  String get fieldUrl => 'Oynatma listesi bağlantısı';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Bağlantıyı test et';

  @override
  String get onbTestOk => 'Bağlantı başarılı';

  @override
  String get onbTestFail => 'Bağlantı başarısız';

  @override
  String get onbNext => 'İleri';

  @override
  String get onbBack => 'Geri';

  @override
  String get onbSave => 'Kaydet ve senkronize et';

  @override
  String get settingsAccounts => 'Kaynaklar';

  @override
  String get settingsLanguageSub => 'Tercih edilen altyazı dilleri';

  @override
  String get settingsLanguageAudio => 'Tercih edilen ses dilleri';

  @override
  String get settingsSubscale => 'Altyazı boyutu';

  @override
  String get settingsSubdelay => 'Altyazı gecikmesi (saniye)';

  @override
  String get settingsGuide => 'Hızlı başlangıç kılavuzunu göster';

  @override
  String get settingsDelete => 'Sil';

  @override
  String get accountAdd => 'Kaynak ekle…';

  @override
  String get settingsChangePassword => 'Parolayı değiştir…';

  @override
  String get settingsNewPassword => 'Yeni parola';

  @override
  String updateAvailable(String p1) {
    return '$p1 sürümü kullanılabilir';
  }

  @override
  String get updateNow => 'Şimdi güncelle';

  @override
  String get updateNotes => 'Yenilikler';

  @override
  String get updateLater => 'Daha sonra';

  @override
  String get updateDownloading => 'Güncelleme indiriliyor…';

  @override
  String updateReady(String p1) {
    return '$p1 sürümü yüklenmeye hazır';
  }

  @override
  String get updateRestart => 'Güncellemek için yeniden başlat';

  @override
  String get updateFailed => 'Güncelleme başarısız';

  @override
  String get updateManual => 'Elle indir';

  @override
  String get updateCheckNow => 'Güncellemeleri denetle';

  @override
  String get updateAuto => 'Güncellemeleri otomatik olarak denetle';

  @override
  String get updateAutoInstall => 'Güncellemeleri otomatik olarak indir';

  @override
  String get updateUpToDate => 'En son sürüme sahipsiniz';

  @override
  String get updateDevBuild =>
      'Güncellemeler yalnızca yüklü uygulamada kullanılabilir';

  @override
  String updateCurrent(String p1) {
    return 'Geçerli sürüm: $p1';
  }

  @override
  String get playerBack => 'Geri';

  @override
  String get playerErrorHint =>
      'Bu durum devam ederse Ayarlar’da kaynağın parolasını kontrol edin.';

  @override
  String get passwordTitle => 'Parola gerekli';

  @override
  String passwordBody(String p1) {
    return '“$p1” için parolayı girin. Bu Mac’te gizli olarak saklanır.';
  }

  @override
  String get passwordNone => 'Parolasız devam et';

  @override
  String get playerSpeed => 'Oynatma hızı';

  @override
  String get playerSpeedNormal => 'Normal';

  @override
  String get playerSpeedReset => 'Normal hız';

  @override
  String get settingsSeekPreview => 'İlerleme çubuğunda küçük resim önizlemesi';

  @override
  String get settingsSeekPreviewNote =>
      'Sağlayıcınıza ikinci bir bağlantı açar. Oynatma duruyorsa veya sağlayıcınız yalnızca tek bağlantıya izin veriyorsa kapatın.';

  @override
  String get playerSeekBar => 'Oynatma konumu';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 / $p2';
  }

  @override
  String get playerLive => 'Canlı';

  @override
  String get playerChannelPrev => 'Önceki kanal';

  @override
  String get playerChannelNext => 'Sonraki kanal';

  @override
  String get playerScaleFit => 'Sığdır';

  @override
  String get playerScaleFill => 'Doldur';

  @override
  String get playerScaleStretch => 'Uzat';

  @override
  String get playerSubtitleAdjust => 'Altyazıları ayarla…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Parlaklık';

  @override
  String get playerVolume => 'Ses düzeyi';

  @override
  String get playerReplay => 'Yeniden oynat';

  @override
  String get settingsClock => 'Oynatıcıda saati göster';

  @override
  String get settingsSeekStep =>
      'Atlama adımı (ok tuşları ve atlama düğmeleri)';

  @override
  String get settingsBarsHide => 'Denetimleri şu süre sonra gizle';

  @override
  String get settingsNever => 'Asla';

  @override
  String get settingsVideoScale => 'Video ölçeği';

  @override
  String get settingsScaleFit => 'Sığdır (siyah çubuklar)';

  @override
  String get settingsScaleFill => 'Doldur (kenarları kırpar)';

  @override
  String get settingsScaleStretch => 'Uzat';

  @override
  String get settingsVideoScaleHint =>
      'Üçü arasında geçiş yapmak için oynatıcıda A tuşuna basın.';

  @override
  String get settingsBuffer => 'Ağ arabelleği';

  @override
  String get settingsBufferSmall => 'Küçük';

  @override
  String get settingsBufferNormal => 'Normal';

  @override
  String get settingsBufferLarge => 'Büyük';

  @override
  String get settingsBufferHint =>
      'Daha büyük bir arabellek, yavaş veya kararsız bağlantılarda yardımcı olur.';

  @override
  String unitSeconds(int p1) {
    return '$p1 sn';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 dk';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 dk';
  }

  @override
  String playerSkipBack(String p1) {
    return '$p1 geri';
  }

  @override
  String playerSkipForward(String p1) {
    return '$p1 ileri';
  }

  @override
  String get playerSleep => 'Uyku zamanlayıcısı';

  @override
  String get downloadsTitle => 'İndirilenler';

  @override
  String get downloadsAdd => 'İndir';

  @override
  String get downloadsSeason => 'Sezonu indir';

  @override
  String get downloadsChooseFolder =>
      'İndirilen filmlerin ve bölümlerin nereye kaydedileceğini seçin';

  @override
  String get downloadsChoose => 'Seç';

  @override
  String get downloadsNotChosen => 'İlk indirmede sorulur';

  @override
  String get downloadsChange => 'Klasörü değiştir…';

  @override
  String get downloadsPause => 'Duraklat';

  @override
  String get downloadsResume => 'Sürdür';

  @override
  String get downloadsCancel => 'İptal';

  @override
  String get downloadsPlay => 'Oynat';

  @override
  String get downloadsReveal => 'Finder’da göster';

  @override
  String get downloadsDelete => 'Dosyayı sil';

  @override
  String get downloadsEmpty => 'Henüz indirme yok';

  @override
  String get downloadsQueued => 'Bekliyor';

  @override
  String get downloadsDone => 'Tamamlandı';

  @override
  String get downloadsHint =>
      'İndirmeler tek tek çalışır. Birçok sağlayıcı yalnızca tek bağlantıya izin verir, bu yüzden indirirken oynatmak başarısız olabilir. Tamamlanmayan indirmeler uygulamadan çıkıldığında saklanmaz.';

  @override
  String get epgNow => 'Şimdi';

  @override
  String get epgNext => 'Sıradaki';

  @override
  String get settingsFullscreen =>
      'Oynatmayı tam ekranda aç (fareyi hareket ettirene kadar denetimler gizlenir)';

  @override
  String get nextTitle => 'Sıradaki';

  @override
  String nextIn(int p1) {
    return '$p1 sn içinde oynatılacak';
  }

  @override
  String get nextNow => 'Şimdi oynat';

  @override
  String get nextCancel => 'İptal';

  @override
  String get settingsAutoNext => 'Sonraki bölümü otomatik oynat';

  @override
  String get downloadsNoSpace => 'Yeterli boş disk alanı yok';

  @override
  String get dbErrorTitle => 'BattleStation TV veritabanını açamıyor';

  @override
  String get dbErrorBody =>
      'Başka bir BattleStation TV kopyası çalışıyorsa onu kapatıp tekrar deneyin.';

  @override
  String get dbRecoveredTitle => 'Veritabanı hasar görmüştü';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV yeni bir veritabanıyla başladı (kaynağınızı yeniden ekleyin). Hasarlı dosya burada saklandı:\n$p1';
  }

  @override
  String get menuShowWindow => 'Pencereyi göster';

  @override
  String get settingsTabGeneral => 'Genel';

  @override
  String get settingsTabPlayer => 'Oynatıcı';

  @override
  String get settingsTabPlaylists => 'Oynatma listeleri';

  @override
  String get settingsAppearance => 'Görünüm';

  @override
  String get settingsSystem => 'Sistem';

  @override
  String get appearanceLight => 'Açık';

  @override
  String get appearanceDark => 'Koyu';

  @override
  String get settingsInterfaceLanguage => 'Arayüz dili';

  @override
  String get settingsLanguageRestart =>
      'BattleStation TV yeniden başlatıldıktan sonra geçerli olur.';

  @override
  String get settingsHideCategories => 'Kategorileri gizle';

  @override
  String get settingsHideCategoriesWords => 'Gizlenecek kelimeler';

  @override
  String get settingsHideCategoriesNote =>
      'Adı bu kelimelerden birini içeren kategorileri gizler (virgülle ayırın). Bu kategorilerdeki kanallar, filmler ve diziler de arama, favoriler ve izlemeye devam et bölümünden kaybolur. Bu basit bir filtredir, ebeveyn kilidi değil: herkes burada değiştirebilir.';

  @override
  String get settingsRefresh => 'Oynatma listelerini güncelle';

  @override
  String get settingsRefresh0 => 'Yalnızca uygulama açıldığında';

  @override
  String get settingsRefresh6 => '6 saatte bir';

  @override
  String get settingsRefresh12 => '12 saatte bir';

  @override
  String get settingsRefresh24 => '24 saatte bir';

  @override
  String get settingsBackup => 'Yedekleme ve geri yükleme';

  @override
  String get backupExport => 'Yedeği dışa aktar…';

  @override
  String get backupImport => 'Yedeği içe aktar…';

  @override
  String get backupWarn =>
      'Yedek dosyası, oturum açma bilgileri içerebilen adresleriyle birlikte oynatma listelerinizi içerir; bu yüzden gizli tutun. Xtream kaynaklarının parolaları içinde saklanmaz. İçe aktarma mevcut kaynaklarınıza ekleme yapar ve hiçbir şeyi silmez.';

  @override
  String get backupExported => 'Yedek kaydedildi.';

  @override
  String get backupImported => 'Yedek içe aktarıldı.';

  @override
  String get backupErrorInvalid =>
      'Bu bir BattleStation TV yedek dosyası değil.';

  @override
  String get backupErrorVersion =>
      'Bu yedek BattleStation TV uygulamasının farklı bir sürümünden geliyor ve okunamıyor.';

  @override
  String get backupErrorTooLarge => 'Bu dosya yedek olamayacak kadar büyük.';

  @override
  String get backupFailed => 'Yedekleme başarısız';

  @override
  String get settingsClearData => 'Verileri temizle';

  @override
  String get clearHistory => 'İzleme geçmişini temizle';

  @override
  String get clearFavorites => 'Favorileri temizle';

  @override
  String get clearImages => 'Görsel önbelleğini temizle';

  @override
  String get clearConfirm => 'Temizle';

  @override
  String get clearHistoryWarn =>
      'Tüm kaynakların devam etme konumları ve izlemeye devam et listeleri silinecek. Bu işlem geri alınamaz.';

  @override
  String get clearFavoritesWarn =>
      'Tüm kaynaklardaki favorileriniz kaldırılacak. Bu işlem geri alınamaz.';

  @override
  String get clearImagesWarn =>
      'Kayıtlı logolar ve afişler kaldırılır ve gerektiğinde yeniden indirilir.';

  @override
  String get infoDetails => 'Ayrıntılar';

  @override
  String get infoPlot => 'Konu';

  @override
  String get infoCast => 'Oyuncular';

  @override
  String get infoDirector => 'Yönetmen';

  @override
  String get infoGenre => 'Tür';

  @override
  String get infoYear => 'Çıkış yılı';

  @override
  String get infoRating => 'Puan';

  @override
  String get infoDuration => 'Süre';

  @override
  String get infoCountry => 'Ülke';

  @override
  String get infoTrailer => 'Fragman';

  @override
  String get infoPlay => 'Oynat';

  @override
  String get infoEmpty => 'Sağlayıcınızın bu yapım hakkında bilgisi yok.';

  @override
  String get infoLoading => 'Ayrıntılar yükleniyor…';

  @override
  String get infoError => 'Ayrıntılar yüklenemedi.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 sa';
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
  String get playerSkipIntro => 'Girişi atla';

  @override
  String get playerSkipCredits => 'Jeneriği atla';

  @override
  String get playerSkipMenu => 'Giriş ve jenerik';

  @override
  String get playerMarkIntroStart => 'Giriş burada başlıyor';

  @override
  String get playerMarkIntroEnd => 'Giriş burada bitiyor';

  @override
  String get playerMarkCredits => 'Jenerik burada başlıyor';

  @override
  String get playerSkipForget => 'Giriş ve jeneriği unut';

  @override
  String get playerSkipSaved => 'Bu dizinin tüm bölümleri için kaydedildi';

  @override
  String get playerSkipRefused => 'Bu noktada mümkün değil';

  @override
  String get continueRemove => 'İzlemeye devam et listesinden kaldır';

  @override
  String get settingsFavoritesAZ => 'Favorileri ada göre sırala (A–Z)';

  @override
  String get settingsKeychain => 'Parolaları Anahtar Zinciri\'nde sakla';

  @override
  String get settingsKeychainNote =>
      'Kapalı: parolalar uygulamanın özel veritabanında kalır. Açık: macOS onları giriş anahtar zincirinizde saklar.';

  @override
  String get settingsKeychainFailed =>
      'Anahtar Zinciri parolaları kabul etmedi. Hiçbir şey değişmedi.';
}
