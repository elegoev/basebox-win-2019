Write-Host -ForegroundColor Blue "#####################################"
Write-Host -ForegroundColor Blue "# >>>> start get-windows-version.ps1 "
Write-Host -ForegroundColor Blue "#####################################"

# get windows version
$application_file_path="c:\vagrant\installed-application.md"
$WINVER = [System.Environment]::OSVersion.Version
$CHOCOLATEY_VERSION = choco --version
Set-Content -Path $application_file_path -Value "# Installed application"
Add-Content -Path $application_file_path -Value "***"
Add-Content -Path $application_file_path -Value "> Windows Server 2019 Datacenter Evaluation 1809 17763.1457 ($WINVER) with OpenSSH"
Add-Content -Path $application_file_path -Value "> Chococlatey $CHOCOLATEY_VERSION"

Write-Host -ForegroundColor Blue "#####################################"
Write-Host -ForegroundColor Blue "# >>>> start get-windows-version.ps1 "
Write-Host -ForegroundColor Blue "#####################################"