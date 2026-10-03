@echo off
set P=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies
set PE=HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies

REM System policies (HKLM so it applies to all users)
reg add "%P%\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f
reg add "%P%\System" /v DisableRegistryTools /t REG_DWORD /d 1 /f
reg add "%P%\System" /v DisableCMD /t REG_DWORD /d 2 /f
reg add "%P%\System" /v DisableLockWorkstation /t REG_DWORD /d 1 /f
reg add "%P%\System" /v DisableChangePassword /t REG_DWORD /d 1 /f
reg add "%P%\System" /v HideFastUserSwitching /t REG_DWORD /d 1 /f
reg add "%P%\System" /v NoDispCPL /t REG_DWORD /d 1 /f
reg add "%P%\System" /v NoDispBackgroundPage /t REG_DWORD /d 1 /f
reg add "%P%\System" /v NoDispSettingsPage /t REG_DWORD /d 1 /f

REM Explorer policies
reg add "%P%\Explorer" /v NoControlPanel /t REG_DWORD /d 1 /f
reg add "%P%\Explorer" /v NoRun /t REG_DWORD /d 1 /f
reg add "%P%\Explorer" /v NoFind /t REG_DWORD /d 1 /f
reg add "%P%\Explorer" /v NoViewContextMenu /t REG_DWORD /d 1 /f
reg add "%P%\Explorer" /v NoTrayContextMenu /t REG_DWORD /d 1 /f
reg add "%P%\Explorer" /v NoFileMenu /t REG_DWORD /d 1 /f
reg add "%P%\Explorer" /v NoFolderOptions /t REG_DWORD /d 1 /f
reg add "%P%\Explorer" /v NoDesktop /t REG_DWORD /d 0 /f
reg add "%P%\Explorer" /v NoSetFolders /t REG_DWORD /d 1 /f
reg add "%P%\Explorer" /v NoSetTaskbar /t REG_DWORD /d 1 /f
reg add "%P%\Explorer" /v NoSaveSettings /t REG_DWORD /d 1 /f
reg add "%P%\Explorer" /v NoViewOnDrive /t REG_DWORD /d 1 /f
reg add "%P%\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 255 /f

REM Shell context menu lockdown
reg add "%P%\Explorer" /v NoTrayItemsDisplay /t REG_DWORD /d 1 /f

REM Remove Start Menu power options and search
reg add "%P%\Explorer" /v NoClose /t REG_DWORD /d 1 /f
reg add "%P%\Explorer" /v NoLogoff /t REG_DWORD /d 1 /f
reg add "%P%\Explorer" /v StartMenuLogOff /t REG_DWORD /d 1 /f

REM Kill right-click on taskbar and Start
reg add "%P%\Explorer" /v NoTrayContextMenu /t REG_DWORD /d 1 /f
reg add "%P%\Explorer" /v NoViewContextMenu /t REG_DWORD /d 1 /f

REM Disable CMD file association as backup
reg add "%P%\Explorer" /v DisallowRun /t REG_DWORD /d 1 /f
reg add "%P%\Explorer\DisallowRun" /v 1 /t REG_SZ /d "cmd.exe" /f
reg add "%P%\Explorer\DisallowRun" /v 2 /t REG_SZ /d "regedit.exe" /f
reg add "%P%\Explorer\DisallowRun" /v 3 /t REG_SZ /d "taskmgr.exe" /f
reg add "%P%\Explorer\DisallowRun" /v 4 /t REG_SZ /d "mmc.exe" /f
reg add "%P%\Explorer\DisallowRun" /v 5 /t REG_SZ /d "powershell.exe" /f
reg add "%P%\Explorer\DisallowRun" /v 6 /t REG_SZ /d "msconfig.exe" /f
reg add "%P%\Explorer\DisallowRun" /v 7 /t REG_SZ /d "control.exe" /f

echo Policies locked. Even a working shell is now useless.
pause
