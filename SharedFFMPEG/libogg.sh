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
_package='libogg-1.3.3.tar.gz'
echo -e $RED"Installation of $_package ....... started"$RESET
libogg_source=$_package
ldconfig
    cd $INSTALL_SDIR
echo "removing old source"
   	rm -vrf libogg*
   	wget $SOURCE_URL/$libogg_source
   	tar -xvzf $_package
   	cd libogg-1.3.3/
	./configure --prefix=$INSTALL_DDIR
	make -j$cpu
	make install

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
