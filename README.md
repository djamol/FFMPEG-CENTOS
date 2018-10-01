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
$ffmpegPath = exec('which ffmpeg');//(get string):=ffmpeg install path 
//$output = shell_exec('ffmpeg -formats');
echo 'Path:'.$ffmpegPath.'<br>';
//echo 'Formats:<pre>'.$output.'</pre><br>';
exec($ffmpegPath.' -formats',$output,$status);
    foreach($output AS $o)
    {
            echo $o , "<br/>";
    }

$srcFile ='video.mp4';
$waterm ='128.png';
$destFile ='v32.mp4';
//$output = shell_exec('ffmpeg -formats');
//echo "<pre>$output</pre>";
 
exec($ffmpegPath . " -i " . $srcFile . " -i " . $waterm . ' -filter_complex "overlay=10:10" ' . $destFile,$output,$status);

?>
```

Testing Some commands

WaterMark
ffmpeg -i Input.mp4 -i Watermark.png -filter_complex "overlay=10:10" Output.mp4
