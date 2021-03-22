# delete application file
$AppFileName = '.\installed-application.md'
if (Test-Path $AppFileName) {
  Remove-Item $AppFileName
}

# delete vagrant directory
$VagrantDirName = '.\.vagrant'
if (Test-Path $VagrantDirName) {
  Remove-Item $VagrantDirName -Recurse
}


