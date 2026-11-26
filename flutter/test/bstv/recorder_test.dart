import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:iptvmac/bstv/recorder.dart';

void main() {
  late Directory directory;
  final ts = List<int>.generate(188 * 8, (i) => i % 188 == 0 ? 0x47 : 0);
  setUp(() async {
    directory = await Directory.systemTemp.createTemp('bstv-recorder-test-');
  });
  tearDown(() async {
    await directory.delete(recursive: true);
  });
  StreamRecorder recorder(MockClient client, {int free = 1000000000}) =>
      StreamRecorder(client: client, checkSpace: (_) async => free);
  test('copies HLS TS segments once and never records the manifest', () async {
    final requests = <String>[];
    final engine = recorder(
      MockClient((request) async {
        requests.add(request.url.path);
        return request.url.path.endsWith('.m3u8')
            ? http.Response(
                '#EXTM3U\n#EXT-X-TARGETDURATION:1\n#EXT-X-MEDIA-SEQUENCE:10\n#EXTINF:1,\na.ts\n#EXTINF:1,\nb.ts\n#EXT-X-ENDLIST\n',
                200,
              )
            : http.Response.bytes(ts, 200);
      }),
    );
    final output = File('${directory.path}/test.ts');
    await engine.record(
      Uri.parse('https://fixture.invalid/live.m3u8'),
      output,
      DateTime.now().add(const Duration(seconds: 10)),
    );
    expect(await output.readAsBytes(), [...ts, ...ts]);
    expect(engine.bytes, ts.length * 2);
    expect(requests, ['/live.m3u8', '/a.ts', '/b.ts']);
  });
  test('rejects encrypted HLS, fMP4, nonmedia and low storage', () async {
    for (final manifest in [
      '#EXTM3U\n#EXT-X-KEY:METHOD=AES-128,URI="key"\na.ts',
      '#EXTM3U\n#EXT-X-MAP:URI="init.mp4"\na.m4s',
    ]) {
      final engine = recorder(
        MockClient((_) async => http.Response(manifest, 200)),
      );
      await expectLater(
        engine.record(
          Uri.parse('https://fixture.invalid/live.m3u8'),
          File('${directory.path}/${manifest.length}.ts'),
          DateTime.now().add(const Duration(seconds: 5)),
        ),
        throwsA(isA<RecordingFailure>()),
      );
    }
    final invalid = recorder(
      MockClient((_) async => http.Response.bytes(List.filled(1000, 0), 200)),
    );
    await expectLater(
      invalid.record(
        Uri.parse('https://fixture.invalid/live.ts'),
        File('${directory.path}/invalid.ts'),
        DateTime.now().add(const Duration(seconds: 5)),
      ),
      throwsA(isA<RecordingFailure>()),
    );
    final full = recorder(
      MockClient((_) async => http.Response.bytes(ts, 200)),
      free: 10,
    );
    await expectLater(
      full.record(
        Uri.parse('https://fixture.invalid/live.ts'),
        File('${directory.path}/full.ts'),
        DateTime.now().add(const Duration(seconds: 5)),
      ),
      throwsA(isA<RecordingFailure>()),
    );
    expect(await File('${directory.path}/full.ts').exists(), isFalse);
  });
  test(
    'never overwrites a file and detects premature direct stream termination',
    () async {
      final output = File('${directory.path}/existing.ts');
      await output.writeAsString('keep');
      final engine = recorder(
        MockClient((_) async => http.Response.bytes(ts, 200)),
      );
      await expectLater(
        engine.record(
          Uri.parse('https://fixture.invalid/live.ts'),
          output,
          DateTime.now().add(const Duration(seconds: 5)),
        ),
        throwsA(isA<RecordingFailure>()),
      );
      expect(await output.readAsString(), 'keep');
      final finite = recorder(
        MockClient((_) async => http.Response.bytes(ts, 200)),
      );
      final partial = File('${directory.path}/partial.ts');
      await expectLater(
        finite.record(
          Uri.parse('https://fixture.invalid/live.ts'),
          partial,
          DateTime.now().add(const Duration(seconds: 5)),
        ),
        throwsA(isA<RecordingFailure>()),
      );
      expect(await partial.readAsBytes(), ts);
      expect(utf8.decode(await output.readAsBytes()), 'keep');
    },
  );
}
