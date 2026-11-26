import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:iptvmac/player/playback_diagnostics.dart';
import 'package:iptvmac/player/playback_controller.dart';

import 'fake_engine.dart';

class AuthFailureEngine extends FakeEngine implements DiagnosticPlaybackEngine {
  @override
  PlaybackDiagnostics get diagnostics => const PlaybackDiagnostics(
    issue: PlaybackIssue(
      PlaybackFailureKind.authentication,
      'Access rejected',
      httpStatus: 401,
    ),
  );
}

void main() {
  test(
    'backend errors retain curated stage/status only, never URLs or secrets',
    () {
      for (final raw in [
        'HTTP error 403 at https://private.example/live/user/secret/1.ts?token=hidden',
        'TLS certificate failed for secret',
        'cannot decode private payload',
        'D3D texture failed https://private.example',
        'unclassified secret',
      ]) {
        final issue = PlaybackIssue.fromBackend(raw);
        expect(issue.message, isNot(contains('secret')));
        expect(issue.message, isNot(contains('private.example')));
        expect(issue.message, isNot(contains('hidden')));
      }
      expect(PlaybackIssue.fromBackend('HTTP error 403').httpStatus, 403);
      expect(
        PlaybackIssue.fromBackend('Server returned 429').kind,
        PlaybackFailureKind.connectionLimit,
      );
      expect(PlaybackIssue.fromBackend('HTTP error 503').retryable, isTrue);
      expect(PlaybackIssue.fromBackend('HTTP error 401').retryable, isFalse);
      expect(PlaybackIssue.fromBackend('unknown').httpStatus, isNull);
    },
  );
  test(
    'queued initialization opens only the most recently selected channel',
    () async {
      final ready = Completer<void>(), gate = LatestMediaLoad();
      final opened = <String>[];
      final first = gate.submit(ready.future, () async {
        opened.add('first');
      }, (_) => fail('unexpected error'));
      final second = gate.submit(ready.future, () async {
        opened.add('second');
      }, (_) => fail('unexpected error'));
      ready.complete();
      await Future.wait([first, second]);
      expect(opened, ['second']);
    },
  );
  test(
    'disposing pending loads prevents connection creation and stale failures',
    () async {
      final ready = Completer<void>(), gate = LatestMediaLoad();
      var opened = false, failed = false;
      final pending = gate.submit(
        ready.future,
        () async {
          opened = true;
        },
        (_) {
          failed = true;
        },
      );
      gate.dispose();
      ready.completeError(StateError('private error'));
      await pending;
      expect(opened, isFalse);
      expect(failed, isFalse);
    },
  );
  test('explicit access denial is not automatically retried', () async {
    final engine = AuthFailureEngine();
    final controller = PlaybackController(engine, tickInterval: null);
    controller.play('https://fixture.invalid/stream.ts', live: true);
    engine.fail('HTTP error 401');
    await Future<void>.delayed(Duration.zero);
    expect(controller.failed, isTrue);
    expect(controller.retryAttempts, 0);
    controller.close();
  });
}
