# BattleStation TV Developer Build Guide

## Release Baseline

- Application: BattleStation TV
- Version: 2.5.0
- Build: 8
- Release name: Automatic Update System
- Android application ID: tv.battlestation.bstv
- Update repository: badbubba-10000/BattleStation-TV
- License: GNU GPLv3

## Development Environment

The following tool versions were used in the existing development environment.

| Tool | Version |
|---|---|
| Flutter | 3.47.7 stable |
| Dart | 3.13.5 |
| Git | 2.55.0 |
| OpenJDK | 25.0.4 |
| Java compilation target | 17 |
| Gradle wrapper | 9.3.1 |
| Android SDK | 36 |
| Android Build Tools | 36.0.0 |
| Visual Studio Build Tools | 2019, 16.11.60 |
| Windows SDK | 10.0.19041.0 |
| Inno Setup | 6.7.3 |

These are observed development tool versions, not necessarily the only compatible versions.

## Obtaining the Source

Obtain the corresponding source code for the desired release.

For BattleStation TV, use the source distribution associated with the official project release.

The active Flutter project is the directory containing pubspec.yaml, lib, android, and windows.

## Installing Dependencies

Install Flutter and the required platform development tools.

For Windows builds, install Visual Studio C++ desktop development tools and an appropriate Windows SDK.

For Android builds, install Android Studio or the corresponding Android SDK and Java development tools.

Run the following commands from the active Flutter project directory:

    flutter doctor -v
    flutter pub get

Resolve any required Android or Windows toolchain errors before building.

## Windows Development Build

A local-only development build can be attempted using:

    flutter build windows --release --dart-define=LOCAL_DATA_ONLY=true

The generated application files are normally located under:

    build/windows/x64/runner/Release/

Keep the complete application directory together. The executable depends on accompanying libraries and data files.

Do not distribute development test entry points as production builds.

## Android Development Build

For a local-only debug build, use:

    flutter build apk --debug --dart-define=LOCAL_DATA_ONLY=true

The generated APK is normally located under:

    build/app/outputs/flutter-apk/

The Android application requires API level 26 or newer.

The current project configuration targets ARM64 and x86-64 architectures.

A clean third-party build must still be verified against the supplied Gradle configuration, including its Firebase configuration requirements.

## Android Release Signing

Official release signing keys are not distributed with the source.

Developers compiling independently must configure their own signing credentials.

Never commit:

- Android signing keystores
- key.properties
- Signing passwords
- Private keys
- Service account credentials

Independently signed APKs cannot normally replace an existing official installation without uninstalling it first.

Uninstallation may remove locally stored application data.

## Firebase Configuration

Optional cloud functionality uses Firebase.

Independent deployments should configure their own Firebase project and application registration.

Review the application cloud service implementation and supplied firestore.rules file.

The Android google-services.json file is Firebase client configuration, not an administrator service account key.

Do not include Firebase administrator credentials or service account private keys.

LOCAL_DATA_ONLY controls local-only application behavior but does not necessarily remove all build-time Firebase configuration requirements.

## GitHub Update Configuration

Application-specific update repository flag:

    BSTV_GITHUB_REPO

Official repository:

    badbubba-10000/BattleStation-TV

Independent builds should configure their own compatible release repository when distributing modified versions.

The updater must not install packages intended for a different application identity.

## Windows Installer

The Windows installer implementation is located under:

    windows/installer/

Primary installer definition:

    windows/installer/IPTVMac.iss

Primary packaging script:

    windows/installer/scripts/Build-Installer.ps1

Installer edition:

    BattleStationTV

Inspect the installer README and packaging script parameters before creating a distribution installer.

Inno Setup and the complete required Windows application runtime are needed.

Review the applicable installer compiler licensing terms before distribution.

## Testing

Run the application test suite using:

    flutter test

Review failed tests individually.

Do not remove or weaken tests simply to obtain a passing result.

Test installation, updating, playback, cloud functionality, data retention, and uninstallation before distributing a production release.

## Licensing

BattleStation TV is derived from IPTVMac by Goelir and contributors.

Original project:

https://github.com/Goelir/IPTVMac

Preserve original copyrights, the GPLv3 license, modification notices, and third-party acknowledgements.

Distributing compiled versions requires satisfying the applicable corresponding source obligations.

## Verification Status

This guide documents the observed development environment.

A clean independent source build has not yet been verified.

Additional platform configuration, native library requirements, and release packaging instructions must be validated before treating the build process as fully reproducible.