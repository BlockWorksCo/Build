


@set THISDIR=%CD%
@set DRIVELETTER=%CD:~0,1%
echo %DRIVELETTER%
@set THISDIRWITHPROPERSLASHES=%THISDIR:\=/%
@set THISDIRFROMHOSTROOT=%THISDIRWITHPROPERSLASHES:~2,100000%

@set BLOCKWORKS_PLATFORM_BASEWITHPROPERSLASHES=%BLOCKWORKS_PLATFORM_BASE:\=/%
@set BLOCKWORKS_PLATFORM_BASEFROMHOSTROOT=%BLOCKWORKS_PLATFORM_BASEWITHPROPERSLASHES:~2,100000%


@set TARGET_PLATFORM_BASE=/HostRoot/%DRIVELETTER%%BLOCKWORKS_PLATFORM_BASEFROMHOSTROOT%
@set TARGET_CWD=/HostRoot/%DRIVELETTER%%THISDIRFROMHOSTROOT%

vagrant ssh -c "export BLOCKWORKS_PLATFORM_BASE=%TARGET_PLATFORM_BASE% && cd %TARGET_CWD% && make %* "



