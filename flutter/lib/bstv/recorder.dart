// BattleStation TV, 2026. GPLv3; see BSTV-NOTICE.md.
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class RecordingFailure implements Exception {
  const RecordingFailure(this.message);
  final String message;
  @override
  String toString() => message;
}

/// Copies unencrypted MPEG-TS or TS-segment HLS without transcoding. URLs stay
/// in memory. A private HTTP client makes cancellation close pending I/O.
class StreamRecorder {
  StreamRecorder({
    http.Client? client,
    required this.checkSpace,
    this.minimumFreeBytes = 512 * 1024 * 1024,
  }) : client = client ?? http.Client();
  final http.Client client;
  final Future<int> Function(String directory) checkSpace;
  final int minimumFreeBytes;
  bool cancelled = false;
  bool finishedPlaylist = false;
  int bytes = 0;
  DateTime _lastSpaceCheck = DateTime.fromMillisecondsSinceEpoch(0);
  void stop() {
    cancelled = true;
    client.close();
  }

  Future<void> _space(String directory) async {
    if (DateTime.now().difference(_lastSpaceCheck) <
        const Duration(seconds: 10)) {
      return;
    }
    if (await checkSpace(directory) < minimumFreeBytes) {
      throw const RecordingFailure(
        'Recording stopped: minimum free space reached',
      );
    }
    _lastSpaceCheck = DateTime.now();
  }

  Future<http.StreamedResponse> _get(Uri uri) async {
    if (!['http', 'https'].contains(uri.scheme)) {
      throw const RecordingFailure('Recording requires an HTTP(S) stream');
    }
    final request = http.Request('GET', uri)
      ..headers['User-Agent'] = 'BattleStationTV';
    final response = await client
        .send(request)
        .timeout(const Duration(seconds: 20));
    if (response.statusCode != 200) {
      throw RecordingFailure('Stream returned HTTP ${response.statusCode}');
    }
    return response;
  }

  Future<String> _text(http.StreamedResponse response) async {
    final data = <int>[];
    await for (final chunk in response.stream.timeout(
      const Duration(seconds: 20),
    )) {
      data.addAll(chunk);
      if (data.length > 2 * 1024 * 1024) {
        throw const RecordingFailure('HLS manifest exceeds size limit');
      }
    }
    return utf8.decode(data);
  }

  Future<void> record(
    Uri uri,
    File output,
    DateTime until, {
    void Function(int bytes)? onProgress,
  }) async {
    IOSink? sink;
    try {
      await _space(output.parent.path);
      if (await output.exists()) {
        throw const RecordingFailure('Recording file already exists');
      }
      // Exclusive create prevents an existing recording being truncated.
      await output.create(exclusive: true);
      sink = output.openWrite(mode: FileMode.append);
      final timer = Timer(
        until.difference(DateTime.now()).isNegative
            ? Duration.zero
            : until.difference(DateTime.now()),
        stop,
      );
      try {
        final response = await _get(uri);
        final contentType =
            response.headers['content-type']?.toLowerCase() ?? '';
        if (uri.path.toLowerCase().endsWith('.m3u8') ||
            contentType.contains('mpegurl')) {
          await _hls(
            uri,
            await _text(response),
            sink,
            until,
            output.parent.path,
            onProgress,
          );
        } else {
          await _transport(
            response.stream,
            sink,
            output.parent.path,
            onProgress,
          );
          if (!cancelled && DateTime.now().isBefore(until)) {
            throw const RecordingFailure(
              'Stream ended before the scheduled finish',
            );
          }
        }
      } finally {
        timer.cancel();
      }
      if (bytes == 0 && !cancelled) {
        throw const RecordingFailure(
          'Stream contained no transport-stream data',
        );
      }
    } on RecordingFailure {
      rethrow;
    } catch (_) {
      if (!cancelled) {
        throw const RecordingFailure(
          'Recording interrupted by a network or storage error',
        );
      }
    } finally {
      await sink?.flush();
      await sink?.close();
      client.close();
    }
  }

  Future<void> _transport(
    Stream<List<int>> input,
    IOSink sink,
    String directory,
    void Function(int)? onProgress,
  ) async {
    // Validate several TS packet boundaries before writing any provider bytes.
    final prefix = <int>[];
    var valid = false;
    await for (final chunk in input.timeout(const Duration(seconds: 30))) {
      if (cancelled) break;
      await _space(directory);
      if (!valid) {
        prefix.addAll(chunk);
        if (prefix.length < 188 * 3) continue;
        if (prefix[0] != 0x47 || prefix[188] != 0x47 || prefix[376] != 0x47) {
          throw const RecordingFailure(
            'Unsupported stream: expected MPEG-TS. MP4, encrypted HLS and DRM are not recorded.',
          );
        }
        valid = true;
        sink.add(List<int>.of(prefix));
        bytes += prefix.length;
        prefix.clear();
      } else {
        sink.add(chunk);
        bytes += chunk.length;
      }
      // Flush applies backpressure and reports filesystem failures promptly.
      await sink.flush();
      onProgress?.call(bytes);
    }
    if (!valid && !cancelled) {
      throw const RecordingFailure(
        'Stream is empty or too short to validate MPEG-TS',
      );
    }
  }

  Future<void> _hls(
    Uri uri,
    String manifest,
    IOSink sink,
    DateTime until,
    String directory,
    void Function(int)? onProgress,
  ) async {
    var variants = 0;
    final seen = <String>{};
    while (!cancelled && DateTime.now().isBefore(until)) {
      if (!manifest.trimLeft().startsWith('#EXTM3U')) {
        throw const RecordingFailure('Invalid HLS manifest');
      }
      final lines = manifest
          .split(RegExp(r'\r?\n'))
          .map((l) => l.trim())
          .where((l) => l.isNotEmpty)
          .toList();
      if (lines.any((l) => l.startsWith('#EXT-X-STREAM-INF:'))) {
        if (++variants > 3) {
          throw const RecordingFailure('Invalid nested HLS variant playlist');
        }
        final index = lines.indexWhere(
          (l) => l.startsWith('#EXT-X-STREAM-INF:'),
        );
        if (index + 1 >= lines.length || lines[index + 1].startsWith('#')) {
          throw const RecordingFailure('Missing HLS variant');
        }
        uri = uri.resolve(lines[index + 1]);
        manifest = await _text(await _get(uri));
        continue;
      }
      if (lines.any(
        (l) =>
            l.startsWith('#EXT-X-KEY:') &&
            !RegExp(r'METHOD=NONE(?:,|$)').hasMatch(l),
      )) {
        throw const RecordingFailure('Encrypted HLS recording is unsupported');
      }
      if (lines.any(
        (l) => l.startsWith('#EXT-X-MAP:') || l.startsWith('#EXT-X-BYTERANGE:'),
      )) {
        throw const RecordingFailure(
          'Fragmented MP4 and byte-range HLS recording are unsupported',
        );
      }
      final seqLine = lines
          .where((l) => l.startsWith('#EXT-X-MEDIA-SEQUENCE:'))
          .firstOrNull;
      var sequence = seqLine == null
          ? 0
          : int.tryParse(seqLine.split(':').last) ?? 0;
      for (final line in lines.where((l) => !l.startsWith('#'))) {
        if (cancelled || DateTime.now().isAfter(until)) break;
        final segment = uri.resolve(line);
        final key = seqLine == null ? segment.toString() : '$sequence';
        sequence++;
        if (seen.contains(key)) continue;
        final response = await _get(segment);
        await _transport(response.stream, sink, directory, onProgress);
        seen.add(key);
        if (seen.length > 20000) {
          throw const RecordingFailure('HLS segment limit reached');
        }
      }
      if (lines.contains('#EXT-X-ENDLIST')) {
        finishedPlaylist = true;
        return;
      }
      final targetLine = lines
          .where((l) => l.startsWith('#EXT-X-TARGETDURATION:'))
          .firstOrNull;
      final seconds = (int.tryParse(targetLine?.split(':').last ?? '') ?? 6)
          .clamp(1, 30);
      // Short cancel-aware delays avoid keeping a stopped recorder asleep.
      for (var i = 0; i < seconds * 2 && !cancelled; i++) {
        await Future<void>.delayed(const Duration(milliseconds: 500));
      }
      if (!cancelled) manifest = await _text(await _get(uri));
    }
  }
}
