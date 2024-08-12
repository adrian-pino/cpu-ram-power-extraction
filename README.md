
# xgain-streaming-experiments

This repository contains scripts and tools for monitoring CPU, RAM, and power consumption, as well as streaming video experiments. The collected data can be used to generate plots for analysis.

## Directory Structure

```plaintext
.
├── results
└── scripts
    ├── generate_plots.sh
    ├── install_dependencies.sh
    ├── monitor_cpu_ram.sh
    ├── monitor_power_consumption.sh
    ├── plot_cpu_ram.py
    ├── run_experiment.sh
    └── start_streaming.sh
```

## Scripts

### `install_dependencies.sh`

This script sets up the Python virtual environment and installs the necessary dependencies for running the other scripts.

**Usage:**
```bash
./install_dependencies.sh
```

### `monitor_cpu_ram.sh`

This script monitors and logs the CPU and RAM usage of the system. It logs the data every second to a file in the `../results` directory. The log file is named based on the current date and time.

**Usage:**
```bash
./monitor_cpu_ram.sh
```

**Log File Format:**
```plaintext
DateTime,CPU_Idle(%),Memory_Used(KB),Memory_Free(KB)
```

### `monitor_power_consumption.sh`

This script monitors and logs the power consumption of a device via MQTT. It connects to the specified MQTT broker, subscribes to the power consumption topic, and logs the data to a file in the `../results/` directory. The log file is named based on the current date and time.

**Usage:**
```bash
./monitor_power_consumption.sh
```

**Log File Format:**
```plaintext
DateTime,Power_Consumption(W)
```

**MQTT Configuration:**
- `MQTT_BROKER_IP`: IP address of the MQTT broker.
- `MQTT_USER`: MQTT username.
- `MQTT_PASSWORD`: MQTT password.
- `MQTT_TOPIC`: MQTT topic for power consumption.

### `start_streaming.sh`

This script starts streaming a video file using FFmpeg. The streaming parameters, including the video file path, streaming duration, receiver IP, and port, can be configured within the script.

**Usage:**
```bash
./start_streaming.sh
```

**Streaming Parameters:**
- `STREAMING_TIME`: Duration for which the video should be streamed.
- `VIDEO_PATH`: Path to the video file.
- `VIDEO_NAME`: Name of the video file.
- `STREAMING_RECEIVER_IP`: IP address of the streaming receiver.
- `STREAMING_RECEIVER_PORT`: Port of the streaming receiver.
- `STREAM_NAME`: Name of the stream.

### `generate_plots.sh`

This script generates histograms for CPU and RAM usage from log files located in the `../results` directory. It calls the `plot_cpu_ram.py` script to create the plots.

**Usage:**
```bash
./generate_plots.sh
```

### `plot_cpu_ram.py`

This Python script generates histograms for CPU and RAM usage from the provided log files directory. It processes the log files and creates side-by-side histograms showing the distribution of CPU and RAM usage.

**Usage:**
```bash
python3 plot_cpu_ram.py <path_to_log_files_directory>
```

**Log File Format:**
```plaintext
DateTime,CPU_Idle(%),Memory_Used(KB),Memory_Free(KB)
```

**Histograms:**
- **CPU Usage Histogram:** Shows the distribution of CPU usage.
- **RAM Usage Histogram:** Shows the distribution of RAM usage.

### `run_experiment.sh`

This script orchestrates the running of a streaming experiment. It starts the streaming process, monitors CPU and RAM usage, and generates plots after the experiment is completed. It uses `start_streaming.sh` to start the streaming and `monitor_cpu_ram.sh` to monitor the system performance.

**Usage:**
```bash
./run_experiment.sh
```

## Setting Up the Environment

1. **Install Dependencies**:
    ```bash
    cd scripts
    ./install_dependencies.sh
    ```

2. **Activate the Virtual Environment**:
    ```bash
    source venv/bin/activate
    ```

3. **Deactivate the Virtual Environment**:
    ```bash
    deactivate
    ```

## Running Experiments

1. **Start the Streaming**:
    ```bash
    ./start_streaming.sh
    ```

2. **Monitor CPU and RAM Usage**:
    ```bash
    ./monitor_cpu_ram.sh
    ```

3. **Monitor Power Consumption**:
    ```bash
    ./monitor_power_consumption.sh
    ```

4. **Run the Experiment**:
    ```bash
    ./run_experiment.sh
    ```

5. **Generate Plots**:
    ```bash
    ./generate_plots.sh
    ```

## Notes

- For the power consumption KPI, configure the MQTT broker settings in the `monitor_power_consumption.sh` script.
- Adjust the video streaming parameters in the `start_streaming.sh` script as needed.

## License

This project is licensed under the MIT License.

