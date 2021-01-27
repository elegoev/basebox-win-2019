# set german language

$LANGUAGEFILE = "C:\files-prov\language\Microsoft-Windows-Server-Language-Pack_x64_de-de.cab"
$LANGUAGE = "de-ch"
$LOCAL = "de-ch"

# check language file
if (Test-Path "$LANGUAGEFILE") {

  # install language
  DISM /Online /Add-Package /Quiet /PackagePath:C:\files-prov\language\Microsoft-Windows-Server-Language-Pack_x64_de-de.cab 

  # set primary language
  Set-WinUILanguageOverride $LANGUAGE

  # set locale
  Set-WinSystemLocale $LOCAL
  
  # set display language
  Set-WinUserLanguageList $LOCAL -Force

  # set timezone
  Set-TimeZone -Id "Central European Standard Time"

} else {
    Write-Host "Language file $LANGUAGEFILE doesn't exists"
}


