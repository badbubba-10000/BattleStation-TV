[CmdletBinding()]
param([switch]$Launch)
& (Join-Path $PSScriptRoot 'Find-RegisteredUninstaller.ps1') -Edition 'BattleStationTV' -Launch:$Launch
