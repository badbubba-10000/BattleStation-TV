[CmdletBinding()]
param([Parameter(Mandatory=$true)][string]$Directory,[Parameter(Mandatory=$true)][ValidateSet('BattleStationTV','GetETV')][string]$Edition)
$ErrorActionPreference='Stop'
$Directory=[IO.Path]::GetFullPath($Directory)
$mpv=Join-Path $Directory 'libmpv-2.dll'
Add-Type -TypeDefinition @"
using System;using System.Runtime.InteropServices;
public static class PlaybackProbe {
 [DllImport("kernel32.dll",CharSet=CharSet.Unicode)]public static extern bool SetDllDirectory(string path);
 [DllImport(@"$mpv",CallingConvention=CallingConvention.Cdecl)]public static extern ulong mpv_client_api_version();
 [DllImport(@"$mpv",CallingConvention=CallingConvention.Cdecl)]public static extern IntPtr mpv_create();
 [DllImport(@"$mpv",CallingConvention=CallingConvention.Cdecl,CharSet=CharSet.Ansi)]public static extern int mpv_set_option_string(IntPtr h,string n,string v);
 [DllImport(@"$mpv",CallingConvention=CallingConvention.Cdecl)]public static extern int mpv_initialize(IntPtr h);
 [DllImport(@"$mpv",CallingConvention=CallingConvention.Cdecl)]public static extern void mpv_terminate_destroy(IntPtr h);
}
"@
[void][PlaybackProbe]::SetDllDirectory($Directory)
$api=[PlaybackProbe]::mpv_client_api_version();$h=[PlaybackProbe]::mpv_create();if($h -eq [IntPtr]::Zero){throw 'libmpv creation failed'}
try{
 [void][PlaybackProbe]::mpv_set_option_string($h,'vo','null');[void][PlaybackProbe]::mpv_set_option_string($h,'ao','null')
 if([PlaybackProbe]::mpv_initialize($h) -lt 0){throw 'libmpv initialization failed'}
 Write-Output ('PASS '+$Edition+' bundled libmpv initializes; API='+$api)
}finally{[PlaybackProbe]::mpv_terminate_destroy($h)}
# The explicit smoke switch uses memory-only preferences/accounts and disables
# provider refresh, download queues, credentials and persistent application data.
$info=New-Object Diagnostics.ProcessStartInfo
$info.FileName=Join-Path $Directory ($Edition+'.exe');$info.Arguments='--bstv-smoke-test';$info.WorkingDirectory=$Directory;$info.UseShellExecute=$false
$info.EnvironmentVariables['PATH']=$env:windir+'\System32;'+$env:windir
$process=[Diagnostics.Process]::Start($info)
$marker=Join-Path ([IO.Path]::GetTempPath()) ('bstv-smoke-ready-'+$process.Id+'.txt')
try{
 $deadline=[DateTime]::UtcNow.AddSeconds(40)
 while(!(Test-Path -LiteralPath $marker) -and [DateTime]::UtcNow -lt $deadline -and !$process.HasExited){Start-Sleep -Milliseconds 250;$process.Refresh()}
 if(!(Test-Path -LiteralPath $marker)){throw 'Relocated application did not reach a safe first frame'}
 $status=Get-Content -LiteralPath $marker -Raw
 if($status -notmatch 'accounts=0; storageProbe=passed'){throw 'Smoke-mode isolation or storage probe failed'}
 $modules=@($process.Modules|Where-Object{$_.ModuleName -match '^(msvcp140|vcruntime140).*\.dll$'}|Select-Object ModuleName,FileName)
 foreach($module in $modules){if(!$module.FileName.StartsWith($Directory+'\',[StringComparison]::OrdinalIgnoreCase)){throw 'Application used a system C++ runtime instead of bundled files'}}
 Write-Output ('PASS '+$Edition+' relocated first frame; memory-only accounts=0; bundled C++ runtime; reduced PATH')
 $modules|Format-Table
}finally{
 if(!$process.HasExited){[void]$process.CloseMainWindow();if(!$process.WaitForExit(5000)){$process.Kill()}}
}
