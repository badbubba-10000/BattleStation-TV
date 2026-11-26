// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Direct';

  @override
  String get tabMovies => 'Films';

  @override
  String get tabSeries => 'Séries';

  @override
  String get catAll => 'Toutes';

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
  String get catFavorites => 'Favoris';

  @override
  String get catContinue => 'Reprendre la lecture';

  @override
  String get catFilter => 'Filtrer les catégories';

  @override
  String get playlistAll => 'Toutes les playlists';

  @override
  String get playlistLabel => 'Playlist';

  @override
  String get aboutAcknowledgements => 'Remerciements';

  @override
  String get aboutPrivacy => 'Confidentialité';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV ne collecte aucune donnée vous concernant. Il n’y a ni compte, ni statistiques d’usage, ni publicité, ni suivi.\n\nVos sources, vos favoris et votre historique de lecture restent sur cet appareil. L’app se connecte uniquement aux adresses que vous ajoutez vous-même : le serveur de votre fournisseur, la playlist, le guide des programmes, les logos et les flux.\n\nLes mots de passe des fournisseurs sont stockés dans l’iOS Keychain, sur cet appareil uniquement. Ils ne sont jamais inclus dans un fichier de sauvegarde.\n\nBattleStation TV n’inclut aucune chaîne, aucun film ni aucune playlist. C’est à vous d’apporter votre source.';

  @override
  String get aboutSource => 'Code source et licence';

  @override
  String get aboutCoffee => 'Offrez-moi un café';

  @override
  String get tipsTitle => 'Soutenir BattleStation TV';

  @override
  String get tipsFooter =>
      'Pourboires facultatifs via Apple. Ils ne débloquent rien : toutes les fonctions restent gratuites pour tout le monde.';

  @override
  String get tipsThanks => 'Merci pour votre soutien !';

  @override
  String get tipsPending => 'En attente d’approbation.';

  @override
  String get tipsFailed => 'Le pourboire n’a pas abouti. Réessayez plus tard.';

  @override
  String get aboutVersion => 'Version';

  @override
  String get catTitle => 'Catégories';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get emptyContinue => 'Rien à reprendre';

  @override
  String get emptyContinueHint =>
      'Les films et épisodes que vous arrêtez en cours de route apparaissent ici.';

  @override
  String get emptyFavorites => 'Aucun favori pour l’instant';

  @override
  String get emptyFavoritesHint =>
      'Maintenez un titre appuyé, puis choisissez « Ajouter aux favoris ».';

  @override
  String get emptyFavoritesLive =>
      'Faites glisser une chaîne vers la gauche, puis touchez l’étoile.';

  @override
  String get emptyNone => 'Rien ici pour l’instant';

  @override
  String get emptyNoneHint =>
      'Tirez vers le bas pour actualiser, ou vérifiez votre source dans Réglages.';

  @override
  String get fieldServerInvalid =>
      'Cette adresse semble incorrecte. Exemple : http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Saisissez le lien complet, en commençant par http:// ou https://';

  @override
  String get infoResume => 'Reprendre';

  @override
  String get libraryEmpty => 'Votre bibliothèque est vide';

  @override
  String get libraryEmptyHint =>
      'Les favoris et les titres que vous avez commencé à regarder apparaissent ici.';

  @override
  String get onbNoChannels =>
      'BattleStation TV n’inclut aucune chaîne, aucun film ni aucune playlist. Ajoutez une source auprès d’un fournisseur auquel vous êtes abonné.';

  @override
  String get onbPasteHint => 'Vous avez copié un lien de playlist ?';

  @override
  String get onbTestRunning => 'Test en cours…';

  @override
  String passwordBodyIos(String p1) {
    return 'Saisissez le mot de passe de « $p1 ». Il est stocké dans l’iOS Keychain de cet appareil.';
  }

  @override
  String get searchRecent => 'Recherches récentes';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Reprendre S$p1 É$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'S$p1 É$p2';
  }

  @override
  String get seriesNoEpisodes => 'Aucun épisode trouvé';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Lire S$p1 É$p2';
  }

  @override
  String get seriesWatched => 'Vu';

  @override
  String get settingsAbout => 'À propos';

  @override
  String get settingsEditSource => 'Modifier la source';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV utilise la langue de votre appareil. Pour utiliser une autre langue pour cette app uniquement, choisissez-la dans les Réglages iOS.';

  @override
  String get settingsOpenIOS => 'Ouvrir les Réglages iOS';

  @override
  String get settingsPasswordNote =>
      'Laissez le nouveau mot de passe vide pour conserver l’actuel. Les mots de passe sont stockés dans l’iOS Keychain.';

  @override
  String get settingsTitle => 'Réglages';

  @override
  String get sourceDeleteWarn =>
      'La source, ses favoris et son historique de lecture sont supprimés de cet appareil. Votre compte chez le fournisseur n’est pas affecté.';

  @override
  String get syncNow => 'Actualiser';

  @override
  String get tabLibrary => 'Bibliothèque';

  @override
  String get scopeCategory => 'Dans la catégorie';

  @override
  String get scopeType => 'Dans la section';

  @override
  String get scopeEverywhere => 'Partout';

  @override
  String get searchPrompt => 'Rechercher';

  @override
  String get syncRunning => 'Synchronisation…';

  @override
  String get syncFailed => 'Échec de la synchronisation';

  @override
  String get syncNotUpdated => 'Données enregistrées affichées';

  @override
  String get emptyResults => 'Aucun résultat';

  @override
  String get favAdd => 'Ajouter aux favoris';

  @override
  String get favRemove => 'Retirer des favoris';

  @override
  String get playerClose => 'Fermer';

  @override
  String get playerSubtitles => 'Sous-titres';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerOff => 'Désactivé';

  @override
  String get playerAddSubtitle => 'Ajouter un fichier de sous-titres…';

  @override
  String get playerCatchup => 'Revoir un programme passé';

  @override
  String get playerFullscreen => 'Plein écran';

  @override
  String get playerError => 'Échec de la lecture';

  @override
  String get playerRetry => 'Réessayer';

  @override
  String get playerPip => 'Image dans l’image';

  @override
  String get playerPipReturn => 'Retour à l’app';

  @override
  String get catchupTitle => 'Rattrapage';

  @override
  String get catchupNoEpg =>
      'Aucun guide des programmes. Choisissez l’heure manuellement.';

  @override
  String get catchupPick => 'Heure de début';

  @override
  String get catchupDuration => 'Minutes';

  @override
  String get seriesSeason => 'Saison';

  @override
  String get onbWelcomeTitle => 'Bienvenue dans BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Regardez des chaînes en direct, des films et des séries de votre fournisseur IPTV. Ajoutons votre première source.';

  @override
  String get onbWhereTitle => 'Où saisir les adresses ?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes : votre fournisseur vous donne une adresse de serveur (comme http://host:8080), un nom d’utilisateur et un mot de passe. Saisissez-les ci-dessous.';

  @override
  String get onbWhereM3u =>
      'M3U : donnez un nom à la source et collez le lien de la playlist fourni par votre fournisseur.';

  @override
  String get fieldKind => 'Type';

  @override
  String get fieldName => 'Nom';

  @override
  String get fieldServer => 'Adresse du serveur';

  @override
  String get fieldUsername => 'Nom d’utilisateur';

  @override
  String get fieldPassword => 'Mot de passe';

  @override
  String get fieldUrl => 'Lien de la playlist';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Tester la connexion';

  @override
  String get onbTestOk => 'Connexion réussie';

  @override
  String get onbTestFail => 'Échec de la connexion';

  @override
  String get onbNext => 'Suivant';

  @override
  String get onbBack => 'Retour';

  @override
  String get onbSave => 'Enregistrer et synchroniser';

  @override
  String get settingsAccounts => 'Sources';

  @override
  String get settingsLanguageSub => 'Langues de sous-titres préférées';

  @override
  String get settingsLanguageAudio => 'Langues audio préférées';

  @override
  String get settingsSubscale => 'Taille des sous-titres';

  @override
  String get settingsSubdelay => 'Décalage des sous-titres (secondes)';

  @override
  String get settingsGuide => 'Afficher le guide de démarrage rapide';

  @override
  String get settingsDelete => 'Supprimer';

  @override
  String get accountAdd => 'Ajouter une source…';

  @override
  String get settingsChangePassword => 'Modifier le mot de passe…';

  @override
  String get settingsNewPassword => 'Nouveau mot de passe';

  @override
  String updateAvailable(String p1) {
    return 'La version $p1 est disponible';
  }

  @override
  String get updateNow => 'Mettre à jour maintenant';

  @override
  String get updateNotes => 'Nouveautés';

  @override
  String get updateLater => 'Plus tard';

  @override
  String get updateDownloading => 'Téléchargement de la mise à jour…';

  @override
  String updateReady(String p1) {
    return 'La version $p1 est prête à être installée';
  }

  @override
  String get updateRestart => 'Redémarrer pour mettre à jour';

  @override
  String get updateFailed => 'Échec de la mise à jour';

  @override
  String get updateManual => 'Télécharger manuellement';

  @override
  String get updateCheckNow => 'Rechercher des mises à jour';

  @override
  String get updateAuto => 'Rechercher les mises à jour automatiquement';

  @override
  String get updateAutoInstall =>
      'Télécharger les mises à jour automatiquement';

  @override
  String get updateUpToDate => 'Vous avez la dernière version';

  @override
  String get updateDevBuild =>
      'Les mises à jour ne sont disponibles que dans l’app installée';

  @override
  String updateCurrent(String p1) {
    return 'Version actuelle : $p1';
  }

  @override
  String get playerBack => 'Retour';

  @override
  String get playerErrorHint =>
      'Si le problème persiste, vérifiez le mot de passe de la source dans Réglages.';

  @override
  String get passwordTitle => 'Mot de passe requis';

  @override
  String passwordBody(String p1) {
    return 'Saisissez le mot de passe de « $p1 ». Il est stocké de manière privée sur ce Mac.';
  }

  @override
  String get passwordNone => 'Continuer sans mot de passe';

  @override
  String get playerSpeed => 'Vitesse de lecture';

  @override
  String get playerSpeedNormal => 'Normale';

  @override
  String get playerSpeedReset => 'Vitesse normale';

  @override
  String get settingsSeekPreview =>
      'Aperçu en vignettes sur la barre de progression';

  @override
  String get settingsSeekPreviewNote =>
      'Ouvre une seconde connexion vers votre fournisseur. Désactivez l’option si la lecture s’arrête ou si votre fournisseur n’autorise qu’une seule connexion.';

  @override
  String get playerSeekBar => 'Position de lecture';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 sur $p2';
  }

  @override
  String get playerLive => 'En direct';

  @override
  String get playerChannelPrev => 'Chaîne précédente';

  @override
  String get playerChannelNext => 'Chaîne suivante';

  @override
  String get playerScaleFit => 'Ajuster';

  @override
  String get playerScaleFill => 'Remplir';

  @override
  String get playerScaleStretch => 'Étirer';

  @override
  String get playerSubtitleAdjust => 'Régler les sous-titres…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Luminosité';

  @override
  String get playerVolume => 'Volume';

  @override
  String get playerReplay => 'Revoir';

  @override
  String get settingsClock => 'Afficher l’heure dans le lecteur';

  @override
  String get settingsSeekStep =>
      'Pas de saut (touches fléchées et boutons de saut)';

  @override
  String get settingsBarsHide => 'Masquer les commandes après';

  @override
  String get settingsNever => 'Jamais';

  @override
  String get settingsVideoScale => 'Échelle de la vidéo';

  @override
  String get settingsScaleFit => 'Ajuster (bandes noires)';

  @override
  String get settingsScaleFill => 'Remplir (rogne les bords)';

  @override
  String get settingsScaleStretch => 'Étirer';

  @override
  String get settingsVideoScaleHint =>
      'Appuyez sur A dans le lecteur pour alterner entre les trois.';

  @override
  String get settingsBuffer => 'Tampon réseau';

  @override
  String get settingsBufferSmall => 'Petit';

  @override
  String get settingsBufferNormal => 'Normal';

  @override
  String get settingsBufferLarge => 'Grand';

  @override
  String get settingsBufferHint =>
      'Un tampon plus grand aide avec une connexion lente ou instable.';

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
    return 'Reculer de $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Avancer de $p1';
  }

  @override
  String get playerSleep => 'Minuterie d’arrêt';

  @override
  String get downloadsTitle => 'Téléchargements';

  @override
  String get downloadsAdd => 'Télécharger';

  @override
  String get downloadsSeason => 'Télécharger la saison';

  @override
  String get downloadsChooseFolder =>
      'Choisissez où enregistrer les films et épisodes téléchargés';

  @override
  String get downloadsChoose => 'Choisir';

  @override
  String get downloadsNotChosen => 'Demandé au premier téléchargement';

  @override
  String get downloadsChange => 'Changer de dossier…';

  @override
  String get downloadsPause => 'Pause';

  @override
  String get downloadsResume => 'Reprendre';

  @override
  String get downloadsCancel => 'Annuler';

  @override
  String get downloadsPlay => 'Lire';

  @override
  String get downloadsReveal => 'Afficher dans le Finder';

  @override
  String get downloadsDelete => 'Supprimer le fichier';

  @override
  String get downloadsEmpty => 'Aucun téléchargement';

  @override
  String get downloadsQueued => 'En attente';

  @override
  String get downloadsDone => 'Terminé';

  @override
  String get downloadsHint =>
      'Les téléchargements se font un à la fois. De nombreux fournisseurs n’autorisent qu’une seule connexion : lire un contenu pendant un téléchargement peut donc échouer. Les téléchargements inachevés ne sont pas conservés à la fermeture de l’app.';

  @override
  String get epgNow => 'Maintenant';

  @override
  String get epgNext => 'Ensuite';

  @override
  String get settingsFullscreen =>
      'Ouvrir la lecture en plein écran (les commandes restent masquées jusqu’à ce que vous bougiez la souris)';

  @override
  String get nextTitle => 'À suivre';

  @override
  String nextIn(int p1) {
    return 'Lecture dans $p1 s';
  }

  @override
  String get nextNow => 'Lire maintenant';

  @override
  String get nextCancel => 'Annuler';

  @override
  String get settingsAutoNext => 'Lire automatiquement l’épisode suivant';

  @override
  String get downloadsNoSpace => 'Espace disque libre insuffisant';

  @override
  String get dbErrorTitle =>
      'BattleStation TV ne peut pas ouvrir sa base de données';

  @override
  String get dbErrorBody =>
      'Si une autre copie d’BattleStation TV est en cours d’exécution, quittez-la et réessayez.';

  @override
  String get dbRecoveredTitle => 'La base de données était endommagée';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV a démarré avec une base de données vierge (ajoutez à nouveau votre source). Le fichier endommagé a été conservé ici :\n$p1';
  }

  @override
  String get menuShowWindow => 'Afficher la fenêtre';

  @override
  String get settingsTabGeneral => 'Général';

  @override
  String get settingsTabPlayer => 'Lecteur';

  @override
  String get settingsTabPlaylists => 'Playlists';

  @override
  String get settingsAppearance => 'Apparence';

  @override
  String get settingsSystem => 'Système';

  @override
  String get appearanceLight => 'Clair';

  @override
  String get appearanceDark => 'Sombre';

  @override
  String get settingsInterfaceLanguage => 'Langue de l’interface';

  @override
  String get settingsLanguageRestart =>
      'Prend effet après le redémarrage d’BattleStation TV.';

  @override
  String get settingsHideCategories => 'Masquer des catégories';

  @override
  String get settingsHideCategoriesWords => 'Mots à masquer';

  @override
  String get settingsHideCategoriesNote =>
      'Masque les catégories dont le nom contient ces mots (séparez-les par des virgules). Leurs chaînes, films et séries disparaissent aussi de la recherche, des favoris et de « Reprendre la lecture ». Il s’agit d’un simple filtre, pas d’un contrôle parental : n’importe qui peut le modifier ici.';

  @override
  String get settingsRefresh => 'Mettre à jour les playlists';

  @override
  String get settingsRefresh0 => 'Uniquement à l’ouverture de l’app';

  @override
  String get settingsRefresh6 => 'Toutes les 6 heures';

  @override
  String get settingsRefresh12 => 'Toutes les 12 heures';

  @override
  String get settingsRefresh24 => 'Toutes les 24 heures';

  @override
  String get settingsBackup => 'Sauvegarde et restauration';

  @override
  String get backupExport => 'Exporter la sauvegarde…';

  @override
  String get backupImport => 'Importer une sauvegarde…';

  @override
  String get backupWarn =>
      'Le fichier de sauvegarde liste vos playlists avec leurs adresses, qui peuvent contenir des identifiants : conservez-le donc en lieu sûr. Les mots de passe des sources Xtream n’y sont pas enregistrés. L’importation s’ajoute à vos sources actuelles et ne supprime rien.';

  @override
  String get backupExported => 'La sauvegarde a été enregistrée.';

  @override
  String get backupImported => 'La sauvegarde a été importée.';

  @override
  String get backupErrorInvalid =>
      'Ce n’est pas un fichier de sauvegarde BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'Cette sauvegarde provient d’une autre version d’BattleStation TV et ne peut pas être lue.';

  @override
  String get backupErrorTooLarge =>
      'Ce fichier est trop volumineux pour être une sauvegarde.';

  @override
  String get backupFailed => 'Échec de la sauvegarde';

  @override
  String get settingsClearData => 'Effacer les données';

  @override
  String get clearHistory => 'Effacer l’historique de lecture';

  @override
  String get clearFavorites => 'Effacer les favoris';

  @override
  String get clearImages => 'Vider le cache des images';

  @override
  String get clearConfirm => 'Effacer';

  @override
  String get clearHistoryWarn =>
      'Les positions de lecture et les listes « Reprendre la lecture » de toutes les sources seront effacées. Cette action est irréversible.';

  @override
  String get clearFavoritesWarn =>
      'Vos favoris de toutes les sources seront supprimés. Cette action est irréversible.';

  @override
  String get clearImagesWarn =>
      'Les logos et affiches enregistrés sont supprimés et téléchargés à nouveau si nécessaire.';

  @override
  String get infoDetails => 'Détails';

  @override
  String get infoPlot => 'Synopsis';

  @override
  String get infoCast => 'Distribution';

  @override
  String get infoDirector => 'Réalisateur';

  @override
  String get infoGenre => 'Genre';

  @override
  String get infoYear => 'Année de sortie';

  @override
  String get infoRating => 'Note';

  @override
  String get infoDuration => 'Durée';

  @override
  String get infoCountry => 'Pays';

  @override
  String get infoTrailer => 'Bande-annonce';

  @override
  String get infoPlay => 'Lire';

  @override
  String get infoEmpty => 'Votre fournisseur n’a aucun détail sur ce titre.';

  @override
  String get infoLoading => 'Chargement des détails…';

  @override
  String get infoError => 'Impossible de charger les détails.';

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
  String get playerSkipIntro => 'Passer l\'intro';

  @override
  String get playerSkipCredits => 'Passer le générique';

  @override
  String get playerSkipMenu => 'Intro et générique';

  @override
  String get playerMarkIntroStart => 'L\'intro commence ici';

  @override
  String get playerMarkIntroEnd => 'L\'intro se termine ici';

  @override
  String get playerMarkCredits => 'Le générique commence ici';

  @override
  String get playerSkipForget => 'Oublier l\'intro et le générique';

  @override
  String get playerSkipSaved =>
      'Enregistré pour tous les épisodes de cette série';

  @override
  String get playerSkipRefused => 'Impossible à cet endroit';

  @override
  String get continueRemove => 'Retirer de Reprendre la lecture';

  @override
  String get settingsFavoritesAZ => 'Trier les favoris par nom (A–Z)';

  @override
  String get settingsKeychain =>
      'Enregistrer les mots de passe dans le trousseau';

  @override
  String get settingsKeychainNote =>
      'Désactivé : les mots de passe restent dans la base de données privée de l\'app. Activé : macOS les garde dans votre trousseau de session.';

  @override
  String get settingsKeychainFailed =>
      'Le trousseau n\'a pas accepté les mots de passe. Rien n\'a été modifié.';
}
