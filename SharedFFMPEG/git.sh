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
_package='Git'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
if [ -e "/etc/yum.conf" ];then
	yum -y install git
fi
if [ -e "/usr/bin/git" ]; then
	mkdir -pv /usr/local/cpffmpeg/bin/
	ln -sf /usr/bin/git  /usr/local/cpffmpeg/bin/git
else
	cd $INSTALL_SDIR/
	rm -rf git*
	wget $SOURCE_URL/git-1.7.2.5.tar.gz
	tar -xzf git-1.7.2.5.tar.gz
	cd git-1.7.2.5/
	./configure --prefix=/usr/
	make -j$cpu
	make install
fi

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
