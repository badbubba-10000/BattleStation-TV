[CmdletBinding()]
param([string]$Flutter='C:\bstv-flutter\bin\flutter.bat',[string]$Compiler,[string]$CrtDirectory)
& (Join-Path $PSScriptRoot 'scripts\Build-Installer.ps1') -Edition 'BattleStationTV' -Flutter $Flutter -Compiler $Compiler -CrtDirectory $CrtDirectory
if(!$?){throw 'Windows installer build failed'}
