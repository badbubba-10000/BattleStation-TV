# Destructive tests operate ONLY on a uniquely named synthetic temp fixture.
$ErrorActionPreference='Stop'
$installer=Split-Path $PSScriptRoot -Parent
$project=Split-Path (Split-Path $installer -Parent) -Parent
$root=Join-Path ([IO.Path]::GetTempPath()) ('iptv-installer-test-'+[guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $root|Out-Null
Set-Content -LiteralPath (Join-Path $root 'SYNTHETIC-ONLY') -Value 'Synthetic fixture; no user data'
$native=Join-Path $root 'sqlite3.dll';Copy-Item -LiteralPath (Join-Path $project 'build\windows\x64\runner\Release\sqlite3.dll') -Destination $native
Add-Type -TypeDefinition @"
using System;using System.Runtime.InteropServices;using System.Text;
public static class FixtureSql {
 [DllImport(@"$native",CallingConvention=CallingConvention.Cdecl)] static extern int sqlite3_open_v2(byte[] p,out IntPtr db,int f,IntPtr v);
 [DllImport(@"$native",CallingConvention=CallingConvention.Cdecl)] static extern int sqlite3_exec(IntPtr db,byte[] sql,IntPtr cb,IntPtr a,IntPtr e);
 [DllImport(@"$native",CallingConvention=CallingConvention.Cdecl)] static extern int sqlite3_close(IntPtr db);
 public static void Exec(string path,string sql){IntPtr db; if(sqlite3_open_v2(Encoding.UTF8.GetBytes(path+"\0"),out db,6,IntPtr.Zero)!=0)throw new Exception("fixture open");try{if(sqlite3_exec(db,Encoding.UTF8.GetBytes(sql+"\0"),IntPtr.Zero,IntPtr.Zero,IntPtr.Zero)!=0)throw new Exception("fixture SQL");}finally{sqlite3_close(db);}}
}
"@
$ps=Join-Path $env:windir 'System32\WindowsPowerShell\v1.0\powershell.exe'
$cleanup=Join-Path $installer 'scripts\Remove-AppData.ps1'
function Check([bool]$pass,[string]$message){if(!$pass){throw $message};Write-Output ('PASS '+$message)}
foreach($edition in @('BattleStationTV','GetETV')){
 $relative=if($edition -eq 'BattleStationTV'){'BattleStation TV\BattleStation TV'}else{'GET ETV'}
 $base=Join-Path $root ('Roaming\'+$relative);$support=Join-Path $base $edition
 New-Item -ItemType Directory -Path $support -Force|Out-Null
 foreach($name in @('iptv.sqlite','downloads.json')){Set-Content -LiteralPath (Join-Path $support $name) 'synthetic-account-sentinel'}
 foreach($name in @('shared_preferences.json','flutter_secure_storage.dat','libCachedImageData.json')){Set-Content -LiteralPath (Join-Path $base $name) 'synthetic-data'}
 New-Item -ItemType Directory -Path (Join-Path $support 'Recordings')|Out-Null;Set-Content -LiteralPath (Join-Path $support 'Recordings\keep.ts') 'synthetic-media'
 [FixtureSql]::Exec((Join-Path $support 'bstv-features.sqlite'),"CREATE TABLE programmes(id TEXT);INSERT INTO programmes VALUES('test');CREATE TABLE settings(key TEXT,value TEXT);INSERT INTO settings VALUES('fetched.fixture','1');CREATE TABLE mappings(id TEXT);INSERT INTO mappings VALUES('keep');")
 & $ps -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File $cleanup -Edition $edition -Categories 'epg,artwork' -TestMode -TestRoot $root
 Check ($LASTEXITCODE -eq 0) "$edition recommended cleanup succeeds"
 Check (Test-Path -LiteralPath (Join-Path $support 'iptv.sqlite')) "$edition preserves library"
 Check (Test-Path -LiteralPath (Join-Path $base 'flutter_secure_storage.dat')) "$edition preserves encrypted credentials"
 Check (Test-Path -LiteralPath (Join-Path $base 'shared_preferences.json')) "$edition preserves settings"
 Check (!(Test-Path -LiteralPath (Join-Path $base 'libCachedImageData.json'))) "$edition removes checked artwork index"
 # Assertions execute SQL only when the retained row sets are correct.
 [FixtureSql]::Exec((Join-Path $support 'bstv-features.sqlite'),"CREATE TABLE assert_zero(v INTEGER CHECK(v=0));INSERT INTO assert_zero SELECT count(*) FROM programmes;CREATE TABLE assert_one(v INTEGER CHECK(v=1));INSERT INTO assert_one SELECT count(*) FROM mappings;")
 Write-Output "PASS $edition EPG removed while mappings preserved"
}
# Reject paths outside the bounded synthetic root before deleting anything.
$ErrorActionPreference='Continue'
& $ps -NoProfile -NonInteractive -ExecutionPolicy Bypass -File $cleanup -Edition GetETV -Categories library -TestMode -TestRoot (Split-Path $root -Parent) 2>$null
$invalidCode=$LASTEXITCODE
$ErrorActionPreference='Stop'
Check ($invalidCode -ne 0) 'reject invalid synthetic root'
$link=Join-Path $root 'Roaming\BattleStation TV\BattleStation TV\backgroundDownloaderDatabase'
$target=Join-Path $root 'Roaming\GET ETV\GetETV'
New-Item -ItemType Junction -Path $link -Target $target|Out-Null
$ErrorActionPreference='Continue'
& $ps -NoProfile -NonInteractive -ExecutionPolicy Bypass -File $cleanup -Edition BattleStationTV -Categories library -TestMode -TestRoot $root 2>$null
$linkCode=$LASTEXITCODE
$ErrorActionPreference='Stop'
Check ($linkCode -ne 0) 'reject junction into other edition before deletion'
Check (Test-Path -LiteralPath (Join-Path $root 'Roaming\BattleStation TV\BattleStation TV\BattleStationTV\iptv.sqlite')) 'junction rejection preserves selected library'
if(![IO.Path]::GetFullPath($link).StartsWith([IO.Path]::GetFullPath($root)+'\',[StringComparison]::OrdinalIgnoreCase)){throw 'Fixture link outside root'}
[IO.Directory]::Delete($link)

$other=Join-Path $root 'Roaming\GET ETV\GetETV\iptv.sqlite'
& $ps -NoProfile -NonInteractive -ExecutionPolicy Bypass -File $cleanup -Edition BattleStationTV -Categories 'library,settings,epg,artwork,backups' -TestMode -TestRoot $root
Check ($LASTEXITCODE -eq 0) 'complete supported BSTV cleanup succeeds'
Check (Test-Path -LiteralPath $other) 'complete cleanup preserves the other edition'
Check (Test-Path -LiteralPath (Join-Path $root 'Roaming\BattleStation TV\BattleStation TV\BattleStationTV\Recordings\keep.ts')) 'complete cleanup preserves recordings'
# Never delete this fixture recursively here: retained evidence supports inspection.
Write-Output ('SYNTHETIC EVIDENCE: '+$root)
