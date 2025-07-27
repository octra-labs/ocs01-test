#!/bin/bash

# OCS01 Test Setup Script
# This script installs Rust, builds the project from source, and sets up the environment

set -e  # Exit on any error

echo "Starting OCS01 Test setup..."

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Rust if not already installed
echo "Checking for Rust installation..."
if ! command_exists rustc; then
    echo "Rust not found. Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
    echo "Rust installed successfully!"
else
    echo "Rust is already installed."
    source $HOME/.cargo/env
fi

# Verify Rust installation
echo "Rust version: $(rustc --version)"
echo "Cargo version: $(cargo --version)"

# Clone the repository
echo "Cloning the OCS01 test repository..."
if [ -d "ocs01-test" ]; then
    echo "Directory 'ocs01-test' already exists. Removing it..."
    rm -rf ocs01-test
fi

git clone https://github.com/octra-labs/ocs01-test.git
cd ocs01-test

# Build the project
echo "Building the project..."
cargo build --release

# Setup - copy contract interface
echo "Setting up contract interface..."
cp EI/exec_interface.json .

# Create wallet.json with user input
echo ""
echo "========================================="
echo "Build completed successfully!"
echo "========================================="
echo ""
echo "Creating wallet.json file..."
echo "Please enter your private key (it will be hidden for security):"
read -s private_key

# Create wallet.json file
cat > wallet.json << EOF
{
  "private_key": "$private_key"
}
EOF

echo "wallet.json created successfully!"
echo ""
echo "========================================="
echo "Setup Complete!"
echo "========================================="
echo ""
echo "What this CLI tool does:"
echo "• Tests all OCS01 contract methods"
echo "• Interactive menu for easy navigation"
echo "• Shows results instantly for view methods"
echo "• Handles transaction signing for call methods"
echo ""
echo "Files ready:"
echo "✓ exec_interface.json (contract interface - DO NOT MODIFY)"
echo "✓ wallet.json (your credentials)"
echo "✓ Release binary at: ./target/release/ocs01-test"
echo ""
echo "Contract address: octBUHw585BrAMPMLQvGuWx4vqEsybYH9N7a3WNj1WBwrDn"
echo ""
echo "To run the application:"
echo "  ./target/release/ocs01-test"
echo ""
echo "Follow the interactive menu to interact with the contract!"
echo ""
echo "Note: Works on Linux, macOS, and Windows"
