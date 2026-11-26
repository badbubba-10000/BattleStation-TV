import 'local_data_policy.dart';

// Optional Firebase REST client for Windows and Android. GPLv3.
// Firebase Auth password handling occurs only through Google's HTTPS endpoints.
// The only cloud document contains a validated .bstvtheme JSON string.
import 'dart:convert';
import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:iptvmac/bstv/theme_package.dart';

/// Only declarative appearance leaves the device. Provider bindings, free-text
/// titles and imported identifiers are omitted even if somebody put a URL there.
BstvThemePackage cloudSafeTheme(BstvThemePackage theme) {
  final json = theme.toJson();
  final layouts = json['layouts'];
  if (layouts is Map) {
    for (final layout in layouts.values) {
      if (layout is Map && layout['widgets'] is List) {
        var index = 0;
        for (final widget in layout['widgets']) {
          if (widget is Map) {
            widget.remove('title');
            widget.remove('categoryId');
            widget['id'] = 'widget-${index++}';
          }
        }
      }
    }
  }
  return BstvThemePackage.decode(jsonEncode(json));
}

class CloudSyncConfig {
  static const project = 'battlestation-tv-cloud-sync';
  static const apiKey = 'AIzaSyCWTUCFL7pPeghuH4neVLYXRbGdhdzWBmA';
  static const appId = 'battleStationTV';
  static const appLabel = 'BattleStation TV';
  static const firebaseAppId = '1:837929364702:web:fbdeb624e1d7fd6474a64f';
  // No cloud credentials or IPTV sources are part of these values.
}

class CloudSyncException implements Exception {
  const CloudSyncException(this.message);
  final String message;
  @override
  String toString() => message;
}


class CloudBackup {
  const CloudBackup(this.slot, this.name, this.theme, this.createdAt, this.updatedAt, this.revision);
  final int slot;
  final String name, createdAt, updatedAt, revision;
  final BstvThemePackage theme;
  int get bytes => utf8.encode(theme.encode()).length;
  factory CloudBackup.fromDocument(int slot, Map<String, dynamic> doc) {
    final fields = doc['fields'] as Map;
    return CloudBackup(slot, (fields['name'] as Map)['stringValue'] as String,
      BstvThemePackage.decode((fields['theme'] as Map)['stringValue'] as String),
      (fields['createdAt'] as Map)['timestampValue'] as String,
      (fields['updatedAt'] as Map)['timestampValue'] as String, doc['updateTime'] as String);
  }
  Map<String, dynamic> toJson() => {'slot': slot, 'name': name, 'theme': theme.toJson(), 'createdAt': createdAt, 'updatedAt': updatedAt};
}

class CloudSyncClient {
  CloudSyncClient({http.Client? httpClient, FlutterSecureStorage? secure})
    : _http = httpClient ?? http.Client(),
      _secure = secure ?? const FlutterSecureStorage();
  final http.Client _http;
  final FlutterSecureStorage _secure;
  String? _idToken, _refreshToken, _uid, _email;
  DateTime _expiresAt = DateTime.fromMillisecondsSinceEpoch(0);
  bool get signedIn => _uid != null && _refreshToken != null;
  String? get email => _email;
  String? get userId => _uid;
  String get _prefix => 'cloud.${CloudSyncConfig.appId}.v1.';

  Future<void> restoreSession() async {
    if (localDataOnly) return;
    final uid = await _secure.read(key: '${_prefix}uid');
    final refresh = await _secure.read(key: '${_prefix}refresh');
    if (uid == null || refresh == null) return;
    _uid = uid;
    _refreshToken = refresh;
    _email = await _secure.read(key: '${_prefix}email');
    try {
      await _token();
    } catch (_) {
      await signOut();
    }
  }

  Future<Map<String, dynamic>> _send(
    Uri uri,
    Map<String, dynamic> data, {
    String method = 'POST',
    String? token,
  }) async {
    if (localDataOnly) {
      throw const CloudSyncException(
        'Cloud Sync is disabled in this local-only edition.',
      );
    }
    late http.Response result;
    try {
      result = await _http
          .send(
            http.Request(method, uri)
              ..headers.addAll({
                'Content-Type': 'application/json',
                if (token != null) 'Authorization': 'Bearer $token',
              })
              ..body = jsonEncode(data),
          )
          .then(http.Response.fromStream)
          .timeout(const Duration(seconds: 20));
    } on TimeoutException {
      throw const CloudSyncException('Connection timed out. Try again later.');
    } catch (_) {
      throw const CloudSyncException(
        'Could not contact Firebase. Check internet access.',
      );
    }
    Map<String, dynamic> decoded;
    try {
      decoded = Map<String, dynamic>.from(jsonDecode(result.body) as Map);
    } catch (_) {
      throw CloudSyncException(
        'Unexpected Firebase response (HTTP ${result.statusCode}).',
      );
    }
    if (result.statusCode < 200 || result.statusCode >= 300) {
      final err = decoded['error'];
      final code = err is Map
          ? '${err['message'] ?? 'REQUEST_FAILED'}'
          : 'REQUEST_FAILED';
      final message = switch (code) {
        'EMAIL_EXISTS' => 'That email address already has an account.',
        'INVALID_LOGIN_CREDENTIALS' ||
        'INVALID_PASSWORD' ||
        'EMAIL_NOT_FOUND' => 'Incorrect email or password.',
        'WEAK_PASSWORD' =>
          'Choose a stronger password (at least 6 characters).',
        'TOO_MANY_ATTEMPTS_TRY_LATER' => 'Too many attempts. Try again later.',
        'USER_DISABLED' => 'This account has been disabled.',
        'INVALID_REFRESH_TOKEN' ||
        'TOKEN_EXPIRED' => 'Your session expired. Sign in again.',
        'CREDENTIAL_TOO_OLD_LOGIN_AGAIN' =>
          'Sign in again before deleting your account.',
        _ => 'Firebase request failed ($code).',
      };
      throw CloudSyncException(message);
    }
    return decoded;
  }

  Uri _auth(String operation) => Uri.https(
    'identitytoolkit.googleapis.com',
    '/v1/accounts:$operation',
    {'key': CloudSyncConfig.apiKey},
  );

  Future<void> signUp(String email, String password) async => _accept(
    await _send(_auth('signUp'), {
      'email': email.trim(),
      'password': password,
      'returnSecureToken': true,
    }),
  );
  Future<void> signIn(String email, String password) async => _accept(
    await _send(_auth('signInWithPassword'), {
      'email': email.trim(),
      'password': password,
      'returnSecureToken': true,
    }),
  );
  Future<void> sendPasswordReset(String address) async {
    await _send(_auth('sendOobCode'), {
      'requestType': 'PASSWORD_RESET',
      'email': address.trim(),
    });
  }

  Future<void> sendVerificationEmail() async {
    await _send(_auth('sendOobCode'), {
      'requestType': 'VERIFY_EMAIL',
      'idToken': await _token(),
    });
  }

  Future<void> _accept(Map<String, dynamic> json) async {
    _idToken = json['idToken'] as String;
    _refreshToken = json['refreshToken'] as String;
    _uid = json['localId'] as String;
    _email = json['email'] as String?;
    _expiresAt = DateTime.now().add(
      Duration(seconds: int.tryParse('${json['expiresIn']}') ?? 3500),
    );
    await _persist();
  }

  Future<void> _persist() async {
    await _secure.write(key: '${_prefix}uid', value: _uid);
    await _secure.write(key: '${_prefix}refresh', value: _refreshToken);
    if (_email != null) {
      await _secure.write(key: '${_prefix}email', value: _email);
    }
  }

  Future<String> _token() async {
    if (localDataOnly) {
      throw const CloudSyncException(
        'Cloud Sync is disabled in this local-only edition.',
      );
    }
    if (!signedIn) throw const CloudSyncException('Sign in to use cloud sync.');
    if (_idToken != null &&
        DateTime.now().isBefore(
          _expiresAt.subtract(const Duration(minutes: 2)),
        )) {
      return _idToken!;
    }
    late http.Response result;
    try {
      result = await _http
          .post(
            Uri.https('securetoken.googleapis.com', '/v1/token', {
              'key': CloudSyncConfig.apiKey,
            }),
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: {
              'grant_type': 'refresh_token',
              'refresh_token': _refreshToken!,
            },
          )
          .timeout(const Duration(seconds: 20));
    } catch (_) {
      throw const CloudSyncException(
        'Could not refresh sign-in. Check your connection.',
      );
    }
    if (result.statusCode != 200) {
      throw const CloudSyncException('Session expired. Sign in again.');
    }
    final json = jsonDecode(result.body) as Map<String, dynamic>;
    if ('${json['user_id']}' != _uid) {
      throw const CloudSyncException('Account mismatch. Sign in again.');
    }
    _idToken = json['id_token'] as String;
    _refreshToken = json['refresh_token'] as String;
    _expiresAt = DateTime.now().add(
      Duration(seconds: int.tryParse('${json['expires_in']}') ?? 3500),
    );
    await _persist();
    return _idToken!;
  }

  Uri get _document => Uri.https(
    'firestore.googleapis.com',
    '/v1/projects/${CloudSyncConfig.project}/databases/(default)/documents/users/$_uid/settings/${CloudSyncConfig.appId}',
  );

  Future<void> saveTheme(BstvThemePackage theme) async {
    final safe = cloudSafeTheme(
      theme,
    ); // strictly appearance-only cloud payload
    final encoded = safe.encode();
    if (utf8.encode(encoded).length > BstvThemePackage.maxBytes) {
      throw const CloudSyncException('Theme is too large to synchronize.');
    }
    await _send(
      _document,
      {
        'fields': {
          'schema': {'integerValue': '1'},
          'theme': {'stringValue': encoded},
          'updatedAt': {
            'timestampValue': DateTime.now().toUtc().toIso8601String(),
          },
        },
      },
      method: 'PATCH',
      token: await _token(),
    );
  }

  Future<BstvThemePackage?> loadTheme() async {
    late http.Response response;
    try {
      response = await _http
          .get(
            _document,
            headers: {'Authorization': 'Bearer ${await _token()}'},
          )
          .timeout(const Duration(seconds: 20));
    } catch (_) {
      throw const CloudSyncException(
        'Could not download settings. Check your connection.',
      );
    }
    if (response.statusCode == 404) return null;
    if (response.statusCode != 200) {
      throw CloudSyncException(
        'Unable to load cloud settings (HTTP ${response.statusCode}).',
      );
    }
    try {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final fields = data['fields'] as Map<String, dynamic>;
      if ((fields['schema'] as Map)['integerValue'] != '1') {
        throw const FormatException('Unsupported cloud settings schema');
      }
      return BstvThemePackage.decode(
        (fields['theme'] as Map)['stringValue'] as String,
      );
    } catch (_) {
      throw const CloudSyncException(
        'Cloud settings are invalid or incompatible.',
      );
    }
  }

  Future<void> deleteCloudTheme() async {
    late http.Response response;
    try {
      response = await _http
          .delete(
            _document,
            headers: {'Authorization': 'Bearer ${await _token()}'},
          )
          .timeout(const Duration(seconds: 20));
    } catch (_) {
      throw const CloudSyncException('Could not delete cloud settings.');
    }
    if (response.statusCode != 200 && response.statusCode != 404) {
      throw CloudSyncException(
        'Cloud deletion failed (HTTP ${response.statusCode}).',
      );
    }
  }


  Uri _backupUri(String app, int slot, [Map<String, String>? query]) {
    if (!const ['battleStationTV', 'getETV'].contains(app) || slot < 1 || slot > 5) {
      throw const CloudSyncException('Invalid backup slot.');
    }
    return Uri.https('firestore.googleapis.com',
      '/v1/projects/${CloudSyncConfig.project}/databases/(default)/documents/users/$_uid/settings/$app/backups/slot$slot', query);
  }

  Future<Map<String, dynamic>?> _readDocument(Uri uri) async {
    final response = await _http.get(uri, headers: {'Authorization': 'Bearer ${await _token()}'}).timeout(const Duration(seconds: 20));
    if (response.statusCode == 404) return null;
    if (response.statusCode != 200) throw CloudSyncException('Cloud read failed (HTTP ${response.statusCode}).');
    return Map<String, dynamic>.from(jsonDecode(response.body) as Map);
  }

  Future<List<CloudBackup>> listBackups() async {
    final results = await Future.wait(List.generate(5, (i) async {
      final doc = await _readDocument(_backupUri(CloudSyncConfig.appId, i + 1));
      return doc == null ? null : CloudBackup.fromDocument(i + 1, doc);
    }));
    return results.whereType<CloudBackup>().toList();
  }

  String _backupName(String name) {
    final value = name.trim();
    if (!RegExp(r'^[a-zA-Z0-9 _.-]{1,60}$').hasMatch(value)) {
      throw const CloudSyncException('Use 1–60 letters, numbers, spaces, dots, dashes or underscores. Never enter credentials.');
    }
    return value;
  }

  Future<void> createBackup(int slot, String name, BstvThemePackage theme) async {
    final encoded = cloudSafeTheme(theme).encode();
    if (utf8.encode(encoded).length > BstvThemePackage.maxBytes) throw const CloudSyncException('Backup is too large.');
    final now = DateTime.now().toUtc().toIso8601String();
    await _send(_backupUri(CloudSyncConfig.appId, slot, {'currentDocument.exists': 'false'}), {'fields': {
      'schema': {'integerValue': '1'}, 'name': {'stringValue': _backupName(name)},
      'theme': {'stringValue': encoded}, 'createdAt': {'timestampValue': now}, 'updatedAt': {'timestampValue': now},
    }}, method: 'PATCH', token: await _token());
  }

  Future<void> renameBackup(CloudBackup backup, String name) async {
    final uri = _backupUri(CloudSyncConfig.appId, backup.slot).replace(queryParameters: {
      'updateMask.fieldPaths': ['name', 'updatedAt'], 'currentDocument.updateTime': backup.revision,
    });
    await _send(uri, {'fields': {'name': {'stringValue': _backupName(name)}, 'updatedAt': {'timestampValue': DateTime.now().toUtc().toIso8601String()}}}, method: 'PATCH', token: await _token());
  }

  Future<void> _deleteDocument(Uri uri) async {
    final response = await _http.delete(uri, headers: {'Authorization': 'Bearer ${await _token()}'}).timeout(const Duration(seconds: 20));
    if (response.statusCode != 200 && response.statusCode != 404) throw CloudSyncException('Cloud deletion failed (HTTP ${response.statusCode}).');
  }

  Future<void> deleteBackup(CloudBackup backup) => _deleteDocument(_backupUri(CloudSyncConfig.appId, backup.slot, {'currentDocument.updateTime': backup.revision}));

  Future<void> deleteEditionData(String app) async {
    for (var slot = 1; slot <= 5; slot++) {
      await _deleteDocument(_backupUri(app, slot));
    }
    await _deleteDocument(Uri.https('firestore.googleapis.com', '/v1/projects/${CloudSyncConfig.project}/databases/(default)/documents/users/$_uid/settings/$app'));
  }

  Future<Map<String, dynamic>> refreshAccountInfo() async {
    final result = await _send(_auth('lookup'), {'idToken': await _token()});
    final users = result['users'] as List;
    final user = users.single as Map;
    return {'email': user['email'], 'emailVerified': user['emailVerified'] == true, 'uid': _uid};
  }

  Future<String> exportCloudData() async {
    final account = await refreshAccountInfo();
    final live = await loadTheme();
    final backups = await listBackups();
    return const JsonEncoder.withIndent('  ').convert({'account': account, 'edition': CloudSyncConfig.appId, 'currentTheme': live?.toJson(), 'backups': backups.map((b) => b.toJson()).toList()});
  }

  Future<void> deleteAccount() async {
    // Firebase does not cascade deletes of Firestore documents.
    await deleteEditionData('battleStationTV');
    await deleteEditionData('getETV');
    await _send(_auth('delete'), {'idToken': await _token()});
    await signOut();
  }

  Future<void> signOut() async {
    _idToken = _refreshToken = _uid = _email = null;
    _expiresAt = DateTime.fromMillisecondsSinceEpoch(0);
    for (final suffix in ['uid', 'refresh', 'email']) {
      await _secure.delete(key: '$_prefix$suffix');
    }
  }

  void dispose() => _http.close();
}
