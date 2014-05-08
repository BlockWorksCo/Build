#!/bin/bash

#
#
#
set -e # Exit script immediately on first error.
set -x # Print commands and their arguments as they are executed.

#
# Tools
#
apt-get update
apt-get install -y software-properties-common
apt-get install -y pkg-config
apt-get install -y mercurial
apt-get install -y git
apt-get install -y subversion
apt-get install -y unzip
apt-get install -y flex bison libgmp3-dev libmpfr-dev libncurses5-dev libmpc-dev autoconf texinfo libtool libftdi-dev libusb-1.0-0-dev zlib1g zlib1g-dev python-yaml
apt-get install -y python-software-properties


#
# Native Linux development.
#
apt-get install -y build-essential
apt-get install -y clang
apt-get install gdbserver
apt-get install gdb

#
# MSP430 development
#
apt-get install -y binutils-msp430
apt-get install -y gcc-msp430
apt-get install -y gdb-msp430
apt-get install -y msp430-libc
apt-get install -y msp430mcu
apt-get install -y mspdebug


#
# Win32 development
#
apt-get install -y mingw32



#
# STM32 development.
#
apt-add-repository -y ppa:dsanda/ppa
apt-get update
apt-get install gcc-arm-none-eabi

cd ~vagrant
git clone https://github.com/texane/stlink.git
cd stlink
./autogen.sh
./configure
make
make install

sudo chmod a+s `which st-util`



#
# AVR/Arduino/ATMega deveopment
#
apt-get install -y gcc-avr
apt-get install -y gdb-avr
apt-get install -y binutils-avr
apt-get install -y simulavr
apt-get install -y avr-libc
apt-get install -y avrdude
apt-get install -y arduino-core

#
# RaspberryPi toolchain.
#
apt-get install git rsync cmake ia32-libs-multiarch
git clone git://github.com/raspberrypi/tools.git
export PATH=$PATH:$HOME/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin


#
#
#
echo export BLOCKWORKS_BUILD=/BlockWorks >> ~vagrant/.bash_profile
echo export HOSTROOT=/HostRoot >> ~vagrant/.bash_profile
echo ls=\'ls -la\' >> ~vagrant/.bash_profile
echo export PATH=~/tools/arm-bcm2708/arm-bcm2708-linux-gnueabi/bin\:\$PATH >> ~vagrant/.bash_profile


chmod -R a+rw ~vagrant/*

#
# setup 'build' user with ssh auth from host.
#





