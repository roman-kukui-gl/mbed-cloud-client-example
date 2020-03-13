# Mbed Cloud Client on RX65N example

The full documentation for original example is [available on documentation site](https://www.pelion.com/docs/device-management/current/connecting/device-management-client-tutorials.html).

## Deployment

### Installing **GCC for Renesas 8.3.0.201904-GNURX Toolchain (Linux)**
1) Register in https://gcc-renesas.com/ for toolchain downloading.
2) Download GCC for Renesas 8.3.0.201904-GNURX Toolchain from https://gcc-renesas.com/rx-download-toolchains/.
3) Change `gcc-8.3.0.201904-GNURX-ELF.run` file mode for executing.
4) Run `./gcc-8.3.0.201904-GNURX-ELF.run`. Enter activation code from **[GNU Tools] Your username and password info** letter, while installing toolchain.
    > For activation code, see registration confirmation letter section: _(If you are using an older toolchain release, please use this activation code instead: **XYXYXYXY**)_

By default, toolchain will be installed in: `~/toolchains/gcc_8.3.0.201904_gnurx-elf`.

### Code Retrieving
1) Clone mbed cloud client app from https://portal-ua.globallogic.com/gitlab/roman.kukui/mbed-cc-app-rx65n and switch to **dev** branch.

    ```
    git clone git@portal-ua.globallogic.com:roman.kukui/mbed-cc-app-rx65n.git
    git checkout dev
    ```
2) Clone mbed-cloud-client lib from https://portal-ua.globallogic.com/gitlab/roman.kukui/mbed-cc-lib-rx65n/ and switch to **dev** branch.
    ```
    git clone git@portal-ua.globallogic.com:roman.kukui/mbed-cc-lib-rx65n.git ./mbed-cloud-client
    git checkout dev
    ```

## Build
### Common
1) Set RXGCC compiler path variable:
    ```
    export RXGCC_DIR="$HOME/toolchains/gcc_8.3.0.201904_gnurx-elf"
    ```
2) Deploy RX65N SDK and Middleware:
    ```
    python pal-platform/pal-platform.py deploy --target=RX65N_FreeRTOS_mbedtls generate
    ```
3) Build RX65N SDK library (libboard.a):
```
make -C pal-platform/SDK/RX65N_FreeRTOS/build -j8 lib
```
### Tests Build
1) Generate Makefiles for building tests:
    ```
    cd __RX65N_FreeRTOS_mbedtls/
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_TOOLCHAIN_FILE=./../pal-platform/Toolchain/RXGCC/RXGCC.cmake \
    -DEXTERNAL_DEFINE_FILE=./../define-RX65N-FreeRTOS-tests.txt
    ```
    > Note: target test or some tests skipping can be set in `define-RX65N-FreeRTOS-tests.txt` in project root.
2) Build tests (run from `__RX65N_FreeRTOS_mbedtls/`).
    ```
    make palTests.elf
    ```
    Generated binary will be placed in `__RX65N_FreeRTOS_mbedtls/Debug` directory.
    You can check generated binary for memory mapping by:
    ```
    rx-elf-objdump -h Debug/palTests.elf
    rx-elf-objdump -h Debug/palTests.mot
    ```
Also, for automatic deployment and build, you can run build script `rebuild_debug.sh`. 
```
./build_debug.sh
```
> Note: before using script, please check RXGCC var value.

## Flashing & Running
> Note: RX65N MCU can be flashed only from x64 Windows OS environment.
1) Download and install [Renesas E2 emulator Lite](https://www.renesas.com/br/en/software/D4000986.html) software.
2) Download and install [Renesas Flash Programmer](https://www.renesas.com/eu/en/products/software-tools/tools/programmer/renesas-flash-programmer-programming-gui.html) on x64 Windows OS system.
3) Setup new project in Renesas Flash Programmer with next settings:
    * Microcontroller: __RX65x__
    * Tool: __E2 emulator Lite__
    * Interface: __FINE__
    > Note: for prompt of the ID-code click Ok 
    > (accept 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF Id-code).
4) Connect cable to _ECN1_ mini-USB port of the _E2 emulator Lite_, placed on lower _MCU board_.
5) Extract _black jumper_ under _USER_SW_ button for debugger mode activation.
6) Flash **.mot** file from `__RX65N_FreeRTOS_mbedtls/Debug` folder into device.
7) Set _black jumper_ under _USER_SW_ button for board regular running.

> Note: for console output used _CN18_ mini-USB port from upper _sensor board_. UART settings: 115200 8N1.