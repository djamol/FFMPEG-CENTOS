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
export LD_LIBRARY_PATH=/usr/local/cpffmpeg/lib:/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH
export LIBRARY_PATH=/usr/local/cpffmpeg/lib:/usr/lib:/usr/local/lib:$LIBRARY_PATH
export CPATH=/usr/local/cpffmpeg/include:/usr/include/:usr/local/include:$CPATH
#presetup
sh presetup.sh

if [ -e "/etc/yum.conf" ];then
        echo "Ensuring required RPM ........"
        yum install gcc gcc-c++ libgcc gd gd-devel gettext freetype \
        	freetype-devel ImageMagick ImageMagick-devel libjpeg* libjpeg-devel* \
        	libpng* libpng-devel* libstdc++* libstdc++-devel* libtiff* \
        	libtiff-devel* libtool*  libxml* libxml2* \
        	libxml2-devel* zlib* zlib-devel* automake* autoconf* samba-common* \
		ncurses-devel ncurses patch make apr-util giflib-devel giflib neon expat expat-devel alsa-lib -y
	rpm -e alsa-lib --nodeps
	export ARCH=$(arch)
fi

if [ -e "/etc/csf/csf.conf" ];then
	csf -x
fi


if [ -e "/etc/debian_version" ];then
	echo "Ensuring Debian packages ....."
	apt-get install gcc libgd-dev gettext libfreetype6 libfreetype6-dev libpng-dev libstdc++-dev \
		libtiff-dev libtool libxml2 libxml2-dev automake autoconf libncurses-dev ncurses-dev patch \
		make git subversion -y
fi
#Git client
sh git.sh

if [ -e "/usr/bin/git" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   Git client  installation Failed. Git is required for ffmpeg and mplayer . Please install it and run this script"$RESET
        echo " "
        echo " "
        exit
fi 

#Subversion client
mkdir -pv /usr/local/cpffmpeg/bin/
sh subversion.sh

if [ -e "/usr/local/cpffmpeg/bin/svn" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   Svn  client  installation Failed.Svn  is required for mplayer . Please install it and run this script"$RESET
        echo " "
        echo " "
        exit
fi 



#free type
sh freetype.sh
#libwmf
sh libwmf.sh
#ruby
sh ruby.sh
#flvtool
sh flvtool.sh
#lame
sh lame.sh
#codecs
sh codecs.sh
#libogg
sh libogg.sh
#libvorbis
sh libvorbis.sh
#vorbistools
sh vorbistools.sh
#libtheora
sh libtheora.sh
#fdk-aac
sh fdkaac.sh
# voaacenc
sh voaacenc.sh
# voamrwbenc
sh voamrwbenc.sh
# libspeex
sh libspeex.sh
# libflac
sh libflac.sh
# libao
sh libao.sh
# uriparser
sh uriparser.sh
# libxspf
#sh libxspf.sh
# liboggz
sh liboggz.sh
# libfishsound
#sh libfishsound.sh
# yamdi
sh yamdi.sh
#amrnb
sh amrnb.sh
#amrwb
sh amrwb.sh
#openamr
sh libopencoreamr.sh
#liba52
sh liba52.sh
#facc
sh facc.sh
#faad2
sh faad2.sh
#yasm
sh yasm.sh
#nasm
sh nasm.sh
#xvid
sh xvid.sh
#x264
sh x264.sh
#re2c
sh re2c.sh

sh acc.sh

#Mplayer
#sh mplayer.sh
#if [ -e "/usr/local/cpffmpeg/bin/mplayer" ]; then
#        echo " "
#else
#        echo " "
#        echo " "
#        echo -e $RED"   Mplayer installation Failed :( ,  please contact  professional support djamolgroup@gmail.com"$RESET
#        echo " "
#        echo " "
#        exit
#fi

#ffmpeg
sh ffmpeg.sh
if [ -e "/usr/local/cpffmpeg/bin/ffmpeg" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   FFMPEG installation Failed :( ,  please contact  professional support djamolgroup@gmail.com"$RESET
        echo " "
        echo " "
        exit
fi

# preset 
sh preset.sh
#Rebuilding Mplayer
sh mplayer.sh
if [ -e "/usr/local/cpffmpeg/bin/mplayer" ]; then
        echo " "
else
        echo " "
        echo " "
        echo -e $RED"   Mplayer installation Failed :( , please contact  professional support djamolgroup@gmail.com"$RESET
        echo " "
        echo " "
        exit
fi
#Mp4Boxh
sh mp4box.sh
#post
sh post.sh

