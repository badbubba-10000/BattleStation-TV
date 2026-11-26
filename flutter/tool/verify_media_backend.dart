// Synthetic, local-only backend check. No playlists, secrets or user data.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:media_kit/media_kit.dart';
import 'package:iptvmac/bstv/recorder.dart';

Future<void> main(List<String> args) async {
  if (args.length != 2) {
    throw ArgumentError(
      'Usage: verify_media_backend.dart <libmpv DLL> <synthetic fixture directory>',
    );
  }
  MediaKit.ensureInitialized(libmpv: args[0]);
  final folder = Directory(args[1]).absolute;
  final allowed = folder
      .listSync()
      .whereType<File>()
      .map((f) => f.uri.pathSegments.last)
      .toSet();
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  final subscription = server.listen((request) async {
    final name = request.uri.pathSegments.lastOrNull;
    if (name == null || !allowed.contains(name)) {
      request.response.statusCode = 404;
      await request.response.close();
      return;
    }
    final file = File('${folder.path}/$name');
    request.response.headers.contentType = ContentType.parse(
      name.endsWith('.m3u8')
          ? 'application/vnd.apple.mpegurl'
          : name.endsWith('.ts')
          ? 'video/mp2t'
          : 'video/mp4',
    );
    request.response.contentLength = await file.length();
    try {
      await request.response.addStream(file.openRead());
      await request.response.close();
    } catch (_) {
      /* Player closed the fixture. */
    }
  });
  final captures = await Directory.systemTemp.createTemp(
    'bstv-synthetic-capture-',
  );
  final capture = File('${captures.path}/capture.ts');
  try {
    final recorder = StreamRecorder(
      checkSpace: (_) async => 1024 * 1024 * 1024,
    );
    await recorder.record(
      Uri.parse('http://127.0.0.1:${server.port}/fixture.m3u8'),
      capture,
      DateTime.now().add(const Duration(seconds: 30)),
    );
    if (recorder.bytes == 0) throw StateError('Synthetic DVR capture is empty');
    stdout.writeln(
      jsonEncode({
        'fixture': 'HLS DVR capture',
        'bytes': recorder.bytes,
        'passed': true,
      }),
    );
    for (final (label, uri) in [
      ('movie', Uri.file('${folder.path}/fixture.mp4')),
      ('series episode', Uri.file('${folder.path}/fixture.mp4')),
      ('HTTP MPEG-TS', Uri.parse('http://127.0.0.1:${server.port}/fixture.ts')),
      ('HTTP HLS', Uri.parse('http://127.0.0.1:${server.port}/fixture.m3u8')),
      ('DVR captured HLS', capture.uri),
    ]) {
      final player = Player();
      final native = player.platform as NativePlayer;
      final errors = <String>[];
      final errorSubscription = player.stream.error.listen(errors.add);
      try {
        await native.setProperty('vo', 'null');
        await native.setProperty('ao', 'null');
        await native.setProperty('hwdec', 'no');
        await native.setProperty('vid', 'auto');
        await player.open(Media(uri.toString()));
        final deadline = DateTime.now().add(const Duration(seconds: 20));
        while (DateTime.now().isBefore(deadline) &&
            (player.state.position.inMilliseconds < 700 ||
                (player.state.width ?? 0) == 0)) {
          await Future<void>.delayed(const Duration(milliseconds: 100));
        }
        if (player.state.position.inMilliseconds < 700 ||
            (player.state.width ?? 0) == 0) {
          stdout.writeln(
            jsonEncode({
              'fixture': label,
              'position': player.state.position.inMilliseconds,
              'width': player.state.width,
              'videoParams': await native.getProperty('video-params'),
              'errors': errors,
            }),
          );
          throw StateError('$label did not decode video');
        }
        stdout.writeln(
          jsonEncode({
            'fixture': label,
            'passed': true,
            'positionMs': player.state.position.inMilliseconds,
            'width': player.state.width,
            'height': player.state.height,
            'audioTracks': player.state.tracks.audio.length,
            'videoCodec': await native.getProperty('video-codec'),
            'output': 'null; decode test, no visual renderer assertion',
          }),
        );
      } finally {
        await errorSubscription.cancel();
        await player.dispose();
      }
    }
  } finally {
    await subscription.cancel();
    await server.close(force: true);
    await captures.delete(recursive: true);
  }
}
