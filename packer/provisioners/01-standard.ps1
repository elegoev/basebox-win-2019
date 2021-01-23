Write-Host -ForegroundColor Blue "################################"
Write-Host -ForegroundColor Blue "# >>>> start standard.ps1       "
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

Write-Host -ForegroundColor Blue "################################"
Write-Host -ForegroundColor Blue "# >>>> end standard.ps1         "
Write-Host -ForegroundColor Blue "################################"

# get windows version
$application_file_path="C:\Vagrant\installed-application.md"
$WINVER = [System.Environment]::OSVersion.Version
Set-Content -Path $application_file_path -Value "# Installed application"
Add-Content -Path $application_file_path -Value "***"
Add-Content -Path $application_file_path -Value "> Windows $WINVER"

