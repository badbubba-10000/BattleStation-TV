# Read-only by default. Never evaluates an arbitrary registry command string.
[CmdletBinding()]
param([Parameter(Mandatory=$true)][ValidateSet('BattleStationTV','GetETV')][string]$Edition,[switch]$Launch)
$ErrorActionPreference='Stop'
$id=if($Edition -eq 'BattleStationTV'){'{651D20D2-2686-4DA8-9F4F-51E7D1AF408A}_is1'}else{'{1BA53108-0F29-4309-975C-93B174598CA9}_is1'}
$name=if($Edition -eq 'BattleStationTV'){'BattleStation TV'}else{'GET ETV'}
$found=@()
foreach($hive in @('HKCU','HKLM')){foreach($branch in @('Software\Microsoft\Windows\CurrentVersion\Uninstall','Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall')){
 $key=$hive+':\'+$branch+'\'+$id
 if(!(Test-Path -LiteralPath $key)){continue};$entry=Get-ItemProperty -LiteralPath $key
 if($entry.DisplayName -notin @($name,($name+' version '+$entry.DisplayVersion))){throw 'Registered application identity mismatch'}
 $command=$entry.UninstallString
 if($command -notmatch '^"([^"]+\.exe)"\s*$'){throw 'Unexpected uninstall command; refusing arbitrary arguments'}
 $exe=[IO.Path]::GetFullPath($matches[1]);$root=[IO.Path]::GetFullPath($entry.InstallLocation).TrimEnd('\')
 if(!$exe.StartsWith($root+'\',[StringComparison]::OrdinalIgnoreCase) -or [IO.Path]::GetFileName($exe) -notmatch '^unins\d+\.exe$'){throw 'Uninstaller path is outside the registered application'}
 if(!(Test-Path -LiteralPath (Join-Path $root ($Edition+'.exe'))) -or !(Test-Path -LiteralPath $exe)){throw 'Registered installation is incomplete'}
 $walk=Split-Path $exe -Parent;while($walk){if((Get-Item -LiteralPath $walk -Force).Attributes -band [IO.FileAttributes]::ReparsePoint){throw 'Refusing a linked installation path'};$parent=Split-Path $walk -Parent;if($parent -eq $walk){break};$walk=$parent}
 $found+=[PSCustomObject]@{Edition=$name;Registry=$key;Path=$exe;SHA256=(Get-FileHash -LiteralPath $exe -Algorithm SHA256).Hash;Signed=(Get-AuthenticodeSignature -LiteralPath $exe).Status}
}}
if(!$found.Count){Write-Output 'No registered installation found.';return}
$found
if($Launch){if($found.Count -ne 1){throw 'Multiple registrations found; choose the application in Windows Settings'};Start-Process -FilePath $found[0].Path}
