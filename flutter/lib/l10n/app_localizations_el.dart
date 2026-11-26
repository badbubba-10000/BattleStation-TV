// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Ζωντανά';

  @override
  String get tabMovies => 'Ταινίες';

  @override
  String get tabSeries => 'Σειρές';

  @override
  String get catAll => 'Όλα';

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
  String get catFavorites => 'Αγαπημένα';

  @override
  String get catContinue => 'Συνέχεια προβολής';

  @override
  String get catFilter => 'Φιλτράρισμα κατηγοριών';

  @override
  String get playlistAll => 'Όλες οι λίστες αναπαραγωγής';

  @override
  String get playlistLabel => 'Λίστα αναπαραγωγής';

  @override
  String get aboutAcknowledgements => 'Ευχαριστίες';

  @override
  String get aboutPrivacy => 'Απόρρητο';

  @override
  String get aboutPrivacyBody =>
      'Το BattleStation TV δεν συλλέγει κανένα δεδομένο για εσάς. Δεν έχει λογαριασμό, αναλυτικά στοιχεία, διαφημίσεις ή παρακολούθηση.\n\nΟι πηγές, τα αγαπημένα και το ιστορικό προβολής σας παραμένουν σε αυτή τη συσκευή. Η εφαρμογή συνδέεται μόνο με τις διευθύνσεις που προσθέτετε εσείς: τον διακομιστή του παρόχου σας, τη λίστα αναπαραγωγής, τον οδηγό προγράμματος, τα λογότυπα και τις ροές.\n\nΟι κωδικοί πρόσβασης του παρόχου αποθηκεύονται στο iOS Keychain μόνο σε αυτή τη συσκευή. Δεν περιλαμβάνονται ποτέ σε αρχείο αντιγράφου ασφαλείας.\n\nΤο BattleStation TV δεν περιλαμβάνει κανάλια, ταινίες ή λίστες αναπαραγωγής. Την πηγή την φέρνετε εσείς.';

  @override
  String get aboutSource => 'Πηγαίος κώδικας και άδεια χρήσης';

  @override
  String get aboutCoffee => 'Κεράστε με έναν καφέ';

  @override
  String get tipsTitle => 'Υποστηρίξτε το BattleStation TV';

  @override
  String get tipsFooter =>
      'Προαιρετικά φιλοδωρήματα μέσω της Apple. Δεν ξεκλειδώνουν τίποτα: όλες οι λειτουργίες μένουν δωρεάν για όλους.';

  @override
  String get tipsThanks => 'Σας ευχαριστούμε για την υποστήριξη!';

  @override
  String get tipsPending => 'Αναμονή έγκρισης.';

  @override
  String get tipsFailed =>
      'Το φιλοδώρημα δεν ολοκληρώθηκε. Δοκιμάστε ξανά αργότερα.';

  @override
  String get aboutVersion => 'Έκδοση';

  @override
  String get catTitle => 'Κατηγορίες';

  @override
  String get commonCancel => 'Ακύρωση';

  @override
  String get emptyContinue => 'Δεν υπάρχει κάτι για συνέχεια';

  @override
  String get emptyContinueHint =>
      'Οι ταινίες και τα επεισόδια που σταματάτε στη μέση εμφανίζονται εδώ.';

  @override
  String get emptyFavorites => 'Δεν υπάρχουν αγαπημένα ακόμη';

  @override
  String get emptyFavoritesHint =>
      'Πατήστε παρατεταμένα έναν τίτλο και επιλέξτε «Προσθήκη στα αγαπημένα».';

  @override
  String get emptyFavoritesLive =>
      'Σύρετε ένα κανάλι προς τα αριστερά και πατήστε το αστέρι.';

  @override
  String get emptyNone => 'Δεν υπάρχει τίποτα εδώ ακόμη';

  @override
  String get emptyNoneHint =>
      'Σύρετε προς τα κάτω για ανανέωση ή ελέγξτε την πηγή σας στις Ρυθμίσεις.';

  @override
  String get fieldServerInvalid =>
      'Αυτή η διεύθυνση δεν φαίνεται σωστή. Παράδειγμα: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Εισαγάγετε ολόκληρο τον σύνδεσμο, ξεκινώντας με http:// ή https://';

  @override
  String get infoResume => 'Συνέχιση';

  @override
  String get libraryEmpty => 'Η βιβλιοθήκη σας είναι άδεια';

  @override
  String get libraryEmptyHint =>
      'Τα αγαπημένα και οι τίτλοι που ξεκινήσατε να βλέπετε εμφανίζονται εδώ.';

  @override
  String get onbNoChannels =>
      'Το BattleStation TV δεν περιλαμβάνει κανάλια, ταινίες ή λίστες αναπαραγωγής. Προσθέστε μια πηγή από πάροχο στον οποίο είστε συνδρομητής.';

  @override
  String get onbPasteHint => 'Αντιγράψατε σύνδεσμο λίστας αναπαραγωγής;';

  @override
  String get onbTestRunning => 'Δοκιμή…';

  @override
  String passwordBodyIos(String p1) {
    return 'Εισαγάγετε τον κωδικό πρόσβασης για το «$p1». Αποθηκεύεται στο iOS Keychain σε αυτή τη συσκευή.';
  }

  @override
  String get searchRecent => 'Πρόσφατες αναζητήσεις';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Συνέχεια Σ$p1 Ε$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'Σ$p1 Ε$p2';
  }

  @override
  String get seriesNoEpisodes => 'Δεν βρέθηκαν επεισόδια';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Αναπαραγωγή Σ$p1 Ε$p2';
  }

  @override
  String get seriesWatched => 'Προβλήθηκε';

  @override
  String get settingsAbout => 'Σχετικά';

  @override
  String get settingsEditSource => 'Επεξεργασία πηγής';

  @override
  String get settingsLanguageNote =>
      'Το BattleStation TV χρησιμοποιεί τη γλώσσα της συσκευής σας. Για να χρησιμοποιήσετε άλλη γλώσσα μόνο για αυτήν την εφαρμογή, επιλέξτε την στις Ρυθμίσεις iOS.';

  @override
  String get settingsOpenIOS => 'Άνοιγμα των Ρυθμίσεων iOS';

  @override
  String get settingsPasswordNote =>
      'Αφήστε τον νέο κωδικό πρόσβασης κενό για να διατηρήσετε τον τρέχοντα. Οι κωδικοί πρόσβασης αποθηκεύονται στο iOS Keychain.';

  @override
  String get settingsTitle => 'Ρυθμίσεις';

  @override
  String get sourceDeleteWarn =>
      'Η πηγή, τα αγαπημένα και το ιστορικό προβολής της αφαιρούνται από αυτή τη συσκευή. Ο λογαριασμός σας στον πάροχο δεν επηρεάζεται.';

  @override
  String get syncNow => 'Ανανέωση';

  @override
  String get tabLibrary => 'Βιβλιοθήκη';

  @override
  String get scopeCategory => 'Στην κατηγορία';

  @override
  String get scopeType => 'Στην ενότητα';

  @override
  String get scopeEverywhere => 'Παντού';

  @override
  String get searchPrompt => 'Αναζήτηση';

  @override
  String get syncRunning => 'Συγχρονισμός…';

  @override
  String get syncFailed => 'Ο συγχρονισμός απέτυχε';

  @override
  String get syncNotUpdated => 'Εμφάνιση αποθηκευμένων δεδομένων';

  @override
  String get emptyResults => 'Δεν βρέθηκε τίποτα';

  @override
  String get favAdd => 'Προσθήκη στα αγαπημένα';

  @override
  String get favRemove => 'Αφαίρεση από τα αγαπημένα';

  @override
  String get playerClose => 'Κλείσιμο';

  @override
  String get playerSubtitles => 'Υπότιτλοι';

  @override
  String get playerAudio => 'Ήχος';

  @override
  String get playerOff => 'Ανενεργό';

  @override
  String get playerAddSubtitle => 'Προσθήκη αρχείου υποτίτλων…';

  @override
  String get playerCatchup => 'Προβολή παλαιότερης εκπομπής';

  @override
  String get playerFullscreen => 'Πλήρης οθόνη';

  @override
  String get playerError => 'Η αναπαραγωγή απέτυχε';

  @override
  String get playerRetry => 'Δοκιμή ξανά';

  @override
  String get playerPip => 'Εικόνα σε εικόνα';

  @override
  String get playerPipReturn => 'Επιστροφή στην εφαρμογή';

  @override
  String get catchupTitle => 'Παλαιότερες εκπομπές';

  @override
  String get catchupNoEpg =>
      'Δεν υπάρχει οδηγός προγράμματος. Επιλέξτε την ώρα χειροκίνητα.';

  @override
  String get catchupPick => 'Ώρα έναρξης';

  @override
  String get catchupDuration => 'Λεπτά';

  @override
  String get seriesSeason => 'Σεζόν';

  @override
  String get onbWelcomeTitle => 'Καλώς ήρθατε στο BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Παρακολουθήστε ζωντανά κανάλια, ταινίες και σειρές από τον πάροχο IPTV σας. Ας προσθέσουμε την πρώτη σας πηγή.';

  @override
  String get onbWhereTitle => 'Πού καταχωρίζονται οι διευθύνσεις;';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: ο πάροχός σας σάς δίνει μια διεύθυνση διακομιστή (π.χ. http://host:8080), ένα όνομα χρήστη και έναν κωδικό πρόσβασης. Καταχωρίστε τα παρακάτω.';

  @override
  String get onbWhereM3u =>
      'M3U: δώστε ένα όνομα στην πηγή και επικολλήστε τον σύνδεσμο λίστας αναπαραγωγής που σας έδωσε ο πάροχός σας.';

  @override
  String get fieldKind => 'Τύπος';

  @override
  String get fieldName => 'Όνομα';

  @override
  String get fieldServer => 'Διεύθυνση διακομιστή';

  @override
  String get fieldUsername => 'Όνομα χρήστη';

  @override
  String get fieldPassword => 'Κωδικός πρόσβασης';

  @override
  String get fieldUrl => 'Σύνδεσμος λίστας αναπαραγωγής';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Δοκιμή σύνδεσης';

  @override
  String get onbTestOk => 'Επιτυχής σύνδεση';

  @override
  String get onbTestFail => 'Η σύνδεση απέτυχε';

  @override
  String get onbNext => 'Επόμενο';

  @override
  String get onbBack => 'Πίσω';

  @override
  String get onbSave => 'Αποθήκευση και συγχρονισμός';

  @override
  String get settingsAccounts => 'Πηγές';

  @override
  String get settingsLanguageSub => 'Προτιμώμενες γλώσσες υποτίτλων';

  @override
  String get settingsLanguageAudio => 'Προτιμώμενες γλώσσες ήχου';

  @override
  String get settingsSubscale => 'Μέγεθος υποτίτλων';

  @override
  String get settingsSubdelay => 'Καθυστέρηση υποτίτλων (δευτερόλεπτα)';

  @override
  String get settingsGuide => 'Εμφάνιση οδηγού γρήγορης εκκίνησης';

  @override
  String get settingsDelete => 'Διαγραφή';

  @override
  String get accountAdd => 'Προσθήκη πηγής…';

  @override
  String get settingsChangePassword => 'Αλλαγή κωδικού πρόσβασης…';

  @override
  String get settingsNewPassword => 'Νέος κωδικός πρόσβασης';

  @override
  String updateAvailable(String p1) {
    return 'Η έκδοση $p1 είναι διαθέσιμη';
  }

  @override
  String get updateNow => 'Ενημέρωση τώρα';

  @override
  String get updateNotes => 'Τι νέο υπάρχει';

  @override
  String get updateLater => 'Αργότερα';

  @override
  String get updateDownloading => 'Λήψη ενημέρωσης…';

  @override
  String updateReady(String p1) {
    return 'Η έκδοση $p1 είναι έτοιμη για εγκατάσταση';
  }

  @override
  String get updateRestart => 'Επανεκκίνηση για ενημέρωση';

  @override
  String get updateFailed => 'Η ενημέρωση απέτυχε';

  @override
  String get updateManual => 'Μη αυτόματη λήψη';

  @override
  String get updateCheckNow => 'Έλεγχος για ενημερώσεις';

  @override
  String get updateAuto => 'Αυτόματος έλεγχος για ενημερώσεις';

  @override
  String get updateAutoInstall => 'Αυτόματη λήψη ενημερώσεων';

  @override
  String get updateUpToDate => 'Έχετε την πιο πρόσφατη έκδοση';

  @override
  String get updateDevBuild =>
      'Οι ενημερώσεις είναι διαθέσιμες μόνο στην εγκατεστημένη εφαρμογή';

  @override
  String updateCurrent(String p1) {
    return 'Τρέχουσα έκδοση: $p1';
  }

  @override
  String get playerBack => 'Πίσω';

  @override
  String get playerErrorHint =>
      'Αν συνεχίσει να συμβαίνει, ελέγξτε τον κωδικό πρόσβασης της πηγής στις Ρυθμίσεις.';

  @override
  String get passwordTitle => 'Απαιτείται κωδικός πρόσβασης';

  @override
  String passwordBody(String p1) {
    return 'Εισαγάγετε τον κωδικό πρόσβασης για το «$p1». Αποθηκεύεται ιδιωτικά σε αυτό το Mac.';
  }

  @override
  String get passwordNone => 'Συνέχεια χωρίς κωδικό πρόσβασης';

  @override
  String get playerSpeed => 'Ταχύτητα αναπαραγωγής';

  @override
  String get playerSpeedNormal => 'Κανονική';

  @override
  String get playerSpeedReset => 'Κανονική ταχύτητα';

  @override
  String get settingsSeekPreview =>
      'Μικρογραφίες προεπισκόπησης στη γραμμή προόδου';

  @override
  String get settingsSeekPreviewNote =>
      'Ανοίγει δεύτερη σύνδεση με τον πάροχό σας. Απενεργοποιήστε το αν η αναπαραγωγή σταματά ή αν ο πάροχός σας επιτρέπει μόνο μία σύνδεση.';

  @override
  String get playerSeekBar => 'Θέση αναπαραγωγής';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 από $p2';
  }

  @override
  String get playerLive => 'Ζωντανά';

  @override
  String get playerChannelPrev => 'Προηγούμενο κανάλι';

  @override
  String get playerChannelNext => 'Επόμενο κανάλι';

  @override
  String get playerScaleFit => 'Προσαρμογή';

  @override
  String get playerScaleFill => 'Γέμισμα';

  @override
  String get playerScaleStretch => 'Έκταση';

  @override
  String get playerSubtitleAdjust => 'Ρύθμιση υποτίτλων…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Φωτεινότητα';

  @override
  String get playerVolume => 'Ένταση';

  @override
  String get playerReplay => 'Αναπαραγωγή ξανά';

  @override
  String get settingsClock => 'Εμφάνιση της ώρας στο πρόγραμμα αναπαραγωγής';

  @override
  String get settingsSeekStep =>
      'Βήμα μετάβασης (πλήκτρα βελών και κουμπιά μετάβασης)';

  @override
  String get settingsBarsHide => 'Απόκρυψη των χειριστηρίων μετά από';

  @override
  String get settingsNever => 'Ποτέ';

  @override
  String get settingsVideoScale => 'Κλιμάκωση βίντεο';

  @override
  String get settingsScaleFit => 'Προσαρμογή (μαύρες λωρίδες)';

  @override
  String get settingsScaleFill => 'Γέμισμα (περικόπτει τις άκρες)';

  @override
  String get settingsScaleStretch => 'Έκταση';

  @override
  String get settingsVideoScaleHint =>
      'Πατήστε A στο πρόγραμμα αναπαραγωγής για εναλλαγή μεταξύ των τριών.';

  @override
  String get settingsBuffer => 'Προσωρινή μνήμη δικτύου';

  @override
  String get settingsBufferSmall => 'Μικρή';

  @override
  String get settingsBufferNormal => 'Κανονική';

  @override
  String get settingsBufferLarge => 'Μεγάλη';

  @override
  String get settingsBufferHint =>
      'Μια μεγαλύτερη προσωρινή μνήμη βοηθά σε αργή ή ασταθή σύνδεση.';

  @override
  String unitSeconds(int p1) {
    return '$p1 δευτ.';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 λεπτ.';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 λ.';
  }

  @override
  String playerSkipBack(String p1) {
    return 'Πίσω $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Μπροστά $p1';
  }

  @override
  String get playerSleep => 'Χρονοδιακόπτης ύπνου';

  @override
  String get downloadsTitle => 'Λήψεις';

  @override
  String get downloadsAdd => 'Λήψη';

  @override
  String get downloadsSeason => 'Λήψη σεζόν';

  @override
  String get downloadsChooseFolder =>
      'Επιλέξτε πού θα αποθηκεύονται οι ταινίες και τα επεισόδια που κατεβάζετε';

  @override
  String get downloadsChoose => 'Επιλογή';

  @override
  String get downloadsNotChosen => 'Θα ζητηθεί στην πρώτη λήψη';

  @override
  String get downloadsChange => 'Αλλαγή φακέλου…';

  @override
  String get downloadsPause => 'Παύση';

  @override
  String get downloadsResume => 'Συνέχιση';

  @override
  String get downloadsCancel => 'Ακύρωση';

  @override
  String get downloadsPlay => 'Αναπαραγωγή';

  @override
  String get downloadsReveal => 'Εμφάνιση στο Finder';

  @override
  String get downloadsDelete => 'Διαγραφή αρχείου';

  @override
  String get downloadsEmpty => 'Δεν υπάρχουν λήψεις ακόμη';

  @override
  String get downloadsQueued => 'Σε αναμονή';

  @override
  String get downloadsDone => 'Ολοκληρώθηκε';

  @override
  String get downloadsHint =>
      'Οι λήψεις εκτελούνται μία τη φορά. Πολλοί πάροχοι επιτρέπουν μία μόνο σύνδεση, επομένως η αναπαραγωγή κατά τη λήψη μπορεί να αποτύχει. Οι μη ολοκληρωμένες λήψεις δεν διατηρούνται όταν γίνεται έξοδος από την εφαρμογή.';

  @override
  String get epgNow => 'Τώρα';

  @override
  String get epgNext => 'Επόμενο';

  @override
  String get settingsFullscreen =>
      'Άνοιγμα της αναπαραγωγής σε πλήρη οθόνη (τα χειριστήρια αποκρύπτονται μέχρι να μετακινήσετε το ποντίκι)';

  @override
  String get nextTitle => 'Στη συνέχεια';

  @override
  String nextIn(int p1) {
    return 'Αναπαραγωγή σε $p1 δευτ.';
  }

  @override
  String get nextNow => 'Αναπαραγωγή τώρα';

  @override
  String get nextCancel => 'Ακύρωση';

  @override
  String get settingsAutoNext => 'Αυτόματη αναπαραγωγή του επόμενου επεισοδίου';

  @override
  String get downloadsNoSpace =>
      'Δεν υπάρχει αρκετός ελεύθερος χώρος στον δίσκο';

  @override
  String get dbErrorTitle =>
      'Το BattleStation TV δεν μπορεί να ανοίξει τη βάση δεδομένων του';

  @override
  String get dbErrorBody =>
      'Αν εκτελείται άλλο αντίγραφο του BattleStation TV, κλείστε το και δοκιμάστε ξανά.';

  @override
  String get dbRecoveredTitle => 'Η βάση δεδομένων είχε υποστεί ζημιά';

  @override
  String dbRecoveredBody(String p1) {
    return 'Το BattleStation TV ξεκίνησε με νέα βάση δεδομένων (προσθέστε ξανά την πηγή σας). Το κατεστραμμένο αρχείο διατηρήθηκε εδώ:\n$p1';
  }

  @override
  String get menuShowWindow => 'Εμφάνιση παραθύρου';

  @override
  String get settingsTabGeneral => 'Γενικά';

  @override
  String get settingsTabPlayer => 'Αναπαραγωγή';

  @override
  String get settingsTabPlaylists => 'Λίστες αναπαραγωγής';

  @override
  String get settingsAppearance => 'Εμφάνιση';

  @override
  String get settingsSystem => 'Σύστημα';

  @override
  String get appearanceLight => 'Φωτεινή';

  @override
  String get appearanceDark => 'Σκούρα';

  @override
  String get settingsInterfaceLanguage => 'Γλώσσα διεπαφής';

  @override
  String get settingsLanguageRestart =>
      'Τίθεται σε ισχύ μετά την επανεκκίνηση του BattleStation TV.';

  @override
  String get settingsHideCategories => 'Απόκρυψη κατηγοριών';

  @override
  String get settingsHideCategoriesWords => 'Λέξεις προς απόκρυψη';

  @override
  String get settingsHideCategoriesNote =>
      'Αποκρύπτει τις κατηγορίες των οποίων το όνομα περιέχει αυτές τις λέξεις (διαχωρίστε τις με κόμματα). Τα κανάλια, οι ταινίες και οι σειρές τους εξαφανίζονται επίσης από την αναζήτηση, τα αγαπημένα και τη συνέχεια προβολής. Πρόκειται για απλό φίλτρο και όχι για γονικό έλεγχο: οποιοσδήποτε μπορεί να το αλλάξει εδώ.';

  @override
  String get settingsRefresh => 'Ενημέρωση λιστών αναπαραγωγής';

  @override
  String get settingsRefresh0 => 'Μόνο όταν ανοίγει η εφαρμογή';

  @override
  String get settingsRefresh6 => 'Κάθε 6 ώρες';

  @override
  String get settingsRefresh12 => 'Κάθε 12 ώρες';

  @override
  String get settingsRefresh24 => 'Κάθε 24 ώρες';

  @override
  String get settingsBackup => 'Αντίγραφο ασφαλείας και επαναφορά';

  @override
  String get backupExport => 'Εξαγωγή αντιγράφου ασφαλείας…';

  @override
  String get backupImport => 'Εισαγωγή αντιγράφου ασφαλείας…';

  @override
  String get backupWarn =>
      'Το αρχείο αντιγράφου ασφαλείας περιλαμβάνει τις λίστες αναπαραγωγής σας με τις διευθύνσεις τους, οι οποίες μπορεί να περιέχουν στοιχεία σύνδεσης, γι\' αυτό κρατήστε το ιδιωτικό. Οι κωδικοί πρόσβασης των πηγών Xtream δεν αποθηκεύονται σε αυτό. Η εισαγωγή προσθέτει στις τρέχουσες πηγές σας και δεν διαγράφει τίποτα.';

  @override
  String get backupExported => 'Το αντίγραφο ασφαλείας αποθηκεύτηκε.';

  @override
  String get backupImported => 'Το αντίγραφο ασφαλείας εισήχθη.';

  @override
  String get backupErrorInvalid =>
      'Αυτό δεν είναι αρχείο αντιγράφου ασφαλείας του BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'Αυτό το αντίγραφο ασφαλείας προέρχεται από διαφορετική έκδοση του BattleStation TV και δεν μπορεί να διαβαστεί.';

  @override
  String get backupErrorTooLarge =>
      'Αυτό το αρχείο είναι πολύ μεγάλο για να είναι αντίγραφο ασφαλείας.';

  @override
  String get backupFailed => 'Το αντίγραφο ασφαλείας απέτυχε';

  @override
  String get settingsClearData => 'Εκκαθάριση δεδομένων';

  @override
  String get clearHistory => 'Εκκαθάριση ιστορικού προβολής';

  @override
  String get clearFavorites => 'Εκκαθάριση αγαπημένων';

  @override
  String get clearImages => 'Εκκαθάριση προσωρινής μνήμης εικόνων';

  @override
  String get clearConfirm => 'Εκκαθάριση';

  @override
  String get clearHistoryWarn =>
      'Οι θέσεις συνέχισης και οι λίστες συνέχειας προβολής όλων των πηγών θα διαγραφούν. Αυτό δεν μπορεί να αναιρεθεί.';

  @override
  String get clearFavoritesWarn =>
      'Τα αγαπημένα σας σε όλες τις πηγές θα αφαιρεθούν. Αυτό δεν μπορεί να αναιρεθεί.';

  @override
  String get clearImagesWarn =>
      'Τα αποθηκευμένα λογότυπα και οι αφίσες αφαιρούνται και λαμβάνονται ξανά όταν χρειάζεται.';

  @override
  String get infoDetails => 'Λεπτομέρειες';

  @override
  String get infoPlot => 'Υπόθεση';

  @override
  String get infoCast => 'Διανομή';

  @override
  String get infoDirector => 'Σκηνοθέτης';

  @override
  String get infoGenre => 'Είδος';

  @override
  String get infoYear => 'Έτος κυκλοφορίας';

  @override
  String get infoRating => 'Βαθμολογία';

  @override
  String get infoDuration => 'Διάρκεια';

  @override
  String get infoCountry => 'Χώρα';

  @override
  String get infoTrailer => 'Τρέιλερ';

  @override
  String get infoPlay => 'Αναπαραγωγή';

  @override
  String get infoEmpty =>
      'Ο πάροχός σας δεν έχει λεπτομέρειες για αυτόν τον τίτλο.';

  @override
  String get infoLoading => 'Φόρτωση λεπτομερειών…';

  @override
  String get infoError => 'Δεν ήταν δυνατή η φόρτωση των λεπτομερειών.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 ώ.';
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
  String get playerSkipIntro => 'Παράλειψη εισαγωγής';

  @override
  String get playerSkipCredits => 'Παράλειψη τίτλων τέλους';

  @override
  String get playerSkipMenu => 'Εισαγωγή και τίτλοι τέλους';

  @override
  String get playerMarkIntroStart => 'Η εισαγωγή ξεκινά εδώ';

  @override
  String get playerMarkIntroEnd => 'Η εισαγωγή τελειώνει εδώ';

  @override
  String get playerMarkCredits => 'Οι τίτλοι τέλους ξεκινούν εδώ';

  @override
  String get playerSkipForget => 'Διαγραφή εισαγωγής και τίτλων τέλους';

  @override
  String get playerSkipSaved => 'Αποθηκεύτηκε για όλα τα επεισόδια της σειράς';

  @override
  String get playerSkipRefused => 'Δεν είναι δυνατό σε αυτό το σημείο';

  @override
  String get continueRemove => 'Αφαίρεση από τη συνέχεια παρακολούθησης';

  @override
  String get settingsFavoritesAZ => 'Ταξινόμηση αγαπημένων κατά όνομα (Α–Ω)';

  @override
  String get settingsKeychain => 'Αποθήκευση κωδικών στην Κλειδοθήκη';

  @override
  String get settingsKeychainNote =>
      'Ανενεργό: οι κωδικοί μένουν στην ιδιωτική βάση δεδομένων της εφαρμογής. Ενεργό: το macOS τους κρατά στην κλειδοθήκη σύνδεσης.';

  @override
  String get settingsKeychainFailed =>
      'Η Κλειδοθήκη δεν δέχτηκε τους κωδικούς. Δεν άλλαξε τίποτα.';
}
