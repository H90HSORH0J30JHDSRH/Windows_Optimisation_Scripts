@echo off
:: Warning the user about closing and saving open files
echo Warning: Please ensure all open files are closed and saved before proceeding.
echo.
echo Warning: Running this script may result in loss of data. By proceeding, you agree that you have closed and saved all necessary files and take full responsibility for any potential data loss.
echo.

echo Notice: Please run this script for each user account that is present on this computer system for maximum effectiveness.
echo.

:: Prompting the user to confirm if they want to proceed with cleanup
set /p continue=Do you accept the terms and conditions (Y/N): 

:: Checking user input to decide whether to proceed with cleanup or not
if /i "%continue%"=="Y" (
    :: Cleaning up temporary files
    del /s /f /q %temp%\*.*
    del /s /f /q "%APPDATA%\Microsoft\Windows\Recent"\*.*
    del /s /f /q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*
    del /s /f /q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*
    REG Delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /VA /F
    REG Delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths /VA /F
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Disk Cleanup will launch. Please select all of the files that you would like to delete and click on OK.', 'Disk Cleanup', 'OK', 'Information')"
powershell -Command "Start-Process cleanmgr -Wait"
    :: Informing the user that cleanup is completed
    powershell -WindowStyle Hidden -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; [System.Windows.Forms.MessageBox]::Show('Your user account was successfully optimised.', 'Successful', 'OK', 'Information')" > nul

) else (
    :: Informing the user that cleanup is aborted
    powershell -WindowStyle Hidden -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; [System.Windows.Forms.MessageBox]::Show('Cleanup aborted.', 'Aborted', 'OK', 'Warning')" > nul
)
