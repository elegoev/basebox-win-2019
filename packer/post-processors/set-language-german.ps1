Write-Host -ForegroundColor Blue "###################################"
Write-Host -ForegroundColor Blue "# >>>> start set-language-german   "
Write-Host -ForegroundColor Blue "###################################"

$LANGUAGEFILE = "C:\files-prov\language\Microsoft-Windows-Server-Language-Pack_x64_de-de.cab"
$LANGUAGE = "de-ch"
$LOCAL = "de-ch"

# check language file
if (Test-Path "$LANGUAGEFILE") {

  # set primary language
  Write-Host -ForegroundColor Blue "###################################"
  Write-Host -ForegroundColor Blue "# >>>> set primary language        "
  Write-Host -ForegroundColor Blue "###################################"
  Set-WinUILanguageOverride $LANGUAGE

  # set locale
  Write-Host -ForegroundColor Blue "###################################"
  Write-Host -ForegroundColor Blue "# >>>> set local                   "
  Write-Host -ForegroundColor Blue "###################################"
  Set-WinSystemLocale $LOCAL
  
  # set display language
  Write-Host -ForegroundColor Blue "###################################"
  Write-Host -ForegroundColor Blue "# >>>> set display language       "
  Write-Host -ForegroundColor Blue "###################################"
  Set-WinUserLanguageList $LOCAL -Force

  # set timezone
  Write-Host -ForegroundColor Blue "###################################"
  Write-Host -ForegroundColor Blue "# >>>> set time zone               "
  Write-Host -ForegroundColor Blue "###################################"
  Set-TimeZone -Id "Central European Standard Time"

} else {
    Write-Host "Language file $LANGUAGEFILE doesn't exists"
}

Write-Host -ForegroundColor Blue "###################################"
Write-Host -ForegroundColor Blue "# >>>> end set-language-german     "
Write-Host -ForegroundColor Blue "###################################"


