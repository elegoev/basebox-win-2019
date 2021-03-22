Write-Host -ForegroundColor Blue "################################"
Write-Host -ForegroundColor Blue "# >>>> start update-windows.ps1 "
Write-Host -ForegroundColor Blue "################################"

# # Install PS Windows Update Module
# Get-PackageProvider -name nuget -force
# Install-Module PSWindowsUpdate -confirm:$false -force
# Get-WindowsUpdate -MicrosoftUpdate -install -IgnoreUserInput -acceptall -AutoReboot | Out-File -filepath 'c:\windowsupdate.log' -append

Write-Host -ForegroundColor Blue "################################"
Write-Host -ForegroundColor Blue "# >>>> end update-windows.ps1   "
Write-Host -ForegroundColor Blue "################################"
