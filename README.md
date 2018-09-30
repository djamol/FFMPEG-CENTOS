# FFMPEG-CENTOS
FFMPEG INstall in Linux Web Server
 Testing Some commands

WaterMark

ffmpeg -i Input.mp4 -i Watermark.png -filter_complex "overlay=10:10" Output.mp4


```
yum -y install wget unzip;wget --no-check-certificate -O installer.zip https://github.com/djamol/FFMPEG-CENTOS/archive/master.zip; unzip installer.zip; cd FFMPEG-CENTOS-master;cd SharedFFMPEG;chmod +x *.sh; ./start.sh 
```
> /root/output.txt & #Server/VPS Information
