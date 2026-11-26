// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Diretta';

  @override
  String get tabMovies => 'Film';

  @override
  String get tabSeries => 'Serie TV';

  @override
  String get catAll => 'Tutte';

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
  String get catFavorites => 'Preferiti';

  @override
  String get catContinue => 'Continua a guardare';

  @override
  String get catFilter => 'Filtra categorie';

  @override
  String get playlistAll => 'Tutte le playlist';

  @override
  String get playlistLabel => 'Playlist';

  @override
  String get aboutAcknowledgements => 'Riconoscimenti';

  @override
  String get aboutPrivacy => 'Privacy';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV non raccoglie alcun dato su di te. Non ha account, analisi, pubblicità né tracciamento.\n\nLe tue sorgenti, i preferiti e la cronologia di visione restano su questo dispositivo. L’app si collega solo agli indirizzi che aggiungi tu: il server del tuo provider, la playlist, la guida TV, i loghi e gli stream.\n\nLe password del provider sono conservate nell’iOS Keychain solo su questo dispositivo. Non sono mai incluse in un file di backup.\n\nBattleStation TV non include canali, film né playlist. La sorgente la porti tu.';

  @override
  String get aboutSource => 'Codice sorgente e licenza';

  @override
  String get aboutCoffee => 'Offrimi un caffè';

  @override
  String get tipsTitle => 'Sostieni BattleStation TV';

  @override
  String get tipsFooter =>
      'Mance facoltative tramite Apple. Non sbloccano nulla: tutte le funzioni restano gratuite per tutti.';

  @override
  String get tipsThanks => 'Grazie per il tuo supporto!';

  @override
  String get tipsPending => 'In attesa di approvazione.';

  @override
  String get tipsFailed =>
      'La mancia non è andata a buon fine. Riprova più tardi.';

  @override
  String get aboutVersion => 'Versione';

  @override
  String get catTitle => 'Categorie';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get emptyContinue => 'Niente da continuare';

  @override
  String get emptyContinueHint =>
      'I film e gli episodi che interrompi a metà compaiono qui.';

  @override
  String get emptyFavorites => 'Ancora nessun preferito';

  @override
  String get emptyFavoritesHint =>
      'Tieni premuto su un titolo, poi scegli Aggiungi ai preferiti.';

  @override
  String get emptyFavoritesLive =>
      'Scorri un canale verso sinistra, poi tocca la stella.';

  @override
  String get emptyNone => 'Ancora niente qui';

  @override
  String get emptyNoneHint =>
      'Trascina verso il basso per aggiornare, oppure controlla la sorgente in Impostazioni.';

  @override
  String get fieldServerInvalid =>
      'Questo indirizzo non sembra corretto. Esempio: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Inserisci il link completo, che inizia con http:// o https://';

  @override
  String get infoResume => 'Riprendi';

  @override
  String get libraryEmpty => 'La tua libreria è vuota';

  @override
  String get libraryEmptyHint =>
      'I preferiti e i titoli che hai iniziato a guardare compaiono qui.';

  @override
  String get onbNoChannels =>
      'BattleStation TV non include canali, film né playlist. Aggiungi una sorgente da un provider a cui sei abbonato.';

  @override
  String get onbPasteHint => 'Hai copiato il link di una playlist?';

  @override
  String get onbTestRunning => 'Verifica in corso…';

  @override
  String passwordBodyIos(String p1) {
    return 'Inserisci la password per “$p1”. Viene memorizzata nell’iOS Keychain su questo dispositivo.';
  }

  @override
  String get searchRecent => 'Ricerche recenti';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Continua S$p1 Ep. $p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'S$p1 Ep. $p2';
  }

  @override
  String get seriesNoEpisodes => 'Nessun episodio trovato';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Riproduci S$p1 Ep. $p2';
  }

  @override
  String get seriesWatched => 'Visto';

  @override
  String get settingsAbout => 'Info';

  @override
  String get settingsEditSource => 'Modifica sorgente';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV usa la lingua del tuo dispositivo. Per usare un’altra lingua solo per questa app, scegline una in Impostazioni di iOS.';

  @override
  String get settingsOpenIOS => 'Apri Impostazioni di iOS';

  @override
  String get settingsPasswordNote =>
      'Lascia vuota la nuova password per mantenere quella attuale. Le password sono conservate nell’iOS Keychain.';

  @override
  String get settingsTitle => 'Impostazioni';

  @override
  String get sourceDeleteWarn =>
      'La sorgente, i suoi preferiti e la sua cronologia di visione vengono rimossi da questo dispositivo. Il tuo account presso il provider non viene toccato.';

  @override
  String get syncNow => 'Aggiorna';

  @override
  String get tabLibrary => 'Libreria';

  @override
  String get scopeCategory => 'Nella categoria';

  @override
  String get scopeType => 'Nella sezione';

  @override
  String get scopeEverywhere => 'Ovunque';

  @override
  String get searchPrompt => 'Cerca';

  @override
  String get syncRunning => 'Sincronizzazione…';

  @override
  String get syncFailed => 'Sincronizzazione non riuscita';

  @override
  String get syncNotUpdated => 'Dati salvati in uso';

  @override
  String get emptyResults => 'Nessun risultato';

  @override
  String get favAdd => 'Aggiungi ai preferiti';

  @override
  String get favRemove => 'Rimuovi dai preferiti';

  @override
  String get playerClose => 'Chiudi';

  @override
  String get playerSubtitles => 'Sottotitoli';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerOff => 'Disattivato';

  @override
  String get playerAddSubtitle => 'Aggiungi file di sottotitoli…';

  @override
  String get playerCatchup => 'Rivedi un programma passato';

  @override
  String get playerFullscreen => 'Schermo intero';

  @override
  String get playerError => 'Riproduzione non riuscita';

  @override
  String get playerRetry => 'Riprova';

  @override
  String get playerPip => 'Picture in Picture';

  @override
  String get playerPipReturn => 'Torna all’app';

  @override
  String get catchupTitle => 'Rivedi';

  @override
  String get catchupNoEpg => 'Nessuna guida TV. Scegli l’orario manualmente.';

  @override
  String get catchupPick => 'Ora di inizio';

  @override
  String get catchupDuration => 'Minuti';

  @override
  String get seriesSeason => 'Stagione';

  @override
  String get onbWelcomeTitle => 'Benvenuto in BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Guarda canali in diretta, film e serie del tuo provider IPTV. Aggiungiamo la tua prima sorgente.';

  @override
  String get onbWhereTitle => 'Dove vanno inseriti gli indirizzi?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: il tuo provider ti fornisce un indirizzo del server (come http://host:8080), un nome utente e una password. Inseriscili qui sotto.';

  @override
  String get onbWhereM3u =>
      'M3U: assegna un nome alla sorgente e incolla il link della playlist fornito dal tuo provider.';

  @override
  String get fieldKind => 'Tipo';

  @override
  String get fieldName => 'Nome';

  @override
  String get fieldServer => 'Indirizzo del server';

  @override
  String get fieldUsername => 'Nome utente';

  @override
  String get fieldPassword => 'Password';

  @override
  String get fieldUrl => 'Link della playlist';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Verifica connessione';

  @override
  String get onbTestOk => 'Connessione riuscita';

  @override
  String get onbTestFail => 'Connessione non riuscita';

  @override
  String get onbNext => 'Avanti';

  @override
  String get onbBack => 'Indietro';

  @override
  String get onbSave => 'Salva e sincronizza';

  @override
  String get settingsAccounts => 'Sorgenti';

  @override
  String get settingsLanguageSub => 'Lingue dei sottotitoli preferite';

  @override
  String get settingsLanguageAudio => 'Lingue audio preferite';

  @override
  String get settingsSubscale => 'Dimensione dei sottotitoli';

  @override
  String get settingsSubdelay => 'Ritardo dei sottotitoli (secondi)';

  @override
  String get settingsGuide => 'Mostra la guida rapida';

  @override
  String get settingsDelete => 'Elimina';

  @override
  String get accountAdd => 'Aggiungi sorgente…';

  @override
  String get settingsChangePassword => 'Cambia password…';

  @override
  String get settingsNewPassword => 'Nuova password';

  @override
  String updateAvailable(String p1) {
    return 'La versione $p1 è disponibile';
  }

  @override
  String get updateNow => 'Aggiorna ora';

  @override
  String get updateNotes => 'Novità';

  @override
  String get updateLater => 'Più tardi';

  @override
  String get updateDownloading => 'Download dell’aggiornamento…';

  @override
  String updateReady(String p1) {
    return 'La versione $p1 è pronta per l’installazione';
  }

  @override
  String get updateRestart => 'Riavvia per aggiornare';

  @override
  String get updateFailed => 'Aggiornamento non riuscito';

  @override
  String get updateManual => 'Scarica manualmente';

  @override
  String get updateCheckNow => 'Verifica aggiornamenti';

  @override
  String get updateAuto => 'Verifica automaticamente gli aggiornamenti';

  @override
  String get updateAutoInstall => 'Scarica automaticamente gli aggiornamenti';

  @override
  String get updateUpToDate => 'Hai già la versione più recente';

  @override
  String get updateDevBuild =>
      'Gli aggiornamenti sono disponibili solo nell’app installata';

  @override
  String updateCurrent(String p1) {
    return 'Versione attuale: $p1';
  }

  @override
  String get playerBack => 'Indietro';

  @override
  String get playerErrorHint =>
      'Se il problema persiste, controlla la password della sorgente in Impostazioni.';

  @override
  String get passwordTitle => 'Password richiesta';

  @override
  String passwordBody(String p1) {
    return 'Inserisci la password per “$p1”. Viene memorizzata in modo privato su questo Mac.';
  }

  @override
  String get passwordNone => 'Continua senza password';

  @override
  String get playerSpeed => 'Velocità di riproduzione';

  @override
  String get playerSpeedNormal => 'Normale';

  @override
  String get playerSpeedReset => 'Velocità normale';

  @override
  String get settingsSeekPreview =>
      'Anteprime in miniatura sulla barra di avanzamento';

  @override
  String get settingsSeekPreviewNote =>
      'Apre una seconda connessione con il tuo provider. Disattivala se la riproduzione si interrompe o se il tuo provider consente una sola connessione.';

  @override
  String get playerSeekBar => 'Posizione di riproduzione';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 di $p2';
  }

  @override
  String get playerLive => 'Diretta';

  @override
  String get playerChannelPrev => 'Canale precedente';

  @override
  String get playerChannelNext => 'Canale successivo';

  @override
  String get playerScaleFit => 'Adatta';

  @override
  String get playerScaleFill => 'Riempi';

  @override
  String get playerScaleStretch => 'Allunga';

  @override
  String get playerSubtitleAdjust => 'Regola i sottotitoli…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Luminosità';

  @override
  String get playerVolume => 'Volume';

  @override
  String get playerReplay => 'Riproduci di nuovo';

  @override
  String get settingsClock => 'Mostra l’ora nel player';

  @override
  String get settingsSeekStep =>
      'Passo di salto (tasti freccia e pulsanti di salto)';

  @override
  String get settingsBarsHide => 'Nascondi i controlli dopo';

  @override
  String get settingsNever => 'Mai';

  @override
  String get settingsVideoScale => 'Scala del video';

  @override
  String get settingsScaleFit => 'Adatta (bande nere)';

  @override
  String get settingsScaleFill => 'Riempi (ritaglia i bordi)';

  @override
  String get settingsScaleStretch => 'Estendi';

  @override
  String get settingsVideoScaleHint =>
      'Premi A nel player per passare da una modalità all’altra.';

  @override
  String get settingsBuffer => 'Buffer di rete';

  @override
  String get settingsBufferSmall => 'Piccolo';

  @override
  String get settingsBufferNormal => 'Normale';

  @override
  String get settingsBufferLarge => 'Grande';

  @override
  String get settingsBufferHint =>
      'Un buffer più grande aiuta con una connessione lenta o instabile.';

  @override
  String unitSeconds(int p1) {
    return '$p1 s';
  }

  @override
  String unitMinutes(int p1) {
    return '$p1 min';
  }

  @override
  String unitMinutesShort(int p1) {
    return '$p1 min';
  }

  @override
  String playerSkipBack(String p1) {
    return 'Indietro di $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Avanti di $p1';
  }

  @override
  String get playerSleep => 'Timer di spegnimento';

  @override
  String get downloadsTitle => 'Download';

  @override
  String get downloadsAdd => 'Scarica';

  @override
  String get downloadsSeason => 'Scarica stagione';

  @override
  String get downloadsChooseFolder =>
      'Scegli dove salvare i film e gli episodi scaricati';

  @override
  String get downloadsChoose => 'Scegli';

  @override
  String get downloadsNotChosen => 'Verrà chiesto al primo download';

  @override
  String get downloadsChange => 'Cambia cartella…';

  @override
  String get downloadsPause => 'Pausa';

  @override
  String get downloadsResume => 'Riprendi';

  @override
  String get downloadsCancel => 'Annulla';

  @override
  String get downloadsPlay => 'Riproduci';

  @override
  String get downloadsReveal => 'Mostra nel Finder';

  @override
  String get downloadsDelete => 'Elimina file';

  @override
  String get downloadsEmpty => 'Ancora nessun download';

  @override
  String get downloadsQueued => 'In attesa';

  @override
  String get downloadsDone => 'Completato';

  @override
  String get downloadsHint =>
      'I download vengono eseguiti uno alla volta. Molti provider consentono una sola connessione, quindi riprodurre durante un download può non riuscire. I download incompleti non vengono conservati quando l’app viene chiusa.';

  @override
  String get epgNow => 'Ora';

  @override
  String get epgNext => 'Dopo';

  @override
  String get settingsFullscreen =>
      'Apri la riproduzione a schermo intero (i controlli restano nascosti finché non muovi il mouse)';

  @override
  String get nextTitle => 'A seguire';

  @override
  String nextIn(int p1) {
    return 'Riproduzione tra $p1 s';
  }

  @override
  String get nextNow => 'Riproduci ora';

  @override
  String get nextCancel => 'Annulla';

  @override
  String get settingsAutoNext =>
      'Riproduci automaticamente l’episodio successivo';

  @override
  String get downloadsNoSpace => 'Spazio libero su disco insufficiente';

  @override
  String get dbErrorTitle =>
      'BattleStation TV non riesce ad aprire il database';

  @override
  String get dbErrorBody =>
      'Se è in esecuzione un’altra copia di BattleStation TV, chiudila e riprova.';

  @override
  String get dbRecoveredTitle => 'Il database era danneggiato';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV è stato avviato con un database nuovo (aggiungi di nuovo la tua sorgente). Il file danneggiato è stato conservato qui:\n$p1';
  }

  @override
  String get menuShowWindow => 'Mostra finestra';

  @override
  String get settingsTabGeneral => 'Generali';

  @override
  String get settingsTabPlayer => 'Player';

  @override
  String get settingsTabPlaylists => 'Playlist';

  @override
  String get settingsAppearance => 'Aspetto';

  @override
  String get settingsSystem => 'Sistema';

  @override
  String get appearanceLight => 'Chiaro';

  @override
  String get appearanceDark => 'Scuro';

  @override
  String get settingsInterfaceLanguage => 'Lingua dell’interfaccia';

  @override
  String get settingsLanguageRestart =>
      'Ha effetto dopo il riavvio di BattleStation TV.';

  @override
  String get settingsHideCategories => 'Nascondi categorie';

  @override
  String get settingsHideCategoriesWords => 'Parole da nascondere';

  @override
  String get settingsHideCategoriesNote =>
      'Nasconde le categorie il cui nome contiene queste parole (separale con virgole). Anche i loro canali, film e serie scompaiono da ricerca, preferiti e Continua a guardare. È un semplice filtro, non un blocco parentale: chiunque può modificarlo qui.';

  @override
  String get settingsRefresh => 'Aggiorna playlist';

  @override
  String get settingsRefresh0 => 'Solo all’apertura dell’app';

  @override
  String get settingsRefresh6 => 'Ogni 6 ore';

  @override
  String get settingsRefresh12 => 'Ogni 12 ore';

  @override
  String get settingsRefresh24 => 'Ogni 24 ore';

  @override
  String get settingsBackup => 'Backup e ripristino';

  @override
  String get backupExport => 'Esporta backup…';

  @override
  String get backupImport => 'Importa backup…';

  @override
  String get backupWarn =>
      'Il file di backup elenca le tue playlist con i rispettivi indirizzi, che possono includere dati di accesso, quindi conservalo con cura. Le password delle sorgenti Xtream non vengono salvate al suo interno. L’importazione si aggiunge alle sorgenti attuali e non elimina nulla.';

  @override
  String get backupExported => 'Il backup è stato salvato.';

  @override
  String get backupImported => 'Il backup è stato importato.';

  @override
  String get backupErrorInvalid =>
      'Questo non è un file di backup di BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'Questo backup proviene da una versione diversa di BattleStation TV e non può essere letto.';

  @override
  String get backupErrorTooLarge =>
      'Questo file è troppo grande per essere un backup.';

  @override
  String get backupFailed => 'Backup non riuscito';

  @override
  String get settingsClearData => 'Cancella dati';

  @override
  String get clearHistory => 'Cancella cronologia di visione';

  @override
  String get clearFavorites => 'Cancella preferiti';

  @override
  String get clearImages => 'Svuota cache immagini';

  @override
  String get clearConfirm => 'Cancella';

  @override
  String get clearHistoryWarn =>
      'Le posizioni di riproduzione e gli elenchi Continua a guardare di tutte le sorgenti verranno cancellati. Questa operazione non può essere annullata.';

  @override
  String get clearFavoritesWarn =>
      'I tuoi preferiti in tutte le sorgenti verranno rimossi. Questa operazione non può essere annullata.';

  @override
  String get clearImagesWarn =>
      'I loghi e le locandine salvati vengono rimossi e scaricati di nuovo quando servono.';

  @override
  String get infoDetails => 'Dettagli';

  @override
  String get infoPlot => 'Trama';

  @override
  String get infoCast => 'Cast';

  @override
  String get infoDirector => 'Regia';

  @override
  String get infoGenre => 'Genere';

  @override
  String get infoYear => 'Anno di uscita';

  @override
  String get infoRating => 'Valutazione';

  @override
  String get infoDuration => 'Durata';

  @override
  String get infoCountry => 'Paese';

  @override
  String get infoTrailer => 'Trailer';

  @override
  String get infoPlay => 'Riproduci';

  @override
  String get infoEmpty => 'Il tuo provider non ha dettagli per questo titolo.';

  @override
  String get infoLoading => 'Caricamento dei dettagli…';

  @override
  String get infoError => 'Impossibile caricare i dettagli.';

  @override
  String unitHoursShort(int p1) {
    return '$p1 h';
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
  String get playerSkipIntro => 'Salta l\'intro';

  @override
  String get playerSkipCredits => 'Salta i titoli di coda';

  @override
  String get playerSkipMenu => 'Intro e titoli di coda';

  @override
  String get playerMarkIntroStart => 'L\'intro inizia qui';

  @override
  String get playerMarkIntroEnd => 'L\'intro finisce qui';

  @override
  String get playerMarkCredits => 'I titoli di coda iniziano qui';

  @override
  String get playerSkipForget => 'Dimentica intro e titoli di coda';

  @override
  String get playerSkipSaved => 'Salvato per tutti gli episodi di questa serie';

  @override
  String get playerSkipRefused => 'Non possibile in questo punto';

  @override
  String get continueRemove => 'Rimuovi da Continua a guardare';

  @override
  String get settingsFavoritesAZ => 'Ordina i preferiti per nome (A–Z)';

  @override
  String get settingsKeychain => 'Salva le password nel portachiavi';

  @override
  String get settingsKeychainNote =>
      'Disattivato: le password restano nel database privato dell\'app. Attivato: macOS le conserva nel portachiavi di login.';

  @override
  String get settingsKeychainFailed =>
      'Il portachiavi non ha accettato le password. Non è stato cambiato nulla.';
}
