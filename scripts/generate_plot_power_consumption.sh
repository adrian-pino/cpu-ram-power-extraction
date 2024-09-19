#!/bin/bash
# Script to plot histograms for CPU and RAM from a given directory that containts .log files

# Hardcoded path to the directory containing log files
LOG_FILES_DIRECTORY="../results/power_consumption"

# Run the Python plotting script with the hardcoded directory path as an argument
python3 plot_power_consumption.py $LOG_FILES_DIRECTORY
