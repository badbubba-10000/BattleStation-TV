// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'สด';

  @override
  String get tabMovies => 'ภาพยนตร์';

  @override
  String get tabSeries => 'ซีรีส์';

  @override
  String get catAll => 'ทั้งหมด';

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
  String get catFavorites => 'รายการโปรด';

  @override
  String get catContinue => 'ดูต่อ';

  @override
  String get catFilter => 'กรองหมวดหมู่';

  @override
  String get playlistAll => 'เพลย์ลิสต์ทั้งหมด';

  @override
  String get playlistLabel => 'เพลย์ลิสต์';

  @override
  String get aboutAcknowledgements => 'ขอขอบคุณ';

  @override
  String get aboutPrivacy => 'ความเป็นส่วนตัว';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV ไม่เก็บข้อมูลใด ๆ เกี่ยวกับคุณ ไม่มีบัญชี ไม่มีการวิเคราะห์ ไม่มีโฆษณา และไม่มีการติดตาม\n\nแหล่งที่มา รายการโปรด และประวัติการรับชมของคุณจะอยู่บนอุปกรณ์เครื่องนี้ แอปจะเชื่อมต่อเฉพาะที่อยู่ที่คุณเพิ่มเองเท่านั้น ได้แก่ เซิร์ฟเวอร์ เพลย์ลิสต์ ผังรายการ โลโก้ และสตรีมของผู้ให้บริการ\n\nรหัสผ่านของผู้ให้บริการจะเก็บไว้ใน iOS Keychain บนอุปกรณ์เครื่องนี้เท่านั้น และจะไม่รวมอยู่ในไฟล์สำรองข้อมูล\n\nBattleStation TV ไม่มีช่อง ภาพยนตร์ หรือเพลย์ลิสต์มาให้ คุณต้องนำแหล่งที่มาของคุณเองมาเพิ่ม';

  @override
  String get aboutSource => 'ซอร์สโค้ดและใบอนุญาต';

  @override
  String get aboutCoffee => 'เลี้ยงกาแฟฉันสักแก้ว';

  @override
  String get tipsTitle => 'สนับสนุน BattleStation TV';

  @override
  String get tipsFooter =>
      'ทิปตามความสมัครใจผ่าน Apple ไม่ได้ปลดล็อกอะไรเพิ่ม ทุกฟีเจอร์ยังคงฟรีสำหรับทุกคน';

  @override
  String get tipsThanks => 'ขอบคุณที่สนับสนุน!';

  @override
  String get tipsPending => 'กำลังรอการอนุมัติ';

  @override
  String get tipsFailed => 'การให้ทิปไม่สำเร็จ ลองอีกครั้งภายหลัง';

  @override
  String get aboutVersion => 'เวอร์ชัน';

  @override
  String get catTitle => 'หมวดหมู่';

  @override
  String get commonCancel => 'ยกเลิก';

  @override
  String get emptyContinue => 'ไม่มีรายการให้ดูต่อ';

  @override
  String get emptyContinueHint => 'ภาพยนตร์และตอนที่คุณดูค้างไว้จะแสดงที่นี่';

  @override
  String get emptyFavorites => 'ยังไม่มีรายการโปรด';

  @override
  String get emptyFavoritesHint =>
      'กดชื่อเรื่องค้างไว้ แล้วเลือก เพิ่มในรายการโปรด';

  @override
  String get emptyFavoritesLive => 'ปัดช่องไปทางซ้าย แล้วแตะรูปดาว';

  @override
  String get emptyNone => 'ยังไม่มีอะไรที่นี่';

  @override
  String get emptyNoneHint =>
      'ดึงลงเพื่อรีเฟรช หรือตรวจสอบแหล่งที่มาในการตั้งค่า';

  @override
  String get fieldServerInvalid =>
      'ที่อยู่ดูเหมือนจะไม่ถูกต้อง ตัวอย่าง: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'ใส่ลิงก์แบบเต็ม โดยขึ้นต้นด้วย http:// หรือ https://';

  @override
  String get infoResume => 'ดูต่อ';

  @override
  String get libraryEmpty => 'คลังของคุณว่างเปล่า';

  @override
  String get libraryEmptyHint =>
      'รายการโปรดและเรื่องที่คุณเริ่มดูแล้วจะแสดงที่นี่';

  @override
  String get onbNoChannels =>
      'BattleStation TV ไม่มีช่อง ภาพยนตร์ หรือเพลย์ลิสต์มาให้ ให้เพิ่มแหล่งที่มาจากผู้ให้บริการที่คุณสมัครใช้งานอยู่';

  @override
  String get onbPasteHint => 'คัดลอกลิงก์เพลย์ลิสต์มาแล้วใช่ไหม';

  @override
  String get onbTestRunning => 'กำลังทดสอบ…';

  @override
  String passwordBodyIos(String p1) {
    return 'ใส่รหัสผ่านสำหรับ “$p1” โดยจะเก็บไว้ใน iOS Keychain บนอุปกรณ์เครื่องนี้';
  }

  @override
  String get searchRecent => 'การค้นหาล่าสุด';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'ดูต่อ ซีซัน $p1 ตอน $p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'ซีซัน $p1 ตอน $p2';
  }

  @override
  String get seriesNoEpisodes => 'ไม่พบตอน';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'เล่น ซีซัน $p1 ตอน $p2';
  }

  @override
  String get seriesWatched => 'ดูแล้ว';

  @override
  String get settingsAbout => 'เกี่ยวกับ';

  @override
  String get settingsEditSource => 'แก้ไขแหล่งที่มา';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV ใช้ภาษาของอุปกรณ์คุณ หากต้องการใช้ภาษาอื่นเฉพาะแอปนี้ ให้เลือกในการตั้งค่า iOS';

  @override
  String get settingsOpenIOS => 'เปิดการตั้งค่า iOS';

  @override
  String get settingsPasswordNote =>
      'เว้นรหัสผ่านใหม่ว่างไว้หากต้องการใช้รหัสผ่านเดิม รหัสผ่านจะเก็บไว้ใน iOS Keychain';

  @override
  String get settingsTitle => 'การตั้งค่า';

  @override
  String get sourceDeleteWarn =>
      'แหล่งที่มา รายการโปรด และประวัติการรับชมของแหล่งนั้นจะถูกลบออกจากอุปกรณ์เครื่องนี้ บัญชีของคุณกับผู้ให้บริการจะไม่ได้รับผลกระทบ';

  @override
  String get syncNow => 'รีเฟรช';

  @override
  String get tabLibrary => 'คลัง';

  @override
  String get scopeCategory => 'ในหมวดหมู่';

  @override
  String get scopeType => 'ในส่วนนี้';

  @override
  String get scopeEverywhere => 'ทุกที่';

  @override
  String get searchPrompt => 'ค้นหา';

  @override
  String get syncRunning => 'กำลังซิงค์…';

  @override
  String get syncFailed => 'ซิงค์ไม่สำเร็จ';

  @override
  String get syncNotUpdated => 'กำลังแสดงข้อมูลที่บันทึกไว้';

  @override
  String get emptyResults => 'ไม่พบรายการ';

  @override
  String get favAdd => 'เพิ่มในรายการโปรด';

  @override
  String get favRemove => 'ลบออกจากรายการโปรด';

  @override
  String get playerClose => 'ปิด';

  @override
  String get playerSubtitles => 'คำบรรยาย';

  @override
  String get playerAudio => 'เสียง';

  @override
  String get playerOff => 'ปิด';

  @override
  String get playerAddSubtitle => 'เพิ่มไฟล์คำบรรยาย…';

  @override
  String get playerCatchup => 'ดูย้อนหลัง';

  @override
  String get playerFullscreen => 'เต็มหน้าจอ';

  @override
  String get playerError => 'เล่นไม่สำเร็จ';

  @override
  String get playerRetry => 'ลองอีกครั้ง';

  @override
  String get playerPip => 'ภาพซ้อนภาพ';

  @override
  String get playerPipReturn => 'กลับไปที่แอป';

  @override
  String get catchupTitle => 'ดูย้อนหลัง';

  @override
  String get catchupNoEpg => 'ไม่มีผังรายการ โปรดเลือกเวลาด้วยตนเอง';

  @override
  String get catchupPick => 'เวลาเริ่มต้น';

  @override
  String get catchupDuration => 'นาที';

  @override
  String get seriesSeason => 'ซีซัน';

  @override
  String get onbWelcomeTitle => 'ยินดีต้อนรับสู่ BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'ดูช่องสด ภาพยนตร์ และซีรีส์จากผู้ให้บริการ IPTV ของคุณ มาเพิ่มแหล่งที่มาแรกของคุณกัน';

  @override
  String get onbWhereTitle => 'ต้องใส่ที่อยู่ตรงไหน';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: ผู้ให้บริการจะให้ที่อยู่เซิร์ฟเวอร์ (เช่น http://host:8080) ชื่อผู้ใช้ และรหัสผ่านแก่คุณ ใส่ข้อมูลเหล่านี้ด้านล่าง';

  @override
  String get onbWhereM3u =>
      'M3U: ตั้งชื่อแหล่งที่มา แล้ววางลิงก์เพลย์ลิสต์ที่ผู้ให้บริการให้มา';

  @override
  String get fieldKind => 'ประเภท';

  @override
  String get fieldName => 'ชื่อ';

  @override
  String get fieldServer => 'ที่อยู่เซิร์ฟเวอร์';

  @override
  String get fieldUsername => 'ชื่อผู้ใช้';

  @override
  String get fieldPassword => 'รหัสผ่าน';

  @override
  String get fieldUrl => 'ลิงก์เพลย์ลิสต์';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'ทดสอบการเชื่อมต่อ';

  @override
  String get onbTestOk => 'เชื่อมต่อสำเร็จ';

  @override
  String get onbTestFail => 'เชื่อมต่อไม่สำเร็จ';

  @override
  String get onbNext => 'ถัดไป';

  @override
  String get onbBack => 'ย้อนกลับ';

  @override
  String get onbSave => 'บันทึกและซิงค์';

  @override
  String get settingsAccounts => 'แหล่งที่มา';

  @override
  String get settingsLanguageSub => 'ภาษาคำบรรยายที่ต้องการ';

  @override
  String get settingsLanguageAudio => 'ภาษาเสียงที่ต้องการ';

  @override
  String get settingsSubscale => 'ขนาดคำบรรยาย';

  @override
  String get settingsSubdelay => 'ความหน่วงของคำบรรยาย (วินาที)';

  @override
  String get settingsGuide => 'แสดงคู่มือเริ่มต้นใช้งาน';

  @override
  String get settingsDelete => 'ลบ';

  @override
  String get accountAdd => 'เพิ่มแหล่งที่มา…';

  @override
  String get settingsChangePassword => 'เปลี่ยนรหัสผ่าน…';

  @override
  String get settingsNewPassword => 'รหัสผ่านใหม่';

  @override
  String updateAvailable(String p1) {
    return 'เวอร์ชัน $p1 พร้อมให้ใช้งาน';
  }

  @override
  String get updateNow => 'อัปเดตทันที';

  @override
  String get updateNotes => 'มีอะไรใหม่';

  @override
  String get updateLater => 'ภายหลัง';

  @override
  String get updateDownloading => 'กำลังดาวน์โหลดอัปเดต…';

  @override
  String updateReady(String p1) {
    return 'เวอร์ชัน $p1 พร้อมติดตั้งแล้ว';
  }

  @override
  String get updateRestart => 'เริ่มต้นใหม่เพื่ออัปเดต';

  @override
  String get updateFailed => 'อัปเดตไม่สำเร็จ';

  @override
  String get updateManual => 'ดาวน์โหลดด้วยตนเอง';

  @override
  String get updateCheckNow => 'ตรวจหาอัปเดต';

  @override
  String get updateAuto => 'ตรวจหาอัปเดตโดยอัตโนมัติ';

  @override
  String get updateAutoInstall => 'ดาวน์โหลดอัปเดตโดยอัตโนมัติ';

  @override
  String get updateUpToDate => 'คุณใช้เวอร์ชันล่าสุดอยู่แล้ว';

  @override
  String get updateDevBuild =>
      'การอัปเดตใช้ได้เฉพาะในแอปที่ติดตั้งแล้วเท่านั้น';

  @override
  String updateCurrent(String p1) {
    return 'เวอร์ชันปัจจุบัน: $p1';
  }

  @override
  String get playerBack => 'ย้อนกลับ';

  @override
  String get playerErrorHint =>
      'หากยังเกิดปัญหานี้ต่อเนื่อง โปรดตรวจสอบรหัสผ่านของแหล่งที่มาในการตั้งค่า';

  @override
  String get passwordTitle => 'ต้องใช้รหัสผ่าน';

  @override
  String passwordBody(String p1) {
    return 'ใส่รหัสผ่านสำหรับ “$p1” โดยจะถูกเก็บไว้เป็นส่วนตัวบน Mac เครื่องนี้';
  }

  @override
  String get passwordNone => 'ดำเนินการต่อโดยไม่ใช้รหัสผ่าน';

  @override
  String get playerSpeed => 'ความเร็วในการเล่น';

  @override
  String get playerSpeedNormal => 'ปกติ';

  @override
  String get playerSpeedReset => 'ความเร็วปกติ';

  @override
  String get settingsSeekPreview => 'แสดงภาพตัวอย่างบนแถบเลื่อนเวลา';

  @override
  String get settingsSeekPreviewNote =>
      'เปิดการเชื่อมต่อที่สองไปยังผู้ให้บริการของคุณ ปิดตัวเลือกนี้หากการเล่นหยุด หรือผู้ให้บริการของคุณอนุญาตเพียงหนึ่งการเชื่อมต่อ';

  @override
  String get playerSeekBar => 'ตำแหน่งการเล่น';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 จาก $p2';
  }

  @override
  String get playerLive => 'สด';

  @override
  String get playerChannelPrev => 'ช่องก่อนหน้า';

  @override
  String get playerChannelNext => 'ช่องถัดไป';

  @override
  String get playerScaleFit => 'พอดี';

  @override
  String get playerScaleFill => 'เต็ม';

  @override
  String get playerScaleStretch => 'ยืด';

  @override
  String get playerSubtitleAdjust => 'ปรับคำบรรยาย…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'ความสว่าง';

  @override
  String get playerVolume => 'ระดับเสียง';

  @override
  String get playerReplay => 'เล่นอีกครั้ง';

  @override
  String get settingsClock => 'แสดงเวลาในเครื่องเล่น';

  @override
  String get settingsSeekStep => 'ระยะข้าม (ปุ่มลูกศรและปุ่มข้าม)';

  @override
  String get settingsBarsHide => 'ซ่อนตัวควบคุมหลังจาก';

  @override
  String get settingsNever => 'ไม่เลย';

  @override
  String get settingsVideoScale => 'มาตราส่วนวิดีโอ';

  @override
  String get settingsScaleFit => 'พอดี (มีแถบสีดำ)';

  @override
  String get settingsScaleFill => 'เต็มพื้นที่ (ตัดขอบ)';

  @override
  String get settingsScaleStretch => 'ยืด';

  @override
  String get settingsVideoScaleHint =>
      'กดปุ่ม A ในเครื่องเล่นเพื่อสลับระหว่างสามแบบ';

  @override
  String get settingsBuffer => 'บัฟเฟอร์เครือข่าย';

  @override
  String get settingsBufferSmall => 'เล็ก';

  @override
  String get settingsBufferNormal => 'ปกติ';

  @override
  String get settingsBufferLarge => 'ใหญ่';

  @override
  String get settingsBufferHint =>
      'บัฟเฟอร์ที่ใหญ่ขึ้นช่วยได้เมื่อการเชื่อมต่อช้าหรือไม่เสถียร';

  @override
  String unitSeconds(int p1) {
    return '$p1 วินาที';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 นาที';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 น.';
  }

  @override
  String playerSkipBack(String p1) {
    return 'ย้อนหลัง $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'ไปข้างหน้า $p1';
  }

  @override
  String get playerSleep => 'ตั้งเวลาปิด';

  @override
  String get downloadsTitle => 'ดาวน์โหลด';

  @override
  String get downloadsAdd => 'ดาวน์โหลด';

  @override
  String get downloadsSeason => 'ดาวน์โหลดทั้งซีซัน';

  @override
  String get downloadsChooseFolder =>
      'เลือกตำแหน่งที่จะบันทึกภาพยนตร์และตอนที่ดาวน์โหลด';

  @override
  String get downloadsChoose => 'เลือก';

  @override
  String get downloadsNotChosen => 'จะถามเมื่อดาวน์โหลดครั้งแรก';

  @override
  String get downloadsChange => 'เปลี่ยนโฟลเดอร์…';

  @override
  String get downloadsPause => 'หยุดชั่วคราว';

  @override
  String get downloadsResume => 'ดำเนินการต่อ';

  @override
  String get downloadsCancel => 'ยกเลิก';

  @override
  String get downloadsPlay => 'เล่น';

  @override
  String get downloadsReveal => 'แสดงใน Finder';

  @override
  String get downloadsDelete => 'ลบไฟล์';

  @override
  String get downloadsEmpty => 'ยังไม่มีการดาวน์โหลด';

  @override
  String get downloadsQueued => 'กำลังรอ';

  @override
  String get downloadsDone => 'เสร็จสิ้น';

  @override
  String get downloadsHint =>
      'การดาวน์โหลดจะทำทีละรายการ ผู้ให้บริการหลายรายอนุญาตให้เชื่อมต่อได้เพียงหนึ่งการเชื่อมต่อ ดังนั้นการเล่นขณะดาวน์โหลดอาจไม่สำเร็จ การดาวน์โหลดที่ยังไม่เสร็จจะไม่ถูกเก็บไว้เมื่อออกจากแอป';

  @override
  String get epgNow => 'ตอนนี้';

  @override
  String get epgNext => 'ถัดไป';

  @override
  String get settingsFullscreen =>
      'เปิดการเล่นแบบเต็มหน้าจอ (ตัวควบคุมจะซ่อนจนกว่าคุณจะขยับเมาส์)';

  @override
  String get nextTitle => 'รายการถัดไป';

  @override
  String nextIn(int p1) {
    return 'เล่นใน $p1 วินาที';
  }

  @override
  String get nextNow => 'เล่นทันที';

  @override
  String get nextCancel => 'ยกเลิก';

  @override
  String get settingsAutoNext => 'เล่นตอนถัดไปโดยอัตโนมัติ';

  @override
  String get downloadsNoSpace => 'พื้นที่ว่างในดิสก์ไม่เพียงพอ';

  @override
  String get dbErrorTitle => 'BattleStation TV เปิดฐานข้อมูลไม่ได้';

  @override
  String get dbErrorBody =>
      'หากมี BattleStation TV อีกสำเนากำลังทำงานอยู่ ให้ออกจากโปรแกรมนั้นแล้วลองอีกครั้ง';

  @override
  String get dbRecoveredTitle => 'ฐานข้อมูลเสียหาย';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV เริ่มทำงานด้วยฐานข้อมูลใหม่ (โปรดเพิ่มแหล่งที่มาของคุณอีกครั้ง) ไฟล์ที่เสียหายถูกเก็บไว้ที่นี่:\n$p1';
  }

  @override
  String get menuShowWindow => 'แสดงหน้าต่าง';

  @override
  String get settingsTabGeneral => 'ทั่วไป';

  @override
  String get settingsTabPlayer => 'เครื่องเล่น';

  @override
  String get settingsTabPlaylists => 'เพลย์ลิสต์';

  @override
  String get settingsAppearance => 'รูปลักษณ์';

  @override
  String get settingsSystem => 'ระบบ';

  @override
  String get appearanceLight => 'สว่าง';

  @override
  String get appearanceDark => 'มืด';

  @override
  String get settingsInterfaceLanguage => 'ภาษาของอินเทอร์เฟซ';

  @override
  String get settingsLanguageRestart =>
      'จะมีผลหลังจากเริ่มต้น BattleStation TV ใหม่';

  @override
  String get settingsHideCategories => 'ซ่อนหมวดหมู่';

  @override
  String get settingsHideCategoriesWords => 'คำที่จะซ่อน';

  @override
  String get settingsHideCategoriesNote =>
      'ซ่อนหมวดหมู่ที่ชื่อมีคำเหล่านี้ (คั่นด้วยเครื่องหมายจุลภาค) ช่อง ภาพยนตร์ และซีรีส์ในหมวดหมู่เหล่านั้นจะหายไปจากการค้นหา รายการโปรด และดูต่อด้วย นี่เป็นเพียงตัวกรองธรรมดา ไม่ใช่การควบคุมโดยผู้ปกครอง ใครก็เปลี่ยนค่านี้ได้ที่นี่';

  @override
  String get settingsRefresh => 'อัปเดตเพลย์ลิสต์';

  @override
  String get settingsRefresh0 => 'เมื่อเปิดแอปเท่านั้น';

  @override
  String get settingsRefresh6 => 'ทุก 6 ชั่วโมง';

  @override
  String get settingsRefresh12 => 'ทุก 12 ชั่วโมง';

  @override
  String get settingsRefresh24 => 'ทุก 24 ชั่วโมง';

  @override
  String get settingsBackup => 'สำรองและกู้คืนข้อมูล';

  @override
  String get backupExport => 'ส่งออกข้อมูลสำรอง…';

  @override
  String get backupImport => 'นำเข้าข้อมูลสำรอง…';

  @override
  String get backupWarn =>
      'ไฟล์สำรองข้อมูลจะแสดงรายการเพลย์ลิสต์ของคุณพร้อมที่อยู่ ซึ่งอาจมีข้อมูลล็อกอินรวมอยู่ด้วย จึงควรเก็บเป็นความลับ รหัสผ่านของแหล่งที่มา Xtream จะไม่ถูกบันทึกไว้ในไฟล์นี้ การนำเข้าจะเพิ่มลงในแหล่งที่มาปัจจุบันของคุณและจะไม่ลบอะไรเลย';

  @override
  String get backupExported => 'บันทึกข้อมูลสำรองแล้ว';

  @override
  String get backupImported => 'นำเข้าข้อมูลสำรองแล้ว';

  @override
  String get backupErrorInvalid => 'นี่ไม่ใช่ไฟล์สำรองของ BattleStation TV';

  @override
  String get backupErrorVersion =>
      'ข้อมูลสำรองนี้มาจาก BattleStation TV คนละเวอร์ชันและไม่สามารถอ่านได้';

  @override
  String get backupErrorTooLarge => 'ไฟล์นี้ใหญ่เกินกว่าจะเป็นไฟล์สำรอง';

  @override
  String get backupFailed => 'การสำรองข้อมูลล้มเหลว';

  @override
  String get settingsClearData => 'ล้างข้อมูล';

  @override
  String get clearHistory => 'ล้างประวัติการรับชม';

  @override
  String get clearFavorites => 'ล้างรายการโปรด';

  @override
  String get clearImages => 'ล้างแคชรูปภาพ';

  @override
  String get clearConfirm => 'ล้าง';

  @override
  String get clearHistoryWarn =>
      'ตำแหน่งที่ดูค้างไว้และรายการดูต่อของทุกแหล่งที่มาจะถูกลบ ไม่สามารถยกเลิกการดำเนินการนี้ได้';

  @override
  String get clearFavoritesWarn =>
      'รายการโปรดในทุกแหล่งที่มาจะถูกลบ ไม่สามารถยกเลิกการดำเนินการนี้ได้';

  @override
  String get clearImagesWarn =>
      'โลโก้และโปสเตอร์ที่บันทึกไว้จะถูกลบและดาวน์โหลดใหม่เมื่อจำเป็น';

  @override
  String get infoDetails => 'รายละเอียด';

  @override
  String get infoPlot => 'เรื่องย่อ';

  @override
  String get infoCast => 'นักแสดง';

  @override
  String get infoDirector => 'ผู้กำกับ';

  @override
  String get infoGenre => 'ประเภท';

  @override
  String get infoYear => 'ปีที่ออกฉาย';

  @override
  String get infoRating => 'คะแนน';

  @override
  String get infoDuration => 'ความยาว';

  @override
  String get infoCountry => 'ประเทศ';

  @override
  String get infoTrailer => 'ตัวอย่าง';

  @override
  String get infoPlay => 'เล่น';

  @override
  String get infoEmpty => 'ผู้ให้บริการของคุณไม่มีรายละเอียดของเรื่องนี้';

  @override
  String get infoLoading => 'กำลังโหลดรายละเอียด…';

  @override
  String get infoError => 'โหลดรายละเอียดไม่สำเร็จ';

  @override
  String unitHoursShort(int p1) {
    return '$p1 ชม.';
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
  String get playerSkipIntro => 'ข้ามช่วงอินโทร';

  @override
  String get playerSkipCredits => 'ข้ามเครดิต';

  @override
  String get playerSkipMenu => 'อินโทรและเครดิต';

  @override
  String get playerMarkIntroStart => 'อินโทรเริ่มตรงนี้';

  @override
  String get playerMarkIntroEnd => 'อินโทรจบตรงนี้';

  @override
  String get playerMarkCredits => 'เครดิตเริ่มตรงนี้';

  @override
  String get playerSkipForget => 'ลืมอินโทรและเครดิต';

  @override
  String get playerSkipSaved => 'บันทึกไว้สำหรับทุกตอนของซีรีส์นี้แล้ว';

  @override
  String get playerSkipRefused => 'ทำไม่ได้ตรงจุดนี้';

  @override
  String get continueRemove => 'ลบออกจากดูต่อ';

  @override
  String get settingsFavoritesAZ => 'เรียงรายการโปรดตามชื่อ (A–Z)';

  @override
  String get settingsKeychain => 'เก็บรหัสผ่านในพวงกุญแจ';

  @override
  String get settingsKeychainNote =>
      'ปิด: รหัสผ่านอยู่ในฐานข้อมูลส่วนตัวของแอป เปิด: macOS เก็บไว้ในพวงกุญแจเข้าสู่ระบบของคุณ';

  @override
  String get settingsKeychainFailed =>
      'พวงกุญแจไม่รับรหัสผ่าน ไม่มีการเปลี่ยนแปลงใดๆ';
}
