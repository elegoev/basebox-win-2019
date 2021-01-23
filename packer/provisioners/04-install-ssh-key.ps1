Write-Host -ForegroundColor Blue "################################"
Write-Host -ForegroundColor Blue "# >>>> start install-ssh-key.sh "
Write-Host -ForegroundColor Blue "################################"

# copy file
Write-Host -ForegroundColor Green "################################"
Write-Host -ForegroundColor Green "# >>>> create ssh key           "
Write-Host -ForegroundColor Green "################################"
Copy-Item C:\Vagrant\administrators_authorized_keys C:\ProgramData\ssh\administrators_authorized_keys

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

Write-Host -ForegroundColor Blue "################################"
Write-Host -ForegroundColor Blue "# >>>> end install-ssh-key.sh   "
Write-Host -ForegroundColor Blue "################################"

