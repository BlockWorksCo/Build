Build/Block
===========

A standard mechanism for working with embedded software toolchains.

See (BlockWorks.co)[http://BlockWorks.co] for details.

To setup:
* Run "source $PLATFORM/HostEnvironmentSetup" on *NIX systems or "Windows\HostEnvironmentSetup.cmd" on windows.
* Set up http_proxy and https_proxy variables as appropriate for your environment. (http_proxy=http://user:pw@your.proxy.server:8080)
* run "vagrant up"

The Build VM will be provisioned and run allowing you to perform the following:

* "Build PLATFORM=$PLATFORM clean all" for PLATFORM in MSP430/STM32/Linux/Win32.
* Run "Debug" for a GDB proxy to the dev board attached to the VM via USB.




Dependencies:
* nose
* pexpect/winpexpect on Windows (https://bitbucket.org/geertj/winpexpect/wiki/Home).


