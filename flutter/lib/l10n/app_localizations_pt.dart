// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'BattleStation TV';

  @override
  String get tabLive => 'Ao vivo';

  @override
  String get tabMovies => 'Filmes';

  @override
  String get tabSeries => 'Séries';

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
  String get catContinue => 'Continuar assistindo';

  @override
  String get catFilter => 'Filtrar categorias';

  @override
  String get playlistAll => 'Todas as playlists';

  @override
  String get playlistLabel => 'Playlist';

  @override
  String get aboutAcknowledgements => 'Agradecimentos';

  @override
  String get aboutPrivacy => 'Privacidade';

  @override
  String get aboutPrivacyBody =>
      'O BattleStation TV não coleta nenhum dado sobre você. Não há conta, análises, publicidade nem rastreamento.\n\nSuas fontes, favoritos e histórico de exibição ficam neste dispositivo. O app só se conecta aos endereços que você mesmo adiciona: o servidor do seu provedor, a playlist, o guia de programação, os logotipos e as transmissões.\n\nAs senhas dos provedores ficam no iOS Keychain apenas neste dispositivo. Elas nunca são incluídas em um arquivo de backup.\n\nO BattleStation TV não inclui canais, filmes nem playlists. Você traz a sua própria fonte.';

  @override
  String get aboutSource => 'Código-fonte e licença';

  @override
  String get aboutCoffee => 'Me pague um café';

  @override
  String get tipsTitle => 'Apoie o BattleStation TV';

  @override
  String get tipsFooter =>
      'Gorjetas opcionais pela Apple. Elas não desbloqueiam nada: todos os recursos continuam gratuitos para todos.';

  @override
  String get tipsThanks => 'Obrigado pelo seu apoio!';

  @override
  String get tipsPending => 'Aguardando aprovação.';

  @override
  String get tipsFailed =>
      'A gorjeta não foi concluída. Tente novamente mais tarde.';

  @override
  String get aboutVersion => 'Versão';

  @override
  String get catTitle => 'Categorias';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get emptyContinue => 'Nada para continuar';

  @override
  String get emptyContinueHint =>
      'Filmes e episódios que você interrompe no meio aparecem aqui.';

  @override
  String get emptyFavorites => 'Nenhum favorito ainda';

  @override
  String get emptyFavoritesHint =>
      'Mantenha um título pressionado e escolha Adicionar aos favoritos.';

  @override
  String get emptyFavoritesLive =>
      'Deslize um canal para a esquerda e toque na estrela.';

  @override
  String get emptyNone => 'Nada aqui ainda';

  @override
  String get emptyNoneHint =>
      'Puxe para baixo para atualizar ou verifique sua fonte em Ajustes.';

  @override
  String get fieldServerInvalid =>
      'Este endereço não parece correto. Exemplo: http://host:8080';

  @override
  String get fieldUrlInvalid =>
      'Digite o link completo, começando com http:// ou https://';

  @override
  String get infoResume => 'Retomar';

  @override
  String get libraryEmpty => 'Sua biblioteca está vazia';

  @override
  String get libraryEmptyHint =>
      'Os favoritos e os títulos que você começou a assistir aparecem aqui.';

  @override
  String get onbNoChannels =>
      'O BattleStation TV não inclui canais, filmes nem playlists. Adicione uma fonte de um provedor do qual você é assinante.';

  @override
  String get onbPasteHint => 'Copiou um link de playlist?';

  @override
  String get onbTestRunning => 'Testando…';

  @override
  String passwordBodyIos(String p1) {
    return 'Digite a senha de “$p1”. Ela é armazenada no iOS Keychain neste dispositivo.';
  }

  @override
  String get searchRecent => 'Buscas recentes';

  @override
  String seriesContinueEp(int p1, int p2) {
    return 'Continuar T$p1 E$p2';
  }

  @override
  String seriesEpShort(int p1, int p2) {
    return 'T$p1 E$p2';
  }

  @override
  String get seriesNoEpisodes => 'Nenhum episódio encontrado';

  @override
  String seriesPlayEp(int p1, int p2) {
    return 'Reproduzir T$p1 E$p2';
  }

  @override
  String get seriesWatched => 'Assistido';

  @override
  String get settingsAbout => 'Sobre';

  @override
  String get settingsEditSource => 'Editar fonte';

  @override
  String get settingsLanguageNote =>
      'O BattleStation TV usa o idioma do seu dispositivo. Para usar outro idioma apenas neste app, escolha-o em Ajustes do iOS.';

  @override
  String get settingsOpenIOS => 'Abrir Ajustes do iOS';

  @override
  String get settingsPasswordNote =>
      'Deixe a nova senha em branco para manter a atual. As senhas são armazenadas no iOS Keychain.';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get sourceDeleteWarn =>
      'A fonte, seus favoritos e seu histórico de exibição são removidos deste dispositivo. Sua conta no provedor não é afetada.';

  @override
  String get syncNow => 'Atualizar';

  @override
  String get tabLibrary => 'Biblioteca';

  @override
  String get scopeCategory => 'Na categoria';

  @override
  String get scopeType => 'Na seção';

  @override
  String get scopeEverywhere => 'Em tudo';

  @override
  String get searchPrompt => 'Buscar';

  @override
  String get syncRunning => 'Sincronizando…';

  @override
  String get syncFailed => 'Falha na sincronização';

  @override
  String get syncNotUpdated => 'Exibindo dados salvos';

  @override
  String get emptyResults => 'Nada encontrado';

  @override
  String get favAdd => 'Adicionar aos favoritos';

  @override
  String get favRemove => 'Remover dos favoritos';

  @override
  String get playerClose => 'Fechar';

  @override
  String get playerSubtitles => 'Legendas';

  @override
  String get playerAudio => 'Áudio';

  @override
  String get playerOff => 'Desativado';

  @override
  String get playerAddSubtitle => 'Adicionar arquivo de legenda…';

  @override
  String get playerCatchup => 'Assistir a programas anteriores';

  @override
  String get playerFullscreen => 'Tela cheia';

  @override
  String get playerError => 'Falha na reprodução';

  @override
  String get playerRetry => 'Tentar novamente';

  @override
  String get playerPip => 'Picture in Picture';

  @override
  String get playerPipReturn => 'Voltar ao app';

  @override
  String get catchupTitle => 'Programas anteriores';

  @override
  String get catchupNoEpg =>
      'Sem guia de programação. Escolha o horário manualmente.';

  @override
  String get catchupPick => 'Horário de início';

  @override
  String get catchupDuration => 'Minutos';

  @override
  String get seriesSeason => 'Temporada';

  @override
  String get onbWelcomeTitle => 'Boas-vindas ao BattleStation TV';

  @override
  String get onbWelcomeBody =>
      'Assista a canais ao vivo, filmes e séries do seu provedor de IPTV. Vamos adicionar sua primeira fonte.';

  @override
  String get onbWhereTitle => 'Onde inserir os endereços?';

  @override
  String get onbWhereXtream =>
      'Xtream Codes: seu provedor fornece um endereço de servidor (como http://host:8080), um nome de usuário e uma senha. Digite-os abaixo.';

  @override
  String get onbWhereM3u =>
      'M3U: dê um nome à fonte e cole o link da playlist que seu provedor forneceu.';

  @override
  String get fieldKind => 'Tipo';

  @override
  String get fieldName => 'Nome';

  @override
  String get fieldServer => 'Endereço do servidor';

  @override
  String get fieldUsername => 'Nome de usuário';

  @override
  String get fieldPassword => 'Senha';

  @override
  String get fieldUrl => 'Link da playlist';

  @override
  String get kindXtream => 'Xtream Codes';

  @override
  String get kindM3u => 'M3U';

  @override
  String get onbTest => 'Testar conexão';

  @override
  String get onbTestOk => 'Conectado com sucesso';

  @override
  String get onbTestFail => 'Falha na conexão';

  @override
  String get onbNext => 'Avançar';

  @override
  String get onbBack => 'Voltar';

  @override
  String get onbSave => 'Salvar e sincronizar';

  @override
  String get settingsAccounts => 'Fontes';

  @override
  String get settingsLanguageSub => 'Idiomas de legenda preferidos';

  @override
  String get settingsLanguageAudio => 'Idiomas de áudio preferidos';

  @override
  String get settingsSubscale => 'Tamanho da legenda';

  @override
  String get settingsSubdelay => 'Atraso da legenda (segundos)';

  @override
  String get settingsGuide => 'Mostrar o guia de início rápido';

  @override
  String get settingsDelete => 'Excluir';

  @override
  String get accountAdd => 'Adicionar fonte…';

  @override
  String get settingsChangePassword => 'Alterar senha…';

  @override
  String get settingsNewPassword => 'Nova senha';

  @override
  String updateAvailable(String p1) {
    return 'A versão $p1 está disponível';
  }

  @override
  String get updateNow => 'Atualizar agora';

  @override
  String get updateNotes => 'Novidades';

  @override
  String get updateLater => 'Mais tarde';

  @override
  String get updateDownloading => 'Baixando atualização…';

  @override
  String updateReady(String p1) {
    return 'A versão $p1 está pronta para instalar';
  }

  @override
  String get updateRestart => 'Reiniciar para atualizar';

  @override
  String get updateFailed => 'Falha na atualização';

  @override
  String get updateManual => 'Baixar manualmente';

  @override
  String get updateCheckNow => 'Buscar atualizações';

  @override
  String get updateAuto => 'Buscar atualizações automaticamente';

  @override
  String get updateAutoInstall => 'Baixar atualizações automaticamente';

  @override
  String get updateUpToDate => 'Você está com a versão mais recente';

  @override
  String get updateDevBuild =>
      'As atualizações só estão disponíveis no app instalado';

  @override
  String updateCurrent(String p1) {
    return 'Versão atual: $p1';
  }

  @override
  String get playerBack => 'Voltar';

  @override
  String get playerErrorHint =>
      'Se isso continuar acontecendo, verifique a senha da fonte em Ajustes.';

  @override
  String get passwordTitle => 'Senha necessária';

  @override
  String passwordBody(String p1) {
    return 'Digite a senha de “$p1”. Ela é armazenada de forma privada neste Mac.';
  }

  @override
  String get passwordNone => 'Continuar sem senha';

  @override
  String get playerSpeed => 'Velocidade de reprodução';

  @override
  String get playerSpeedNormal => 'Normal';

  @override
  String get playerSpeedReset => 'Velocidade normal';

  @override
  String get settingsSeekPreview =>
      'Miniaturas de pré-visualização na barra de progresso';

  @override
  String get settingsSeekPreviewNote =>
      'Abre uma segunda conexão com o seu provedor. Desative se a reprodução parar ou se o seu provedor permitir apenas uma conexão.';

  @override
  String get playerSeekBar => 'Posição de reprodução';

  @override
  String playerSeekValue(String p1, String p2) {
    return '$p1 de $p2';
  }

  @override
  String get playerLive => 'Ao vivo';

  @override
  String get playerChannelPrev => 'Canal anterior';

  @override
  String get playerChannelNext => 'Próximo canal';

  @override
  String get playerScaleFit => 'Ajustar';

  @override
  String get playerScaleFill => 'Preencher';

  @override
  String get playerScaleStretch => 'Esticar';

  @override
  String get playerSubtitleAdjust => 'Ajustar legendas…';

  @override
  String get playerAirplay => 'AirPlay';

  @override
  String get playerBrightness => 'Brilho';

  @override
  String get playerVolume => 'Volume';

  @override
  String get playerReplay => 'Reproduzir novamente';

  @override
  String get settingsClock => 'Mostrar a hora no player';

  @override
  String get settingsSeekStep => 'Salto (teclas de seta e botões de salto)';

  @override
  String get settingsBarsHide => 'Ocultar os controles após';

  @override
  String get settingsNever => 'Nunca';

  @override
  String get settingsVideoScale => 'Escala do vídeo';

  @override
  String get settingsScaleFit => 'Ajustar (barras pretas)';

  @override
  String get settingsScaleFill => 'Preencher (corta as bordas)';

  @override
  String get settingsScaleStretch => 'Esticar';

  @override
  String get settingsVideoScaleHint =>
      'Pressione A no player para alternar entre os três.';

  @override
  String get settingsBuffer => 'Buffer de rede';

  @override
  String get settingsBufferSmall => 'Pequeno';

  @override
  String get settingsBufferNormal => 'Normal';

  @override
  String get settingsBufferLarge => 'Grande';

  @override
  String get settingsBufferHint =>
      'Um buffer maior ajuda em conexões lentas ou instáveis.';

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
    return 'Voltar $p1';
  }

  @override
  String playerSkipForward(String p1) {
    return 'Avançar $p1';
  }

  @override
  String get playerSleep => 'Timer de desligamento';

  @override
  String get downloadsTitle => 'Downloads';

  @override
  String get downloadsAdd => 'Baixar';

  @override
  String get downloadsSeason => 'Baixar temporada';

  @override
  String get downloadsChooseFolder =>
      'Escolha onde salvar os filmes e episódios baixados';

  @override
  String get downloadsChoose => 'Escolher';

  @override
  String get downloadsNotChosen => 'Será perguntado no primeiro download';

  @override
  String get downloadsChange => 'Alterar pasta…';

  @override
  String get downloadsPause => 'Pausar';

  @override
  String get downloadsResume => 'Retomar';

  @override
  String get downloadsCancel => 'Cancelar';

  @override
  String get downloadsPlay => 'Reproduzir';

  @override
  String get downloadsReveal => 'Mostrar no Finder';

  @override
  String get downloadsDelete => 'Excluir arquivo';

  @override
  String get downloadsEmpty => 'Nenhum download ainda';

  @override
  String get downloadsQueued => 'Aguardando';

  @override
  String get downloadsDone => 'Concluído';

  @override
  String get downloadsHint =>
      'Os downloads são feitos um de cada vez. Muitos provedores permitem apenas uma conexão, então reproduzir durante um download pode falhar. Downloads incompletos não são mantidos ao fechar o app.';

  @override
  String get epgNow => 'Agora';

  @override
  String get epgNext => 'Depois';

  @override
  String get settingsFullscreen =>
      'Abrir a reprodução em tela cheia (os controles ficam ocultos até você mover o mouse)';

  @override
  String get nextTitle => 'A seguir';

  @override
  String nextIn(int p1) {
    return 'Reproduzindo em $p1 s';
  }

  @override
  String get nextNow => 'Reproduzir agora';

  @override
  String get nextCancel => 'Cancelar';

  @override
  String get settingsAutoNext =>
      'Reproduzir o próximo episódio automaticamente';

  @override
  String get downloadsNoSpace => 'Espaço livre em disco insuficiente';

  @override
  String get dbErrorTitle =>
      'O BattleStation TV não consegue abrir o banco de dados';

  @override
  String get dbErrorBody =>
      'Se outra cópia do BattleStation TV estiver aberta, feche-a e tente novamente.';

  @override
  String get dbRecoveredTitle => 'O banco de dados estava danificado';

  @override
  String dbRecoveredBody(String p1) {
    return 'O BattleStation TV foi iniciado com um banco de dados novo (adicione sua fonte novamente). O arquivo danificado foi mantido aqui:\n$p1';
  }

  @override
  String get menuShowWindow => 'Mostrar janela';

  @override
  String get settingsTabGeneral => 'Geral';

  @override
  String get settingsTabPlayer => 'Player';

  @override
  String get settingsTabPlaylists => 'Playlists';

  @override
  String get settingsAppearance => 'Aparência';

  @override
  String get settingsSystem => 'Sistema';

  @override
  String get appearanceLight => 'Claro';

  @override
  String get appearanceDark => 'Escuro';

  @override
  String get settingsInterfaceLanguage => 'Idioma da interface';

  @override
  String get settingsLanguageRestart =>
      'Entra em vigor após reiniciar o BattleStation TV.';

  @override
  String get settingsHideCategories => 'Ocultar categorias';

  @override
  String get settingsHideCategoriesWords => 'Palavras a ocultar';

  @override
  String get settingsHideCategoriesNote =>
      'Oculta as categorias cujo nome contém estas palavras (separe-as com vírgulas). Os canais, filmes e séries delas também somem da busca, dos favoritos e de Continuar assistindo. Este é um filtro simples, não um controle parental: qualquer pessoa pode alterá-lo aqui.';

  @override
  String get settingsRefresh => 'Atualizar playlists';

  @override
  String get settingsRefresh0 => 'Somente ao abrir o app';

  @override
  String get settingsRefresh6 => 'A cada 6 horas';

  @override
  String get settingsRefresh12 => 'A cada 12 horas';

  @override
  String get settingsRefresh24 => 'A cada 24 horas';

  @override
  String get settingsBackup => 'Backup e restauração';

  @override
  String get backupExport => 'Exportar backup…';

  @override
  String get backupImport => 'Importar backup…';

  @override
  String get backupWarn =>
      'O arquivo de backup lista suas playlists com os endereços, que podem incluir logins, então mantenha-o em sigilo. As senhas das fontes Xtream não são salvas nele. A importação acrescenta às suas fontes atuais e não exclui nada.';

  @override
  String get backupExported => 'O backup foi salvo.';

  @override
  String get backupImported => 'O backup foi importado.';

  @override
  String get backupErrorInvalid =>
      'Este não é um arquivo de backup do BattleStation TV.';

  @override
  String get backupErrorVersion =>
      'Este backup vem de outra versão do BattleStation TV e não pode ser lido.';

  @override
  String get backupErrorTooLarge =>
      'Este arquivo é grande demais para ser um backup.';

  @override
  String get backupFailed => 'Falha no backup';

  @override
  String get settingsClearData => 'Limpar dados';

  @override
  String get clearHistory => 'Limpar histórico de exibição';

  @override
  String get clearFavorites => 'Limpar favoritos';

  @override
  String get clearImages => 'Limpar cache de imagens';

  @override
  String get clearConfirm => 'Limpar';

  @override
  String get clearHistoryWarn =>
      'As posições de reprodução e as listas de Continuar assistindo de todas as fontes serão apagadas. Esta ação não pode ser desfeita.';

  @override
  String get clearFavoritesWarn =>
      'Seus favoritos em todas as fontes serão removidos. Esta ação não pode ser desfeita.';

  @override
  String get clearImagesWarn =>
      'Logotipos e pôsteres salvos são removidos e baixados novamente quando necessário.';

  @override
  String get infoDetails => 'Detalhes';

  @override
  String get infoPlot => 'Sinopse';

  @override
  String get infoCast => 'Elenco';

  @override
  String get infoDirector => 'Direção';

  @override
  String get infoGenre => 'Gênero';

  @override
  String get infoYear => 'Ano de lançamento';

  @override
  String get infoRating => 'Avaliação';

  @override
  String get infoDuration => 'Duração';

  @override
  String get infoCountry => 'País';

  @override
  String get infoTrailer => 'Trailer';

  @override
  String get infoPlay => 'Reproduzir';

  @override
  String get infoEmpty => 'Seu provedor não tem detalhes deste título.';

  @override
  String get infoLoading => 'Carregando detalhes…';

  @override
  String get infoError => 'Não foi possível carregar os detalhes.';

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
  String get playerSkipIntro => 'Pular abertura';

  @override
  String get playerSkipCredits => 'Pular créditos';

  @override
  String get playerSkipMenu => 'Abertura e créditos';

  @override
  String get playerMarkIntroStart => 'A abertura começa aqui';

  @override
  String get playerMarkIntroEnd => 'A abertura termina aqui';

  @override
  String get playerMarkCredits => 'Os créditos começam aqui';

  @override
  String get playerSkipForget => 'Esquecer abertura e créditos';

  @override
  String get playerSkipSaved => 'Salvo para todos os episódios desta série';

  @override
  String get playerSkipRefused => 'Não é possível neste ponto';

  @override
  String get continueRemove => 'Remover de Continuar assistindo';

  @override
  String get settingsFavoritesAZ => 'Ordenar favoritos por nome (A–Z)';

  @override
  String get settingsKeychain => 'Guardar senhas nas Chaves';

  @override
  String get settingsKeychainNote =>
      'Desligado: as senhas ficam no banco de dados privado do app. Ligado: o macOS as guarda nas suas chaves de início de sessão.';

  @override
  String get settingsKeychainFailed =>
      'As Chaves não aceitaram as senhas. Nada foi alterado.';
}
