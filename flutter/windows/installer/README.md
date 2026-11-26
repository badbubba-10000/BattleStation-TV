# Windows installation system

Version is read from pubspec.yaml, currently 2.2.1+5. No version or changelog is incremented by these scripts. Build-WindowsInstaller.ps1 resolves dependencies, analyzes Flutter, compiles Windows with LOCAL_DATA_ONLY=true, stages the entire required release, copies licensed x64 CRT files from Visual Studio REDIST, audits PE imports, packages licenses and current app source, compiles Inno, checks its exit code/output and prints SHA-256. It never uploads or publishes. PowerShell 5.1 is supported. Missing tools cause explicit failure.

```powershell
& '.\Build-WindowsInstaller.ps1'
& '.\Locate-Uninstaller.ps1' # Read-only validation
& '.\Locate-Uninstaller.ps1' -Launch # Explicitly open validated registered UI
```

If Inno Setup is absent:

```powershell
winget install --id JRSoftware.InnoSetup --exact --version 6.7.3 --source winget --scope user --silent --accept-source-agreements --accept-package-agreements
```

Shared implementation lives under scripts; each edition has an independent wrapper and historic AppId. The old IPTVMac.iss filename is retained for existing automation. Required compiler definitions are provided by the build script; do not call ISCC with an unvalidated raw Flutter release directory.

Express installs mandatory components and recommended shortcuts. Custom exposes directory, Desktop/Start menu shortcuts and optional Windows sign-in startup. Installation scope is current user only. Inno's native modern wizard handles accessibility/scaling and system styling; custom executable icon, logo panels and welcome/completion text use existing project branding. This is not a fully custom dark-mode installer engine.

Upgrades reuse the registered directory and task choices. A four-part version including build number blocks downgrades, same-version setup offers repair, the file manifest retires obsolete installer-owned files after successful copying, and known stale legacy shortcuts/debug zlib are removed. App data lives outside the application directory. Inno supplies standard file-replacement rollback; no atomic rollback across every possible OS/power/storage failure is promised. No services, firewall rules, scheduled tasks or updater daemons are created.

The installed uninstaller is under uninstall/unins000.exe and is registered with Windows and the Start menu. Selective defaults preserve library/credentials/settings/backups; Complete selects all supported categories. Both require summary confirmation. Silent personal-data removal is refused. Personal cleanup refuses running edition processes and directory links; SQLite EPG deletion is transactional. Credentials are removed only from this edition's encrypted storage and its exact compiled Credential Manager key. Cloud-hosted records are never deleted.

Categories are grouped according to physical storage. Library includes IPTV accounts/credentials, local cloud tokens, playlist data, favorites/history, feature source/mapping/DVR stores and transfer queue metadata. Settings includes all shared preferences: profiles, appearance, navigation and playback/general choices. Cached programmes are independently removable by SQL without deleting mappings, DVR jobs or source configuration. Caches additionally cover the disposable artwork index/TLS certificate. Recovered iptv.sqlite.corrupt-* backups have a separate choice. Externally exported backups, downloaded media/recordings, shared generic temp image files, unknown files and other users' data are preserved, including in Complete mode. Consequently “Complete” means all supported app-owned local categories, not an unsafe purge of every directory. Unknown/legacy credential entries are not guessed or broadly erased.

The default policy in lib/bstv/local_data_policy.dart disables all Firebase account/sync network actions and leaves data on each recipient's device on both Windows and Android. Explicit developer LOCAL_DATA_ONLY=false builds retain the cloud code. IPTV/artwork requests still reach providers; this is not network anonymity. There is no developer-PC hosting endpoint. Native SQLite metadata is rewritten to a bundled basename; the stage is tested outside development paths with a reduced PATH.

Tests: tests/Test-Cleanup.ps1 creates synthetic files/databases under a uniquely marked temp root and tests preservation, category isolation and junction refusal. tests/Test-RelocatedPayload.ps1 initializes bundled libmpv without a stream and runs the application's memory-only smoke mode. Neither test deletes real user data. No registered install was removed during development. Clean Windows offline installation, upgrade/repair/downgrade, Express/Custom UI, real live streams and full installed uninstaller interaction still need clean-VM validation. This machine's available tools/VM inventory did not provide such a VM.

Public redistribution requires GPL/LGPL corresponding-source and exact bundled third-party license/build-input verification. Current application source and per-package license notices are included; full third-party corresponding-source sufficiency remains a distribution gate. Installers are unsigned; publisher signing requires a certificate. No GitHub release/push/upload is performed.
