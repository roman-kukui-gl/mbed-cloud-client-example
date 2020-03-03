#!/bin/bash
rm __RX65N_FreeRTOS_mbedtls/Debug/palTests.elf

cd __RX65N_FreeRTOS_mbedtls

/home/roman/toolchains/gcc_8.3.0.201904_gnurx-elf/bin/rx-elf-g++ \
-Wl,--verbose \
-O0 \
-ffunction-sections \
-fdata-sections \
-g2 \
-Wstack-usage=100 \
-mcpu=rx64m \
-misa=v2 \
-mlittle-endian-data \
-o Debug/palTests.elf \
\
-Wl,-u,_Except_Vectors \
-Wl,-u,_Reset_Vector \
-Wl,-u,_PowerON_Reset_PC \
\
Debug/libpalTests.a Debug/libmbedtls.a Debug/libmbedcrypto.a Debug/libmbedx509.a Debug/libplatformCommon.a Debug/libplatformCommonROT.a Debug/libmbedCloudClient.a Debug/libfactory-configurator-client.a Debug/libesfs.a Debug/libsotp.a Debug/libtinycbor.a Debug/libmbedTrace.a Debug/libcertificate-enrollment-client.a Debug/libsecure-device-access-client.a Debug/libcose.a \
Debug/libsanityTests.a Debug/libRTOSTests.a Debug/libROTTests.a Debug/libEntropyTests.a Debug/libNetworkTests.a Debug/libDRBGTests.a Debug/libFileSystemTests.a Debug/libSSTTests.a Debug/libTimeTests.a Debug/libTLSTests.a Debug/libcloud_credentials.a Debug/libCryptoTests.a Debug/libUpdateTests.a Debug/libFlashTests.a Debug/libSotpTests.a Debug/libplatformCommon.a Debug/libpalunity.a Debug/libupdate-client.a Debug/libpal.a Debug/libpalNetworking.a Debug/libpalEntropy.a \
Debug/libmbedclient.a Debug/libpalTLS.a Debug/libnanostackeventloop.a Debug/libkey-config-manager.a Debug/libcrypto-service.a Debug/libpalTime.a Debug/libfccstorage.a Debug/libesfs.a Debug/libpalFilesystem.a Debug/libpalDRBG.a Debug/libpalCrypto.a Debug/libmbedtls.a Debug/libmbedx509.a Debug/libmbedcrypto.a Debug/libpalROT.a Debug/libplatformCommonROT.a Debug/libsotp.a Debug/libmbedcoap.a Debug/libmbedTrace.a Debug/libnanostacklibservice.a Debug/libmbedclientrandlib.a Debug/libnshalpal.a Debug/libpalRTOS.a \
../pal-platform/SDK/RX65N_FreeRTOS/build/libboard.a \
-T "/home/roman/proj/mbed-cc-app-rx65n/pal-platform/Device/RX65N/linker_script.ld" \
-Wl,--start-group \
-lm \
-lc \
-lgcc \
-Wl,--end-group \
-nostartfiles \
-Wl,-e_PowerON_Reset \
-Wl,-M=palTests.map > link_log.txt

rx-elf-objdump -h Debug/palTests.elf

rx-elf-objcopy Debug/palTests.elf -O srec -I elf32-rx-be-ns  Debug/palTests.mot
rx-elf-objdump -h Debug/palTests.mot
