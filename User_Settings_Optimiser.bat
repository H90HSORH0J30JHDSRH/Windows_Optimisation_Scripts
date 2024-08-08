@echo off
:: Print Script Title
echo [94m-----User_Settings_Optimiser-----[0m
echo.
echo [94mCreated By: Hackboto Tech Tips[0m
echo.
echo [94mVersion: 1.2.4[0m
echo.
::Print Terms and Conditions
echo -----Terms and Conditions-----
echo.
echo Running this script may result in loss of data. 
echo.
echo Please ensure all open files are closed and saved before proceeding.
echo.
echo This script will alter your system settings.
echo.
echo If you have not ran the System_Settings_Optimiser.bat on this computer already, please run it before proceeding with this script.
echo.
echo By proceeding, you agree take full responsibility for any potential data loss and all of the above.
echo.
echo Additional terms and conditions can be found at https://hackbototechtips.github.io/legal.html
echo.
:: Prompting the user to confirm if they want to proceed with system reg changes.
set /p continue=Do you accept the terms and conditions? (If you accept, changes will make to your computer.) (Y/N): 

:: Checking user input to decide whether to proceed with script or not
if /i "%continue%"=="Y" (
    :: Applying REG changes
    REG Delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /VA /F
    REG Delete HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths /VA /F
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "EnableSecondOOBE" /t REG_DWORD /d 0 /f >nul 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_IrisRecommendations" /t REG_DWORD /d 0 /f >nul 2>&1
	reg add "HKCU\Software\Microsoft\Input\Settings" /v "InsightsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
	reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 1 /f >nul 2>&1
    	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\InkingAndTypingPersonalization" /v "Value" /t REG_DWORD /d 0 /f >nul 2>&1
    	reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 0 /f >nul 2>&1
    	reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f >nul 2>&1
    	reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f >nul 2>&1
    	reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 0 /f >nul 2>&1
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDynamicSearchBoxEnabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_AccountNotifications" /t REG_DWORD /d 0 /f
	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSd" /t REG_DWORD /d 1 /f
	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f
	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d 0 /f
	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d 0 /f
	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 0 /f
	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableTailoredExperiencesWithDiagnosticData" /t REG_DWORD /d 1 /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v "EnthusiastMode" /t REG_DWORD /d 1 /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d 1 /f
	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "ShowGlobalPrompts" /t REG_DWORD /d 0 /f
	reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\CPSS\Store" /v "UserLocationOverridePrivacySetting" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d 0 /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f
	reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\ImproveInkingAndTyping" /v "Value" /t REG_DWORD /d 0 /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\AdvertisingInfo" /v "Value" /t REG_DWORD /d 0 /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d 0 /f
    :: Informing the user that settings are applied
    powershell -WindowStyle Hidden -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; [System.Windows.Forms.MessageBox]::Show('Your user account settings were successfully optimised.', 'Successful', 'OK', 'Information')" > nul

) else (
    :: Informing the user that cleanup is aborted
    powershell -WindowStyle Hidden -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; [System.Windows.Forms.MessageBox]::Show('Settings optimisation aborted.', 'Aborted', 'OK', 'Warning')" > nul
)
