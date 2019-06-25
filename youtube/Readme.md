Download Video


```
youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' http://youtube.com/watch?v=p-tSLdo-QiA

```
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

If you do not have curl, you can alternatively use a recent wget:

sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

Windows users can download an .exe file and place it in any location on their PATH except for %SYSTEMROOT%\System32 (e.g. do not put in C:\Windows\System32).
