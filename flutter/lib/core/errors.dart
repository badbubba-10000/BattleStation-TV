/// Errors of the Xtream / M3U layer. Compare with `==` (e.g. `IPTVError.http(403)`).
class IPTVError implements Exception {
  const IPTVError._(this._name, [this.code]);

  static const badResponse = IPTVError._('badResponse');
  static const badConfig = IPTVError._('badConfig');
  static const badCredentials = IPTVError._('badCredentials');
  static const emptyResponse = IPTVError._('emptyResponse');
  static const partialResponse = IPTVError._('partialResponse');
  static const accountInactive = IPTVError._('accountInactive');
  static IPTVError http(int code) => IPTVError._('http', code);

  final String _name;

  /// The HTTP status, for `IPTVError.http`.
  final int? code;

  /// English text for logs; the app shows its own translation.
  String get description => switch (_name) {
    'http' => 'HTTP $code',
    'badResponse' => 'Invalid API response from server',
    'badConfig' => 'Invalid server address',
    'badCredentials' => 'Wrong username or password',
    'emptyResponse' =>
      'The server returned an empty list; keeping your saved data',
    'partialResponse' => 'The provider returned an empty list for some sections right now; keeping your saved ones. Try again later',
    _ => 'The subscription is not active (expired or disabled)',
  };

  @override
  bool operator ==(Object other) =>
      other is IPTVError && other._name == _name && other.code == code;

  @override
  int get hashCode => Object.hash(_name, code);

  @override
  String toString() => 'IPTVError($description)';
}

/// Only curated stage names and status codes cross the diagnostics/UI boundary.
/// Never retains a URL, hostname, response body or original exception.
enum XtreamStage {
  authentication,
  liveCategories,
  liveStreams,
  movieCategories,
  movies,
  seriesCategories,
  series,
  epg,
  details;

  static XtreamStage forAction(String? action) => switch (action) {
    null => authentication,
    'get_live_categories' => liveCategories,
    'get_live_streams' => liveStreams,
    'get_vod_categories' => movieCategories,
    'get_vod_streams' => movies,
    'get_series_categories' => seriesCategories,
    'get_series' => series,
    'get_short_epg' || 'get_simple_data_table' => epg,
    _ => details,
  };

  String get label => switch (this) {
    authentication => 'authentication',
    liveCategories => 'live categories',
    liveStreams => 'live channels',
    movieCategories => 'movie categories',
    movies => 'movies',
    seriesCategories => 'series categories',
    series => 'series',
    epg => 'EPG',
    details => 'content details',
  };

  bool get isCatalog =>
      this != authentication && this != epg && this != details;
}

enum XtreamFailureKind { http, timeout, invalidResponse, network }

class XtreamRequestFailure implements Exception {
  const XtreamRequestFailure({
    required this.stage,
    required this.kind,
    this.statusCode,
    this.authenticationConfirmed = false,
  });
  final XtreamStage stage;
  final XtreamFailureKind kind;
  final int? statusCode;
  final bool authenticationConfirmed;

  String get description {
    final prefix = authenticationConfirmed && stage.isCatalog
        ? 'Authentication succeeded, but playlist loading failed at ${stage.label}'
        : 'Xtream ${stage.label} request failed';
    final reason = switch (kind) {
      XtreamFailureKind.timeout => 'Network timeout',
      XtreamFailureKind.invalidResponse => 'Invalid API response',
      XtreamFailureKind.network =>
        'Network connection failed; the provider may be unavailable',
      XtreamFailureKind.http => switch (statusCode) {
        511 => 'Provider or intermediary returned HTTP 511 (network authentication required)',
        512 => 'Provider or intermediary returned HTTP 512 (non-standard response; not proof of invalid credentials)',
        final int code when code >= 500 =>
          'Provider unavailable or intermediary error (HTTP $code)',
        _ => 'Provider or intermediary returned HTTP $statusCode',
      },
    };
    return '$prefix: $reason';
  }

  @override
  String toString() => description;
}
