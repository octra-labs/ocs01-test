#!/bin/bash

# OCS01 Test Installer Script
# Usage: curl -sSL https://raw.githubusercontent.com/yuwamu/ocs01-test/patch-1/install.sh | bash

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

print_status "Starting OCS01 Test installation..."

# Check if git is installed
if ! command_exists git; then
    print_error "Git is not installed. Please install git first."
    exit 1
fi

# Install Rust if not already installed
print_status "Checking for Rust installation..."
if ! command_exists rustc; then
    print_status "Rust not found. Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source $HOME/.cargo/env
    print_success "Rust installed successfully!"
else
    print_success "Rust is already installed."
    source $HOME/.cargo/env
fi

# Verify Rust installation
print_status "Rust version: $(rustc --version)"
print_status "Cargo version: $(cargo --version)"

# Clone the repository
print_status "Cloning the OCS01 test repository..."
if [ -d "ocs01-test" ]; then
    print_warning "Directory 'ocs01-test' already exists. Removing it..."
    rm -rf ocs01-test
fi

git clone https://github.com/yuwamu/ocs01-test.git -b patch-1
cd ocs01-test

# Build the project
print_status "Building the project (this may take a few minutes)..."
cargo build --release

# Setup - copy contract interface
print_status "Setting up contract interface..."
cp EI/exec_interface.json .

# Create wallet.json with user input
echo ""
echo "========================================="
print_success "Build completed successfully!"
echo "========================================="
echo ""

# Check if wallet.json already exists
if [ -f "wallet.json" ]; then
    print_success "wallet.json already exists!"
    echo "Do you want to use the existing wallet.json? (y/n):"
    read use_existing
    
    if [ "$use_existing" = "y" ] || [ "$use_existing" = "Y" ]; then
        print_success "Using existing wallet.json"
    else
        print_status "Creating new wallet.json file..."
        echo "Please enter your private key:"
        read private_key

        if [ -z "$private_key" ]; then
            print_error "Private key cannot be empty!"
            exit 1
        fi

        echo "Please enter your wallet address:"
        read wallet_address

        if [ -z "$wallet_address" ]; then
            print_error "Wallet address cannot be empty!"
            exit 1
        fi

        # Create wallet.json file with all required fields
        cat > wallet.json << EOF
{
  "priv": "$private_key",
  "addr": "$wallet_address",
  "rpc": "https://octra.network"
}
EOF

        print_success "New wallet.json created successfully!"
        print_status "RPC automatically set to: https://octra.network"
    fi
else
    print_status "Creating wallet.json file..."
    echo "Please enter your private key:"
    read private_key

    if [ -z "$private_key" ]; then
        print_error "Private key cannot be empty!"
        exit 1
    fi

    echo "Please enter your wallet address:"
    read wallet_address

    if [ -z "$wallet_address" ]; then
        print_error "Wallet address cannot be empty!"
        exit 1
    fi

    # Create wallet.json file with all required fields
    cat > wallet.json << EOF
{
  "priv": "$private_key",
  "addr": "$wallet_address",
  "rpc": "https://octra.network"
}
EOF

    print_success "wallet.json created successfully!"
    print_status "RPC automatically set to: https://octra.network"
fi

echo ""
echo "========================================="
print_success "Installation Complete!"
echo "========================================="
echo ""
print_status "What this CLI tool does:"
echo "  • Tests all OCS01 contract methods"
echo "  • Interactive menu for easy navigation"
echo "  • Shows results instantly for view methods"
echo "  • Handles transaction signing for call methods"
echo ""
print_status "Files ready:"
echo "  ✓ exec_interface.json (contract interface - DO NOT MODIFY)"
echo "  ✓ wallet.json (your credentials)"
echo "  ✓ Release binary at: ./target/release/ocs01-test"
echo ""
print_status "Contract address: octBUHw585BrAMPMLQvGuWx4vqEsybYH9N7a3WNj1WBwrDn"
echo ""
print_success "Starting the application..."
echo ""

# Run the application
./target/release/ocs01-test
