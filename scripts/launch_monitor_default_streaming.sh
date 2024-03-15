#!/bin/bash
# Script to launch default video streaming and monitoring

# Start VLC streaming in the background for default streaming
./run_default_streaming.sh &
VLC_PID=$!

# Start monitoring in the background, specifying the log file for default streaming
./monitor_cpu_ram.sh default &
MONITOR_PID=$!

# Wait for VLC to finish
wait $VLC_PID

# Once VLC is done, kill the monitoring script
kill $MONITOR_PID

