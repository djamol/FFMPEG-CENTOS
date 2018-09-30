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
_package='libao-1.2.0.tar.gz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
cd $INSTALL_SDIR/
rm -rf libao*
wget $SOURCE_URL/$_package
tar -xvzf $_package
cd libao-1.2.0/
./configure --prefix=$INSTALL_DDIR
make -j$cpu
make install
ldconfig
echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
