import sys
import os
import pandas as pd
import matplotlib.pyplot as plt
import glob
import psutil

def plot_histograms(log_file_path):
    # Load the log file into a DataFrame
    df = pd.read_csv(log_file_path)
    df["CPU_Usage"] = 100 - df["CPU_Idle(%)"]
    df["Memory_Used_MB"] = df["Memory_Used(KB)"] / 1024

    base_name = os.path.basename(log_file_path)
    plot_name_prefix = "plot_" + base_name[:-4]  # removing '.log'
    base_path = os.path.dirname(log_file_path)

    # Get the maximum RAM capacity of the device (in bytes)
    max_ram_capacity_bytes = psutil.virtual_memory().total

    # Convert the maximum RAM capacity to megabytes
    max_ram_capacity_mb = max_ram_capacity_bytes / (1024 * 1024)

    # Plot CPU Usage Histogram
    plt.figure(figsize=(10, 6))
    plt.hist(df["CPU_Usage"], bins=8, color='lightcoral', edgecolor='black', range=(0, 100))
    plt.title("Histogram of CPU Usage (%)")
    plt.xlabel("CPU Usage (%)")
    plt.ylabel("Frequency")
    plt.grid(axis='y', alpha=0.75)
    plt.savefig(os.path.join(base_path, f"{plot_name_prefix}_cpu_histogram.png"))
    plt.close()

    # Plot RAM Usage Histogram
    plt.figure(figsize=(10, 6))
    plt.hist(df["Memory_Used_MB"], bins=8, color='skyblue', edgecolor='black', range=(0, max_ram_capacity_mb))
    plt.title("Histogram of RAM Used (MB)")
    plt.xlabel("RAM Used (MB)")
    plt.ylabel("Frequency")
    plt.grid(axis='y', alpha=0.75)
    plt.savefig(os.path.join(base_path, f"{plot_name_prefix}_ram_histogram.png"))
    plt.close()

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 plot_cpu_ram.py <path_to_log_files_directory>")
        sys.exit(1)

    log_files_directory = sys.argv[1]
    log_files = glob.glob(os.path.join(log_files_directory, "*.log"))
    for log_file in log_files:
        plot_histograms(log_file)

