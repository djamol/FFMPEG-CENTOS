		 
#		 error//--enable-libfaac --enable-libvorbis
		 
		 
		 
# --enable-libfdk-aac   --enable-libfreetype --enable-libopus  --enable-libvpx
INSTALL_SDIR='/root/djamolDEV/ffmpeg'
SOURCE_URL='https://github.com/djamol/offline/raw/master/ffmpeg/9'
INSTALL_DDIR='/usr/local/cpffmpeg'

#libfdk_aac  
#AAC audio encoder. 
# Requires ffmpeg to be configured with --enable-libfdk-aac (and --enable-nonfree if you also included --enable-gpl). 
cd $INSTALL_SDIR
curl -o  fdk-aac.tar.gz $SOURCE_URL/fdk-aac.tar.gz;
tar xvzf fdk-aac.tar.gz;
cd fdk-aac
autoreconf -fiv
./configure --prefix="/usr/local/cpffmpeg" --enable-shared
make
make install
make distclean

#libopus
#Opus audio decoder and encoder.
#Requires ffmpeg to be configured with --enable-libopus.

#Ogg bitstream library. Required by libtheora and libvorbis.
#libvorbis
#Vorbis audio encoder. Requires libogg.


#libvpx
#VP8/VP9 video encoder.
#Requires ffmpeg to be configured with --enable-libvpx.


# ./configure --prefix=/usr/local/cpffmpeg --enable-shared \
# --enable-nonfree --enable-gpl --enable-pthreads  \
# --enable-libopencore-amrnb  --enable-decoder=liba52 \
# --enable-libopencore-amrwb    --enable-libmp3lame --enable-libtheora \
# --enable-libx264  --enable-libxvid --extra-cflags=-I/usr/local/cpffmpeg/include/ \
# --extra-ldflags=-L/usr/local/cpffmpeg/lib  --enable-version3 --extra-version=syslint \
# --enable-libfdk-aac   --enable-libfreetype 