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
:: Print Script Title
echo [94m-----System_Settings_Optimiser-----[0m
echo.
echo [94mCreated By: Hackboto Tech Tips[0m
echo.
echo [94mVersion: 1.2.6[0m
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
echo By proceeding, you agree take full responsibility for any potential data loss and all of the above.
echo.
echo Additional terms and conditions can be found at https://hackbototechtips.github.io/legal.html
echo.
:: Prompting the user to confirm if they want to proceed with system reg changes.
set /p continue=Do you accept the terms and conditions? (If you accept, changes will make to your computer.) (Y/N): 

:: Checking user input to decide whether to proceed with cleanup or not
if /i "%continue%"=="Y" (
    :: Begin cleanup script
   	::Begin reg changes
		reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v AllowInputPersonalization /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v LimitEnhancedDiagnosticDataWindowsAnalytics /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v LimitDumpCollection /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v LimitDiagnosticLogCollection /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DisableTelemetryOptInSettingsUx /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DisableTelemetryOptInChangeNotification /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowWUfBCloudProcessing /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowUpdateComplianceProcessing /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowDeviceNameInTelemetry /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowDesktopAnalyticsProcessing /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowCommercialDataPipeline /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableCloudOptimizedContent" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableConsumerAccountStateContent" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsSearch" /v "EnableDynamicContentInWSB" /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Policies\Microsoft\Dsh" /v AllowNewsAndInterests /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\WOW6432Node\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Feeds" /v EnableFeeds /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Chat" /v ChatIcon /t REG_DWORD /d 3 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "TyposquattingCheckerEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ResolveNavigationErrorsUseWebService" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "AlternateErrorPagesEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "NetworkPredictionOptions" /t REG_DWORD /d 2 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SiteSafetyServicesEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "UserFeedbackAllowed" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SearchSuggestEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ConfigureDoNotTrack" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "LocalProvidersEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "WebWidgetAllowed" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v MicrosoftEdgeInsiderPromotionEnabled /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowMicrosoftRewards /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AllowGamesMenu /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowAcrobatSubscriptionButton /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ShowRecommendationsEnabled /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Policies\Microsoft\Windows\Appx" /v "AllowAutomaticAppArchiving" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AllowUntriggeredNetworkTrafficOnSettingsPage" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d 2 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsInkWorkspace" /v "AllowSuggestedAppsInWindowsInkWorkspace" /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableLockScreenAppNotifications" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "QuickSearchShowMiniMenu" /t REG_DWORD /d 0 /f
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
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSd" /t REG_DWORD /d 1 /f
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d 0 /f
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d 0 /f
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 0 /f
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d 0 /f
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
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "ShowGlobalPrompts" /t REG_DWORD /d 0 /f
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store" /v "UserLocationOverridePrivacySetting" /t REG_DWORD /d 0 /f
		reg add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d 0 /f
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f
		reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\ImproveInkingAndTyping" /v "Value" /t REG_DWORD /d 0 /f
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CPSS\Store\AdvertisingInfo" /v "Value" /t REG_DWORD /d 0 /f
		reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d 0 /f
		reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowShortenedDateTime" /t REG_DWORD /d 0 /f
		reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.BackupReminder" /v "Enabled" /t REG_DWORD /d 0 /f
		REG Add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableSearchBoxSuggestions /T REG_DWORD /D 1 /F
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageAllowedBackgroundTypes" /t REG_DWORD /d 3 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageHideDefaultTopSites" /t REG_DWORD /d 1 /f
		reg add "HKLM\Software\Policies\Microsoft\Edge" /v "AllowSurfGame" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SpotlightExperiencesAndRecommendationsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageBingChatEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "RelatedMatchesCloudServiceEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PromotionalTabsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageContentEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageQuickLinksEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "WalletDonationEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "UploadFromPhoneEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "TabServicesEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SplitScreenEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ShowHistoryThumbnails" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SharedLinksEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SearchInSidebarEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PromptForDownloadLocation" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PictureInPictureOverlayEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeWalletEtreeEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeWalletCheckoutEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeOpenInSidebarEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeFollowEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "Edge3PSerpTelemetryEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "DiagnosticData" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "DefaultShareAdditionalOSRegionSetting" /t REG_DWORD /d 2 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "DefaultBrowserSettingsCampaignEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "CryptoWalletEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ComposeInlineEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "AIGenThemesEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "AccessibilityImageLabelsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ShowHomeButton" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenPuaEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SleepingTabsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PinBrowserEssentialsToolbarButton" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PerformanceDetectorEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "LocalBrowserDataShareEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v SettingsPageVisibility /t REG_SZ /d "hide:home" /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d 1 /f
		reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f
		reg add "HKLM\System\CurrentControlSet\Control\Remote Assistance" /v "fAllowFullControl" /t REG_DWORD /d 0 /f
		reg add "HKLM\SYSTEM\ControlSet001\Services\Ndu" /v "Start" /t REG_DWORD /d 2 /f
		reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d 30 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v UploadUserActivities /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v PreventHandwritingDataSharing /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v CEIPEnable /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Messaging" /v AllowMessageSync /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableUAR /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" /v DisableAIDataAnalysis /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v Value /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v Value /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeEnhanceImagesEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "QuickViewOfficeFilesEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeCollectionsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "FamilySafetySettingsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PinningWizardAllowed" /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Policies\Microsoft\Edge" /v "UrlDiagnosticDataEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Policies\Microsoft\Edge" /v "DNSInterceptionChecksEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Policies\Microsoft\Edge" /v "ImageEditorServiceEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Policies\Microsoft\Edge" /v "NewPDFReaderEnabled" /t REG_DWORD /d 1 /f
		reg add "HKLM\Software\Policies\Microsoft\Edge" /v "ShowPDFDefaultRecommendationsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d 1 /f
		reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d 1 /f
		reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AllowOnlineTips" /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "ForceDisableModeChangeAnimation" /t REG_DWORD /d 1 /f
		REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge\Recommended" /v "HideInternetExplorerRedirectUXForIncompatibleSitesEnabled" /t REG_DWORD /d 1 /f
		REG ADD "HKLM\Software\Policies\Microsoft\Edge\Recommended" /v "NewTabPagePrerenderEnabled" /t REG_DWORD /d 1 /f
		REG ADD "HKLM\Software\Policies\Microsoft\Edge\Recommended" /v "NewTabPageSearchBox" /t REG_SZ /d "redirect" /f
		REG ADD "HKLM\Software\Policies\Mozilla\Firefox\FirefoxHome" /v TopSites /t REG_DWORD /d 0 /f
		REG ADD "HKLM\Software\Policies\Mozilla\Firefox\FirefoxHome" /v Pocket /t REG_DWORD /d 0 /f
		REG ADD "HKLM\Software\Policies\Mozilla\Firefox" /v DisableTelemetry /t REG_DWORD /d 1 /f
		REG ADD "HKLM\Software\Policies\Mozilla\Firefox" /v DisableFirefoxStudies /t REG_DWORD /d 1 /f
		REG ADD "HKLM\Software\Policies\Mozilla\Firefox" /v SearchSuggestEnabled /t REG_DWORD /d 0 /f
		REG ADD "HKLM\Software\Policies\Mozilla\Firefox" /v DisablePocket /t REG_DWORD /d 1 /f
		REG ADD "HKLM\Software\Policies\Mozilla\Firefox\Preferences" /v browser.slowStartup.notificationDisabled /t REG_DWORD /d 1 /f
		REG ADD "HKLM\Software\Policies\Mozilla\Firefox\Preferences" /v browser.urlbar.suggest.history /t REG_DWORD /d 0 /f
		REG ADD "HKLM\Software\Policies\Mozilla\Firefox\Preferences" /v browser.urlbar.suggest.openpage /t REG_DWORD /d 0 /f
		REG ADD "HKLM\Software\Policies\Mozilla\Firefox\Preferences" /v places.history.enabled /t REG_DWORD /d 0 /f
		REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v DisableDefaultBrowserAgent /t REG_DWORD /d 1 /f
		REG ADD "HKCU\Software\Mozilla\NativeMessagingHosts\Firefox" /v IsDefaultBrowser /t REG_DWORD /d 1 /f
		REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v DontCheckDefaultBrowser /t REG_DWORD /d 1 /f
		REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxSuggest" /v ImproveSuggest /t REG_DWORD /d 0 /f
		REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxSuggest" /v SponsoredSuggestions /t REG_DWORD /d 0 /f
		REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\FirefoxSuggest" /v WebSuggestions /t REG_DWORD /d 0 /f
		REG ADD "HKLM\SOFTWARE\Policies\Mozilla\Firefox\ContentAnalysis" /v Enabled /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Policies\Mozilla\Firefox" /v ShowHomeButton /t REG_DWORD /d 1 /f
		reg add "HKLM\Software\Policies\Mozilla\Firefox" /v PromptForDownloadLocation /t REG_DWORD /d 1 /f
		reg add "HKLM\Software\Policies\Mozilla\Firefox\DNSOverHTTPS" /v Enabled /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Policies\Mozilla\Firefox\DNSOverHTTPS" /v Locked /t REG_DWORD /d 1 /f
		reg add "HKLM\Software\Policies\Mozilla\Firefox\FirefoxHome" /v Locked /t REG_DWORD /d 1 /f
		reg add "HKLM\Software\Policies\Mozilla\Firefox\FirefoxSuggest" /v Locked /t REG_DWORD /d 1 /f
		reg add "HKLM\Software\Policies\Google\Chrome" /v BatterySaverModeAvailability /t REG_DWORD /d 0 /f
		reg add "HKLM\Software\Policies\Google\Chrome" /v NetworkPredictionOptions /t REG_DWORD /d 2 /f
	::Disable services
		schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable
		schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable
		schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable
		schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
		schtasks /change /tn "\Microsoft\Windows\Feedback\Siuf\DmClient" /disable
		schtasks /change /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /disable
		schtasks /change /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable
		schtasks /change /tn "\Microsoft\Windows\Application Experience\MareBackup" /disable
		schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /disable
		schtasks /change /tn "\Microsoft\Windows\Application Experience\PcaPatchDbTask" /disable
		schtasks /end /tn "\Microsoft\Windows\Maps\MapsUpdateTask"
		schtasks /change /tn "\Microsoft\Windows\Maps\MapsUpdateTask" /disable
		schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor"
		schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable
		schtasks /end /tn "\Microsoft\Windows\Device Information\Device"
		schtasks /change /tn "\Microsoft\Windows\Device Information\Device" /disable
		schtasks /end /tn "\Microsoft\Windows\Device Information\Device User"
		schtasks /change /tn "\Microsoft\Windows\Device Information\Device User" /disable
		schtasks /change /tn "\Microsoft\Windows\DiagTrack\diagtrack" /disable
		schtasks /change /tn "\Microsoft\Windows\dmwappushsvc\dmwappushservice" /disable
		schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable
		sc config DiagTrack start= disabled
		schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable
		schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser Exp" /Disable
		net stop PcaSvc
		sc config PcaSvc start= disabled

:: Device specific spyware	
	:: HP Spyware Disable
		net stop HpTouchpointAnalyticsService
		sc config HpTouchpointAnalyticsService start=disabled
		net stop HPSysInfoCap
		sc config HPSysInfoCap start=disabled
		net stop HPNetworkCap
		sc config HPNetworkCap start=disabled
		net stop HPDiagsCap
		sc config HPDiagsCap start=disabled
		net stop HPAppHelperCap
		sc config HPAppHelperCap start=disabled
	::AMD Spyware disable
		net stop AUEPLauncher
		sc config AUEPLauncher start= disabled
:: Google Chrome debloat
	::AI and bloat remove
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "CreateThemesSettings" /t REG_DWORD /d 2 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DevToolsGenAiSettings" /t REG_DWORD /d 2 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "GenAILocalFoundationalModelSettings" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "HelpMeWriteSettings" /t REG_DWORD /d 2 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "HistorySearchSettings" /t REG_DWORD /d 2 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "TabOrganizerSettings" /t REG_DWORD /d 2 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "AllowDinosaurEasterEgg" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "HideWebStoreIcon" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "NTPCardsVisible" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "NTPMiddleSlotAnnouncementVisible" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PromotionalTabsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PromotionsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PromptForDownloadLocation" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ShoppingListEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "SideSearchEnabled" /t REG_DWORD /d 0 /f


	::Privacy
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "AdditionalDnsQueryTypesEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "AdsSettingForIntrusiveAdsSites" /t REG_DWORD /d 2 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "BuiltInDnsClientEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DNSInterceptionChecksEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "FeedbackSurveysEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "GoogleSearchSidePanelEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "HistoryClustersVisible" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "MediaRecommendationsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "MetricsReportingEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PaymentMethodQueryEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ProfileReauthPrompt" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "SearchSuggestEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "SharedClipboardEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PasswordSharingEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PrivacySandboxAdMeasurementEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PrivacySandboxAdTopicsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PrivacySandboxPromptEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PrivacySandboxSiteEnabledAdsEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "SafeBrowsingExtendedReportingEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "SafeBrowsingProtectionLevel" /t REG_DWORD /d 1 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "SafeBrowsingSurveysEnabled" /t REG_DWORD /d 0 /f
		reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "SpellCheckServiceEnabled" /t REG_DWORD /d 0 /f
::Office
	::Teaching cards and bloat
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "SLRToggleReplaceTeachingCalloutID" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "UseTighterSpacingTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "RibbonOverflowTeachingCalloutID" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "CloudSettingsSyncTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "Olk_SearchBoxTitleBar_SLR_Sequence" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "SearchIncludeDeletedItems" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "AutoAltText1" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "ThreadedCommentsCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "PowerQueryAsDefaultGetDataTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "AutoSaveToggleOnExcel" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "FocusedInboxTeachingCallout_7" /t REG_DWORD /d 1 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "AutocreateTeachingCallout_MoreLocations" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "GroupAdvancedSettingsTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "GroupUnreadCountTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "StatusBarFormulasTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "PreviewPlaceUpdate" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "Word_TextPredictor_InCanvas" /t REG_DWORD /d 1 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "SuggestedRepliesCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "AccCheckerStatusBarTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "MeetingAllowForwardTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "AutoSaveToggleOnWord" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "VersionHistoryRenameCalloutWord" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "AutoSaveFirstSaveWord" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "AccCheckerPaneTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "HubBarTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "LineageDiscoverabilityTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "PinAppTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "LineageFilterTeachingCallout" /t REG_DWORD /d 1 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "OneNoteQuickNoteToolbarToggleButtonCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "ComingSoonTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "Search.TopResults" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "DataVisualizerRibbonTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "ExportToWordProcessTabTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "PPT_RecordingTab_Callout_Sequence" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "PPT_RecordTab_Callout_Sequence" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "EnhancedLocationWellTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "AutoSaveFirstSaveExcel" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "a79db66d-e74d-41e8-a138-558044fae3cb" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "CreatePivotTableFromPowerBITeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "Word_CanvasContextual_v3" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "SyncProgressUITeachingCalloutA" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "AutoSaveToggleOnPPT" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "AutoSaveFirstSavePPT" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "VersionHistoryRenameCalloutPPT" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "TabbedPanesTeachingUI" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "MessageExtensionsTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "UseToDoAppTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "PPT_RecordVideoPresentation_Callout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "PPT_InsertCameo_Callout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\TeachingCallouts" /v "NavigationPaneTeachingCallout" /t REG_DWORD /d 2 /f
		reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Preferences" /v "UseNewOutlook" /t REG_DWORD /d 0 /f
		reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\General" /v "HideNewOutlookToggle" /t REG_DWORD /d 1 /f
		reg add "HKCU\Software\Microsoft\Office\16.0\Common\Privacy\SettingsStore\Anonymous" /v "OptionalConnectedExperiencesNoticeVersion" /t REG_DWORD /d 2 /f
		reg add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "PreferCloudSaveLocations" /t REG_DWORD /d 0 /f
		reg add "HKCU\Software\Microsoft\Office\16.0\Common\Toolbars\Outlook" /v "QuickAccessToolbarStyleExplorer" /t REG_DWORD /d 16 /f
		reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\Preferences" /v "EnableSingleLineRibbon" /t REG_DWORD /d 0 /f
		reg add "HKCU\Software\Microsoft\Office\16.0\OneNote\General" /v "IsImmersiveModeLandscape" /t REG_DWORD /d 0 /f
:: Uninstall bloat
	:: Copilot, and other Bloat
		powershell.exe -command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -like '*Microsoft.Copilot*'} | Remove-AppxPackage -AllUsers -ErrorAction Continue"
		powershell.exe -command "Get-AppxPackage -AllUsers *Microsoft.549981C3F5F10* | Remove-AppxPackage -AllUsers -ErrorAction Continue"
		powershell.exe -command "Get-AppxPackage -AllUsers *Clipchamp* | Remove-AppxPackage -AllUsers -ErrorAction Continue"

:: Tells user that their PC will now restart to apply changes
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Your computer will now restart. I Recommend you run the User_Settings_Optimser on this computer system after your system on any additional user accounts that are present.', 'System Settings Optimisation Complete', 'OK', 'Information')"
	shutdown -t 0 -r
) else (
    :: Informing the user that script is aborted
    powershell -Command "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('System Settings Optimisation Aborted.', 'Warning', 'OK', 'Warning')"
)
