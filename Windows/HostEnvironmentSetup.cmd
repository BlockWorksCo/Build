

rem
rem Argument is the target platform STM32/MSP320/Win32/Linux
rem
set BLOCKWORKS_TARGET_PLATFORM=%1
set BLOCKWORKS_HOST_PLATFORM=Windows



rem
rem User configurables.
rem
set BLOCKWORKS_BUILD_HOSTTYPE=Windows
set BLOCKWORKS_BUILD_BASE=c:\BlockWorks\Build
set BLOCKWORKS_PLATFORM_BASE=c:\BlockWorks\Platform


rem
rem Derive the correct path from the user configurables.
rem *NOTE: Make sure that host-specific paths come *before* Common paths to allow us to 
rem reuse the Common code while still have the ability to override for Host specifics.
rem
set PATH=%BLOCKWORKS_BUILD_BASE%\Common;%PATH%
set PATH=%BLOCKWORKS_BUILD_BASE%\%BLOCKWORKS_BUILD_HOSTTYPE%;%PATH%
set VAGRANT_CWD=%BLOCKWORKS_BUILD_BASE%\Common
set VAGRANT_VAGRANTFILE=%BLOCKWORKS_BUILD_BASE%/Common/Vagrantfile



