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
_package='amrwb-11.0.0.0.tar.bz2'
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
amrwb=$_package
ldconfig
   cd $INSTALL_SDIR
echo "removing old source"
   rm -vrf amrwb*
   wget $SOURCE_URL/$amrwb
   tar -xvjf $_package
   cd amrwb-11.0.0.0/
   ./configure --prefix=$INSTALL_DDIR
make -j$cpu
make install

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2