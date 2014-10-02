



VBoxManage sharedfolder remove "BlockWorksBuild" --name "BLOCKWORKS_BASE"
VBoxManage sharedfolder add "BlockWorksBuild" --name "BLOCKWORKS_BASE" --hostpath "c:\\BlockWorks"

VBoxManage sharedfolder remove "BlockWorksBuild" --name "HOSTROOT_C"
VBoxManage sharedfolder add "BlockWorksBuild" --name "HOSTROOT_C" --hostpath "c:\\"

VBoxManage sharedfolder remove "BlockWorksBuild" --name "HOSTROOT_G"
VBoxManage sharedfolder add "BlockWorksBuild" --name "HOSTROOT_G" --hostpath "g:\\"

VBoxManage sharedfolder remove "BlockWorksBuild" --name "HOSTROOT_I"
VBoxManage sharedfolder add "BlockWorksBuild" --name "HOSTROOT_I" --hostpath "i:\\"

VBoxManage sharedfolder remove "BlockWorksBuild" --name "HOSTROOT_J"
VBoxManage sharedfolder add "BlockWorksBuild" --name "HOSTROOT_J" --hostpath "j:\\"

VBoxManage sharedfolder remove "BlockWorksBuild" --name "HOSTROOT_R"
VBoxManage sharedfolder add "BlockWorksBuild" --name "HOSTROOT_R" --hostpath "r:\\"

VBoxManage startvm "BlockWorksBuild" --type headless

BuildVMssh "sudo /BlockWorks/Build/Common/MountHostRoot.py"
