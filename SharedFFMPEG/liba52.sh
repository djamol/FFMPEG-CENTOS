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
_package='a52dec-0.7.4.tar.gz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
cd $INSTALL_SDIR/
rm -rf a52dec-0.7.4*
wget $SOURCE_URL/$_package
tar -xvzf $_package
cd a52dec-0.7.4/
./bootstrap
ARCh=`arch`
#64bit processor bug fix
if [[ $ARCh == 'x86_64' ]];then
	./configure --prefix=$INSTALL_DDIR --enable-shared 'CFLAGS=-fPIC'	
        
else
        ./configure --prefix=$INSTALL_DDIR  --enable-shared
fi

make -j$cpu
make install

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
