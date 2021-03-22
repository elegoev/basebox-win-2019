Write-Host -ForegroundColor Blue "##############################################"
Write-Host -ForegroundColor Blue "# >>>> start install-virtualbox-additions.ps1 "
Write-Host -ForegroundColor Blue "##############################################"

# install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# install chocolatey GUI
choco install -y chocolateygui

# install virtualbox guest addations
choco install -y virtualbox-guest-additions-guest.install

#cmd /c "$env:SYSTEMROOT\Temp\virtualbox\VBoxWindowsAdditions.exe" /S /with_wddm /xres=1024 /yres=768

Write-Host -ForegroundColor Blue "##############################################"
Write-Host -ForegroundColor Blue "# >>>> end install-virtualbox-additions.ps1   "
Write-Host -ForegroundColor Blue "##############################################"
