param([switch]$Launch)
& (Join-Path $PSScriptRoot 'scripts\Find-RegisteredUninstaller.ps1') -Edition 'BattleStationTV' -Launch:$Launch
