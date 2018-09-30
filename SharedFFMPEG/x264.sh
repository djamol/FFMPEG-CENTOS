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
_package='x264'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
ldconfig
cd $INSTALL_SDIR
echo "Removing old source"
   rm -vrf $INSTALL_SDIR/x264-snapshot*
	git clone git://git.videolan.org/x264.git
	cd x264/
	./configure  --prefix=$INSTALL_DDIR --enable-shared --disable-asm
	make -j$cpu
	make install

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
