# set variables
$BUILDDIR = "./vagrant_build_dir"
$VAGRANTFILETMPL = "./packer/files-prov/template/Vagrantfile"
$SSHKEY = "./packer/files-prov/ssh/administrators_authorized_keys"
$OUTPUTFILE = "package.box"
$APPLICATIONFILE = "installed-application.md"

# create build directory
New-Item -ItemType "directory" -Path "$BUILDDIR" | Out-Null

# copy Vagrantfile template
Copy-Item "$VAGRANTFILETMPL" -Destination "$BUILDDIR"

# copy ssh key
Copy-Item "$SSHKEY" -Destination "$BUILDDIR"

# save location
Push-Location

# start vagrant in build directory
cd $BUILDDIR
vagrant up

# export vagrant box
vagrant halt
vagrant package --output $OUTPUTFILE

# destroy vagrant
vagrant destroy -f

# restore location
Pop-Location

# copy installed-application.md
Copy-Item "$BUILDDIR/$APPLICATIONFILE" -Destination "."

# run packer for vagrant virtualbox provider
# packer build packer-virtualbox.json 

# delete build directory
# Remove-Item "$BUILDDIR" -Recurse