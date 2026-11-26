[CmdletBinding()]
param([Parameter(Mandatory=$true)][string]$Directory,[Parameter(Mandatory=$true)][ValidateSet('BattleStationTV','GetETV')][string]$Edition,[string]$Dumpbin)
$ErrorActionPreference='Stop'
if(!$Dumpbin){$Dumpbin="${env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\BuildTools\VC\Tools\MSVC\14.29.30133\bin\Hostx64\x64\dumpbin.exe"}
if(!(Test-Path -LiteralPath $Dumpbin)){throw 'Supply -Dumpbin for native dependency audit'}
$report=@();$missing=@()
foreach($file in Get-ChildItem -LiteralPath $Directory -File|Where-Object{$_.Extension -in @('.exe','.dll')}){
 $text=& $Dumpbin /DEPENDENTS $file.FullName;$code=$LASTEXITCODE;if($code -ne 0){throw 'PE import inspection failed'}
 $imports=@($text|Where-Object{$_ -match '^\s+([A-Za-z0-9_.-]+\.dll)\s*$'}|ForEach-Object{$_.Trim()}|Select-Object -Unique)
 foreach($dll in $imports){
  $kind='bundled'
  if(!(Test-Path -LiteralPath (Join-Path $Directory $dll))){
   $system=Join-Path $env:windir ('System32\'+$dll)
   if($dll -match '^(api-ms-win-|ext-ms-win-)'){$kind='Windows API contract'}
   elseif((Test-Path -LiteralPath $system) -and (Get-Item -LiteralPath $system).VersionInfo.ProductName -match 'Windows.*(Operating System|Search)'){$kind='Windows system component'}
   else{$missing+=$dll;$kind='MISSING'}
  }
  $report+=[PSCustomObject]@{Binary=$file.Name;Dependency=$dll;Resolution=$kind}
 }
}
$report|ConvertTo-Json -Depth 4|Set-Content -LiteralPath (Join-Path $Directory 'dependency-audit.json') -Encoding UTF8
if($missing.Count){throw ('Unbundled non-system dependencies: '+(($missing|Select-Object -Unique)-join ', '))}
Write-Output ('Native import audit passed for '+$Edition+'. Clean offline VM verification is still required.')
