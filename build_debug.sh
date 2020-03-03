#!/bin/bash

rm -fr __RX65N_FreeRTOS_mbedtls

printf "\n\n\t=== Set RXGCC toolchain path\n\n"
export RXGCC_DIR="$HOME/toolchains/gcc_8.3.0.201904_gnurx-elf"
printf "RXGCC_DIR: %s\n" $RXGCC_DIR

printf "\n\n\t=== Deploy PAL for RX65N target\n\n"
python pal-platform/pal-platform.py deploy --target=RX65N_FreeRTOS_mbedtls generate

printf "\n\n\t=== Build RX65N platform port mbed (debug config)\n\n"
make -C pal-platform/SDK/RX65N_FreeRTOS/build -j8 lib

# printf "\n\n\t=== Generate Mbed Cloud Client makefiles (debug config)\n\n"
cd __RX65N_FreeRTOS_mbedtls/
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug \
-DCMAKE_TOOLCHAIN_FILE=./../pal-platform/Toolchain/RXGCC/RXGCC.cmake \
-DEXTERNAL_DEFINE_FILE=./../define-RX65N-FreeRTOS-common.txt > cmake_log.txt

printf "\n\n\t=== Build mbed-cloud-client app (debug config)\n\n"
# make -j4 mbedCloudClientExample.elf
# make
# make -j8 NetworkTests.elf
# make -j8 RTOSTests.elf
make VERBOSE=1 palTests.elf > build_log.txt
