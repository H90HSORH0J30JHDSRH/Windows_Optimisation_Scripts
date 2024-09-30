@echo off
:: Print Script Title
echo [94m-----User_Settings_Optimiser-----[0m
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
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Deny" /f
	reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d 0 /f
	reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowShortenedDateTime" /t REG_DWORD /d 0 /f
	reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.BackupReminder" /v "Enabled" /t REG_DWORD /d 0 /f
	REG ADD "HKCU\Software\Mozilla\NativeMessagingHosts\Firefox" /v IsDefaultBrowser /t REG_DWORD /d 1 /f
	REG Add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /V DisableSearchBoxSuggestions /T REG_DWORD /D 1 /F
	::Office
	::Teaching cards disable
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
:: Informing the user that settings are applied
    powershell -WindowStyle Hidden -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; [System.Windows.Forms.MessageBox]::Show('Your user account settings were successfully optimised.', 'Successful', 'OK', 'Information')" > nul

) else (
    :: Informing the user that cleanup is aborted
    powershell -WindowStyle Hidden -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null; [System.Windows.Forms.MessageBox]::Show('Settings optimisation aborted.', 'Aborted', 'OK', 'Warning')" > nul
)
