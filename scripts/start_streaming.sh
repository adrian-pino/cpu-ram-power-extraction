#!/bin/bash
set -x 

# Define the streaming parameters
STREAMING_TIME=1100
VIDEO_PATH="../videos"
VIDEO_NAME="hiv0199_test_und_1080.mp4"
STREAMING_RECEIVER_IP="192.168.40.114"
STREAMING_RECEIVER_PORT="8554"
STREAM_NAME="mystream"

# Debugging purposes; stream only 10 seconds
# ffmpeg -re -i "$VIDEO_PATH/$VIDEO_NAME" -c copy -an -t 10 -f rtsp "rtsp://$STREAMING_RECEIVER_IP:$STREAMING_RECEIVER_PORT/$STREAM_NAME"

# Stream the whole video on loop (infinitely)
# ffmpeg -re -stream_loop -1 -i "$VIDEO_PATH/$VIDEO_NAME" -c copy -an -f rtsp "rtsp://$STREAMING_RECEIVER_IP:$STREAMING_RECEIVER_PORT/$STREAM_NAME"

# Stream the video for the specified duration in STREAMING_TIME
ffmpeg -re -stream_loop -1 -i "$VIDEO_PATH/$VIDEO_NAME" -c copy -an -t "$STREAMING_TIME" -f rtsp "rtsp://$STREAMING_RECEIVER_IP:$STREAMING_RECEIVER_PORT/$STREAM_NAME"
