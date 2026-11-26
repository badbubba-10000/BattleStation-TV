# BattleStation TV development fork

Derived from Goelir/IPTVMac at `cfdfa8601b39b291d8b44f545d68b5e798405263`.
Upstream: https://github.com/Goelir/IPTVMac

Original copyrights and the upstream GPLv3 LICENSE remain in force. BattleStation TV modifications (2026) include Flutter branding/design tokens, the responsive dashboard shell and registry foundation, a separate application identity/storage namespace, and accompanying tests. Those changes are distributed under GPLv3. See the Git diff from tag `bstv/upstream-baseline-cfdfa860` for individual modified files. Unmodified Swift applications retain their original identity.

The Dart package/import name remains `iptvmac` to preserve upstream compatibility. The Android application ID is `tv.battlestation.bstv`; the Windows executable is `BattleStationTV.exe`, with its own installer GUID. Production startup does not enable the upstream updater. The About screen labels the upstream source/attribution. There is no published BSTV repository or release endpoint yet.

Existing artwork/icons and third-party notices have not been relicensed. This is a development foundation, not a release-ready distribution. Native library licensing, downloader task secrets, device playback, and release signing still require verification. No provider content or real credentials are included.

The core feature batch adds local guide/XMLTV storage and mapping, a timeline, MPEG-TS/HLS-TS recording and a persistent in-app scheduler. `bstv-features.sqlite` is additive; the upstream library schema is unchanged. XMLTV URLs use `bstv.guide.*` secure-storage keys. Recording queues resolve stream URLs in memory from hashed channel keys. Scheduling requires the app running and the device awake; background wake-up, Android recording services, DRM/encrypted HLS and MP4 recording are not supported. No automatic recording deletion runs.

Development verification entry points use synthetic fixtures only: `tool/verify_media_backend.dart` checks decoding and captured HLS bytes; `tool/verify_windows_renderer.dart` builds a separate visual test entry point and must never be packaged as the normal app. Rebuild the default `lib/main.dart` target after using it. The normal app's explicit `--bstv-smoke-test` flag uses temporary databases, memory secrets and preferences, disables automatic refresh/download initialization, and writes a fixed first-frame/storage-probe marker. None of these modes verifies private-provider access or Android device playback.
