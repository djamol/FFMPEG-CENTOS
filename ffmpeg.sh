# MOre details https://trac.ffmpeg.org/wiki/CompilationGuide/Centos
#By DjAmol Group www.djamol.com
#git clone http://github.com/djamol/DjAmol-VPS-INSTALLER.git; cd DjAmol-VPS-INSTALLER
#  Shared Disable in this bash script
yum -y remove libvpx libogg libvorbis libtheora libx264 x264 ffmpeg ffmpeg-devel
yum update


SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
#echo $SCRIPTPATH

mkdir $SCRIPTPATH/log
BUILDDIR=$SCRIPTPATH/log/
BUILDFILE=$RANDOM.txt
BUILD=$BUILDDIR$BUILDFILE

echo $BUILD
mkdir ~/ffmpeg_sources
date +"%r" >> $BUILD;echo "Start :  Yasm" >> $BUILD
#Yasm
#Yasm is an assembler used by x264 and FFmpeg. 
cd ~/ffmpeg_sources

if git clone --depth 1 http://github.com/yasm/yasm.git; then
echo -e "\033[33;32m Git Clone yasm Success ";
else
echo -e "\033[33;35m Failed Git Clone yasm But Import From github start";curl -o  yasm.tar.gz http://104.223.87.83/ffmpeg/yasm.tar.gz;
tar xvzf yasm.tar.gz;
fi

cd yasm
./autogen.sh
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"
make
make install
make distclean

date +"%r" >> $BUILD;echo "Start :  libx264" >> $BUILD
#libx264
#H.264 video encoder. See the H.264 Encoding Guide for more information and usage examples.
#Requires ffmpeg to be configured with --enable-gpl --enable-libx264
cd ~/ffmpeg_sources

if  git clone https://github.com/qupai/x264; then
echo -e "\033[33;32m Git Clone x264 Success ";
else
echo -e "\033[33;35m Failed Git Clone x264 But Import From github start";curl -o  x264.tar.gz http://104.223.87.83/ffmpeg/x264.tar.gz;
tar xvzf x264.tar.gz;
fi

cd x264
PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static
make
make install
make distclean


yum -y install hg
yum -y install cmake

date +"%r" >> $BUILD;echo "Start :  libx265" >> $BUILD

#libx265
#H.265/HEVC video encoder. See the H.265 Encoding Guide for more information and usage examples.
#Requires ffmpeg to be configured with --enable-gpl --enable-libx265. 
cd ~/ffmpeg_sources
#wget https://bitbucket.org/multicoreware/x265/downloads/x265_1.9.tar.gz; tar xvzf x265_1.9.tar.gz; cd ~/ffmpeg_sources/x265_1.9/build/linux
if hg clone https://bitbucket.org/multicoreware/x265; then
echo -e "\033[33;32m bitbucket Clone x265 Success ";
else
echo -e "\033[33;35m Failed Git Clone x265 But Import From github start";curl -o  x265_1.9.tar.gz http://104.223.87.83/ffmpeg/x265_1.9.tar.gz;
tar xvzf x265_1.9.tar.gz;mv x265_1.9 x265
fi
cd ~/ffmpeg_sources/x265/build/linux
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED:bool=off ../../source
make
make install

date +"%r" >> $BUILD;echo "Start :  libfdk_aac" >> $BUILD

#libfdk_aac  
#AAC audio encoder. 
# Requires ffmpeg to be configured with --enable-libfdk-aac (and --enable-nonfree if you also included --enable-gpl). 
cd ~/ffmpeg_sources
if git clone --depth 1 http://git.code.sf.net/p/opencore-amr/fdk-aac; then
echo -e "\033[33;32m Git Clone fdk-acc Success ";
else
echo -e "\033[33;35m Failed Git Clone fdk-acc But Import From github start";curl -o  fdk-aac.tar.gz http://104.223.87.83/ffmpeg/fdk-aac.tar.gz;
tar xvzf fdk-aac.tar.gz;
fi
cd fdk-aac
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean


date +"%r" >> $BUILD;echo "Start :  libmp3lame" >> $BUILD

#libmp3lame

#MP3 audio encoder.
#Requires ffmpeg to be configured with --enable-libmp3lame.
cd ~/ffmpeg_sources
curl -o  lame-3.99.5.tar.gz http://104.223.87.83/ffmpeg/lame-3.99.5.tar.gz
tar xzvf lame-3.99.5.tar.gz
cd lame-3.99.5
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --disable-shared --enable-nasm
make
make install
make distclean

date +"%r" >> $BUILD;echo "Start :  libopus" >> $BUILD
#libopus
#Opus audio decoder and encoder.
#Requires ffmpeg to be configured with --enable-libopus.

cd ~/ffmpeg_sources

if git clone http://git.opus-codec.org/opus.git; then
echo -e "\033[33;32m Git opus  Success ";
else
echo -e "\033[33;35m Failed Git Clone opus But Import From github start";curl -o  opus.tar.gz http://104.223.87.83/ffmpeg/opus.tar.gz;
tar xvzf opus.tar.gz;
fi


cd opus
autoreconf -fiv
./autogen.sh
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean


date +"%r" >> $BUILD;echo "Start :  libogg" >> $BUILD
#libogg

#Ogg bitstream library. Required by libtheora and libvorbis.

cd ~/ffmpeg_sources
curl -o  libogg-1.3.2.tar.gz http://104.223.87.83/ffmpeg/libogg-1.3.2.tar.gz;

tar xzvf libogg-1.3.2.tar.gz
cd libogg-1.3.2
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean

date +"%r" >> $BUILD;echo "Start :  libvorbis" >> $BUILD
#libvorbis
#Vorbis audio encoder. Requires libogg.
#Requires ffmpeg to be configured with --enable-libvorbis. 
cd ~/ffmpeg_sources
curl -o  libvorbis-1.3.4.tar.gz http://104.223.87.83/ffmpeg/libvorbis-1.3.4.tar.gz;
tar xzvf libvorbis-1.3.4.tar.gz
cd libvorbis-1.3.4
LDFLAGS="-L$HOME/ffmeg_build/lib" CPPFLAGS="-I$HOME/ffmpeg_build/include" ./configure --prefix="$HOME/ffmpeg_build" --with-ogg="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean


date +"%r" >> $BUILD;echo "Start :  libvpx" >> $BUILD
#libvpx
#VP8/VP9 video encoder.
#Requires ffmpeg to be configured with --enable-libvpx.

cd ~/ffmpeg_sources


if git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git; then
echo -e "\033[33;32m Git libvpx  Success ";
else
echo -e "\033[33;35m Failed Git Clone libvpx But Import From github start";curl -o  libvpx.tar.gz http://104.223.87.83/ffmpeg/libvpx.tar.gz;
tar xvzf libvpx.tar.gz;
fi

cd libvpx
./configure --prefix="$HOME/ffmpeg_build" --disable-examples
make
make install
make clean


date +"%r" >> $BUILD;echo "Start :  FFmpeg" >> $BUILD
#FFmpeg

cd ~/ffmpeg_sources

if git clone http://source.ffmpeg.org/git/ffmpeg.git; then
echo -e "\033[33;32m Git ffmpeg  Success ";
else
echo -e "\033[33;35m Failed Git Clone ffmpeg But Import From github start";curl -o  ffmpeg.tar.gz http://104.223.87.83/ffmpeg/ffmpeg.tar.gz;
tar xvzf ffmpeg.tar.gz;
fi



cd ffmpeg
#PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib" --bindir="$HOME/bin" --pkg-config-flags="--static" --enable-gpl --enable-nonfree --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265

#PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib" --bindir="$HOME/bin" --pkg-config-flags="--static" --enable-gpl --enable-nonfree --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx --enable-libx264 --enable-libx265 --disable-shared
PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" \
--extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
--bindir="$HOME/bin" --pkg-config-flags="--static" --enable-gpl --enable-nonfree \
--enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libopus \
--enable-libvorbis --enable-libvpx --enable-libx264  --disable-shared
#remove --enable-libx265 error new version of x265 ERROR: x265 not found using pkg-config
make
make install
make distclean
hash -r








date +"%r" >> $BUILD;echo "Start :  php-ffmpeg" >> $BUILD
## install php-ffmpeg
#yum -y install php-gd php-devel
#tar -xjf ffmpeg-php*
#cd ffmpeg-php*
#phpize
#./configure && make
#make test
#make install
#yum install nano
#echo -e 'if error ffmpeg_movie.c\nnano ffmpeg_movie.c\nrow 311: list_entry *le to zend_rsrc_list_entry *le\nrow 346: list_entry new_le to zend_rsrc_list_entry new_le\n#row 360: hashkey_length+1, (void *)&new_le, sizeof(list_entry), to hashkey_length+1, (void *)&new_le,sizeof(zend_rsrc_list_entry),
#';

#nano /etc/php.ini
#edit php.ini
#And Put this two line
#[ffmpeg]
#extension=ffmpeg.so
#And restart httpd/apache
#echo -e '[ffmpeg]\nextension=ffmpeg.so' >> /local/lib/php.ini
#service apache2 graceful

date +"%r" >> $BUILD;echo "done : service apache2 graceful" >> $BUILD
