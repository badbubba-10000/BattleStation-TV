import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:iptvmac/core/release_update.dart';
import 'package:iptvmac/bstv/identity.dart';

import 'apk_installer.dart';
import 'update_manager.dart';

class NativeUpdateHost extends UpdateInstallHost {
  NativeUpdateHost({UpdateIdentity? identity})
    : identity = identity ?? UpdateIdentity.current;
  final UpdateIdentity identity;
  static const _validator = r'''
param([Parameter(Mandatory=$true)][string]$Candidate,[Parameter(Mandatory=$true)][string]$Product,[Parameter(Mandatory=$true)][string]$Version)
$ErrorActionPreference='Stop'
$v=(Get-Item -LiteralPath $Candidate).VersionInfo
if($v.ProductName -ne $Product -or $v.FileVersion.Replace('+','.') -ne $Version){throw 'Wrong application or version in update installer'}
$s=Get-AuthenticodeSignature -LiteralPath $Candidate
if($s.Status -notin @('Valid','NotSigned')){throw 'Windows installer signature is invalid'}
@{product=$v.ProductName;version=$v.FileVersion;signature=$s.Status.ToString()}|ConvertTo-Json -Compress
''';
  @override
  Future<Directory> folder() async => Platform.isAndroid
      ? apkInstaller.folder()
      : Directory('${(await getApplicationSupportDirectory()).path}/Updates');
  @override
  Future<void> validate(File file, AppRelease release) async {
    if (Platform.isAndroid) {
      if (!await apkInstaller.validate(
        file.path,
        identity.packageId,
        release.version.build,
      )) {
        throw const UpdateFailure(
          'Android rejected the package identity, version or signing certificate.',
        );
      }
      return;
    }
    if (!Platform.isWindows) {
      throw const UpdateFailure(
        'In-app installation is unsupported on this platform.',
      );
    }
    final script = File('${(await folder()).path}/validate-installer.ps1');
    await script.writeAsString(_validator, flush: true);
    final result = await Process.run(
      '${Platform.environment['WINDIR'] ?? r'C:\Windows'}\\System32\\WindowsPowerShell\\v1.0\\powershell.exe',
      [
        '-NoLogo',
        '-NoProfile',
        '-NonInteractive',
        '-ExecutionPolicy',
        'Bypass',
        '-File',
        script.path,
        '-Candidate',
        file.path,
        '-Product',
        BstvIdentity.name,
        '-Version',
        '${release.version.core}.${release.version.build}',
      ],
    );
    if (result.exitCode != 0) {
      throw const UpdateFailure(
        'Windows installer identity/version/signature validation failed. No installer was launched.',
      );
    }
    try {
      final data = jsonDecode(result.stdout as String);
      if (data['product'] != BstvIdentity.name) throw const FormatException();
    } catch (_) {
      throw const UpdateFailure(
        'Unable to validate Windows installer metadata.',
      );
    }
  }

  @override
  Future<void> install(
    File file,
    AppRelease release, {
    required bool restart,
  }) async {
    if (Platform.isAndroid) {
      if (!apkInstaller.supported) {
        throw const UpdateFailure(
          'This store/device build does not support in-app installation.',
        );
      }
      if (!await apkInstaller.canInstall()) {
        await apkInstaller.openSettings();
        for (var i = 0; i < 120 && !await apkInstaller.canInstall(); i++) {
          await Future<void>.delayed(apkPermissionPoll);
        }
        if (!await apkInstaller.canInstall()) {
          throw const UpdateFailure(
            'Installation permission was not granted. Your existing app is unchanged.',
          );
        }
      }
      if (!await apkInstaller.install(file.path)) {
        throw const UpdateFailure(
          'Android package installer could not be opened.',
        );
      }
      return;
    }
    final id = identity.packageId == UpdateIdentity.bstv.packageId
        ? '{651D20D2-2686-4DA8-9F4F-51E7D1AF408A}'
        : '{1BA53108-0F29-4309-975C-93B174598CA9}';
    final result = await Process.run('reg.exe', [
      'query',
      r'HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\'
          '${id}_is1',
      '/v',
      'InstallLocation',
    ]);
    final match = RegExp(r'InstallLocation\s+REG_SZ\s+([^\r\n]+)')
        .firstMatch('${result.stdout}');
    if (result.exitCode != 0 || match == null) {
      throw const UpdateFailure(
        'This portable copy is not the registered installation. Run the downloaded setup manually to install it first.',
      );
    }
    final target = Directory(match[1]!.trim()).absolute.path
        .replaceAll('/', r'\')
        .replaceAll(RegExp(r'\+$'), '')
        .toLowerCase();
    final running = File(Platform.resolvedExecutable);
    if (running.uri.pathSegments.last != identity.executable ||
        running.parent.absolute.path
                .replaceAll('/', r'\')
                .replaceAll(RegExp(r'\+$'), '')
                .toLowerCase() !=
            target) {
      throw const UpdateFailure(
        'Registered installation does not match this running application. Update cancelled.',
      );
    }
    await Process.start(file.path, [
      '/BSTVUPDATE=1',
      '/DIR=${running.parent.path}',
      '/RESTARTAPP=${restart ? '1' : '0'}',
      '/NORESTART',
    ], mode: ProcessStartMode.detached);
    // The installer is running, not yet successful. It waits for this process to
    // release its files; successful completion is observed on the next launch.
    exit(0);
  }
}
