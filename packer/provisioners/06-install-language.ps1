Write-Host -ForegroundColor Blue "###################################"
Write-Host -ForegroundColor Blue "# >>>> start install-language      "
Write-Host -ForegroundColor Blue "###################################"


$LANGUAGEFILE = "C:\files-prov\language\Microsoft-Windows-Server-Language-Pack_x64_de-de.cab"
$LANGUAGE = "de-ch"
$LOCAL = "de-ch"

# check language file
if (Test-Path "$LANGUAGEFILE") {

  # install language
  Write-Host -ForegroundColor Green "###################################"
  Write-Host -ForegroundColor Green "# >>>> install language pack       "
  Write-Host -ForegroundColor Green "###################################"
  DISM /Online /Add-Package /Quiet /NoRestart /PackagePath:C:\files-prov\language\Microsoft-Windows-Server-Language-Pack_x64_de-de.cab 

} else {
    Write-Host "Language file $LANGUAGEFILE doesn't exists"
}

Write-Host -ForegroundColor Blue "###################################"
Write-Host -ForegroundColor Blue "# >>>> end install-language        "
Write-Host -ForegroundColor Blue "###################################"


