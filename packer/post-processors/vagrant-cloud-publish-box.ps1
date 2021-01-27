# publish vagrant cloud box

# check vagrant cloud token for packer (PACKER_VAGRANTCLOUD_TOKEN)
if (-not (Test-Path env:PACKER_VAGRANTCLOUD_TOKEN)) { 
  Write-Host "Environment variable 'PACKER_VAGRANTCLOUD_TOKEN' not set" -ForegroundColor Red
} else {

  # vagrant publish parameter
  $BOX_NAMESPACE = "elegoev"
  $BOX_NAME = $env:IMAGE_NAME
  $BOX_VERSION = "1.0.0"
  $BOX_PROVIDER = "virtualbox"
  $BOX_FILE = "./vagrant_build_dir/package.box"
  $BOX_DESCRIPTION = "Beschreibung"
  $BOX_SHORTDESCRIPTION = ""
  $BOX_VERSIONDESCRIPTION = "Version Beschreibung"

  # show used token
  # Write-Host "token = $env:PACKER_VAGRANTCLOUD_TOKEN"

  # check if login user
  vagrant cloud auth login --token $env:PACKER_VAGRANTCLOUD_TOKEN
  if($?) {
    
    # check cloud image
    # vagrant cloud search $IMAGE_NAME --short | Select-String -Pattern 'elegoev/ubuntu-18.04'
    Write-Host "image name = $BOX_NAME"

    # create box
    vagrant cloud box create --no-private "$BOX_NAMESPACE/$BOX_NAME"

    # publish box
    vagrant cloud publish "$BOX_NAMESPACE/$BOX_NAME" "$BOX_VERSION" $BOX_PROVIDER $BOX_FILE `
      --description "$BOX_DESCRIPTION" `
      --short-description "$BOX_SHORTDESCRIPTION" `
      --release `
      --version-description "$BOX_VERSIONDESCRIPTION" `
      --force

  } else {
    Write-Host "Wrong vagrant cloud token configured" -ForegroundColor Red
  }

}





