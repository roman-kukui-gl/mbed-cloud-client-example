message ("\n\n\t=== Process FreeRTOS.cmake ...\n")

# PAL build system configuration

# /mbed-cloud-client/mbed-client-pal/Source/Port/Reference-Impl/ \
#   /OS_Specific/FreeRTOS/
set (OS_BRAND FreeRTOS)

# select network satck placed at:
# /mbed-cloud-client/mbed-client-pal/Source/Port/Reference-Impl/ \
#   /OS_Specific/FreeRTOS/Networking/WIFI-SX-ULPGN/pal_plat_network.c
set(NETWORK_STACK WIFI-SX-ULPGN)

# PAL configuration
# add_definitions(-DTARGET_${TRGT})
add_definitions(-D__FREERTOS__)

# OS includes
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/FreeRTOS/inc)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/FreeRTOS/cfg)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/FreeRTOS/portable/GCC/RX600v2)   # portmacro.h
# include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/)
# include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/)
# include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/)

# Network stack includes

link_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/build)