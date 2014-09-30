




rem
rem User configurables.
rem
set BLOCKWORKS_BUILDVM_USERNAME=blockworks
set BLOCKWORKS_BUILDVM_IP=172.18.250.100
set BLOCKWORKS_BASE=c:\BlockWorks

set BLOCKWORKS_BUILD_BASE=%BLOCKWORKS_BASE%/Build
set BLOCKWORKS_PLATFORM_BASE=%BLOCKWORKS_BASE%/Platform

set BLOCKWORKS_BUILDVM_USERHOST=%BLOCKWORKS_BUILDVM_USERNAME%@%BLOCKWORKS_BUILDVM_IP%


rem
rem Derive the correct path from the user configurables.
rem *NOTE: Make sure that host-specific paths come *before* Common paths to allow us to 
rem reuse the Common code while still have the ability to override for Host specifics.
rem
set PATH=%BLOCKWORKS_BUILD_BASE%\Common;%PATH%
set PATH=%BLOCKWORKS_BUILD_BASE%\%BLOCKWORKS_BUILD_HOSTTYPE%;%PATH%



