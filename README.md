
# xgain-streaming-experiments

This repository contains scripts and tools for monitoring CPU, RAM, and power consumption, as well as streaming video experiments. The collected data can be used to generate plots for analysis.

## Scripts

### `generate_plots.sh`

This script generates histograms for CPU and RAM usage from log files located in the `../results` directory.

Usage:
```bash
./generate_plots.sh
```

### `install_dependencies.sh`

This script creates a virtual environment and installs the required Python packages.

Usage:
```bash
./install_dependencies.sh
```

### `monitor_cpu_ram.sh`

This script monitors and logs CPU and RAM usage every second.

Usage:
```bash
./monitor_cpu_ram.sh
```

### `monitor_power_consumption.sh`

This script monitors and logs power consumption using an MQTT broker.

Usage:
```bash
./monitor_power_consumption.sh
```

### `plot_cpu_ram.py`

This Python script generates histograms for CPU and RAM usage from the provided log files directory.

Usage:
```bash
python3 plot_cpu_ram.py <path_to_log_files_directory>
```

### `run_experiment.sh`

This script runs a streaming experiment, monitors CPU and RAM usage, and generates plots after the experiment.

Usage:
```bash
./run_experiment.sh
```

### `start_streaming.sh`

This script starts streaming a video using FFmpeg.

Usage:
```bash
./start_streaming.sh
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

- Ensure that the `results` directory exists to store log files.
- Configure the MQTT broker settings in the `monitor_power_consumption.sh` script.
- Adjust the video streaming parameters in the `start_streaming.sh` script as needed.

## License

This project is licensed under the MIT License.

