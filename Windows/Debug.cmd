




@set THISDIR=%CD%
@set THISDIRWITHPROPERSLASHES=%THISDIR:\=/%
@set THISDIRFROMHOSTROOT=%THISDIRWITHPROPERSLASHES:~2,100000%

@set BLOCKWORKS_PLATFORM_BASEWITHPROPERSLASHES=%BLOCKWORKS_PLATFORM_BASE:\=/%
@set BLOCKWORKS_PLATFORM_BASEFROMHOSTROOT=%BLOCKWORKS_PLATFORM_BASEWITHPROPERSLASHES:~2,100000%

rem vagrant ssh -c "export BLOCKWORKS_PLATFORM_BASE=/HostRoot%BLOCKWORKS_PLATFORM_BASEFROMHOSTROOT% && cd /HostRoot%THISDIRFROMHOSTROOT% && make %* "
vagrant ssh -c "export BLOCKWORKS_PLATFORM_BASE=/HostRoot%BLOCKWORKS_PLATFORM_BASEFROMHOSTROOT% && cd /HostRoot%THISDIRFROMHOSTROOT% && arm-none-eabi-gdb %* "



