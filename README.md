# ocs01 test

rust cli for testing ocs01 smart contract

## what it does

- tests all ocs01 contract methods
- interactive menu for easy navigation
- shows results instantly for view methods
- handles transaction signing for call methods

## supported platforms

- linux
- macos
- windows

## quick installation

install and run with a single command:

```bash
curl -sSL https://raw.githubusercontent.com/yuwamu/ocs01-test/ux-fixes/install.sh | bash
```

this automated installer will:
1. install rust if not already present
2. clone and build the project from source
3. set up required configuration files
4. prompt for wallet credentials (or use existing wallet.json)
5. automatically launch the application

## manual installation

### prerequisites

ensure rust is installed:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

### build from source

```bash
git clone https://github.com/yuwamu/ocs01-test.git -b patch-1
cd ocs01-test
cargo build --release
```

### configuration

copy the contract interface:

```bash
cp EI/exec_interface.json .
```

create `wallet.json` with your credentials:

```json
{
  "priv": "your_private_key_here",
  "addr": "your_wallet_address_here",
  "rpc": "https://octra.network"
}
```

### execution

run the compiled binary:

```bash
./target/release/ocs01-test
```

## configuration files

two files must be present in the working directory:

- **`wallet.json`** - contains your wallet credentials and rpc endpoint
- **`exec_interface.json`** - contract interface specification (do not modify)

## contract details

- **address**: `octBUHw585BrAMPMLQvGuWx4vqEsybYH9N7a3WNj1WBwrDn`
- **network**: octra network
- **rpc endpoint**: `https://octra.network`

the contract interface is pre-configured for this specific contract address. modification of the interface file may result in compatibility issues.

## usage

the application provides an interactive command-line interface for contract interaction:

- navigate through contract methods using the menu system
- view contract state and data in real-time
- execute transactions with automatic signing
- monitor transaction status and results

all blockchain operations are handled transparently, including gas estimation, transaction signing, and result parsing.

## project structure

```
ocs01-test/
├── EI/
│   └── exec_interface.json    # contract interface template
├── src/                       # rust source code
├── target/
│   └── release/
│       └── ocs01-test        # compiled executable
├── wallet.json               # user credentials (created during setup)
├── exec_interface.json       # active contract interface
├── Cargo.toml               # rust project manifest
└── install.sh               # automated installation script
```

## security considerations

- store your `wallet.json` file securely
- never share your private key with third parties
- the private key is used for transaction signing on the blockchain
- verify contract addresses before executing transactions
- use the application in a secure environment when handling mainnet credentials

## development

to contribute to this project:

1. fork the repository
2. create a feature branch
3. make your changes
4. test thoroughly
5. submit a pull request

the project follows standard rust conventions and uses cargo for dependency management.etwork**: Octra Network
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
