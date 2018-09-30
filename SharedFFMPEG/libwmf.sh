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
_package='libwmf-0.2.8.4.tar.gz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
libwmf=$_package
ldconfig
cd $INSTALL_SDIR
sleep 2
echo "removing old source"
   rm -vrf libwmf*
   wget $SOURCE_URL/$libwmf
   tar -xvzf  $libwmf
   cd libwmf-0.2.8.4/
   ./configure --prefix=$INSTALL_DDIR --with-freetype=/usr/local/cpffmpeg
make -j$cpu
make install

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
