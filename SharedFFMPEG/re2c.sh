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
_package='re2c-1.0.3.tar.gz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
ldconfig
cd $INSTALL_SDIR
echo "Removing old source"
   rm -vrf re2c*
   wget $SOURCE_URL/$_package
   tar -xvzf $_package
   cd re2c-1.0.3/
./configure --prefix=$INSTALL_DDIR

make -j$cpu
make install
ln -s /usr/local/cpffmpeg/bin/re2c /usr/local/bin/re2c
echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
