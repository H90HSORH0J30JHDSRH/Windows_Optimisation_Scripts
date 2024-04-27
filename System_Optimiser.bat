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
    del /s /q %windir%\Logs\CBS\*.*
    del /s /q %windir%\Logs\DISM\*.*
    del /s /q %SystemRoot%\System32\winevt\Logs\*.*
    del /s /q %SystemRoot%\Logs\SetupCleanupTask\*.*
    del /s /q %SystemRoot%\Logs\waasmediccapsule\*.*
    del /s /q %SystemRoot%\Logs\WindowsUpdate\*.*
    net stop wuauserv
    rmdir /s /q %windir%\softwaredistribution
    rmdir /s /q %SystemRoot%\Panther
    net start wuauserv
	::Begin reg changes
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" /v AllowInputPersonalization /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v LimitEnhancedDiagnosticDataWindowsAnalytics /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v LimitDumpCollection /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v LimitDiagnosticLogCollection /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DisableTelemetryOptInSettingsUx /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DisableTelemetryOptInChangeNotification /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowWUfBCloudProcessing /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowUpdateComplianceProcessing /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowDeviceNameInTelemetry /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowDesktopAnalyticsProcessing /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowCommercialDataPipeline /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableCloudOptimizedContent" /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableConsumerAccountStateContent" /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsSearch" /v "EnableDynamicContentInWSB" /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Policies\Microsoft\Dsh" /v AllowNewsAndInterests /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Chat" /v ChatIcon /t REG_DWORD /d 3 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "TyposquattingCheckerEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ResolveNavigationErrorsUseWebService" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AlternateErrorPagesEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NetworkPredictionOptions" /t REG_DWORD /d 2 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SiteSafetyServicesEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "UserFeedbackAllowed" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SearchSuggestEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ConfigureDoNotTrack" /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "LocalProvidersEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "WebWidgetAllowed" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v MicrosoftEdgeInsiderPromotionEnabled /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowMicrosoftRewards /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AllowGamesMenu /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowAcrobatSubscriptionButton /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowRecommendationsEnabled /t REG_DWORD /d 0 /f
		reg add "HKCU\Software\Policies\Microsoft\Office\16.0\Outlook\Options\General" /v HideNewOutlookToggle /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Appx" /v "AllowAutomaticAppArchiving" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AllowUntriggeredNetworkTrafficOnSettingsPage" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpynetReporting" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d 2 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" /v "AllowSuggestedAppsInWindowsInkWorkspace" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableLockScreenAppNotifications" /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "QuickSearchShowMiniMenu" /t REG_DWORD /d 0 /f
		for /f "tokens=*" %%a in ('reg query HKU') do (
    			reg add "%%a\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "EnableSecondOOBE" /t REG_DWORD /d 0 /f >nul 2>&1
			reg add "%%a\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_IrisRecommendations" /t REG_DWORD /d 0 /f >nul 2>&1
			reg add "%%a\Software\Microsoft\Input\Settings" /v "InsightsEnabled" /t REG_DWORD /d 0 /f >nul 2>&1
			reg add "%%a\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 1 /f >nul 2>&1
    			reg add "%%a\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\InkingAndTypingPersonalization" /v "Value" /t REG_DWORD /d 0 /f >nul 2>&1
    			reg add "%%a\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 0 /f >nul 2>&1
    			reg add "%%a\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f >nul 2>&1
    			reg add "%%a\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f >nul 2>&1
    			reg add "%%a\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 0 /f >nul 2>&1
)
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageAllowedBackgroundTypes" /t REG_DWORD /d 3 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageHideDefaultTopSites" /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge" /v "AllowSurfGame" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SpotlightExperiencesAndRecommendationsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageBingChatEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "RelatedMatchesCloudServiceEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PromotionalTabsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageContentEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageQuickLinksEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "WalletDonationEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "UploadFromPhoneEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "TabServicesEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SplitScreenEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ShowHistoryThumbnails" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SharedLinksEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SearchInSidebarEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PromptForDownloadLocation" /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PictureInPictureOverlayEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeWalletEtreeEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeWalletCheckoutEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeOpenInSidebarEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeFollowEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "Edge3PSerpTelemetryEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DiagnosticData" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DefaultShareAdditionalOSRegionSetting" /t REG_DWORD /d 2 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DefaultBrowserSettingsCampaignEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "CryptoWalletEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ComposeInlineEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AIGenThemesEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AccessibilityImageLabelsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "ShowHomeButton" /t REG_DWORD /d 1 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenPuaEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "SleepingTabsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PinBrowserEssentialsToolbarButton" /t REG_DWORD /d 0 /f
		reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PerformanceDetectorEnabled" /t REG_DWORD /d 0 /f
	:: Ask user to cleanup disk
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Disk Cleanup will launch. Please select all of the files that you would like to delete and click on OK.', 'Disk Cleanup', 'OK', 'Information')"
    powershell -Command "Start-Process cleanmgr -Verb RunAs -Wait"
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Your computer will now restart. I Recommend you run the User-Optimiser on this computer system after your system has finished restarting.', 'System Optimisation Complete', 'OK', 'Information')"
    shutdown -t 0 -r
) else (
    :: Informing the user that script is aborted
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('System Optimisation Aborted.', 'Warning', 'OK', 'Warning')"
)
