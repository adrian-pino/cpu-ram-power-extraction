import sys
import os
import pandas as pd
import matplotlib.pyplot as plt
import glob
import numpy as np

def plot_histograms(log_file_path):
    # Load the log file into a DataFrame
    df = pd.read_csv(log_file_path)
    df["CPU_Usage"] = 100 - df["CPU_Idle(%)"]
    df["Memory_Used_MB"] = df["Memory_Used(KB)"] / 1024

    # Extract the log file name without the extension
    file_name_without_ext = os.path.splitext(os.path.basename(log_file_path))[0]

    # Get the directory where the log file is located
    log_dir = os.path.dirname(log_file_path)

    # Creating side by side histograms
    fig, ax = plt.subplots(1, 2, figsize=(16, 6))

    # Font settings
    title_fontsize = 18  # Smaller font
    label_fontsize = 16  # Smaller font
    text_fontsize = 14  # Smaller font

    # Plot CPU Usage Histogram
    cpu_data = df["CPU_Usage"]
    ax[0].hist(cpu_data, bins=8, color='lightcoral', edgecolor='black', zorder=3)
    ax[0].set_title("CPU", fontsize=title_fontsize)
    ax[0].set_xlabel("CPU Usage (%)", fontsize=label_fontsize)
    ax[0].set_ylabel("Frequency", fontsize=label_fontsize)
    ax[0].grid(True, which='both', linestyle='--', linewidth=0.5, zorder=0)
    ax[0].tick_params(axis='both', which='major', labelsize=label_fontsize)
    # Display mean and median in a box
    ax[0].text(0.95, 0.95, f'mean: {cpu_data.mean():.2f}, median: {np.median(cpu_data):.2f}',
               transform=ax[0].transAxes, verticalalignment='top', horizontalalignment='right',
               fontsize=text_fontsize, bbox=dict(facecolor='lightyellow', edgecolor='black', boxstyle='round,pad=0.5'), zorder=4)

    # Plot RAM Usage Histogram
    ram_data = df["Memory_Used_MB"]
    ax[1].hist(ram_data, bins=8, color='skyblue', edgecolor='black', zorder=3)
    ax[1].set_title("RAM", fontsize=title_fontsize)
    ax[1].set_xlabel("RAM Used (MB)", fontsize=label_fontsize)
    ax[1].set_ylabel("Frequency", fontsize=label_fontsize)
    ax[1].grid(True, which='both', linestyle='--', linewidth=0.5, zorder=0)
    ax[1].tick_params(axis='both', which='major', labelsize=label_fontsize)
    # Display mean and median in a box
    ax[1].text(0.95, 0.95, f'mean: {ram_data.mean():.2f}, median: {np.median(ram_data):.2f}',
               transform=ax[1].transAxes, verticalalignment='top', horizontalalignment='right',
               fontsize=text_fontsize, bbox=dict(facecolor='lightyellow', edgecolor='black', boxstyle='round,pad=0.5'), zorder=4)

    plt.tight_layout()
    plot_name = os.path.join(log_dir, f"{file_name_without_ext}.png")
    plt.savefig(plot_name)
    plt.close()

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 plot_cpu_ram.py <path_to_log_files_directory>")
        sys.exit(1)

    log_files_directory = sys.argv[1]
    log_files = glob.glob(os.path.join(log_files_directory, "*.log"))
    for log_file in log_files:
        plot_histograms(log_file)
