#################################################################################
#  Copyright 2016, 2017 ARM Ltd.
#  
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#  
#      http://www.apache.org/licenses/LICENSE-2.0
#  
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#################################################################################

########### COMPILER FLAGS  ###########
#
#######################################
macro(SET_COMPILER_DBG_RLZ_FLAG flag value)
        SET(${flag}_DEBUG "${${flag}_DEBUG} ${value}")
        SET(${flag}_RELEASE "${${flag}_RELEASE} ${value}")
if (0)
 message("flag = ${flag}")
 message("value = ${value}")
 message("MY_C_FLAGS_RELEASE2 = ${CMAKE_C_FLAGS_RELEASE}")
endif(0) # comment end
endmacro(SET_COMPILER_DBG_RLZ_FLAG)


SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "")

########### ASSEMBLER DEBUG ###########
SET(CMAKE_ASM_FLAGS_DEBUG "${CMAKE_ASM_FLAGS_DEBUG} -DDEBUG")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-D__STARTUP_CLEAR_BSS")
SET(CMAKE_ASM_FLAGS_DEBUG "${CMAKE_ASM_FLAGS_DEBUG} -O0")
SET(CMAKE_ASM_FLAGS_DEBUG "${CMAKE_ASM_FLAGS_DEBUG} -g2")

########### ASSEMBLER GENERAL #########
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-Wall")

SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-ffunction-sections")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-fdata-sections")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-Wstack-usage=100")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-mcpu=rx64m")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-misa=v2")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-mlittle-endian-data")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-x assembler-with-cpp")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-Wa,--gdwarf2")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-Wa,-adlhn=\"$(basename $(notdir $<)).lst\"")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-MMD")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-MP")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-MF\"$(@:%.o=%.d)\"")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_ASM_FLAGS "-MT\"$(@)\"")

message("${CMAKE_SOURCE_DIR}/include_file.txt")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "@${CMAKE_SOURCE_DIR}/include_file.txt")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "@${CMAKE_SOURCE_DIR}/include_file.txt")


# Debug specific
SET(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -DDEBUG")

########### C Debug specific ###########
SET(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g2")
SET(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0")				# no optimisation

########### C Flags ############
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "-mcpu=rx64m")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "-Wall")

# Board specific
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "-ffunction-sections")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "-fdata-sections")

# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "-Wstack-usage=100")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "-misa=v2")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "-mlittle-endian-data")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "-std=gnu99")

SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "-Wa,-adlnh=\"$(basename $(notdir $<)).lst\"")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "-MMD")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "-MP")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "-MF\"$(@:%.o=%.d)\"")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_C_FLAGS "-MT\"$(@)\" \"$<\"")

########### Release specific ###########
SET(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -DNDEBUG")
SET(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -Os")
######################################


########### LINKER FLAGS  ###########
SET(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -g2")
SET(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0")
######################################
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-Wall")

SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-ffunction")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-sections")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-fdata")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-sections ")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-Wstack-usage=100")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-mcpu=rx64m")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-misa=v2")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-mlittle-endian-data")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-Wl,--start-group")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-lm")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-lc")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-lgcc")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-Wl,--end-group")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-nostartfiles")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-Wl,-e_PowerON_Reset")
SET_COMPILER_DBG_RLZ_FLAG (CMAKE_CXX_FLAGS "-Wl,-M=aws_demos.map")
#####################################

########### DEBUG ###########
# Debug specific
# SET(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS_DEBUG} -g2")

########### LINKER RELEASE ###########
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-mcpu=rx64m")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-Wall")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-mfloat-abi=hard")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "--specs=nosys.specs")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-fno-common")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-ffunction-sections")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-fdata-sections")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-ffreestanding")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-fno-builtin")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-mthumb")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-mapcs")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-Xlinker")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "--gc-sections")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-Xlinker")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-static")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-Xlinker")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-z")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-Xlinker")
# SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "muldefs")

# if (PAL_MEMORY_STATISTICS) #currently working only in gcc based compilers
# 	SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-Wl,--wrap=malloc")
# 	SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-Wl,--wrap=free")
# 	SET_COMPILER_DBG_RLZ_FLAG (CMAKE_EXE_LINKER_FLAGS "-Wl,--wrap=calloc")
# 	add_definitions("-DPAL_MEMORY_STATISTICS")
# endif()
