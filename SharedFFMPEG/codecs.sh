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
_package='all-20071007.tar.bz2'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
codec_source=$_package

#install codecs
ldconfig
   cd $INSTALL_SDIR
echo "removing old source"
   rm -fr all* 
   wget $SOURCE_URL/$codec_source
   tar -xvjf $codec_source
   chown -R root.root all-20071007/
   mkdir -pv $INSTALL_DDIR/lib/codecs/
   cp -vrf all-20071007/* $INSTALL_DDIR/lib/codecs/
   chmod -R 755 /usr/local/cpffmpeg/lib/codecs/

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
