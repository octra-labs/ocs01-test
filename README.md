**ocs01-test**

rust cli for testing ocs01 smart contract

**what it does**

-   tests all ocs01 contract methods
-   interactive menu for easy navigation
-   shows results instantly for view methods
-   handles tx signing for call methods

**works on**

-   linux
-   macos
-   windows

**install rust (if not installed)**

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

**build from source**

```bash
git clone https://github.com/octra-labs/ocs01-test.git
cd ocs01-test
cargo build --release
```

**setup**

```bash
# copy contract interface
cp EI/exec_interface.json .
```

**required files in same directory**

-   wallet.json - create with your credentials
```bash
# create a wallet.json file 
touch wallet.json

# open the wallet.json 
nano wallet.json

# open wallet.json and edit it (change placeholders to your wallet data):

{
  "priv": "private-key-here",
  "addr": "octxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  "rpc": "https://octra.network"
}

# Note the priv is your B64 private key
# save and exit with 
# Ctrl + X , Then press Y , then hit Enter button
```

-   exec_interface.json - copy from EI/ folder

**run**

you must copy the release binary to your cli folder and also copy the EI file (execution interface file) to the same location 

the release binary is located in this folder after successful build. 
```bash
./target/release/ocs01-test
```

*for this task the ei file contains the interface for contract at address octBUHw585BrAMPMLQvGuWx4vqEsybYH9N7a3WNj1WBwrDn, do not modify it*

after running, follow the menu to interact with the contract
