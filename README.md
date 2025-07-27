# OCS01 Test

Rust CLI for testing OCS01 smart contract

## What it does

- Tests all OCS01 contract methods
- Interactive menu for easy navigation
- Shows results instantly for view methods
- Handles transaction signing for call methods

## Supported Platforms

- Linux
- macOS
- Windows

## Quick Installation

Install and run with a single command:

```bash
curl -sSL https://raw.githubusercontent.com/yuwamu/ocs01-test/patch-1/install.sh | bash
```

This automated installer will:
1. Install Rust if not already present
2. Clone and build the project from source
3. Set up required configuration files
4. Prompt for wallet credentials (or use existing wallet.json)
5. Automatically launch the application

## Manual Installation

### Prerequisites

Ensure Rust is installed:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

### Build from Source

```bash
git clone https://github.com/yuwamu/ocs01-test.git -b patch-1
cd ocs01-test
cargo build --release
```

### Configuration

Copy the contract interface:

```bash
cp EI/exec_interface.json .
```

Create `wallet.json` with your credentials:

```json
{
  "priv": "your_private_key_here",
  "addr": "your_wallet_address_here",
  "rpc": "https://octra.network"
}
```

### Execution

Run the compiled binary:

```bash
./target/release/ocs01-test
```

## Configuration Files

Two files must be present in the working directory:

- **`wallet.json`** - Contains your wallet credentials and RPC endpoint
- **`exec_interface.json`** - Contract interface specification (do not modify)

## Contract Details

- **Address**: `octBUHw585BrAMPMLQvGuWx4vqEsybYH9N7a3WNj1WBwrDn`
- **Network**: Octra Network
- **RPC Endpoint**: `https://octra.network`

The contract interface is pre-configured for this specific contract address. Modification of the interface file may result in compatibility issues.

## Usage

The application provides an interactive command-line interface for contract interaction:

- Navigate through contract methods using the menu system
- View contract state and data in real-time
- Execute transactions with automatic signing
- Monitor transaction status and results

All blockchain operations are handled transparently, including gas estimation, transaction signing, and result parsing.

## Project Structure

```
ocs01-test/
├── EI/
│   └── exec_interface.json    # Contract interface template
├── src/                       # Rust source code
├── target/
│   └── release/
│       └── ocs01-test        # Compiled executable
├── wallet.json               # User credentials (created during setup)
├── exec_interface.json       # Active contract interface
├── Cargo.toml               # Rust project manifest
└── install.sh               # Automated installation script
```

## Security Considerations

- Store your `wallet.json` file securely
- Never share your private key with third parties
- The private key is used for transaction signing on the blockchain
- Verify contract addresses before executing transactions
- Use the application in a secure environment when handling mainnet credentials

## Development

To contribute to this project:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

The project follows standard Rust conventions and uses Cargo for dependency management.
