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
_package='flvtool2-1.0.6.tgz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
flvtool_source=$_package
#install flvtool
ldconfig
   cd $INSTALL_SDIR
echo "removing old source"
   rm -vrf flvtool*
   wget $SOURCE_URL/$flvtool_source
   tar -zxvf  $_package
   cd flvtool2-1.0.6/
   /usr/local/cpffmpeg/bin/ruby setup.rb config
   /usr/local/cpffmpeg/bin/ruby setup.rb setup
   /usr/local/cpffmpeg/bin/ruby setup.rb install
   ln -s /usr/local/cpffmpeg/bin/flvtool2 /usr/local/bin/flvtool2
   ln -s /usr/local/cpffmpeg/bin/flvtool2 /usr/bin/flvtool2
echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
