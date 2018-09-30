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
_package='gpac-0.7.0.tar.gz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
cd $INSTALL_SDIR/
rm -rf gpac*
if [ -e "/etc/yum.conf" ];then
yum -y install freetype-devel SDL-devel freeglut-devel
fi
wget -c $SOURCE_URL/$_package
tar -xvzf $_package
cd gpac-0.7.0/
./configure --prefix=/usr/local/cpffmpeg/ --extra-cflags=-I/usr/local/cpffmpeg/include/ \
                --extra-ldflags=-L/usr/local/cpffmpeg/lib  --disable-wx 
make 
make install
ln -sf /usr/local/cpffmpeg/bin/MP4Box /usr/local/bin/MP4Box
ln -sf /usr/local/cpffmpeg/bin/MP4Box /usr/bin/MP4Box
echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
