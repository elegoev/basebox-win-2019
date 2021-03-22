# delete vagrant directory
$VagrantDirName = '.\.vagrant'
if (Test-Path $VagrantDirName) {
  Remove-Item $VagrantDirName -Recurse
}



