#/bin/bash

# Python dependencies
# Define the name of the virtual environment directory
VENV_DIR="venv"

# Define required Python packages
REQUIRED_PACKAGES="pandas matplotlib psutil"

echo "Installing dependencies..."
echo "Installing jq"
sudo apt-get install jq -y

echo "Creating virtual environment..."
python3 -m venv $VENV_DIR

echo "Activating virtual environment..."
source $VENV_DIR/bin/activate

echo "Installing required Python packages: $REQUIRED_PACKAGES..."
pip install $REQUIRED_PACKAGES

echo "Setup complete. Virtual environment '$VENV_DIR' is ready and activated."
echo "To deactivate the virtual environment, run 'deactivate'."
echo "To reactivate the virtual environment in future sessions, run 'source $VENV_DIR/bin/activate'."
