<#
 # File: Win 11 Optimizer
 # Created Date: Tuesday, October 18th 2022, 6:35:19 pm
 # HISTORY:
 # Date      	By	    Comments
 # ----------	---  	----------------------------------------------------------
 # 2022-10-19	C.V.	Added further error handling measures
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

try {
    Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon -Name Shell -Value C:\Program Files (x86)\Overwatch\_retail_\Overwatch.exe
} catch {
    Write-Host 'Unable to set item property for Overwatch.exe. Please enter path of Overwatch.exe file (ex. C:\:\Program Files (x86)\Overwatch\_retail_\Overwatch.exe)'
    $path = Read-Host 'Full Directory Path: '

}

try {
    Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon -Name Shell -Value $path
} catch {
    Write-Host 'Unable to set Item Property. Critical Error'
    return 1
    end
}

$action2 = Read-Host 'Are you prepared to shut down?'

if ($action2 -like '*yes*') {
    Write-Host 'Rebooting now...'
    shutdown /r /t 5
} elseif ($action2 -like '*no*') {
    Write-Host 'Please reboot manually then.'
}

