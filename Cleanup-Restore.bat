@ECHO OFF
:: Begin Elevation script

setlocal EnableDelayedExpansion

::net file to test privileges, 1>NUL redirects output, 2>NUL redirects errors
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto START ) else ( goto getPrivileges )

:getPrivileges
MSHTA.EXE vbscript:Close(CreateObject("WScript.Shell").Popup("This script will remove system junk, user junk and also optimise and repair this computer system. If there is more than one account please run the cleanup script without admin rights for each of the other accounts to fully optimise this computer system.",120,"README",64))
MSHTA.EXE vbscript:Close(CreateObject("WScript.Shell").Popup("Please make sure you have saved your open windows/ files as this script will restart your computer which might result in file loss should you not do this prior to running this script.",30,"Warning",64))
if '%1'=='ELEV' ( goto START )

set "batchPath=%~f0"
set "batchArgs=ELEV"

::Add quotes to the batch path, if needed
set "script=%0"
set script=%script:"=%
IF '%0'=='!script!' ( GOTO PathQuotesDone )
    set "batchPath=""%batchPath%"""
:PathQuotesDone

::Add quotes to the arguments, if needed.
:ArgLoop
IF '%1'=='' ( GOTO EndArgLoop ) else ( GOTO AddArg )
    :AddArg
    set "arg=%1"
    set arg=%arg:"=%
    IF '%1'=='!arg!' ( GOTO NoQuotes )
        set "batchArgs=%batchArgs% "%1""
        GOTO QuotesDone
        :NoQuotes
        set "batchArgs=%batchArgs% %1"
    :QuotesDone
    shift
    GOTO ArgLoop
:EndArgLoop

::Create and run the vb script to elevate the batch file
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "cmd", "/c ""!batchPath! !batchArgs!""", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs"
exit /B

:START
::Remove the elevation tag and set the correct working directory
IF '%1'=='ELEV' ( shift /1 )
cd /d %~dp0

::...

:: End Elevation Script
:: Begin cleanup script
start /B /wait rundll32.exe pnpclean.dll,RunDLL_PnpClean /drivers/maxclean
start /B /wait dism /Online /Cleanup-Image /CheckHealth
start /B /wait sfc /scannow
start /B /wait dism /Online /Cleanup-Image /RestoreHealth
start /B /wait dism /online /Cleanup-Image /Startcomponentcleanup /resetbase
del %temp%\*.* /s /q
del /s /f /q %windir%\Temp\*.*
del /s /f /q %windir%\Prefetch\*.*
del /s /f /q "%APPDATA%\Microsoft\Windows\Recent"\*.*
del /F /Q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*
del /F /Q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*
REG Delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /VA /F
REG Delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths /VA /F
net stop wuauserv
rmdir %windir%\softwaredistribution  /s /q
net start wuauserv
MSHTA.EXE vbscript:Close(CreateObject("WScript.Shell").Popup("In 60 seconds Disk Cleanup will launch, please select all of the files that you would like deleting and click on OK.",60,"Disk Cleanup",64))
start /B /wait Cleanmgr
MSHTA.EXE vbscript:Close(CreateObject("WScript.Shell").Popup("Your computer will restart soon, after this is done you can use your computer as normal. This message will close after 300 seconds",300,"Cleanup and Repair",64))
shutdown -t 0 -r