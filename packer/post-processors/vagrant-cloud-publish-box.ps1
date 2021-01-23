# publish vagrant cloud box

# check vagrant cloud token for packer (PACKER_VAGRANTCLOUD_TOKEN)
if (-not (Test-Path env:PACKER_VAGRANTCLOUD_TOKEN)) { 
  Write-Host "Environment variable 'PACKER_VAGRANTCLOUD_TOKEN' not set" -ForegroundColor Red
} else {

  # set vagrant image name
  $IMAGE_NAME = $env:IMAGE_NAME
  $IMAGE_VERSION = "test-001"
  $DESCRIPTION = "Beschreibung"
  $VERSIONDESCRIPTION = "Version Beschreibung"

  # show used token
  # Write-Host "token = $env:PACKER_VAGRANTCLOUD_TOKEN"

  # check if login user
  vagrant cloud auth login --token $env:PACKER_VAGRANTCLOUD_TOKEN
  if($?) {
    
    # check cloud image
    # vagrant cloud search $IMAGE_NAME --short | Select-String -Pattern 'elegoev/ubuntu-18.04'
    Write-Host "image name = $IMAGE_NAME"

    # create box
    vagrant cloud box create --no-private "elegoev/$IMAGE_NAME"

    # publish box
    vagrant cloud publish --box-version $IMAGE_VERSION `
                          --description $DESCRIPTION `
                          --version-description $VERSIONDESCRIPTION `
                          elegoev/$IMAGE_NAME $IMAGE_VERSION virtualbox

  } else {
    Write-Host "Wrong vagrant cloud token configured" -ForegroundColor Red
  }

}





