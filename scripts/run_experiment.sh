#!/bin/bash
# Start streaming in the background
./start_streaming.sh &
VLC_PID=$!

# Start monitoring in the background
./monitor_cpu_ram.sh &
MONITOR_PID=$!

# Wait for VLC to finish
wait $VLC_PID

# Once VLC is done, kill the monitoring script
kill $MONITOR_PID

echo ""
echo "Experiment finished successfully"
echo ""

# Generate the plots
source venv/bin/activate
./generate_plots.sh
echo "Plots generated successfully"
