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
_package='ruby-1.8.7.tar.gz' 
ruby='ruby-1.8.7.tar.gz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
ldconfig
if [ -e "/etc/yum.conf" ];then
yum -y install ruby
fi
if [ -e "/usr/bin/ruby" ]; then
	ln -sf /usr/bin/ruby  /usr/local/cpffmpeg/bin/ruby
elif  [ -e "/usr/local/cpanel/scripts/installruby" ]; then
	/usr/local/cpanel/scripts/installruby
else
	cd $INSTALL_SDIR
	echo "removing old source"
   	rm -vrf ruby*
   	wget $SOURCE_URL/$ruby
   	tar -xvzf  $ruby
   	cd ruby-1.8.7/
   	./configure --prefix=$INSTALL_DDIR
	make 
	make install
fi
echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
