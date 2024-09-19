#!/bin/bash
# Script to monitor and log power consumption for multiple devices via MQTT.

MQTT_BROKER_IP= "<IP>"
MQTT_USER= "<USER>"
MQTT_PASSWORD= "<PWD>"
LOG_FILES_DIRECTORY="../results/power_consumption"
MQTT_PREFIX=("<TOPIC_DEVICE_1>" "<TOPIC_DEVICE_N")
MQTT_TOPIC_SUFFIX="status/switch:0"

# Check if the directory exists
if [ ! -d "$LOG_FILES_DIRECTORY" ]; then
    echo "Directory $LOG_FILES_DIRECTORY does not exist. Creating..."
    mkdir -p "$LOG_FILES_DIRECTORY"
    echo "Created"
fi

# Function to monitor power consumption of a single device
monitor_device() {
    local device_prefix=$1
    local MQTT_TOPIC="$device_prefix/$MQTT_TOPIC_SUFFIX"
    local LOG_FILE="$LOG_FILES_DIRECTORY/${device_prefix}_power_consumption_$(date '+%Y-%m-%d_%H-%M-%S').log"

    # Prepare the log file with headers
    echo "Extracting the power consumption for $device_prefix using the MQTT broker..."
    echo "DateTime,Power_Consumption(W)" > $LOG_FILE

    # Start monitoring
    mosquitto_sub -h $MQTT_BROKER_IP -u $MQTT_USER -P $MQTT_PASSWORD -t $MQTT_TOPIC | while read -r message; do
        power=$(echo $message | jq '.apower')
        datetime=$(date '+%Y-%m-%d %H:%M:%S')
        echo "$datetime,$power" >> $LOG_FILE
    done
}

# Loop over each device prefix and monitor them in parallel
for device_prefix in "${MQTT_PREFIX[@]}"; do
    monitor_device "$device_prefix" &
done

# Wait for all background processes to complete
wait
