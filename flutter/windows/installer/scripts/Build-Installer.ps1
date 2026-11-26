# Requires Windows PowerShell 5.1. No network access occurs in the installed setup.
[CmdletBinding()]
param([Parameter(Mandatory=$true)][ValidateSet('BattleStationTV','GetETV')][string]$Edition,
 [string]$Project,
 [string]$Flutter='C:\bstv-flutter\bin\flutter.bat',[string]$Compiler,[string]$CrtDirectory,
 [switch]$UseVerifiedRelease)
$ErrorActionPreference='Stop';Set-StrictMode -Version 2
if(!$Project){$Project=Split-Path (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent) -Parent}
function Native([string]$Exe,[string[]]$Arguments){& $Exe @Arguments;$code=$LASTEXITCODE;if($code -ne 0){throw "$([IO.Path]::GetFileName($Exe)) failed with exit code $code"}}
$Project=[IO.Path]::GetFullPath($Project);$installer=Join-Path $Project 'windows\installer'
$repo=Split-Path $Project -Parent
$match=[regex]::Match((Get-Content -LiteralPath (Join-Path $Project 'pubspec.yaml') -Raw),'(?m)^version:\s*(\d+\.\d+\.\d+)\+(\d+)\s*$')
if(!$match.Success){throw 'Expected a semantic Flutter version with build number'}
$version=$match.Groups[1].Value+'+'+$match.Groups[2].Value;
$releasePrefix=if($Edition -eq 'BattleStationTV'){'BattleStation-TV'}else{'GET-ETV'}
$packageBase=$releasePrefix+'-'+$match.Groups[1].Value+'-Build-'+$match.Groups[2].Value+'-Setup';$fileVersion=$match.Groups[1].Value+'.'+$match.Groups[2].Value
if(!(Get-Content -LiteralPath (Join-Path $Project 'windows\CMakeLists.txt') -Raw).Contains('set(BINARY_NAME "'+$Edition+'")')){throw 'Executable identity does not match selected edition'}
if(!$Compiler){$candidates=@("$env:LOCALAPPDATA\Programs\Inno Setup 6\ISCC.exe","${env:ProgramFiles(x86)}\Inno Setup 6\ISCC.exe");$Compiler=$candidates|Where-Object{Test-Path -LiteralPath $_}|Select-Object -First 1}
if(!$Compiler -or !(Test-Path -LiteralPath $Compiler)){throw 'Inno Setup 6 missing. Run: winget install --id JRSoftware.InnoSetup --exact --scope user --source winget'}
Push-Location $Project
try{
 if(!$UseVerifiedRelease){
  Native $Flutter @('pub','get');Native $Flutter @('analyze','--no-fatal-infos');Native $Flutter @('build','windows','--release','--dart-define=LOCAL_DATA_ONLY=false')
 }
 $release=Join-Path $Project 'build\windows\x64\runner\Release'
 $required=@("$Edition.exe",'flutter_windows.dll','libmpv-2.dll','sqlite3.dll','data\app.so','data\icudtl.dat','data\flutter_assets\AssetManifest.bin')
 foreach($f in $required){if(!(Test-Path -LiteralPath (Join-Path $release $f))){throw "Missing release component: $f"}}
 $actual=(Get-Item -LiteralPath (Join-Path $release "$Edition.exe")).VersionInfo.FileVersion
 if($actual.Replace('+','.') -ne $fileVersion){throw "Release version $actual does not match $fileVersion"}
 $stage=Join-Path $installer ('staging\'+$Edition+'-'+$version+'-'+(Get-Date -Format yyyyMMdd-HHmmss))
 New-Item -ItemType Directory -Path $stage -Force|Out-Null
 Copy-Item -LiteralPath (Join-Path $release 'data') -Destination $stage -Recurse
 # A stale unused zlib.dll in the development release links the debug CRT.
 # No shipped binary imports it; exclude it rather than redistributing debug DLLs.
 foreach($file in Get-ChildItem -LiteralPath $release -File | Where-Object { $_.Name -ne 'zlib.dll' }){Copy-Item -LiteralPath $file.FullName -Destination $stage}
 # Native-asset metadata must resolve bundled SQLite, never a developer path.
 $assetsFile=Join-Path $stage 'native_assets.json'
 $internal=Join-Path $stage 'data\flutter_assets\NativeAssetsManifest.json'
 # Flutter versions may emit only the internal manifest. Validate its schema,
 # architecture and every declared bundled file instead of using a stale copy.
 $manifestSource=if(Test-Path -LiteralPath $internal){$internal}elseif(Test-Path -LiteralPath $assetsFile){$assetsFile}else{throw 'No native asset manifest was produced by this release'}
 $assets=Get-Content -LiteralPath $manifestSource -Raw | ConvertFrom-Json
 if(($assets.'format-version' -join '.') -ne '1.0.0' -or !$assets.'native-assets'.windows_x64){throw 'Unsupported Windows native asset manifest'}
 foreach($platform in $assets.'native-assets'.PSObject.Properties){
  if($platform.Name -ne 'windows_x64'){throw 'Unexpected native asset architecture'}
  foreach($asset in $platform.Value.PSObject.Properties){
   if($asset.Value.Count -ne 2 -or $asset.Value[0] -notin @('absolute','relative')){throw 'Unsupported native asset lookup'}
   $leaf=[IO.Path]::GetFileName([string]$asset.Value[1])
   if($leaf -ne 'sqlite3.dll' -or !(Test-Path -LiteralPath (Join-Path $stage $leaf))){throw 'Unexpected or unbundled native asset'}
   $asset.Value=@('absolute',$leaf)
  }
 }
 $assets|ConvertTo-Json -Depth 10|Set-Content -LiteralPath $assetsFile -Encoding UTF8
 $assets|ConvertTo-Json -Depth 10|Set-Content -LiteralPath $internal -Encoding UTF8
 if(!$CrtDirectory){
  $vc="${env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\BuildTools\VC\Redist\MSVC"
  $CrtDirectory=Get-ChildItem -LiteralPath $vc -Directory |Where-Object{$_.Name -match '^\d+\.'}|Sort-Object Name -Descending|ForEach-Object{Join-Path $_.FullName 'x64\Microsoft.VC142.CRT'}|Where-Object{Test-Path -LiteralPath $_}|Select-Object -First 1
 }
 if(!$CrtDirectory){throw 'Supply -CrtDirectory pointing to the licensed Visual Studio REDIST x64 CRT folder; never copy arbitrary system DLLs'}
 foreach($name in @('msvcp140.dll','msvcp140_1.dll','msvcp140_2.dll','msvcp140_atomic_wait.dll','vcruntime140.dll','vcruntime140_1.dll','concrt140.dll')){
  $file=Join-Path $CrtDirectory $name;if(!(Test-Path -LiteralPath $file)){throw "REDIST runtime missing: $name"};Copy-Item -LiteralPath $file -Destination $stage
 }
 $maintenance=Join-Path $stage 'maintenance';New-Item -ItemType Directory -Force $maintenance|Out-Null
 Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'Remove-AppData.ps1') -Destination $maintenance
 $licenses=Join-Path $stage 'licenses';New-Item -ItemType Directory -Force $licenses|Out-Null
 Copy-Item -LiteralPath (Join-Path $repo 'LICENSE') -Destination (Join-Path $licenses 'LICENSE.txt')
 Copy-Item -LiteralPath (Join-Path $Project 'assets\Acknowledgements.md') -Destination $licenses
 foreach($notice in @('BSTV-NOTICE.md','GET-ETV-NOTICE.md')){foreach($parent in @($Project,$repo,(Split-Path $repo -Parent))){$file=Join-Path $parent $notice;if(Test-Path -LiteralPath $file){Copy-Item -LiteralPath $file -Destination $licenses;break}}}
 $packages=Get-Content -LiteralPath (Join-Path $Project '.dart_tool\package_config.json') -Raw|ConvertFrom-Json
 foreach($pkg in $packages.packages){
  $uri=[Uri]::new([Uri]([IO.Path]::GetFullPath((Join-Path $Project '.dart_tool\package_config.json'))),[string]$pkg.rootUri)
  if($uri.IsFile){foreach($name in @('LICENSE','LICENSE.md','LICENSE.txt','COPYING')){$f=Join-Path $uri.LocalPath $name;if(Test-Path -LiteralPath $f){Copy-Item -LiteralPath $f -Destination (Join-Path $licenses ($pkg.name+'-'+$name));break}}}
 }
 Copy-Item -LiteralPath (Join-Path $installer 'RUNTIME-NOTICES.txt') -Destination $licenses
 $source=Join-Path $stage 'source';New-Item -ItemType Directory -Force $source|Out-Null
 # Corresponding app source, including local modifications. No Git metadata, caches,
 # signing material, databases, archives of user data, or development credentials.
 Add-Type -AssemblyName System.IO.Compression
 Add-Type -AssemblyName System.IO.Compression.FileSystem
 $archive=Join-Path $source ($Edition+'-source-'+$version+'.zip')
 $zip=[IO.Compression.ZipFile]::Open($archive,[IO.Compression.ZipArchiveMode]::Create)
 try{
  $include=@('lib','test','windows','android','assets','tool')
  foreach($top in $include){$base=Join-Path $Project $top;foreach($f in Get-ChildItem -LiteralPath $base -Recurse -File){
   $rel=$f.FullName.Substring($Project.Length+1)
   if($rel -match '(^|\\)(build|ephemeral|\.gradle|staging|output|\.symlinks)(\\|$)' -or $f.Extension -in @('.jks','.keystore','.p12','.pfx','.sqlite','.zip') -or $f.Name -match '^(key|local)\.properties$|\.backup-|\.(bak|orig)$'){continue}
   [void][IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip,$f.FullName,$rel.Replace('\','/'),[IO.Compression.CompressionLevel]::Optimal)
  }}
  foreach($name in @('pubspec.yaml','pubspec.lock','analysis_options.yaml','firestore.rules','BSTV-NOTICE.md','GET-ETV-NOTICE.md','BUILDING.md')){if(Test-Path -LiteralPath (Join-Path $Project $name)){[void][IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip,(Join-Path $Project $name),$name,[IO.Compression.CompressionLevel]::Optimal)}}
  [void][IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip,(Join-Path $repo 'LICENSE'),'LICENSE',[IO.Compression.CompressionLevel]::Optimal)
 }finally{$zip.Dispose()}
 & (Join-Path $PSScriptRoot 'Test-Payload.ps1') -Directory $stage -Edition $Edition
 if(!$?){throw 'Native dependency audit failed'}
 $manifest=@(Get-ChildItem -LiteralPath $stage -Recurse -File|ForEach-Object{[PSCustomObject]@{Path=$_.FullName.Substring($stage.Length+1);SHA256=(Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash}})
 $manifest|ConvertTo-Json -Depth 4|Set-Content -LiteralPath (Join-Path $stage 'payload-manifest.json') -Encoding UTF8
 @($manifest | ForEach-Object { $_.Path }) + @('payload-manifest.json','installed-files.txt') | Set-Content -LiteralPath (Join-Path $stage 'installed-files.txt') -Encoding UTF8
 $output=Join-Path $installer 'output';New-Item -ItemType Directory -Force $output|Out-Null
 $dest=Join-Path $output ($packageBase+'.exe')
 # Never accept a stale previous EXE as evidence of a successful compile.
 if(Test-Path -LiteralPath $dest){Move-Item -LiteralPath $dest -Destination ($dest+'.previous-'+(Get-Date -Format yyyyMMdd-HHmmss))}
 $compilerArgs=@("/DEdition=$Edition","/DAppVersion=$version","/DFileVersion=$fileVersion","/DSourceDir=$stage","/DOutputDir=$output","/DPackageBase=$packageBase",(Join-Path $installer 'IPTVMac.iss'))
 Native $Compiler $compilerArgs
 if(!(Test-Path -LiteralPath $dest)){throw 'Compiler exited without producing the expected installer'}
 $hash=(Get-FileHash -LiteralPath $dest -Algorithm SHA256).Hash
 ($hash+'  '+[IO.Path]::GetFileName($dest))|Set-Content -LiteralPath ($dest+'.sha256') -Encoding ASCII
 Write-Output ('INSTALLER: '+$dest);Write-Output ('SHA256: '+$hash)
}finally{Pop-Location}
