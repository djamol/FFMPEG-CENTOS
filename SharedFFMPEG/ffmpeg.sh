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
_package='FFMPEG'
clear
sleep 2
echo -e '
 ▒█░▒░▓█░█▒░▒▒█░█▓░▒░█▓   █████▒    ▓█ ▒█▓▓█▓ ██████ ▓████▒░█░      ░█████░▒████▓ ▓█████░ 
 ░▓ █▓▓█ ▓ ██▒█░▓░▓█░█▓   ▓▒  █▓    ▒█ ▒▓▓▓█▓ ▓░█▓▒█░▓▒  █▓ ▓       ░█░  ▓ ▒▓  ▓█ ▓▒▓█▒█▒ 
 ▒█▒█▓▓█░█▓▓█▒█▒█▓▓█▒█▓   █▓  █▓░▓░ ▓█ ██▒▒█▓░█▒█▓▒█░██  █▓░█▒  ░   ▒█▒ ░▓ ██  ██ █▓▓█░█▒ 
 ░█████▓ ██████ ▓█████░▓█ █████░░█████ █▓  █▓░█▒░░▒█ ▓████▒░█████▒█▓ █████ ▒████▓ █▓░▒░█▒ 
';
echo -e "$GREEN 
# Powered By DjAmol Group Inc         #
# Email : Support@djamol.com          #
# Website : www.djamol.com            #
# Copyright By PatilWeb.com           #
# IG:PatilWeb FB:PatilWeb TW:PatilWeb #
$RESET";

ffmpeg_source=$_package
ldconfig
echo -e $RED"Installation of $_package ....... started"$RESET
cd $INSTALL_SDIR
echo "Removing old source"
   rm -vrf ffmpeg*
   #wget $SOURCE_URL/$ffmpeg_source
   #tar -xvzf $ffmpeg_source
  git clone git://source.ffmpeg.org/ffmpeg.git ffmpeg 
   cd ffmpeg/
   ldconfig

  ./configure --prefix=$INSTALL_DDIR --enable-shared \
 --enable-nonfree --enable-gpl --enable-pthreads  \
 --enable-libopencore-amrnb  --enable-decoder=liba52 \
 --enable-libopencore-amrwb    --enable-libmp3lame --enable-libtheora \
 --enable-libx264  --enable-libxvid --extra-cflags=-I/usr/local/cpffmpeg/include/ \
 --extra-ldflags=-L/usr/local/cpffmpeg/lib  --enable-version3 --extra-version=syslint \
 --enable-libfdk-aac   --enable-libfreetype 
		 make -j$cpu
   make tools/qt-faststart   
if   make install; then
echo -e $RED"Installed of FFMPEG ......"$RESET
else
#Error With git soucr
cd $INSTALL_SDIR
sleep 2
echo "removing old source"
   rm -vrf ffmpeg*
   wget $SOURCE_URL/ffmpeg.zip;wget $SOURCE_URL/ffmpeg2.zip
   unzip ffmpeg.zip;unzip ffmpeg2.zip;
   cd ffmpeg/
     ./configure --prefix=$INSTALL_DDIR --enable-shared \
 --enable-nonfree --enable-gpl --enable-pthreads  \
 --enable-libopencore-amrnb  --enable-decoder=liba52 \
 --enable-libopencore-amrwb    --enable-libmp3lame --enable-libtheora \
 --enable-libx264  --enable-libxvid --extra-cflags=-I/usr/local/cpffmpeg/include/ \
 --extra-ldflags=-L/usr/local/cpffmpeg/lib  --enable-version3 --extra-version=syslint \
 --enable-libfdk-aac   --enable-libfreetype 
   make ;make tools/qt-faststart;make install;   
fi
   cp -vf tools/qt-faststart /usr/local/cpffmpeg/bin/
   ln -sf /usr/local/cpffmpeg/bin/ffmpeg /usr/local/bin/ffmpeg
   ln -sf /usr/local/cpffmpeg/bin/ffmpeg /usr/bin/ffmpeg
   ln -sf /usr/local/cpffmpeg/bin/qt-faststart /usr/local/bin/qt-faststart
   ln -sf /usr/local/cpffmpeg/bin/qt-faststart /usr/bin/qt-faststart
   ldconfig
   /usr/bin/ffmpeg -formats

   echo -e $RED"
                        :rvri                     
                  :vJUJYri:::::i::                
            .sDgEJi                 r7i           
         .KQX7.                        .L:        
       iRRs.        5vsvv7v7Yv            Kr      
     :gd5.         5Yv7LYL777I.             M     
    PbuI  ..      ru7rrv:77rrr5              Q7   
   QUYI. .        I7r7vr .srir7j              BJ  
  g2LYj          ULr7rS   17rirJ:              Rr 
  EY7JL         i1r7rj:    2rrirU              KS 
 sUvvvI.        57rr7U     7LrrivJ             r1.
.1sv7vss       2v7r7J       sriiiJ:            r7:
:jjv77r7L     ru777vY       :7rirr2            7i:
 uJvriBMvI:   KL7vr:vuUIUI1urririrru           :r:
  Zvi1BBEiK2i:ii7:...jI2IUI11Lririrvr         ..X 
  gJ5BYB:i.iUYr:..rJ:         Jririrv7        .ur 
   DZQBu : 7Yvv77777j.        iYriiiirjr:...:iUY  
    5q: ...v:7Ls7v7uvU:        is7iriri77vvvvSr   
     :SYJ:::::. Iqr :7U.        .rLrrrrirrrsU     
       vq1vri.  Er   u75.         .::iirrJJ.      
         1JvJv.Ii  rBB:.i.    . .   ..r7i         
        LRbbPZbEKI .BR   s:....:ir7Lr:            
                  :......ir.....                 
"$RESET

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
