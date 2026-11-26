# Windows PowerShell 5.1. Called only by the installed uninstaller after consent.
[CmdletBinding()]
param([Parameter(Mandatory=$true)][ValidateSet('BattleStationTV','GetETV')][string]$Edition,
 [Parameter(Mandatory=$true)][string]$Categories,
 [switch]$TestMode,[string]$TestRoot)
$ErrorActionPreference='Stop'
if(!$TestMode -and (Get-Process -Name $Edition -ErrorAction SilentlyContinue)){throw 'Close this application before removing personal data'}
$allowed=@('library','settings','epg','artwork','backups')
$selected=@($Categories.Split(',') | Where-Object { $_ })
foreach($c in $selected){if($allowed -notcontains $c){throw 'Invalid cleanup category'}}
$relative=if($Edition -eq 'BattleStationTV'){'BattleStation TV\BattleStation TV'}else{'GET ETV'}
$folder=$Edition
$root=Join-Path ([Environment]::GetFolderPath('ApplicationData')) $relative
$local=Join-Path ([Environment]::GetFolderPath('LocalApplicationData')) $relative
if($TestMode){
 $test=[IO.Path]::GetFullPath($TestRoot).TrimEnd('\')
 $temp=[IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\')+'\'
 if(!$test.StartsWith($temp,[StringComparison]::OrdinalIgnoreCase) -or !(Split-Path $test -Leaf).StartsWith('iptv-installer-test-') -or !(Test-Path -LiteralPath (Join-Path $test 'SYNTHETIC-ONLY'))){throw 'Invalid synthetic fixture root'}
 $root=Join-Path $test ('Roaming\'+$relative);$local=Join-Path $test ('Local\'+$relative)
}
function Assert-Safe([string]$path){
 $full=[IO.Path]::GetFullPath($path)
 if(!($full.StartsWith($root+'\',[StringComparison]::OrdinalIgnoreCase) -or $full.StartsWith($local+'\',[StringComparison]::OrdinalIgnoreCase))){throw 'Cleanup path outside edition root'}
 $ancestor=$full
 while($ancestor){
  if(Test-Path -LiteralPath $ancestor){if((Get-Item -LiteralPath $ancestor -Force).Attributes -band [IO.FileAttributes]::ReparsePoint){throw 'Cleanup refused a directory link'}}
  $parent=Split-Path $ancestor -Parent;if($parent -eq $ancestor){break};$ancestor=$parent
 }
 if(Test-Path -LiteralPath $full -PathType Container){foreach($entry in Get-ChildItem -LiteralPath $full -Force){Assert-Safe $entry.FullName}}
}
$targets=New-Object 'System.Collections.Generic.List[string]'
function Target([string]$path){Assert-Safe $path;$targets.Add($path)}
$support=Join-Path $root $folder
if($selected -contains 'library'){
 foreach($name in @('iptv.sqlite','iptv.sqlite-wal','iptv.sqlite-shm','bstv-features.sqlite','bstv-features.sqlite-wal','bstv-features.sqlite-shm','downloads.json')){Target (Join-Path $support $name)}
 foreach($name in @('flutter_secure_storage.dat','backgroundDownloaderDatabase','backgroundDownloaderResumeData','backgroundDownloaderTaskRecords')){Target (Join-Path $root $name)}
}
if($selected -contains 'settings'){Target (Join-Path $root 'shared_preferences.json')}
if($selected -contains 'artwork'){Target (Join-Path $root 'Updates');Target (Join-Path $root 'libCachedImageData.json');Target (Join-Path $root 'cacert.pem')}
if($selected -contains 'backups' -and (Test-Path -LiteralPath $support)){
 foreach($file in Get-ChildItem -LiteralPath $support -File -Force){if($file.Name -match '^iptv\.sqlite\.corrupt-[0-9]+$'){Target $file.FullName}}
}
# Preflight every target and DB before any mutation. Never remove media, exported
# files, arbitrary directories, other user profiles or generic shared temp caches.
$db=Join-Path $support 'bstv-features.sqlite'
if($selected -contains 'epg' -and $selected -notcontains 'library' -and (Test-Path -LiteralPath $db)){
 Assert-Safe $db; Assert-Safe ($db+'-wal'); Assert-Safe ($db+'-shm')
 $native=Join-Path (Split-Path $PSScriptRoot -Parent) 'sqlite3.dll'
 if($TestMode){$native=Join-Path $TestRoot 'sqlite3.dll'}
 if(!(Test-Path -LiteralPath $native)){throw 'Bundled SQLite is missing; data preserved'}
 $escaped=$native.Replace('"','""')
 Add-Type -TypeDefinition @"
using System; using System.Runtime.InteropServices;
public static class CleanupSql {
 [DllImport(@"$escaped",CallingConvention=CallingConvention.Cdecl)] public static extern int sqlite3_open_v2(byte[] p,out IntPtr db,int flags,IntPtr vfs);
 [DllImport(@"$escaped",CallingConvention=CallingConvention.Cdecl)] public static extern int sqlite3_exec(IntPtr db,byte[] sql,IntPtr cb,IntPtr arg,IntPtr err);
 [DllImport(@"$escaped",CallingConvention=CallingConvention.Cdecl)] public static extern int sqlite3_close(IntPtr db);
}
"@
 $handle=[IntPtr]::Zero;$utf8=[Text.Encoding]::UTF8
 $rc=[CleanupSql]::sqlite3_open_v2($utf8.GetBytes($db+[char]0),[ref]$handle,2,[IntPtr]::Zero)
 if($rc -ne 0){if($handle -ne [IntPtr]::Zero){[void][CleanupSql]::sqlite3_close($handle)};throw 'EPG database is locked or unavailable; cleanup stopped'}
 try{
  $sql="PRAGMA busy_timeout=3000; BEGIN IMMEDIATE; DELETE FROM programmes; DELETE FROM settings WHERE key LIKE 'fetched.%' OR key LIKE 'retry.%' OR key LIKE 'sourceStats.%'; COMMIT;"
  if([CleanupSql]::sqlite3_exec($handle,$utf8.GetBytes($sql+[char]0),[IntPtr]::Zero,[IntPtr]::Zero,[IntPtr]::Zero) -ne 0){throw 'EPG cleanup failed; transaction rolled back'}
 }finally{[void][CleanupSql]::sqlite3_close($handle)}
}
foreach($target in $targets){if(Test-Path -LiteralPath $target){Assert-Safe $target;Remove-Item -LiteralPath $target -Recurse -Force -ErrorAction Stop}}
if(!$TestMode){
 if($selected -contains 'settings'){$key=if($Edition -eq 'BattleStationTV'){'HKCU:\Software\BattleStationTV\Window'}else{'HKCU:\Software\GetETV\Window'};if(Test-Path -LiteralPath $key){Remove-Item -LiteralPath $key -Recurse -Force}}
 if($selected -contains 'library'){
  Add-Type -TypeDefinition 'using System;using System.Runtime.InteropServices;public static class CleanupCredential{[DllImport("advapi32.dll",CharSet=CharSet.Unicode,SetLastError=true)]public static extern bool CredDelete(string target,int type,int flags);}'
  # Exact compiled plugin prefix: never enumerate/delete another application's credentials.
  $target='key_'+$Edition+'_VGhpcyBpcyB0aGUgcHJlZml4IGZv_'
  if(![CleanupCredential]::CredDelete($target,1,0) -and [Runtime.InteropServices.Marshal]::GetLastWin32Error() -ne 1168){throw 'Local credential key could not be removed'}
 }
}
Write-Output ('Cleanup completed for '+$Edition+': '+($selected -join ',')+'. External media and cloud records were preserved.')
