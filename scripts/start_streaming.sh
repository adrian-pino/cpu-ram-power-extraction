#/bin/bash
set -x 
STREAMING_TIME=1100

# Debugging purposes; stream only 5 sec
# ffmpeg -re -i ../videos/hiv0199_test_und_1080.mp4 -c copy -an -t 10 -f rtsp rtsp://192.168.40.114:8554/mystream

# Stream the hole video on loop (inf)
# ffmpeg -re -stream_loop -1 -i ../videos/hiv0199_test_und_1080.mp4 -c copy -an -f rtsp rtsp://192.168.40.114:8554/mystream

# Stream the video the seconds specified in STREAMING_TIME
ffmpeg -re -stream_loop -1 -i ../videos/hiv0199_test_und_1080.mp4 -c copy -an -t $STREAMING_TIME -f rtsp rtsp://192.168.40.114:8554/mystream
