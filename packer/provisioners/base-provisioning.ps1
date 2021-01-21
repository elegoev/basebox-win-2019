Write-Host -ForegroundColor Blue "################################"
Write-Host -ForegroundColor Blue "# >>>> standard provisioning    "
Write-Host -ForegroundColor Blue "################################"

# allow ICMPv4
Write-Host -ForegroundColor Green "################################"
Write-Host -ForegroundColor Green "# >>>> allow ICMPv4             "
Write-Host -ForegroundColor Green "################################"
New-NetFirewallRule -Name 'ICMPv4' `
                    -DisplayName 'ICMPv4' `
                    -Description 'Allow ICMPv4' `
                    -Profile Any `
                    -Direction Inbound `
                    -Action Allow `
                    -Protocol ICMPv4 `
                    -Program Any `
                    -LocalAddress Any `
                    -RemoteAddress Any 

# get windows version
$application_file_path="/vagrant/installed-application.md"
$WINVER = [System.Environment]::OSVersion.Version
Remove-Item $application_file_path
Set-Content -Path $application_file_path -Value "# Installed application"
Add-Content -Path $application_file_path -Value "***"
Add-Content -Path $application_file_path -Value "> Windows $WINVER"


# show icons
## ==============================================
## Show Desktop Icons
## ==============================================

$ErrorActionPreference = "SilentlyContinue"
If ($Error) {$Error.Clear()}
$RegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
If (Test-Path $RegistryPath) {
	$Res = Get-ItemProperty -Path $RegistryPath -Name "HideIcons"
	If (-Not($Res)) {
		New-ItemProperty -Path $RegistryPath -Name "HideIcons" -Value "0" -PropertyType DWORD -Force | Out-Null
	}
	$Check = (Get-ItemProperty -Path $RegistryPath -Name "HideIcons").HideIcons
	If ($Check -NE 0) {
		New-ItemProperty -Path $RegistryPath -Name "HideIcons" -Value "0" -PropertyType DWORD -Force | Out-Null
	}
}
$RegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons"
If (-Not(Test-Path $RegistryPath)) {
	New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "HideDesktopIcons" -Force | Out-Null
	New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons" -Name "NewStartPanel" -Force | Out-Null
}
$RegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
If (-Not(Test-Path $RegistryPath)) {
	New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons" -Name "NewStartPanel" -Force | Out-Null
}
If (Test-Path $RegistryPath) {
	## -- My Computer
	$Res = Get-ItemProperty -Path $RegistryPath -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
	If (-Not($Res)) {
		New-ItemProperty -Path $RegistryPath -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Value "0" -PropertyType DWORD -Force | Out-Null
	}
	$Check = (Get-ItemProperty -Path $RegistryPath -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}")."{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
	If ($Check -NE 0) {
		New-ItemProperty -Path $RegistryPath -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Value "0" -PropertyType DWORD -Force | Out-Null
	}
	## -- Control Panel
	$Res = Get-ItemProperty -Path $RegistryPath -Name "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"
	If (-Not($Res)) {
		New-ItemProperty -Path $RegistryPath -Name "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" -Value "0" -PropertyType DWORD -Force | Out-Null
	}
	$Check = (Get-ItemProperty -Path $RegistryPath -Name "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}")."{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}"
	If ($Check -NE 0) {
		New-ItemProperty -Path $RegistryPath -Name "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" -Value "0" -PropertyType DWORD -Force | Out-Null
	}
	## -- User's Files
	$Res = Get-ItemProperty -Path $RegistryPath -Name "{59031a47-3f72-44a7-89c5-5595fe6b30ee}"
	If (-Not($Res)) {
		New-ItemProperty -Path $RegistryPath -Name "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" -Value "0" -PropertyType DWORD -Force | Out-Null
	}
	$Check = (Get-ItemProperty -Path $RegistryPath -Name "{59031a47-3f72-44a7-89c5-5595fe6b30ee}")."{59031a47-3f72-44a7-89c5-5595fe6b30ee}"
	If ($Check -NE 0) {
		New-ItemProperty -Path $RegistryPath -Name "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" -Value "0" -PropertyType DWORD -Force | Out-Null
	}
	## -- Recycle Bin
	$Res = Get-ItemProperty -Path $RegistryPath -Name "{645FF040-5081-101B-9F08-00AA002F954E}"
	If (-Not($Res)) {
		New-ItemProperty -Path $RegistryPath -Name "{645FF040-5081-101B-9F08-00AA002F954E}" -Value "0" -PropertyType DWORD -Force | Out-Null
	}
	$Check = (Get-ItemProperty -Path $RegistryPath -Name "{645FF040-5081-101B-9F08-00AA002F954E}")."{645FF040-5081-101B-9F08-00AA002F954E}"
	If ($Check -NE 0) {
		New-ItemProperty -Path $RegistryPath -Name "{645FF040-5081-101B-9F08-00AA002F954E}" -Value "0" -PropertyType DWORD -Force | Out-Null
	}
	## -- Network
	$Res = Get-ItemProperty -Path $RegistryPath -Name "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"
	If (-Not($Res)) {
		New-ItemProperty -Path $RegistryPath -Name "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" -Value "0" -PropertyType DWORD -Force | Out-Null
	}
	$Check = (Get-ItemProperty -Path $RegistryPath -Name "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}")."{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}"
	If ($Check -NE 0) {
		New-ItemProperty -Path $RegistryPath -Name "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" -Value "0" -PropertyType DWORD -Force | Out-Null
	}
}
If ($Error) {$Error.Clear()}

# install openssh
# install ssh server
Write-Host -ForegroundColor Green "################################"
Write-Host -ForegroundColor Green "# >>>> install openssh          "
Write-Host -ForegroundColor Green "################################"
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# get sshd status
Write-Host -ForegroundColor Green "################################"
Write-Host -ForegroundColor Green "# >>>> get ssh status           "
Write-Host -ForegroundColor Green "################################"
Get-Service sshd
Get-Service ssh-agent

# configure service
Write-Host -ForegroundColor Green "################################"
Write-Host -ForegroundColor Green "# >>>> configure ssh service    "
Write-Host -ForegroundColor Green "################################"
Set-Service -Name sshd -StartupType Automatic
Set-Service -Name ssh-agent -StartupType Automatic

# start service
Write-Host -ForegroundColor Green "################################"
Write-Host -ForegroundColor Green "# >>>> start ssh service        "
Write-Host -ForegroundColor Green "################################"
Start-Service sshd
Start-Service ssh-agent

# install ssh key

# copy file
Write-Host -ForegroundColor Green "################################"
Write-Host -ForegroundColor Green "# >>>> create ssh key           "
Write-Host -ForegroundColor Green "################################"
Copy-Item C:\Vagrant\files\ssh\administrators_authorized_keys C:\ProgramData\ssh\administrators_authorized_keys

# set permisssion
Write-Host -ForegroundColor Green "################################"
Write-Host -ForegroundColor Green "# >>>> ssh key set permission   "
Write-Host -ForegroundColor Green "################################"
$acl = Get-Acl C:\ProgramData\ssh\administrators_authorized_keys
$acl.SetAccessRuleProtection($true, $false)
$administratorsRule = New-Object system.security.accesscontrol.filesystemaccessrule("Administrators","FullControl","Allow")
$systemRule = New-Object system.security.accesscontrol.filesystemaccessrule("SYSTEM","FullControl","Allow")
$acl.SetAccessRule($administratorsRule)
$acl.SetAccessRule($systemRule)
$acl | Set-Acl

# set ssh shell

# set powershell as default ssh shell
Write-Host -ForegroundColor Green "###################################"
Write-Host -ForegroundColor Green "# >>>> set powershell as ssh shell "
Write-Host -ForegroundColor Green "###################################"
New-ItemProperty -Path HKLM:\SOFTWARE\OpenSSH `
                 -Name DefaultShell `
                 -Value C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe `
                 -PropertyType string

# set powershell prompt
Write-Host -ForegroundColor Green "###################################"
Write-Host -ForegroundColor Green "# >>>> set powershell prompt       "
Write-Host -ForegroundColor Green "###################################"
$hostname = hostname.exe
if (!(Test-Path -Path $PROFILE.AllUsersAllHosts)) {
    New-Item -ItemType File -Path $PROFILE.AllUsersAllHosts -Force
}
Add-Content -Path $PROFILE.AllUsersAllHosts -Value "function global:prompt{'PS $hostname>\'}"

