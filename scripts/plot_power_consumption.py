import sys
import os
import pandas as pd
import matplotlib.pyplot as plt
import glob
import numpy as np

def plot_power_consumption(log_file_path):
    # Load the log file into a DataFrame
    df = pd.read_csv(log_file_path, parse_dates=["DateTime"])

    # Extract date and time information from the log file name
    file_name = os.path.basename(log_file_path)
    datetime_info = file_name.split("_")[2] + "_" + file_name.split("_")[3]  # Extracting date and time from the file name
    date_time = datetime_info.replace("-", "_")  # Replace '-' with '_' for consistency

    # Get the directory where the log file is located
    log_dir = os.path.dirname(log_file_path)

    # Font settings
    title_fontsize = 24
    label_fontsize = 20
    text_fontsize = 20

    # Creating the plot
    fig, ax = plt.subplots(figsize=(16, 6))

    # Plot Power Consumption
    ax.plot(df["DateTime"], df["Power_Consumption(W)"], color='lightcoral', marker='o', linestyle='-', zorder=3)
    ax.fill_between(df["DateTime"], df["Power_Consumption(W)"], color='lightcoral', alpha=0.3)

    # Set title and labels
    ax.set_title("Power Consumption", fontsize=title_fontsize)
    ax.set_xlabel("Time", fontsize=label_fontsize)
    ax.set_ylabel("Power Consumption (W)", fontsize=label_fontsize)
    ax.grid(True, which='both', linestyle='--', linewidth=0.5, zorder=0)
    ax.tick_params(axis='both', which='major', labelsize=label_fontsize)

    # Calculate mean and median
    mean_power = df["Power_Consumption(W)"].mean()
    median_power = df["Power_Consumption(W)"].median()

    # Add text box for mean and median
    ax.text(0.95, 0.95, f'mean: {mean_power:.2f}, median: {median_power:.2f}',
            transform=ax.transAxes, verticalalignment='top', horizontalalignment='right',
            fontsize=text_fontsize, bbox=dict(facecolor='white', alpha=0.8), zorder=5)

    plt.tight_layout()
    plot_name = os.path.join(log_dir, f"power_consumption_plot_{date_time}.png")
    plt.savefig(plot_name)
    plt.close()

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 plot_power_consumption.py <path_to_log_files_directory>")
        sys.exit(1)

    log_files_directory = sys.argv[1]
    log_files = glob.glob(os.path.join(log_files_directory, "*.log"))
    for log_file in log_files:
        plot_power_consumption(log_file)
