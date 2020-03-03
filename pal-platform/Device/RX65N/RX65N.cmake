# platform name
set (TRGT RX65N)

# PAL build configuartion
set(PAL_TARGET_DEVICE "${TRGT}")
set(TARGET_NAME TARGET_${TRGT})

add_definitions(-DTARGET_${TRGT})

# RUN. Non standart Mbed application entrypoint
add_definitions(-DMBED_CLOUD_APPLICATION_NONSTANDARD_ENTRYPOINT)

###############################################################################
###     Tests

# TEST. Non standart test entrypoint.
add_definitions(-DPAL_UNIT_TESTING_NONSTANDARD_ENTRYPOINT)

# Use external Unity configuration file.
add_definitions(-DUNITY_INCLUDE_CONFIG_H)

# \todo Read how tests selector work.
# Test selector for palTests.elf
add_definitions(-DPAL_UNIT_TEST_RTOS)
set(PAL_TEST_RTOS 1)

# select target for flash driver
add_definitions(-DBSP_MCU_RX65N)

###############################################################################
###     Includes

# empty terminators (became clean after full porting)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/mbed_cc_port/inc)

# board general configuration
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/board/general)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/board/r_config)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/board/r_pincfg)

# bsp -board software package
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/drv/r_bsp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/drv/r_bsp/board/generic_rx65n)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/drv/r_bsp/mcu/rx65n)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/drv/r_bsp/mcu/rx65n/register_access/gnuc)

# internal flash driver
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/drv/r_flash_rx)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/drv/r_flash_rx/ref)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/drv/r_flash_rx/src)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/drv/r_flash_rx/src/flash_type_1)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/drv/r_flash_rx/src/flash_type_3)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/drv/r_flash_rx/src/flash_type_4)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/drv/r_flash_rx/src/targets/rx65n)

# internal board requirements
# \todo Change header dir
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/aws_cc_port/freertos)    # serial_term_uart.h


###############################################################################
###     Compile options

if(CMAKE_COMPILER_IS_GNUCC)
    message("\n\t(i) used GNUCC Compiler\n")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
    -mcpu=rx64m \
    -misa=v2 \
	-mlittle-endian-data \
    ")

    set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} \
    -mcpu=rx64m \
    -misa=v2 \
    -mlittle-endian-data \
    ")

    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} \
    -mcpu=rx64m \
    -misa=v2 \
    -mlittle-endian-data \
    -Wl,-e_PowerON_Reset \
    -Wl,-M=aws_demos.map \
    ")

    # -Wl,--whole-archive   # error - multiple definition in file
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} \
    -T${CMAKE_SOURCE_DIR}/pal-platform/SDK/${TRGT}_FreeRTOS/board/linker_script.ld \
    -mcpu=rx64m \
    -misa=v2 \
    -mlittle-endian-data \
    \
    -lboard \
    \
    -Wl,-e_PowerON_Reset \
    -Wl,-M=aws_demos.map \
    ")
endif(CMAKE_COMPILER_IS_GNUCC)

link_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/build)