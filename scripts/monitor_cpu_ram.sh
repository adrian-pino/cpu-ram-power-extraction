#!/bin/bash
# Script to monitor and log CPU and RAM usage.

current_date=$(date '+%Y-%m-%d_%H-%M-%S')
LOG_FILES_DIRECTORY="../results"
LOG_FILE="$LOG_FILES_DIRECTORY/cpu_ram_usage_${current_date}.log"

# Check if the directory exists
if [ ! -d "$LOG_FILES_DIRECTORY" ]; then
    echo "Directory $LOG_FILES_DIRECTORY does not exist. Creating..."
    mkdir -p "$LOG_FILES_DIRECTORY"
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
