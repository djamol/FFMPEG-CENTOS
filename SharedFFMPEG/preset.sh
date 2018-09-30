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
_package='presets.tar.gz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
cd $INSTALL_SDIR/
rm -rf presets*
wget $SOURCE_URL/$_package
tar -xvzf $_package
cp -vrf presets/* /usr/local/cpffmpeg/share/ffmpeg/
cp -vrf presets/* /usr/share/ffmpeg/

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
