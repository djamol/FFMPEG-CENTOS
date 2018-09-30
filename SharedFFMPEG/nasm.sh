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
_package='nasm-2.13.02.tar.gz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
ldconfig
cd $INSTALL_SDIR
echo "Removing old source"
if [ -e "/etc/yum.conf" ];then
yum -y install nasm
fi
if [ -e "/usr/bin/nasm" ]; then
	ln -sf /usr/bin/nasm  /usr/local/cpffmpeg/bin/nasm
else
	rm -vrf nasm*
	wget $SOURCE_URL/$_package
	tar -xvzf $_package
	cd  nasm-2.13.02/
	./configure --prefix=/usr/local/cpffmpeg/ 
	make -j$cpu
	make install
	ln -sf /usr/local/cpffmpeg/bin/nasm /usr/local/bin/nasm
fi
ldconfig
echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
