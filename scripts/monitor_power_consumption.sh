#!/bin/bash
# Script to monitor and log power consumption via MQTT.

MQTT_BROKER_IP="<>"
MQTT_USER="<>"
MQTT_PASSWORD="<>"
MQTT_TOPIC="<>/status/switch:0"
LOG_FILES_DIRECTORY="../results/power_consumption"
LOG_FILE="$LOG_FILES_DIRECTORY/power_consumption_$(date '+%Y-%m-%d_%H-%M-%S').log"

# Check if the directory exists
if [ ! -d "$LOG_FILES_DIRECTORY" ]; then
    echo "Directory $LOG_FILES_DIRECTORY does not exist. Creating..."
    mkdir -p "$LOG_FILES_DIRECTORY"
    echo "Created"
fi

# Prepare the log file with headers
echo "Extracting the power consumption using the MQTT broker..."
echo "DateTime,Power_Consumption(W)" > $LOG_FILE

# Start monitoring
mosquitto_sub -h $MQTT_BROKER_IP -u $MQTT_USER -P $MQTT_PASSWORD -t $MQTT_TOPIC | while read -r message; do
    power=$(echo $message | jq '.apower')
    datetime=$(date '+%Y-%m-%d %H:%M:%S')
    echo "$datetime,$power" >> $LOG_FILE
done

