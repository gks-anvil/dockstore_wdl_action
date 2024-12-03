#!/bin/bash

set -e


WDL_FILE="$1"
if [[ -z "$WDL_FILE" ]]; then
  echo "Error: WDL file not specified."
  exit 1
fi

TEST_PARAMETERS="$2"
if [[ -z "$TEST_PARAMETERS" ]]; then
  echo "Error: test input file not specified."
  exit 1
fi

echo "Installing prerequisites..."
sudo apt-get update && sudo apt-get install -y openjdk-17-jdk docker.io

# Install Dockstore CLI
echo "Installing Dockstore CLI..."
mkdir -p ~/bin
curl -L -o ~/bin/dockstore https://github.com/dockstore/dockstore-cli/releases/download/1.16.0/dockstore
chmod +x ~/bin/dockstore
export PATH=~/bin:$PATH

# Configure Dockstore
echo "Configuring Dockstore..."
mkdir -p ~/.dockstore
cat <<EOF > ~/.dockstore/config
token: $DOCKSTORE_TOKEN
server-url: https://dockstore.org/api
EOF

# Run Dockstore
echo "Running Dockstore workflow..."
dockstore workflow launch --local-entry "$WDL_FILE" --json "$TEST_PARAMETERS"
