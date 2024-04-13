@ECHO OFF
::ELEVATION START 
setlocal EnableDelayedExpansion

NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto START ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' ( goto START )

set "batchPath=%~f0"
set "batchArgs=ELEV"
set "script=%0"
set script=%script:"=%
IF '%0'=='!script!' ( GOTO PathQuotesDone )
set "batchPath=""%batchPath%"""
:PathQuotesDone

:ArgLoop
IF '%1'=='' ( GOTO EndArgLoop ) else ( GOTO AddArg )
:AddArg
set "arg=%1"
set arg=%arg:"=%
IF '%1'=='!arg!' ( GOTO NoQuotes ) else ( set "batchArgs=!batchArgs! "%1"" )
:NoQuotes
set "batchArgs=!batchArgs! %1"
shift
GOTO ArgLoop
:EndArgLoop

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "cmd", "/c ""!batchPath! !batchArgs!""", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs"
exit /B

:START
IF '%1'=='ELEV' ( shift /1 )
cd /d %~dp0
::ELEVATION END
 
::ACCEPT
:: Warning the user about closing and saving open files
echo Warning: Please ensure all open files are closed and saved before proceeding.
echo.
echo Warning: Running this script may result in loss of data. By proceeding, you agree that you have closed and saved all necessary files and take full responsibility for any potential data loss.
echo.

echo Notice: Please run the User-Optimiser on this computer system for maximum effectiveness once this script has completed.
echo.

:: Prompting the user to confirm if they want to proceed with cleanup
set /p continue=Do you accept the terms and conditions (Y/N): 

:: Checking user input to decide whether to proceed with cleanup or not
if /i "%continue%"=="Y" (
    :: Begin cleanup script
    start /B /wait rundll32.exe pnpclean.dll,RunDLL_PnpClean /drivers/maxclean
    start /B /wait dism /Online /Cleanup-Image /CheckHealth
    start /B /wait sfc /scannow
    start /B /wait dism /Online /Cleanup-Image /RestoreHealth
    start /B /wait dism /online /Cleanup-Image /Startcomponentcleanup /resetbase
    del /s /f /q  %temp%\*.*
    del /s /f /q %windir%\Temp\*.*
    del /s /f /q %windir%\Prefetch\*.*
    net stop wuauserv
    rmdir %windir%\softwaredistribution  /s /q
    net start wuauserv
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Disk Cleanup will launch. Please select all of the files that you would like to delete and click on OK.', 'Disk Cleanup', 'OK', 'Information')"
    powershell -Command "Start-Process cleanmgr -Verb RunAs -Wait"
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Your computer will now restart. I Recommend you run the User-Optimiser on this computer system after your system has finished restarting.', 'System Optimisation Complete', 'OK', 'Information')"
    shutdown -t 0 -r
) else (
    :: Informing the user that script is aborted
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('System Optimisation Aborted.', 'Warning', 'OK', 'Warning')"
)
