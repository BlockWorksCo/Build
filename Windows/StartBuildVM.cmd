

VBoxManage sharedfolder add "BlockWorksBuild" --name "BLOCKWORKS_BASE" --hostpath "c:\\BlockWorks"

VBoxManage sharedfolder add "BlockWorksBuild" --name "HOSTROOT_C" --hostpath "c:\\"
VBoxManage sharedfolder add "BlockWorksBuild" --name "HOSTROOT_G" --hostpath "g:\\"
VBoxManage sharedfolder add "BlockWorksBuild" --name "HOSTROOT_I" --hostpath "i:\\"
VBoxManage sharedfolder add "BlockWorksBuild" --name "HOSTROOT_J" --hostpath "j:\\"
VBoxManage sharedfolder add "BlockWorksBuild" --name "HOSTROOT_R" --hostpath "r:\\"

VBoxManage startvm "BlockWorksBuild" --type headless

VBoxManage hostonlyif ipconfig "VirtualBox Host-Only Ethernet Adapter" --ip 172.16.250.2 --netmask 255.255.255.0

