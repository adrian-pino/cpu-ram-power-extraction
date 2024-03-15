#!/bin/bash
# Script to monitor and log CPU and RAM usage. The log file name depends on the streaming type.

# Get current date and time for unique file naming
current_date=$(date '+%Y-%m-%d_%H-%M-%S')

# Determine log file name based on the argument passed
if [ "$1" == "default" ]; then
    LOG_FILE="../results/default_cpu_ram_usage_${current_date}.log"
elif [ "$1" == "intensive" ]; then
    LOG_FILE="../results/intensive_cpu_ram_usage_${current_date}.log"
else
    echo "Unknown streaming type. Exiting."
    exit 1
fi

# Prepare the log file with headers
echo "DateTime,CPU_Idle(%),Memory_Used(KB),Memory_Free(KB)" > $LOG_FILE

# Start monitoring
while true; do
    datetime=$(date '+%Y-%m-%d %H:%M:%S')
    read cpu_idle mem_used mem_free <<< $(vmstat 1 2 | tail -1 | awk '{print $15, $4, $5}')
    echo "$datetime,$cpu_idle,$mem_used,$mem_free" >> $LOG_FILE
    sleep 1
done

