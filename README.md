# Mbed Cloud Client on RX65N example

The full documentation for original example is [available on our documentation site](https://www.pelion.com/docs/device-management/current/connecting/device-management-client-tutorials.html).

**dev** - main development branch. Please, create you branches from it.

## Deployment

### Installing GCC for Renesas 8.3.0.201904-GNURX Toolchain (Linux)
1) Register in https://gcc-renesas.com/ for toolchain downloading.
2) Download GCC for Renesas 8.3.0.201904-GNURX Toolchain from https://gcc-renesas.com/rx-download-toolchains/.
3) Change `gcc-8.3.0.201904-GNURX-ELF.run` file mode for executing.
4) Run `./gcc-8.3.0.201904-GNURX-ELF.run`. Enter activation code from _[GNU Tools] Your username and password info_ letter, while installing toolchain.
    > For activation code, see registration confirmation letter section: _(If you are using an older toolchain release, please use this activation code instead: **XYXYXYXY**)_

By default, toolchain will be installed in: `~/toolchains/gcc_8.3.0.201904_gnurx-elf`.

### Code Retrieving
1) Clone mbed cloud client app from https://portal-ua.globallogic.com/gitlab/roman.kukui/mbed-cc-app-rx65n and switch to **dev** branch.

    ```
    git clone git@portal-ua.globallogic.com:roman.kukui/mbed-cc-app-rx65n.git
    git checkout dev
    ```
2) Clone mbed-cloud-client lib from https://portal-ua.globallogic.com/gitlab/roman.kukui/mbed-cc-lib-rx65n/tree/master and switch to **dev** branch.
    ```
    git clone git@portal-ua.globallogic.com:roman.kukui/mbed-cc-lib-rx65n.git ./mbed-cloud-client
    git checkout dev
    ```

## Build

1) Run build script `build_debug.sh`.
    ```
    ./build_debug.sh
    ```
