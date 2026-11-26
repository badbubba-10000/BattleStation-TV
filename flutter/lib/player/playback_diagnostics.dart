// BattleStation TV, 2026. GPLv3; see BSTV-NOTICE.md.
enum PlaybackStage { initializing, loading, buffering, playing, failed }

enum PlaybackFailureKind {
  authentication,
  unavailable,
  connectionLimit,
  network,
  tls,
  format,
  decoding,
  rendering,
  initialization,
  unknown,
}

class PlaybackIssue {
  const PlaybackIssue(
    this.kind,
    this.message, {
    this.httpStatus,
    this.retryable = false,
  });
  final PlaybackFailureKind kind;
  final String message;
  final int? httpStatus;
  final bool retryable;

  /// Raw backend messages may include credentials. Retain only curated fields.
  factory PlaybackIssue.fromBackend(Object error) {
    final text = error.toString().toLowerCase();
    final code = RegExp(
      r'(?:http(?: error| status)?|server returned|status code)\s*[:=]?\s*([1-5]\d{2})\b',
    ).firstMatch(text)?.group(1);
    final status = code == null ? null : int.parse(code);
    if (status == 401 || status == 403) {
      return PlaybackIssue(
        PlaybackFailureKind.authentication,
        'Stream access rejected. Check account expiry, VPN requirements and provider access.',
        httpStatus: status,
      );
    }
    if (status == 429) {
      return PlaybackIssue(
        PlaybackFailureKind.connectionLimit,
        'Provider rate or connection limit reached. Stop other sessions before retrying.',
        httpStatus: status,
      );
    }
    if (status == 404 || status == 410) {
      return PlaybackIssue(
        PlaybackFailureKind.unavailable,
        'Stream endpoint unavailable or expired. Refresh the playlist and check the supported stream format.',
        httpStatus: status,
      );
    }
    if (text.contains('certificate') ||
        text.contains('tls') ||
        text.contains('ssl')) {
      return PlaybackIssue(
        PlaybackFailureKind.tls,
        'TLS certificate verification or negotiation failed. Check device time and provider certificates; verification remains enabled.',
        httpStatus: status,
      );
    }
    if (text.contains('decode') || text.contains('decoder')) {
      return const PlaybackIssue(
        PlaybackFailureKind.decoding,
        'Media decoding failed. Check codec support or try software decoding.',
      );
    }
    if (text.contains('render') ||
        text.contains('texture') ||
        text.contains('d3d') ||
        text.contains('opengl')) {
      return const PlaybackIssue(
        PlaybackFailureKind.rendering,
        'Video output initialization failed. Check graphics drivers and software rendering support.',
      );
    }
    if (text.contains('demux') ||
        text.contains('format') ||
        text.contains('unrecognized') ||
        text.contains('invalid data')) {
      return const PlaybackIssue(
        PlaybackFailureKind.format,
        'No supported media was found. The endpoint may return non-media data or an unsupported format.',
      );
    }
    if (text.contains('timeout') ||
        text.contains('timed out') ||
        text.contains('connection') ||
        text.contains('resolve') ||
        status != null) {
      return PlaybackIssue(
        PlaybackFailureKind.network,
        'Stream connection failed. Check connectivity, VPN routing and provider availability.',
        httpStatus: status,
        retryable: status == null || status >= 500,
      );
    }
    return const PlaybackIssue(
      PlaybackFailureKind.unknown,
      'Media backend could not load this stream. Inspect the safe diagnostics and check provider access and format.',
    );
  }
}

class PlaybackDiagnostics {
  const PlaybackDiagnostics({
    this.stage = PlaybackStage.initializing,
    this.protocol,
    this.issue,
    this.videoCodec,
    this.audioCodec,
    this.outputReady = false,
  });
  final PlaybackStage stage;
  final String? protocol, videoCodec, audioCodec;
  final PlaybackIssue? issue;
  final bool outputReady;
}

abstract interface class DiagnosticPlaybackEngine {
  PlaybackDiagnostics get diagnostics;
}

/// Delayed initialization must never open a superseded channel or a disposed session.
class LatestMediaLoad {
  int generation = 0;
  bool disposed = false;
  Future<void> submit(
    Future<void> ready,
    Future<void> Function() open,
    void Function(Object) onError,
  ) async {
    final current = ++generation;
    try {
      await ready.timeout(const Duration(seconds: 20));
      if (disposed || current != generation) return;
      await open();
    } catch (error) {
      if (!disposed && current == generation) onError(error);
    }
  }

  void dispose() {
    disposed = true;
    generation++;
  }
}
