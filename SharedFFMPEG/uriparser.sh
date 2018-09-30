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
_package='uriparser-0.8.4.tar.bz2'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
cd $INSTALL_SDIR/
rm -rf uriparser*

yum -y install doxygen graphviz-devel graphviz expat expat-devel
wget -c $SOURCE_URL/$_package
tar -xvjf $_package
cd uriparser-0.8.4/
./configure  --prefix=/usr/local/cpffmpeg --disable-test
make 
make install
ldconfig
echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
