#!/bin/bash
# Script to start streaming, monitor CPU/RAM usage, and monitor power consumption.

# Kill any existing instances of the scripts to avoid zombie processes
pkill -f start_streaming.sh
pkill -f monitor_cpu_ram.sh
pkill -f monitor_power.sh

# Start streaming in the background
./start_streaming.sh &
VLC_PID=$!

# Start monitoring CPU/RAM usage in the background
./monitor_cpu_ram.sh &
MONITOR_CPU_RAM_PID=$!

# Start monitoring power consumption in the background
./monitor_power_consumption.sh &
MONITOR_POWER_PID=$!

# Wait for VLC to finish
wait $VLC_PID

# Once VLC is done, kill the monitoring scripts
kill $MONITOR_CPU_RAM_PID
kill $MONITOR_POWER_PID

echo ""
echo "Experiment finished successfully"
echo ""

# Generate the plots
source venv/bin/activate
./generate_plots.sh
echo "Plots generated successfully"

