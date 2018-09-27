# FFMPEG-CENTOS
FFMPEG INstall in Linux Web Server
 Testing Some commands

WaterMark

ffmpeg -i Input.mp4 -i Watermark.png -filter_complex "overlay=10:10" Output.mp4
