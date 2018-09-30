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
_package='subversion-1.2.0.tar.gz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
subversion=$_package
ldconfig
cd $INSTALL_SDIR
echo "removing old source"
   rm -vrf $INSTALL_SDIR/subversion*
if [ -e "/etc/yum.conf" ];then
	yum -y install subversion
fi
if [ -e "/usr/bin/svn" ]; then
	ln -sf /usr/bin/svn /usr/local/cpffmpeg/bin/svn
else
   	wget $SOURCE_URL/$_package
   	tar -zxvf $_package
   	cd subversion-1.2.0/
   	./configure --prefix=$INSTALL_DDIR 
	make -j$cpu
	make install
fi
echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
