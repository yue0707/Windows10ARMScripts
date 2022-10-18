<#
 # File: Win 11 Optimizer
 # Created Date: Tuesday, October 18th 2022, 6:35:19 pm
 # HISTORY:
 # Date      	By	    Comments
 # ----------	---  	----------------------------------------------------------
 # 2022-10-18	C.V.	Created
 #>

 # Set variables
 
$services = @(
"DiagTrack",
"DusmSvc",
"LanmanWorkstation",
"WSearch",
"WpnService",
"LicenseManager",
"EventLog",
"TokenBroker",
"UsoSvc",
"TabletInputService",
"DPS",
"iphlpsvc",
"NcbService",
"Spooler",
"PcaSvc",
"LanmanServer",
"SysMain",
"lmhosts",
"Themes"
)

$action = Read-Host 'Please verify which option you wish to do. Enable or Disable?'
if ($action -like '*enable*' ) {
    $action = 'Enabled'
} elseif ($action -like '*disable*') {
    $action = 'Disabled'
}

# Start actions
foreach ($service in $services) {
    Set-Service -StartupType $action -Name $service
    Write-Host $service 'has been' $action
}

Write-Host 'Action confirmed: '$action
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon -Name Shell -Value C:\Program Files (x86)\Overwatch\_retail_\Overwatch.exe
Write-Host 'Now rebooting'
shutdown /r /t 0
