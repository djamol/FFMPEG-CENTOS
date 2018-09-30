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
_package='MPlayer-1.3.0.tar.xz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET

cd $INSTALL_SDIR/
rm -rf mplayer*
wget $SOURCE_URL/$_package
tar -xvJf $_package
#/usr/local/cpffmpeg/bin/svn  checkout  svn://svn.mplayerhq.hu/mplayer/trunk mplayer
#cd mplayer/
cd MPlayer-1.3.0/
./configure --prefix=$INSTALL_DDIR  --codecsdir=$INSTALL_DDIR/lib/codecs/   \
		--extra-cflags=-I/usr/local/cpffmpeg/include/ --extra-ldflags=-L/usr/local/cpffmpeg/lib \
		--with-freetype-config=/usr/local/cpffmpeg/bin/freetype-config   --yasm=/usr/local/cpffmpeg/bin/yasm --disable-gui
make -j$cpu
make install
cp -f etc/codecs.conf $INSTALL_DDIR/etc/mplayer/codecs.conf
ln -sf /usr/local/cpffmpeg/bin/mplayer /usr/local/bin/mplayer
ln -sf /usr/local/cpffmpeg/bin/mplayer /usr/bin/mplayer
ln -sf /usr/local/cpffmpeg/bin/mencoder /usr/bin/mencoder
ln -sf /usr/local/cpffmpeg/bin/mencoder /usr/local/bin/mencoder

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
