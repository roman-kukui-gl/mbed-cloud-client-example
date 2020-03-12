#!/bin/bash

printf "\n\n\t=== Set RXGCC toolchain path\n\n"
export RXGCC_DIR="$HOME/toolchains/gcc_8.3.0.201904_gnurx-elf"
printf "RXGCC_DIR: %s\n" $RXGCC_DIR

cd __RX65N_FreeRTOS_mbedtls

make -j8 palTests.elf

rx-elf-objdump -h Debug/palTests.elf

# rx-elf-objcopy Debug/palTests.elf -O srec -I elf32-rx-be-ns  Debug/palTests.mot
rx-elf-objdump -h Debug/palTests.mot