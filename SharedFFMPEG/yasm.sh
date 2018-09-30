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
_package='yasm-1.3.0.tar.gz'
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
ldconfig
cd $INSTALL_SDIR
echo "Removing old source"
rm -vrf yasm*
wget $SOURCE_URL/$_package
tar -xvzf $_package
cd  yasm-1.3.0/
	./configure --prefix=/usr/local/cpffmpeg/ 
make -j$cpu
make install
ln -sf /usr/local/cpffmpeg/bin/yasm /usr/local/bin/yasm
ldconfig
echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
