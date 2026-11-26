; Canonical compatibility entry point. Keep the historic edition AppId for upgrades.
#ifndef Edition
 #define Edition "BattleStationTV"
#endif
#if Edition == "GetETV"
 #define Product "GET ETV"
 #define Identity "{{1BA53108-0F29-4309-975C-93B174598CA9}"
 #define RegistryId "{1BA53108-0F29-4309-975C-93B174598CA9}_is1"
 #define Accent "$00E0A000"
#else
 #define Product "BattleStation TV"
 #define Identity "{{651D20D2-2686-4DA8-9F4F-51E7D1AF408A}"
 #define RegistryId "{651D20D2-2686-4DA8-9F4F-51E7D1AF408A}_is1"
 #define Accent "$00D06090"
#endif
#ifndef AppVersion
 #error AppVersion must come from pubspec.yaml
#endif
#ifndef FileVersion
 #error FileVersion must include the Flutter build number
#endif
#ifndef SourceDir
 #error A validated, staged SourceDir is required
#endif
#ifndef OutputDir
 #define OutputDir "output"
#endif
[Setup]
AppId={#Identity}
AppName={#Product}
AppVersion={#AppVersion}
AppVerName={#Product} {#AppVersion}
AppPublisher={#Product}
DefaultDirName={localappdata}\Programs\{#Edition}
DefaultGroupName={#Product}
PrivilegesRequired=lowest
MinVersion=10.0.17763
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
OutputDir={#OutputDir}
OutputBaseFilename={#PackageBase}
SetupIconFile=..\runner\resources\app_icon.ico
UninstallDisplayIcon={app}\{#Edition}.exe
UninstallDisplayName={#Product}
UninstallFilesDir={app}\uninstall
VersionInfoVersion={#FileVersion}
VersionInfoProductName={#Product}
LicenseFile={#SourceDir}\licenses\LICENSE.txt
InfoAfterFile=INSTALLATION-NOTES.txt
WizardStyle=modern
WizardImageFile=wizard.bmp
WizardSmallImageFile=header.bmp
WizardImageStretch=yes
DisableWelcomePage=no
DisableProgramGroupPage=yes
DisableReadyPage=no
Compression=lzma2
SolidCompression=yes
CloseApplications=yes
RestartApplications=no
SetupLogging=yes
UninstallLogging=yes
UsePreviousAppDir=yes
UsePreviousTasks=yes
ChangesAssociations=no
[InstallDelete]
Type: files; Name: "{app}\zlib.dll"
Type: files; Name: "{autoprograms}\{#Edition}.lnk"
Type: files; Name: "{autodesktop}\{#Edition}.lnk"
[Files]
Source: "{#SourceDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
[Tasks]
Name: desktop; Description: "Desktop shortcut"
Name: startmenu; Description: "Start menu shortcuts"
Name: startup; Description: "Start {#Product} when I sign in to Windows"; Flags: unchecked
[Icons]
Name: "{autodesktop}\{#Product}"; Filename: "{app}\{#Edition}.exe"; Tasks: desktop
Name: "{autoprograms}\{#Product}\{#Product}"; Filename: "{app}\{#Edition}.exe"; Tasks: startmenu
Name: "{autoprograms}\{#Product}\Uninstall {#Product}"; Filename: "{uninstallexe}"; Tasks: startmenu
[Registry]
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; ValueName: "{#Edition}"; ValueData: """{app}\{#Edition}.exe"""; Tasks: startup; Flags: uninsdeletevalue
Root: HKCU; Subkey: "Software\{#Edition}\Installer"; ValueType: string; ValueName: "FileVersion"; ValueData: "{#FileVersion}"; Flags: uninsdeletekey
[Registry]
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; ValueType: none; ValueName: "{#Edition}"; Tasks: not startup; Flags: deletevalue
[Run]
Filename: "{app}\{#Edition}.exe"; Description: "Launch {#Product}"; Flags: nowait postinstall skipifsilent; Check: NormalLaunch
Filename: "{app}\{#Edition}.exe"; Flags: nowait; Check: UpdateRelaunch
[Code]
var ModePage: TInputOptionWizardPage; DataCategories: String; PreviousInstall: Boolean; UpdateMode: Boolean; PreviousFiles: TArrayOfString;
function FileAttributes(Name: String): LongWord;
 external 'GetFileAttributesW@kernel32.dll stdcall';
function NoLinks(Path: String): Boolean;
var Parent: String; Attr: LongWord;
begin
 Result:=True;
 while Length(Path)>3 do begin
  Attr:=FileAttributes(Path);
  if (Attr<>$FFFFFFFF) and ((Attr and $400)<>0) then begin Result:=False;Exit;end;
  Parent:=ExtractFileDir(Path);if Parent=Path then Exit;Path:=Parent;
 end;
end;
function SafeOwnedPath(Relative: String): Boolean;
begin
 Result := (Relative<>'') and (Pos('..',Relative)=0) and (Pos(':',Relative)=0) and (Relative[1]<>'\') and (Relative[1]<>'/') and NoLinks(AddBackslash(ExpandConstant('{app}'))+Relative);
end;
function NormalLaunch: Boolean;
begin Result:=not UpdateMode;end;
function UpdateRelaunch: Boolean;
begin Result:=UpdateMode and (ExpandConstant('{param:RESTARTAPP|1}')='1');end;
procedure CurStepChanged(Step: TSetupStep);
var Current: TArrayOfString; I,J: Integer; Found: Boolean;
begin
 if Step=ssInstall then LoadStringsFromFile(ExpandConstant('{app}\installed-files.txt'),PreviousFiles);
 if (Step=ssPostInstall) and LoadStringsFromFile(ExpandConstant('{app}\installed-files.txt'),Current) then
  for I:=0 to GetArrayLength(PreviousFiles)-1 do if SafeOwnedPath(PreviousFiles[I]) then begin
   Found:=False;for J:=0 to GetArrayLength(Current)-1 do if CompareText(PreviousFiles[I],Current[J])=0 then Found:=True;
   if not Found then if not DeleteFile(AddBackslash(ExpandConstant('{app}'))+PreviousFiles[I]) then Log('Obsolete installer-owned file could not be removed.');
  end;
end;
function InitializeSetup(): Boolean;
var OldVersion: String; Existing: Int64; Incoming: Int64;
begin
 Result := True;
 UpdateMode := ExpandConstant('{param:BSTVUPDATE|0}')='1';
 PreviousInstall := RegKeyExists(HKCU, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{#RegistryId}');
 if RegQueryStringValue(HKCU, 'Software\{#Edition}\Installer', 'FileVersion', OldVersion) then
  if StrToVersion(OldVersion, Existing) and StrToVersion('{#FileVersion}', Incoming) and (Existing > Incoming) then begin
   MsgBox('A newer version is installed. Downgrades are blocked to protect your data.', mbError, MB_OK); Result := False;
  end;
end;
procedure InitializeWizard();
begin
 WizardForm.WelcomeLabel1.Caption := 'Welcome to {#Product}';
 WizardForm.WelcomeLabel2.Caption := 'Install the complete Windows player. No separate Flutter, media player or runtime download is required.' + #13#10#13#10 + 'Existing accounts and personal data are preserved. Windows 10/11 x64. Current-user installation; administrator rights are not required.';
 WizardForm.FinishedHeadingLabel.Caption := '{#Product} is ready';
 WizardForm.NextButton.Font.Color := {#Accent};
 ModePage := CreateInputOptionPage(wpLicense, 'Installation mode', 'Choose Express or Custom', 'Both modes include all required application files and bundled runtimes.', True, False);
 ModePage.Add('Express Installation (Recommended)');
 ModePage.Add('Custom Installation (Advanced)'); ModePage.SelectedValueIndex := 0;
end;
function ShouldSkipPage(PageID: Integer): Boolean;
begin
 if UpdateMode and ((PageID=ModePage.ID) or (PageID=wpSelectDir) or (PageID=wpSelectTasks)) then begin Result:=True;Exit;end;
 Result := (ModePage.SelectedValueIndex = 0) and ((PageID = wpSelectDir) or (PageID = wpSelectTasks)); end;
function NextButtonClick(CurPageID: Integer): Boolean;
var FindRec: TFindRec; HasFiles: Boolean; V: String; OldV, NewV: Int64;
begin
 Result := True;
 if (CurPageID = ModePage.ID) and (ModePage.SelectedValueIndex = 0) and not PreviousInstall then WizardSelectTasks('desktop,startmenu');
 if (CurPageID = wpSelectDir) or (CurPageID = wpReady) then begin
  if not NoLinks(WizardDirValue) then begin MsgBox('Linked installation folders are not supported.',mbError,MB_OK);Result:=False;Exit;end;
  HasFiles := False;
  if FindFirst(AddBackslash(WizardDirValue)+'*',FindRec) then begin
   try repeat if (FindRec.Name<>'.') and (FindRec.Name<>'..') then HasFiles:=True; until not FindNext(FindRec); finally FindClose(FindRec); end;
  end;
  if HasFiles and not FileExists(AddBackslash(WizardDirValue)+'{#Edition}.exe') then begin
   MsgBox('Choose an empty folder or this application''s existing installation folder. Other application folders are not safe installation targets.',mbError,MB_OK);Result:=False;Exit;
  end;
 end;
 if CurPageID = wpReady then begin
  if GetVersionNumbersString(AddBackslash(WizardDirValue)+'{#Edition}.exe',V) then
   if StrToVersion(V, OldV) and StrToVersion('{#FileVersion}', NewV) then begin
    if OldV > NewV then begin MsgBox('This folder contains a newer version. Downgrade blocked.',mbError,MB_OK); Result := False; end
    else if (OldV = NewV) and not UpdateMode then Result := MsgBox('The same version is installed. Repair/reinstall application files while keeping personal data?',mbConfirmation,MB_YESNO)=IDYES;
   end;
 end;
end;
function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
begin
 Result := '{#Product} {#AppVersion}' + NewLine + 'Scope: current Windows user (no elevation)' + NewLine + MemoDirInfo + NewLine + MemoTasksInfo + NewLine + 'Core application, Flutter, playback, SQLite and Visual C++ runtimes: included.' + NewLine + 'Personal data: preserved. No cloud records are modified.';
end;
function InitializeUninstall(): Boolean;
var Form: TSetupForm; Note: TNewStaticText; Selective, Complete: TNewRadioButton;
 Boxes: array[0..4] of TNewCheckBox; Keep, All, Recommended, Remove, Cancel: TNewButton;
 I: Integer; Names: array[0..4] of String;
begin
 Result := False; DataCategories := '';
 if not NoLinks(ExpandConstant('{app}')) then begin MsgBox('Uninstall refused a linked installation directory.',mbError,MB_OK);Exit;end;
 if UninstallSilent then begin MsgBox('Interactive confirmation is required. Silent data removal is not supported.',mbError,MB_OK); Exit; end;
 Names[0]:='Accounts, credentials, local cloud sessions, playlists, favorites, history and DVR/download queues';
 Names[1]:='Profiles, settings, appearance, themes and navigation (shared preferences)';
 Names[2]:='Downloaded EPG programmes and fetch-state cache (sources and mappings stay)';
 Names[3]:='Disposable artwork index and TLS certificate cache (shared image files stay)';
 Names[4]:='Application-owned recovered database backups (not exported backups)';
 Form:=CreateCustomForm(660,460,False,False); Form.Caption:='{#Product} - Uninstallation Center';Form.Position:=poScreenCenter;
 Selective:=TNewRadioButton.Create(Form);Selective.Parent:=Form;Selective.SetBounds(ScaleX(20),ScaleY(16),ScaleX(620),ScaleY(24));Selective.Caption:='Selective Uninstall (Recommended)';Selective.Checked:=True;
 Complete:=TNewRadioButton.Create(Form);Complete.Parent:=Form;Complete.SetBounds(ScaleX(20),ScaleY(44),ScaleX(620),ScaleY(24));Complete.Caption:='Complete Uninstall - remove all supported local data';
 Note:=TNewStaticText.Create(Form);Note.Parent:=Form;Note.SetBounds(ScaleX(20),ScaleY(78),ScaleX(620),ScaleY(50));Note.AutoSize:=False;Note.WordWrap:=True;Note.Caption:='Application files and shortcuts are always removed. Checked = REMOVE data; unchecked = PRESERVE. Complete mode selects every category at confirmation. Recordings, downloaded media, exported backups, other users and cloud accounts are never deleted.';
 for I:=0 to 4 do begin Boxes[I]:=TNewCheckBox.Create(Form);Boxes[I].Parent:=Form;Boxes[I].SetBounds(ScaleX(20),ScaleY(140+I*45),ScaleX(620),ScaleY(40));Boxes[I].Caption:=Names[I];Boxes[I].Checked:=(I=2) or (I=3); end;
 { Controls use modal results so the form can safely update selections without callbacks. }
 All:=TNewButton.Create(Form);All.Parent:=Form;All.SetBounds(ScaleX(20),ScaleY(370),ScaleX(100),ScaleY(28));All.Caption:='Select All';All.ModalResult:=10;
 Keep:=TNewButton.Create(Form);Keep.Parent:=Form;Keep.SetBounds(ScaleX(130),ScaleY(370),ScaleX(150),ScaleY(28));Keep.Caption:='Keep All My Data';Keep.ModalResult:=11;
 Recommended:=TNewButton.Create(Form);Recommended.Parent:=Form;Recommended.SetBounds(ScaleX(290),ScaleY(370),ScaleX(200),ScaleY(28));Recommended.Caption:='Recommended Selections';Recommended.ModalResult:=12;
 Remove:=TNewButton.Create(Form);Remove.Parent:=Form;Remove.SetBounds(ScaleX(420),ScaleY(420),ScaleX(110),ScaleY(28));Remove.Caption:='Uninstall';Remove.ModalResult:=mrOK;
 Cancel:=TNewButton.Create(Form);Cancel.Parent:=Form;Cancel.SetBounds(ScaleX(540),ScaleY(420),ScaleX(100),ScaleY(28));Cancel.Caption:='Cancel';Cancel.ModalResult:=mrCancel;Cancel.Cancel:=True;
 repeat
  I:=Form.ShowModal;
  if I=10 then begin Boxes[0].Checked:=True;Boxes[1].Checked:=True;Boxes[2].Checked:=True;Boxes[3].Checked:=True;Boxes[4].Checked:=True;end;
  if I=11 then begin Boxes[0].Checked:=False;Boxes[1].Checked:=False;Boxes[2].Checked:=False;Boxes[3].Checked:=False;Boxes[4].Checked:=False;end;
  if I=12 then begin Boxes[0].Checked:=False;Boxes[1].Checked:=False;Boxes[2].Checked:=True;Boxes[3].Checked:=True;Boxes[4].Checked:=False;end;
 until (I=mrOK) or (I=mrCancel);
 if I=mrOK then begin
  if Complete.Checked then for I:=0 to 4 do Boxes[I].Checked:=True;
  Note.Caption:='REMOVE: application files, runtimes, shortcuts and installer registration.';
  for I:=0 to 4 do if Boxes[I].Checked then Note.Caption:=Note.Caption+#13#10+Names[I];
  if Boxes[0].Checked then Note.Caption:=Note.Caption+#13#10#13#10+'WARNING: local accounts and irreplaceable credentials will be removed. Cloud deletion is a separate authenticated operation.';
  Result:=MsgBox(Note.Caption+#13#10#13#10+'Continue?',mbConfirmation,MB_YESNO or MB_DEFBUTTON2)=IDYES;
  if Result then begin
   if Boxes[0].Checked then DataCategories:='library,';
   if Boxes[1].Checked then DataCategories:=DataCategories+'settings,';
   if Boxes[2].Checked then DataCategories:=DataCategories+'epg,';
   if Boxes[3].Checked then DataCategories:=DataCategories+'artwork,';
   if Boxes[4].Checked then DataCategories:=DataCategories+'backups,';
  end;
 end;
 Form.Free;
end;
procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var Code: Integer;
begin
 if (CurUninstallStep=usUninstall) and (DataCategories<>'') then begin
  Log('Requested local-data categories: '+DataCategories);
  if not Exec(ExpandConstant('{sys}\WindowsPowerShell\v1.0\powershell.exe'), '-NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -File "'+ExpandConstant('{app}\maintenance\Remove-AppData.ps1')+'" -Edition {#Edition} -Categories "'+DataCategories+'"', '', SW_HIDE, ewWaitUntilTerminated, Code) or (Code<>0) then begin
   Log('Local-data cleanup failed. Application removal stopped.');
   RaiseException('Personal-data cleanup failed or was blocked. Application removal stopped; selected data may be partially removed. Check for a running application, locked files or directory links and retry.');
  end;
  Log('Requested local-data cleanup completed successfully.');
 end;
end;
