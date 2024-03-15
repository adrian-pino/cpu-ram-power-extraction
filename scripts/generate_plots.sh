#!/bin/bash
# Script to plot histograms for CPU and RAM from a given directory that containts .log files

# Hardcoded path to the directory containing log files
LOG_FILES_DIRECTORY="../results"

# Run the Python plotting script with the hardcoded directory path as an argument
python3 plot_cpu_ram.py "$LOG_FILES_DIRECTORY"

