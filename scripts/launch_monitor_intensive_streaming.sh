#!/bin/bash
# Script to launch intensive video streaming and monitoring

# Start VLC streaming in the background with settings for intensive streaming
./run_intensive_streaming.sh &
VLC_PID=$!

# Start monitoring in the background, specifying the log file for intensive streaming
./monitor_cpu_ram.sh intensive &
MONITOR_PID=$!

# Wait for VLC to finish
wait $VLC_PID

# Once VLC is done, kill the monitoring script
kill $MONITOR_PID

