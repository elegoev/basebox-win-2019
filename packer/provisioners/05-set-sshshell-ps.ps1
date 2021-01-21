Write-Host -ForegroundColor Blue "###################################"
Write-Host -ForegroundColor Blue "# >>>> start set-sshshell-ps       "
Write-Host -ForegroundColor Blue "###################################"

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

Write-Host -ForegroundColor Blue "###################################"
Write-Host -ForegroundColor Blue "# >>>> end set-sshshell-ps         "
Write-Host -ForegroundColor Blue "###################################"

