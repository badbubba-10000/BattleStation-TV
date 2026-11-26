// Explicit synthetic-only entry point. Does not initialize library/user stores.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:iptvmac/player/media_kit_engine.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const path = String.fromEnvironment('BSTV_FIXTURE_DIR');
  if (path.isEmpty) throw StateError('Supply a synthetic fixture folder');
  await File('$path/probe-entry.txt').writeAsString('BSTV_SYNTHETIC_ENTRY_ONLY');
  final directory = Directory(path);
  final files = directory
      .listSync()
      .whereType<File>()
      .map((f) => f.uri.pathSegments.last)
      .toSet();
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  server.listen((request) async {
    final name = request.uri.pathSegments.lastOrNull;
    if (name == null || !files.contains(name)) {
      request.response.statusCode = 404;
      await request.response.close();
      return;
    }
    final file = File('$path/$name');
    request.response.headers.contentType = ContentType.parse(
      name.endsWith('.m3u8') ? 'application/vnd.apple.mpegurl' : 'video/mp2t',
    );
    request.response.contentLength = await file.length();
    try {
      await request.response.addStream(file.openRead());
      await request.response.close();
    } catch (_) {}
  });
  runApp(
    MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: _Probe(path, server.port),
    ),
  );
}

class _Probe extends StatefulWidget {
  const _Probe(this.path, this.port);
  final String path;
  final int port;
  @override
  State<_Probe> createState() => _ProbeState();
}

class _ProbeState extends State<_Probe> {
  late final MediaKitEngine engine;
  late final List<(String, String)> fixtures;
  Timer? poll;
  int index = 0;
  bool verified = false;
  String? failure;
  final records = <Map<String, Object?>>[];
  @override
  void initState() {
    super.initState();
    fixtures = [
      ('Movie', Uri.file('${widget.path}/fixture.mp4').toString()),
      ('Series episode', Uri.file('${widget.path}/fixture.mp4').toString()),
      ('HTTP MPEG-TS', 'http://127.0.0.1:${widget.port}/fixture.ts'),
      ('HTTP HLS', 'http://127.0.0.1:${widget.port}/fixture.m3u8'),
    ];
    engine = MediaKitEngine(hwdec: 'no');
    engine.setVolume(0);
    engine.failures.listen((_) {
      if (mounted) setState(() => failure = 'Playback failed');
    });
    engine.load(fixtures.first.$2);
    poll = Timer.periodic(const Duration(milliseconds: 250), (_) async {
      if (!verified && engine.videoWidth == 320 && engine.position >= 1) {
        verified = true;
        engine.setPaused(true);
        records.add({
          'fixture': fixtures[index].$1,
          'position': engine.position,
          'width': engine.videoWidth,
          'height': engine.videoHeight,
          'renderer': 'production MediaKitEngine.buildVideo',
          'muted': true,
        });
        await File('${widget.path}/renderer-result.json')
            .writeAsString(jsonEncode(records));
      }
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    poll?.cancel();
    engine.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('BSTV Synthetic Renderer Probe — no account data'),
    ),
    body: Column(
      children: [
        Text(
          '${fixtures[index].$1} • ${engine.videoWidth}×${engine.videoHeight} • ${engine.position.toStringAsFixed(2)} s • ${verified ? 'Frame ready for visual inspection' : 'Loading'}',
        ),
        if (failure != null) Text(failure!),
        Expanded(child: engine.buildVideo(BoxFit.contain)),
        FilledButton(
          onPressed: index >= fixtures.length - 1
              ? null
              : () {
                  setState(() {
                    index++;
                    verified = false;
                    failure = null;
                    engine.load(fixtures[index].$2);
                  });
                },
          child: const Text('Next fixture'),
        ),
        const Text(
          'Synthetic color bars/test pattern only. Muted. This probe does not read playlists, passwords or settings.',
        ),
      ],
    ),
  );
}
