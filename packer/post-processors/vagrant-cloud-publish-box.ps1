# publish vagrant cloud box

# check vagrant cloud token for packer (PACKER_VAGRANTCLOUD_TOKEN)
if (-not (Test-Path env:PACKER_VAGRANTCLOUD_TOKEN)) { 
  Write-Host "Environment variable 'PACKER_VAGRANTCLOUD_TOKEN' not set" -ForegroundColor Red
} else {

  # set vagrant image name
  $BOX_NAME = $env:IMAGE_NAME
  $BOX_VERSION = "1.0.0"
  $DESCRIPTION = "Beschreibung"
  $VERSIONDESCRIPTION = "Version Beschreibung"
  $BOXFILE = "./vagrant_build_dir/package.box"

  # show used token
  # Write-Host "token = $env:PACKER_VAGRANTCLOUD_TOKEN"

  # check if login user
  vagrant cloud auth login --token $env:PACKER_VAGRANTCLOUD_TOKEN
  if($?) {
    
    # check cloud image
    # vagrant cloud search $IMAGE_NAME --short | Select-String -Pattern 'elegoev/ubuntu-18.04'
    Write-Host "image name = $BOX_NAME"

    # create box
    vagrant cloud box create --no-private "elegoev/$BOX_NAME"

    # publish box
    vagrant cloud publish "elegoev/win-2019" "1.0.0" virtualbox ./vagrant_build_dir/vb-win2019-1.0.0.box `
      --description "description" `
      --short-description "short description" `
      --release `
      --version-description "version-description" `
      --debug `
      --force

  } else {
    Write-Host "Wrong vagrant cloud token configured" -ForegroundColor Red
  }

}





