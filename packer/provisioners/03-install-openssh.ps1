Write-Host -ForegroundColor Blue "################################"
Write-Host -ForegroundColor Blue "# >>>> start install-openssh.sh "
Write-Host -ForegroundColor Blue "################################"

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

Write-Host -ForegroundColor Blue "################################"
Write-Host -ForegroundColor Blue "# >>>> end install-openssh.sh   "
Write-Host -ForegroundColor Blue "################################"
