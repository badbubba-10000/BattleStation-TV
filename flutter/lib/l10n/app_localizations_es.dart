// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'En vivo';

  @override
  String get tabMovies => 'Películas';

  @override
  String get tabSeries => 'Series';

  @override
  String get catAll => 'Todas';

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
  String get catFavorites => 'Favoritos';

  @override
  String get catContinue => 'Seguir viendo';

  @override
  String get catFilter => 'Filtrar categorías';

  @override
  String get playlistAll => 'Todas las listas';

  @override
  String get playlistLabel => 'Lista';

  @override
  String get aboutAcknowledgements => 'Agradecimientos';

  @override
  String get aboutPrivacy => 'Privacidad';

  @override
  String get aboutPrivacyBody =>
      'BattleStation TV no recopila ningún dato sobre ti. No tiene cuenta, analíticas, publicidad ni seguimiento.\n\nTus fuentes, favoritos e historial de reproducción se quedan en este dispositivo. La app solo se conecta a las direcciones que añades tú: el servidor de tu proveedor, la lista, la guía de programación, los logotipos y las emisiones.\n\nLas contraseñas del proveedor se guardan en el iOS Keychain solo en este dispositivo. Nunca se incluyen en un archivo de copia de seguridad.\n\nBattleStation TV no incluye canales, películas ni listas. La fuente la pones tú.';

  @override
  String get aboutSource => 'Código fuente y licencia';

  @override
  String get aboutCoffee => 'Invítame a un café';

  @override
  String get tipsTitle => 'Apoya BattleStation TV';

  @override
  String get tipsFooter =>
      'Propinas opcionales a través de Apple. No desbloquean nada: todas las funciones siguen siendo gratis para todos.';

  @override
  String get tipsThanks => '¡Gracias por tu apoyo!';

  @override
  String get tipsPending => 'Esperando aprobación.';

  @override
  String get tipsFailed =>
      'La propina no se completó. Inténtalo de nuevo más tarde.';

  @override
  String get aboutVersion => 'Versión';

  @override
  String get catTitle => 'Categorías';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get emptyContinue => 'Nada para seguir viendo';

  @override
  String get emptyContinueHint =>
      'Las películas y los episodios que dejes a medias aparecen aquí.';

  @override
  String get emptyFavorites => 'Aún no hay favoritos';

  @override
  String get emptyFavoritesHint =>
      'Mantén pulsado un título y elige “Añadir a favoritos”.';

  @override
  String get emptyFavoritesLive =>
      'Desliza un canal hacia la izquierda y toca la estrella.';

  @override
  String get emptyNone => 'Aún no hay nada aquí';

  @override
  String get emptyNoneHint =>
      'Desliza hacia abajo para actualizar o revisa tu fuente en Ajustes.';

  @override
  String get fieldServerInvalid =>
      'Esta dirección no parece correcta. Ejemplo: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Introduce el enlace completo, empezando por http:// o https://';

  @override
  String get infoResume => 'Reanudar';

  @override
  String get libraryEmpty => 'Tu biblioteca está vacía';

  @override
  String get libraryEmptyHint =>
      'Aquí aparecen tus favoritos y los títulos que has empezado a ver.';

  @override
  String get onbNoChannels =>
      'BattleStation TV no incluye canales, películas ni listas. Añade una fuente de un proveedor al que estés suscrito.';

  @override
  String get onbPasteHint => '¿Has copiado el enlace de una lista?';

  @override
  String get onbTestRunning => 'Probando…';

  @override
  String passwordBodyIos(String p1) {
    return 'Introduce la contraseña de “$p1”. Se guarda en el iOS Keychain de este dispositivo.';
  }

  @override
  String get searchRecent => 'Búsquedas recientes';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Seguir con T$p1 E$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'T$p1 E$p2';
  }

  @override
  String get seriesNoEpisodes => 'No se encontraron episodios';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Reproducir T$p1 E$p2';
  }

  @override
  String get seriesWatched => 'Visto';

  @override
  String get settingsAbout => 'Acerca de';

  @override
  String get settingsEditSource => 'Editar fuente';

  @override
  String get settingsLanguageNote =>
      'BattleStation TV usa el idioma de tu dispositivo. Para usar otro idioma solo en esta app, elígelo en los Ajustes de iOS.';

  @override
  String get settingsOpenIOS => 'Abrir los Ajustes de iOS';

  @override
  String get settingsPasswordNote =>
      'Deja la nueva contraseña vacía para conservar la actual. Las contraseñas se guardan en el iOS Keychain.';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get sourceDeleteWarn =>
      'La fuente, sus favoritos y su historial de reproducción se eliminan de este dispositivo. Tu cuenta con el proveedor no se ve afectada.';

  @override
  String get syncNow => 'Actualizar';

  @override
  String get tabLibrary => 'Biblioteca';

  @override
  String get scopeCategory => 'En la categoría';

  @override
  String get scopeType => 'En la sección';

  @override
  String get scopeEverywhere => 'En todas partes';

  @override
  String get searchPrompt => 'Buscar';

  @override
  String get syncRunning => 'Sincronizando…';

  @override
  String get syncFailed => 'Error de sincronización';

  @override
  String get syncNotUpdated => 'Mostrando datos guardados';

  @override
  String get emptyResults => 'Sin resultados';

  @override
  String get favAdd => 'Añadir a favoritos';

  @override
  String get favRemove => 'Quitar de favoritos';

  @override
  String get playerClose => 'Cerrar';

  @override
  String get playerSubtitles => 'Subtítulos';

  @override
  String get playerAudio => 'Audio';

  @override
  String get playerOff => 'Desactivado';

  @override
  String get playerAddSubtitle => 'Añadir archivo de subtítulos…';

  @override
  String get playerCatchup => 'Ver programas anteriores';

  @override
  String get playerFullscreen => 'Pantalla completa';

  @override
  String get playerError => 'Error de reproducción';

  @override
  String get playerRetry => 'Reintentar';

  @override
  String get playerPip => 'Imagen en imagen';

  @override
  String get playerPipReturn => 'Volver a la app';

  @override
  String get catchupTitle => 'En diferido';

  @override
  String get catchupNoEpg =>
      'No hay guía de programación. Elige la hora manualmente.';

  @override
  String get catchupPick => 'Hora de inicio';

  @override
  String get catchupDuration => 'Minutos';

  @override
  String get seriesSeason => 'Temporada';

  @override
  String get onbWelcomeTitle => 'Te damos la bienvenida a BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Mira canales en directo, películas y series de tu proveedor de IPTV. Vamos a añadir tu primera fuente.';

  @override
  String get onbWhereTitle => '¿Dónde se escriben las direcciones?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: tu proveedor te da una dirección de servidor (como http://host:8080), un nombre de usuario y una contraseña. Introdúcelos abajo.';

  @override
  String get onbWhereM3u =>
      'M3U: ponle un nombre a la fuente y pega el enlace de la lista que te dio tu proveedor.';

  @override
  String get fieldKind => 'Tipo';

  @override
  String get fieldName => 'Nombre';

  @override
  String get fieldServer => 'Dirección del servidor';

  @override
  String get fieldUsername => 'Nombre de usuario';

  @override
  String get fieldPassword => 'Contraseña';

  @override
  String get fieldUrl => 'Enlace de la lista';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Probar conexión';

  @override
  String get onbTestOk => 'Conexión correcta';

  @override
  String get onbTestFail => 'Error de conexión';

  @override
  String get onbNext => 'Siguiente';

  @override
  String get onbBack => 'Atrás';

  @override
  String get onbSave => 'Guardar y sincronizar';

  @override
  String get settingsAccounts => 'Fuentes';

  @override
  String get settingsLanguageSub => 'Idiomas de subtítulos preferidos';

  @override
  String get settingsLanguageAudio => 'Idiomas de audio preferidos';

  @override
  String get settingsSubscale => 'Tamaño de los subtítulos';

  @override
  String get settingsSubdelay => 'Retraso de los subtítulos (segundos)';

  @override
  String get settingsGuide => 'Mostrar la guía de inicio rápido';

  @override
  String get settingsDelete => 'Eliminar';

  @override
  String get accountAdd => 'Añadir fuente…';

  @override
  String get settingsChangePassword => 'Cambiar contraseña…';

  @override
  String get settingsNewPassword => 'Nueva contraseña';

  @override
  String updateAvailable(String p1) {
    return 'La versión $p1 está disponible';
  }

  @override
  String get updateNow => 'Actualizar ahora';

  @override
  String get updateNotes => 'Novedades';

  @override
  String get updateLater => 'Más tarde';

  @override
  String get updateDownloading => 'Descargando actualización…';

  @override
  String updateReady(String p1) {
    return 'La versión $p1 está lista para instalarse';
  }

  @override
  String get updateRestart => 'Reiniciar para actualizar';

  @override
  String get updateFailed => 'Error al actualizar';

  @override
  String get updateManual => 'Descargar manualmente';

  @override
  String get updateCheckNow => 'Buscar actualizaciones';

  @override
  String get updateAuto => 'Buscar actualizaciones automáticamente';

  @override
  String get updateAutoInstall => 'Descargar actualizaciones automáticamente';

  @override
  String get updateUpToDate => 'Tienes la última versión';

  @override
  String get updateDevBuild =>
      'Las actualizaciones solo están disponibles en la app instalada';

  @override
  String updateCurrent(String p1) {
    return 'Versión actual: $p1';
  }

  @override
  String get playerBack => 'Atrás';

  @override
  String get playerErrorHint =>
      'Si sigue ocurriendo, revisa la contraseña de la fuente en Ajustes.';

  @override
  String get passwordTitle => 'Se necesita la contraseña';

  @override
  String passwordBody(String p1) {
    return 'Introduce la contraseña de “$p1”. Se guarda de forma privada en este Mac.';
  }

  @override
  String get passwordNone => 'Continuar sin contraseña';

  @override
  String get playerSpeed => 'Velocidad de reproducción';

  @override
  String get playerSpeedNormal => 'Normal';

  @override
  String get playerSpeedReset => 'Velocidad normal';

  @override
  String get settingsSeekPreview =>
      'Miniaturas de vista previa en la barra de progreso';

  @override
  String get settingsSeekPreviewNote =>
      'Abre una segunda conexión con tu proveedor. Desactívalo si la reproducción se detiene o si tu proveedor solo permite una conexión.';

  @override
  String get playerSeekBar => 'Posición de reproducción';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 de $p2';
  }

  @override
  String get playerLive => 'En vivo';

  @override
  String get playerChannelPrev => 'Canal anterior';

  @override
  String get playerChannelNext => 'Canal siguiente';

  @override
  String get playerScaleFit => 'Ajustar';

  @override
  String get playerScaleFill => 'Rellenar';

  @override
  String get playerScaleStretch => 'Estirar';

  @override
  String get playerSubtitleAdjust => 'Ajustar subtítulos…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Brillo';

  @override
  String get playerVolume => 'Volumen';

  @override
  String get playerReplay => 'Reproducir de nuevo';

  @override
  String get settingsClock => 'Mostrar la hora en el reproductor';

  @override
  String get settingsSeekStep => 'Salto (teclas de flecha y botones de salto)';

  @override
  String get settingsBarsHide => 'Ocultar los controles tras';

  @override
  String get settingsNever => 'Nunca';

  @override
  String get settingsVideoScale => 'Escala del vídeo';

  @override
  String get settingsScaleFit => 'Ajustar (con barras negras)';

  @override
  String get settingsScaleFill => 'Rellenar (recorta los bordes)';

  @override
  String get settingsScaleStretch => 'Estirar';

  @override
  String get settingsVideoScaleHint =>
      'Pulsa A en el reproductor para alternar entre las tres.';

  @override
  String get settingsBuffer => 'Búfer de red';

  @override
  String get settingsBufferSmall => 'Pequeño';

  @override
  String get settingsBufferNormal => 'Normal';

  @override
  String get settingsBufferLarge => 'Grande';

  @override
  String get settingsBufferHint =>
      'Un búfer mayor ayuda con una conexión lenta o inestable.';

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
    return 'Retroceder $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Avanzar $p1';
  }

  @override
  String get playerSleep => 'Temporizador de apagado';

  @override
  String get downloadsTitle => 'Descargas';

  @override
  String get downloadsAdd => 'Descargar';

  @override
  String get downloadsSeason => 'Descargar temporada';

  @override
  String get downloadsChooseFolder =>
      'Elige dónde guardar las películas y los episodios descargados';

  @override
  String get downloadsChoose => 'Elegir';

  @override
  String get downloadsNotChosen => 'Se preguntará en la primera descarga';

  @override
  String get downloadsChange => 'Cambiar carpeta…';

  @override
  String get downloadsPause => 'Pausar';

  @override
  String get downloadsResume => 'Reanudar';

  @override
  String get downloadsCancel => 'Cancelar';

  @override
  String get downloadsPlay => 'Reproducir';

  @override
  String get downloadsReveal => 'Mostrar en el Finder';

  @override
  String get downloadsDelete => 'Eliminar archivo';

  @override
  String get downloadsEmpty => 'Aún no hay descargas';

  @override
  String get downloadsQueued => 'En espera';

  @override
  String get downloadsDone => 'Completada';

  @override
  String get downloadsHint =>
      'Las descargas se hacen de una en una. Muchos proveedores solo permiten una conexión, por lo que reproducir mientras se descarga puede fallar. Las descargas sin terminar no se conservan al cerrar la app.';

  @override
  String get epgNow => 'Ahora';

  @override
  String get epgNext => 'Después';

  @override
  String get settingsFullscreen =>
      'Abrir la reproducción en pantalla completa (los controles se ocultan hasta que muevas el ratón)';

  @override
  String get nextTitle => 'A continuación';

  @override
  String nextIn(int p1) {
    return 'Se reproduce en $p1 s';
  }

  @override
  String get nextNow => 'Reproducir ahora';

  @override
  String get nextCancel => 'Cancelar';

  @override
  String get settingsAutoNext =>
      'Reproducir el siguiente episodio automáticamente';

  @override
  String get downloadsNoSpace => 'No hay suficiente espacio libre en el disco';

  @override
  String get dbErrorTitle => 'BattleStation TV no puede abrir su base de datos';

  @override
  String get dbErrorBody =>
      'Si hay otra copia de BattleStation TV en ejecución, ciérrala e inténtalo de nuevo.';

  @override
  String get dbRecoveredTitle => 'La base de datos estaba dañada';

  @override
  String dbRecoveredBody(String p1) {
    return 'BattleStation TV se inició con una base de datos nueva (vuelve a añadir tu fuente). El archivo dañado se conservó aquí:\n$p1';
  }

  @override
  String get menuShowWindow => 'Mostrar ventana';

  @override
  String get settingsTabGeneral => 'General';

  @override
  String get settingsTabPlayer => 'Reproductor';

  @override
  String get settingsTabPlaylists => 'Listas';

  @override
  String get settingsAppearance => 'Apariencia';

  @override
  String get settingsSystem => 'Sistema';

  @override
  String get appearanceLight => 'Claro';

  @override
  String get appearanceDark => 'Oscuro';

  @override
  String get settingsInterfaceLanguage => 'Idioma de la interfaz';

  @override
  String get settingsLanguageRestart =>
      'Se aplica al reiniciar BattleStation TV.';

  @override
  String get settingsHideCategories => 'Ocultar categorías';

  @override
  String get settingsHideCategoriesWords => 'Palabras que ocultar';

  @override
  String get settingsHideCategoriesNote =>
      'Oculta las categorías cuyo nombre contenga estas palabras (sepáralas con comas). Sus canales, películas y series también desaparecen de la búsqueda, los favoritos y Seguir viendo. Es un filtro simple, no un control parental: cualquiera puede cambiarlo aquí.';

  @override
  String get settingsRefresh => 'Actualizar listas';

  @override
  String get settingsRefresh0 => 'Solo al abrir la app';

  @override
  String get settingsRefresh6 => 'Cada 6 horas';

  @override
  String get settingsRefresh12 => 'Cada 12 horas';

  @override
  String get settingsRefresh24 => 'Cada 24 horas';

  @override
  String get settingsBackup => 'Copia de seguridad y restauración';

  @override
  String get backupExport => 'Exportar copia de seguridad…';

  @override
  String get backupImport => 'Importar copia de seguridad…';

  @override
  String get backupWarn =>
      'El archivo de copia de seguridad contiene tus listas con sus direcciones, que pueden incluir credenciales, así que guárdalo en un lugar privado. Las contraseñas de las fuentes Xtream no se guardan en él. Al importar, se añade a tus fuentes actuales y no se elimina nada.';

  @override
  String get backupExported => 'Se guardó la copia de seguridad.';

  @override
  String get backupImported => 'Se importó la copia de seguridad.';

  @override
  String get backupErrorInvalid =>
      'Este no es un archivo de copia de seguridad de BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'Esta copia de seguridad procede de otra versión de BattleStation TV y no se puede leer.';

  @override
  String get backupErrorTooLarge =>
      'Este archivo es demasiado grande para ser una copia de seguridad.';

  @override
  String get backupFailed => 'Error en la copia de seguridad';

  @override
  String get settingsClearData => 'Borrar datos';

  @override
  String get clearHistory => 'Borrar historial de reproducción';

  @override
  String get clearFavorites => 'Borrar favoritos';

  @override
  String get clearImages => 'Borrar caché de imágenes';

  @override
  String get clearConfirm => 'Borrar';

  @override
  String get clearHistoryWarn =>
      'Se borrarán las posiciones de reproducción y las listas de Seguir viendo de todas las fuentes. Esta acción no se puede deshacer.';

  @override
  String get clearFavoritesWarn =>
      'Se eliminarán tus favoritos de todas las fuentes. Esta acción no se puede deshacer.';

  @override
  String get clearImagesWarn =>
      'Se eliminan los logotipos y los carteles guardados y se vuelven a descargar cuando hagan falta.';

  @override
  String get infoDetails => 'Detalles';

  @override
  String get infoPlot => 'Sinopsis';

  @override
  String get infoCast => 'Reparto';

  @override
  String get infoDirector => 'Director';

  @override
  String get infoGenre => 'Género';

  @override
  String get infoYear => 'Año de estreno';

  @override
  String get infoRating => 'Valoración';

  @override
  String get infoDuration => 'Duración';

  @override
  String get infoCountry => 'País';

  @override
  String get infoTrailer => 'Tráiler';

  @override
  String get infoPlay => 'Reproducir';

  @override
  String get infoEmpty => 'Tu proveedor no tiene detalles de este título.';

  @override
  String get infoLoading => 'Cargando detalles…';

  @override
  String get infoError => 'No se pudieron cargar los detalles.';

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
  String get playerSkipIntro => 'Saltar intro';

  @override
  String get playerSkipCredits => 'Saltar créditos';

  @override
  String get playerSkipMenu => 'Intro y créditos';

  @override
  String get playerMarkIntroStart => 'La intro empieza aquí';

  @override
  String get playerMarkIntroEnd => 'La intro termina aquí';

  @override
  String get playerMarkCredits => 'Los créditos empiezan aquí';

  @override
  String get playerSkipForget => 'Olvidar intro y créditos';

  @override
  String get playerSkipSaved =>
      'Guardado para todos los episodios de esta serie';

  @override
  String get playerSkipRefused => 'No es posible en este punto';

  @override
  String get continueRemove => 'Quitar de Seguir viendo';

  @override
  String get settingsFavoritesAZ => 'Ordenar favoritos por nombre (A–Z)';

  @override
  String get settingsKeychain => 'Guardar contraseñas en el llavero';

  @override
  String get settingsKeychainNote =>
      'Desactivado: las contraseñas quedan en la base de datos privada de la app. Activado: macOS las guarda en tu llavero de inicio de sesión.';

  @override
  String get settingsKeychainFailed =>
      'El llavero no aceptó las contraseñas. No se cambió nada.';
}
