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

###############################################################################
###     Includes

# mbed-cloud-client requirements
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/mbed_cc_port/inc)

# internal board requirements
# \todo Change header dir
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/aws_cc_port/freertos)    # serial_term_uart.h


###############################################################################
###     Comile options

if(CMAKE_COMPILER_IS_GNUCC)
    message("\n\t(i) used GNUCC Compiler\n")
    # set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb")
    # set(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -mfpu=fpv4-sp-d16")
    # set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mfpu=fpv4-sp-d16")
    # set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--whole-archive \
    # -T${CMAKE_SOURCE_DIR}/pal-platform/Platform/${TRGT}_FreeRTOS/script/ra6m3.ld \
    # -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb\
    # -lboard -lc -lm -lnosys")
endif(CMAKE_COMPILER_IS_GNUCC)

link_directories(${CMAKE_CURRENT_SOURCE_DIR}/../pal-platform/SDK/${TRGT}_FreeRTOS/build)