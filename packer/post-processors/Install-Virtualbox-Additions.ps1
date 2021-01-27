# original: http://codegists.com/snippet/powershell/install-virtualbox-additionsps1_brennanfee_powershell
$ErrorActionPreference = "Stop"
Write-Host "Installing guest additions..."
cmd /c "$env:ALLUSERSPROFILE\Chocolatey\choco.exe" install -y 7zip.commandline
if (-Not (Test-Path "$env:SYSTEMROOT\Temp\VBoxGuestAdditions.iso")) {
 Write-Host "Downloading"
 $virtualBoxVersion="5.2.10"
 (New-Object System.Net.WebClient).DownloadFile("http://download.virtualbox.org/virtualbox/$virtualBoxVersion/VBoxGuestAdditions_$virtualBoxVersion.iso", "$env:SYSTEMROOT\Temp\VBoxGuestAdditions.iso")
}
Write-Host "Unzip the ISO"
cmd /c "$env:ALLUSERSPROFILE\chocolatey\bin\7z.exe" x "$env:SYSTEMROOT\Temp\VBoxGuestAdditions.iso" "-o$env:SYSTEMROOT\Temp\virtualbox"
Write-Host "Install the cert"
# cmd /c "$env:SYSTEMROOT\System32\certutil.exe" -addstore -f "TrustedPublisher" "$env:SYSTEMROOT\Temp\virtualbox\cert\oracle-vbox.cer"
# cmd /c for %%i in ($env:SYSTEMROOT\Temp\virtualbox\cert\vbox*.cer) do "$env:SYSTEMROOT\Temp\virtualbox\cert\VBoxCertUtil" add-trusted-publisher %%i --root %%i
cmd /c "$env:SYSTEMROOT\Temp\virtualbox\cert\VBoxCertUtil" add-trusted-publisher "$env:SYSTEMROOT\Temp\virtualbox\cert\vbox-sha1.cer" --root "$env:SYSTEMROOT\virtualbox\cert\vbox-sha1.cer"
cmd /c "$env:SYSTEMROOT\Temp\virtualbox\cert\VBoxCertUtil" add-trusted-publisher "$env:SYSTEMROOT\Temp\virtualbox\cert\vbox-sha256.cer" --root "$env:SYSTEMROOT\virtualbox\cert\vbox-sha256.cer"
cmd /c "$env:SYSTEMROOT\Temp\virtualbox\cert\VBoxCertUtil" add-trusted-publisher "$env:SYSTEMROOT\Temp\virtualbox\cert\vbox-sha256-r3.cer" --root "$env:SYSTEMROOT\virtualbox\cert\vbox-sha256-r3.cer"

Write-Host "Install the Guest Additions"
cmd /c "$env:SYSTEMROOT\Temp\virtualbox\VBoxWindowsAdditions.exe" /S /with_wddm /xres=1024 /yres=768
Write-Host "Clean up"
Remove-Item "$env:SYSTEMROOT\Temp\VBoxGuestAdditions.iso"
Remove-Item "$env:SYSTEMROOT\Temp\virtualbox\*" -recurse