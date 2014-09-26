

set BLOCKWORKS_BUILDVM_USERHOST=blockworks@192.168.56.1

VBoxManage.exe sharedfolder add "BlockWorksBuild" --name "BLOCKWORKS_BASE" --hostpath "C:\BlockWorks"
VBoxManage startvm "BlockWorksBuild" --type headless
rem ssh %BLOCKWORKS_BUILDVM_USERHOST% -C "source /BlockWorks/Build/Common/SetupProxy.sh"

