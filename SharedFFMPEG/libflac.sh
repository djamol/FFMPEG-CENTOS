#!/bin/bash
# Amol Patil
#Email US :support@djamol.com
 # WEB@DjAmol.com
RED='\033[01;31m'
RESET='\033[0m'
INSTALL_SDIR='/root/djamolDEV/ffmpeg'
SOURCE_URL='https://github.com/djamol/offline/raw/master/ffmpeg/9'
INSTALL_DDIR='/usr/local/cpffmpeg'
export cpu=`cat "/proc/cpuinfo" | grep "processor"|wc -l`
export TMPDIR=$HOME/tmp
_package='flac-1.3.2.tar.xz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
cd $INSTALL_SDIR/
rm -rf flac*
wget $SOURCE_URL/$_package
tar -xvJf $_package
cd flac-1.3.2/
./configure --prefix=$INSTALL_DDIR

make -j$cpu
make install
ldconfig
echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
