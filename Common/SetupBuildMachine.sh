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
apt-get install -y git
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
apt-get install -y gdbserver
apt-get install -y gdb

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
add-apt-repository -y ppa:terry.guo/gcc-arm-embedded
apt-get update
apt-get install -y gcc-arm-none-eabi
apt-get -o Dpkg::Options::="--force-overwrite"  install -y gdb-arm-none-eabi
apt-get install -y openocd

cd ~/
git clone http://github.com/texane/stlink.git
#curl -O http://BlockWorks.co/Downloads/stlink.zip
#unzip stlink.zip
cd stlink
chmod a+x ./autogen.sh
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
chmod -R a+rw ~/*
apt-get install -y git rsync cmake
cd ~
git clone http://github.com/raspberrypi/tools.git
export PATH=$PATH:$HOME/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin


#
# Setup paths.
#
echo export BLOCKWORKS_BUILD=/BlockWorks >> ~/.bash_profile
echo export HOSTROOT=/HostRoot >> ~/.bash_profile
echo ls=\'ls -la\' >> ~/.bash_profile
echo export PATH=~/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin\:\$PATH >> ~/.bash_profile


#
# setup 'build' user with ssh auth from host.
#





