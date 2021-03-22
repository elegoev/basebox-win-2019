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

# disable windows auto update
# sc.exe config wuauserv start=disabled

Write-Host -ForegroundColor Blue "################################"
Write-Host -ForegroundColor Blue "# >>>> end standard.ps1         "
Write-Host -ForegroundColor Blue "################################"

