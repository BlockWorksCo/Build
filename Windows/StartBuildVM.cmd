

VBoxManage sharedfolder add "BlockWorksBuild" --name "BLOCKWORKS_BASE" --hostpath "c:\\BlockWorks"
VBoxManage sharedfolder add "BlockWorksBuild" --name "HOSTROOT" --hostpath "c:\\"
VBoxManage startvm "BlockWorksBuild" --type headless

VBoxManage hostonlyif ipconfig "VirtualBox Host-Only Ethernet Adapter" --ip 172.16.250.2 --netmask 255.255.255.0

