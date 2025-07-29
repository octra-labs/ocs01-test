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
-   virtual IDE

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
-   exec_interface.json - copy from EI/ folder

**run**

you must copy both wallet.json and exec_interface.json to the folder that conains the executable file which is the ocs01-test

You can find it after succesfully building.

**build**
To ensure the executable file is available run (ran into some problem with mine)
```bash
cd target/release
```
if it isn't available run
```bash
cargo build --release
```
To run the file Run:
```bash
./target/release/ocs01-test
```

*for this task the ei file(exec_interface.json) contains the interface for contract at address octBUHw585BrAMPMLQvGuWx4vqEsybYH9N7a3WNj1WBwrDn, do not modify it*

after running, follow the menu to interact with the contract
