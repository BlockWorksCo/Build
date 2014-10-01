

VBoxManage dhcpserver remove --netname "HostInterfaceNetworking-vboxnet0"
VBoxManage hostonlyif create
VBoxManage hostonlyif ipconfig "vboxnet0" --ip 172.16.250.1 --netmask 255.255.255.0
VBoxManage dhcpserver add --ifname vboxnet0 --ip 172.16.250.1 --netmask 255.255.255.0 --lowerip 172.16.250.100 --upperip 172.16.250.200
VBoxManage dhcpserver modify --ifname vboxnet0 --enable


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
