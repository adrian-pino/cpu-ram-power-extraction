import sys
import os
import pandas as pd
import matplotlib.pyplot as plt
import glob

def plot_histograms(log_file_path):
    # Load the log file into a DataFrame
    df = pd.read_csv(log_file_path)
    df["CPU_Usage"] = 100 - df["CPU_Idle(%)"]
    df["Memory_Used_MB"] = df["Memory_Used(KB)"] / 1024

    # Extract date and time information from the log file name
    file_name = os.path.basename(log_file_path)
    datetime_info = file_name.split("_")[4]  # Extracting date and time from the file name
    date_time = datetime_info.replace("-", "_")  # Replace '-' with '_' for consistency

    # Get the directory where the log file is located
    log_dir = os.path.dirname(log_file_path)

    # Plot CPU Usage Histogram
    plt.figure(figsize=(10, 6))
    plt.hist(df["CPU_Usage"], bins=8, color='lightcoral', edgecolor='black')
    plt.title("Histogram of CPU Usage (%)")
    plt.xlabel("CPU Usage (%)")
    plt.ylabel("Frequency")
    plt.grid(axis='y', alpha=0.75)
    cpu_plot_name = os.path.join(log_dir, f"cpu_histogram_{date_time}.png")
    plt.savefig(cpu_plot_name)
    plt.close()

    # Plot RAM Usage Histogram
    plt.figure(figsize=(10, 6))
    plt.hist(df["Memory_Used_MB"], bins=8, color='skyblue', edgecolor='black')
    plt.title("Histogram of RAM Used (MB)")
    plt.xlabel("RAM Used (MB)")
    plt.ylabel("Frequency")
    plt.grid(axis='y', alpha=0.75)
    ram_plot_name = os.path.join(log_dir, f"ram_histogram_{date_time}.png")
    plt.savefig(ram_plot_name)
    plt.close()

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 plot_cpu_ram.py <path_to_log_files_directory>")
        sys.exit(1)

    log_files_directory = sys.argv[1]
    log_files = glob.glob(os.path.join(log_files_directory, "*.log"))
    for log_file in log_files:
        plot_histograms(log_file)

