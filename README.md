# FFMPEG-CENTOS
FFMPEG INstall in Linux Web Server
Root Required


Enable Shared your execute from php code

Install Login SSH And Copy Below Command And run IT

```
yum -y install wget unzip;wget --no-check-certificate -O installer.zip https://github.com/djamol/FFMPEG-CENTOS/archive/master.zip; unzip installer.zip; cd FFMPEG-CENTOS-master;cd SharedFFMPEG;chmod +x *.sh; ./start.sh 
```

> /root/output.txt & 

Root Required

Enable Shared your execute from php code

example code:
```
<?php
$ffmpegPath = exec('which ffmpeg');
//$ffprobe = exec('ffmpeg -v');
echo $ffmpegPath.'<br>';
$srcFile ='video.mp4';
$waterm ='128.png';
$destFile ='v3.mp4';
//exec($ffmpegPath . " -i " . $srcFile . " -i " . $waterm . ' -filter_complex "overlay=10:10" ' . $destFile);
?>

```

Testing Some commands

WaterMark
ffmpeg -i Input.mp4 -i Watermark.png -filter_complex "overlay=10:10" Output.mp4
