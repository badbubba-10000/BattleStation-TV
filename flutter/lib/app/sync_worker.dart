import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:http/http.dart' as http;
import 'package:iptvmac/core/app_database.dart';
import 'package:iptvmac/core/errors.dart';
import 'package:iptvmac/core/models.dart';
import 'package:iptvmac/core/sync_service.dart';

/// Syncs one account and returns null on success or a short message fit to show. Never throws. [onProgress] hears how far it is, 0..1.
typedef SyncRunner = Future<String?> Function(Account account, String password, void Function(double fraction) onProgress);

/// A message for a failure of the network layer. Library exceptions can carry the request URL (which holds the password),
/// so URLs are cut out of anything that is not one of our own errors.
String describeError(Object e) {
  if (e is XtreamRequestFailure) return e.description;
  if (e is IPTVError) return e.description;
  if (e is TimeoutException) return 'The server did not answer in time';
  // Arbitrary exception text may contain bare passwords, headers or private IPs,
  // not just URLs. Keep it out of both the UI and diagnostic exports.
  if (e is SocketException || e is http.ClientException) return 'Network connection failed; the provider may be unavailable';
  return 'The operation failed. Check the connection and local storage settings';
}

/// The runner the app uses: the whole sync (download, decode, insert) runs in a background isolate that opens its own
/// connection to the same database file (WAL), so the UI isolate keeps reading and drawing meanwhile.
SyncRunner isolateSyncRunner(String dbPath) => (account, password, onProgress) => _syncInIsolate(dbPath, account, password, onProgress);

Future<String?> _syncInIsolate(String dbPath, Account account, String password, void Function(double) onProgress) async {
  final port = ReceivePort(); // the isolate reports its progress through this port
  final listener = port.listen((m) {
    if (m is double) onProgress(m);
  });
  try {
    return await _runSyncIsolate(dbPath, (account.id, account.name, account.kind, account.server, account.username, account.url), password, port.sendPort);
  } finally {
    await listener.cancel();
    port.close();
  }
}

// Its own function so the closure sent to the isolate holds nothing but sendable values: a closure sees the whole scope it was made in,
// and in the function above that scope also holds `onProgress`, which reaches the model.
Future<String?> _runSyncIsolate(String dbPath, (int?, String, AccountKind, String?, String?, String?) fields, String password, SendPort out) {
  return Isolate.run(() async {
    final (id, name, kind, server, username, url) = fields;
    final a = Account(id: id, name: name, kind: kind, server: server, username: username, url: url);
    final db = AppDatabase.open(dbPath);
    try {
      await SyncService(db).sync(a, password: password, onProgress: out.send);
      return null;
    } catch (e) {
      return describeError(e);
    } finally {
      db.close();
    }
  });
}

/// Runs the sync on the calling isolate against an already open database (tests with an in-memory database and a fake
/// `http.Client`; the app when the database file could not be opened and an in-memory one is used instead).
SyncRunner inlineSyncRunner(AppDatabase db, {http.Client? client}) => (account, password, onProgress) async {
      try {
        await SyncService(db, client: client).sync(account, password: password, onProgress: onProgress);
        return null;
      } catch (e) {
        return describeError(e);
      }
    };
