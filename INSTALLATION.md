# BattleStation TV Installation Guide

## Official Downloads

https://github.com/badbubba-10000/BattleStation-TV/releases/latest

Always obtain installation packages from the official project release page.

## Windows Installation

1. Open the latest GitHub release.
2. Download the Windows Setup.exe package.
3. Download and verify its SHA-256 checksum.
4. Run the installer.
5. Choose the desired installation options.
6. Complete the installation.
7. Launch BattleStation TV.

The Windows installer is not currently digitally signed by a trusted Windows publisher.

Windows may display a SmartScreen warning.

Verify that the file came from the official project repository and that its checksum matches before deciding whether to proceed.

A matching checksum verifies file integrity against the published value, not publisher identity.

## Android Phone or Tablet

1. Open the latest GitHub release.
2. Download the Android APK.
3. Open the downloaded APK.
4. If prompted, allow installation from the application used to open the APK.
5. Review the Android installation confirmation.
6. Complete the installation.
7. Launch BattleStation TV.

Android 8.0 or newer and a supported 64-bit operating system are required.

## Android TV and Google TV

1. Download the official Android APK.
2. Transfer the APK to your television device.
3. Open it using a compatible file manager or package installer.
4. Approve the installation when prompted.
5. Launch BattleStation TV.

Installation procedures vary between devices.

## Automatic Updates

The application includes an About and Updates interface.

When an update is available:

1. Review the release information.
2. Choose whether to download the update.
3. Follow the platform-specific installation prompts.

Android updates require compatible application identities and signing certificates.

Public end-to-end update testing remains necessary.

## Windows Uninstallation

Open Windows Settings and locate BattleStation TV under Installed Apps.

The uninstall workflow is designed to provide options for retaining or removing application data.

Review the selected data removal options before confirming.

Removing application data may permanently delete locally stored information.

## Android Uninstallation

Open the device application settings, select BattleStation TV, and choose Uninstall.

Android normally removes application-private local data during uninstallation.

Back up important settings before uninstalling.

## Verifying Package Integrity

Use Windows PowerShell and the Get-FileHash command with the SHA256 algorithm to calculate the downloaded package checksum.

Compare the result against the SHA-256 checksum supplied with the official GitHub release.

Do not install a package if its checksum does not match.