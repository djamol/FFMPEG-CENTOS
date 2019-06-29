# FFMPEG-CENTOS
AuTo INSTALL using nux rpm
INstallation 
```yum -y install http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
yum install ffmpeg perl-Image-ExifTool
```
Pathes:
ffmpeg 	/usr/bin/ffmpeg
ffprobe 	/usr/bin/ffprobe
exiftool 	/usr/bin/exiftool
/usr/bin/ffmpeg -version



FFMPEG INstall in Linux Web Server
Root Required

Enable Shared your execute from php code


&#x1F536;##Install Login SSH And Copy Below Command And run IT

```
yum -y install wget unzip;wget --no-check-certificate -O installer.zip https://github.com/djamol/FFMPEG-CENTOS/archive/master.zip; unzip installer.zip; cd FFMPEG-CENTOS-master;cd SharedFFMPEG;chmod +x *.sh; 
#Runable
#./start.sh 
#BAckground install and output store in file
./start.sh > FFMPEG-output.log 2>&1 &
```

> /root/output.txt & 
Download Video
youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' http://youtube.com/watch?v=p-tSLdo-QiA

&#x1F536;Root Required


&#x1F536;Enable Shared your execute from php code
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
 
//exec($ffmpegPath . " -i " . $srcFile . " -i " . $waterm . ' -filter_complex "overlay=10:10" ' . $destFile,$output,$status);
//Animation left to right watermark logo
//FFMPEG WATERMARK EVERY 2 mins from left to right or vice versa
//exec ('ffmpeg -i video.mp4 -i 128.png -filter_complex "overlay='if(gte(t,1), -w+(t-1)*200, NAN)':(main_h-overlay_h)/2" birds4.mp4');
//exec ('ffmpeg -i video.mp4 -i 128.png -filter_complex "overlay='."'if(gte(t,1), -w+(t-1)*200, NAN)'".':(main_h-overlay_h)/2" mobile.mp4');
exec ('ffmpeg -i video.mp4 -i 128.png -filter_complex "overlay='."'if(gte(t,1), -w+(t-1)*200, NAN)'".':(main_h-overlay_h)/2" mobile.mp4 2>&1', $output, $return_var);

// Last ...Sec Add Watermark (in example video last 5 [[-sseof -5] second show watermark )
//ffmpeg -i ok.mp4 -sseof -5 -copyts -i ok.mp4 -loop 1 -i logo.png -filter_complex "[1][2]overlay=shortest=1[logo];[0][logo]overlay" out.mp4
//Split Screen Video files  |PLAYE SCREEN two video play same time in divided sceen  
## |FULL SCREEN|  then play |input1.mp4 input2.mp4 |
ffmpeg   -i input1.mp4   -i input2.mp4 \
  -filter_complex '[0:v]pad=iw*2:ih[int];[int][1:v]overlay=W/2:0[vid]'   -map [vid]   -c:v libx264   -crf 23   -preset veryfast   output.mp4

## Merge multiple video files
#First, create a text file with the filenames.
#file '1.mp4'
#file '2.mp4'
#...
#file '13.mp4'
ffmpeg -f concat -i textfile -c copy -fflags +genpts merged.mp4   # If they are not, you can encode the concat. then ffmpeg -f concat -i textfile -fflags +genpts merged.mp4

#Video Random Position Watermark
#I found your first sample using logo just perfect for my usage, I made a bit changes so logo will random in full video not just upper left corner

    Place logo.png in a random (x ,y) position of the video.
    Make the logo fade out after 2 secods.
    Wait 5 seconds and repeat.(]trim=0:5)-change value for wait for repeat show logo another place

ffmpeg -i input.mp4 -loop 1 -i logo.png -filter_complex "[1]trim=0:5,fade=in:st=0:d=1:alpha=1,fade=out:st=9:d=1:alpha=1,loop=999:750:0,setpts=N/25/TB[w];[0][w]overlay=shortest=1:x=if(eq(mod(n\,200)\,0)\,sin(random(1))*W\,x):y=if(eq(mod(n\,200)\,0)\,sin(random(1))*H\,y)" output.mpg
//Compressed Mp4 Files
 ffmpeg -i 2.mp4 -vcodec h264 -acodec mp2 output.mp4
var_dump($return_var);
echo "return_var is: $return_var" . "\n";
var_dump($output);
?>
```

&#x1F53D;Testing Some commands
```
<?php
exec ('ffmpeg -i video.avi 2>&1', $output, $return_var);
var_dump($output);
?>
```
&#x1F53D;WaterMark
```ffmpeg -i Input.mp4 -i Watermark.png -filter_complex "overlay=10:10" Output.mp4```

&#x1F53D;Getting infos from a video file
```ffmpeg -i video.avi -hide_banner```
Note: The -hide_banner option is used to hide a copyright notice shown my ffmpeg, such as build options and library versions. This option can be used to suppress printing this information.

&#x1F53D;Split a video into images
```ffmpeg -i video.flv image%d.jpg```

&#x1F53D;Convert images into a video
```$ ffmpeg -f image2 -i image%d.jpg imagestovideo.mpg```

&#x1F53D;Convert a video into mp3 format/Extract Audio
```ffmpeg -i video.flv -vn -ar 44100 -ac 2 -ab 192 -f mp3 audio.mp3```


&#x1F53D;Covert flv video file to mpg format
```ffmpeg -i video.flv video.mpg```

&#x1F53D;Convert mpg video file to flv
```ffmpeg -i video.mpg -ab 26k -f flv video1.flv```

&#x1F53D;Convert avi video file to mpeg
```ffmpeg -i video.avi -target pal-dvd -ps 2000000000 -aspect 16:9 video.mpeg```

&#x1F53D;Convert video into animated gif
```ffmpeg -i video.flv animated.gif.mp4```

&#x1F53D;Convert a video to CD or DVD format
```ffmpeg -i video.mpg -target vcd vcd_video.mpg```

&#x1F53D;Add subtitles to a Movie
```ffmpeg -i video.mp4 -i subtitles.srt -map 0 -map 1 -c copy -c:v libx264 -crf 23 -preset veryfast video-output.mkv```

&#x1F53D;Encode a video sequence for the iPpod/iPhone

Explanations :

    Source : source_video.avi
    
    Audio codec : aac
    
    Audio bitrate : 128kb/s
    
    Video codec : mpeg4
    
    Video bitrate : 1200kb/s
    
    Video size : 320px par 180px
    
    Generated video : final_video.mp4

```ffmpeg -i source_video.avi input -acodec aac -ab 128kb -vcodec mpeg4 -b 1200kb -mbd 2 -flags +4mv+trell -aic 2 -cmp 2 -subcmp 2 -s 320x180 -title X final_video.mp4```

&#x1F53D;Encode video for the PSP

Explanations :

    Source : source_video.avi

    Audio codec : aac

    Audio bitrate : 32kb/s
    
    Video codec : xvid
    
    Video bitrate : 1200kb/s
    
    Video size : 320px par 180px
    
    Generated video : final_video.mp4
    
```ffmpeg -i source_video.avi -b 300 -s 320x240 -vcodec xvid -ab 32 -ar 24000 -acodec aac final_video.mp4```
&#x1F53D;Compress .avi to SVCD mpeg2

NTSC format:

```ffmpeg -i video_origine.avi -target ntsc-svcd video_finale.mpg```

PAL format:

```ffmpeg -i video_origine.avi -target pal-svcd video_finale.mpg```

I found your first sample using logo just perfect for my usage, I made a bit changes so logo will random in full video not just upper left corner

```ffmpeg -i v.mp4 -loop 1 -i logo.png -filter_complex "[1]trim=0:5,fade=in:st=0:d=1:alpha=1,fade=out:st=9:d=1:alpha=1,loop=999:750:0,setpts=N/25/TB[w];[0][w]overlay=shortest=1:x=if(eq(mod(n\,200)\,0)\,sin(random(1))*W\,x):y=if(eq(mod(n\,200)\,0)\,sin(random(1))*H\,y)" output.mp4```

