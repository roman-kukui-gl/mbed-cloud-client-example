/*
 * Copyright (c) 2018-2019 ARM Limited. All rights reserved.
 * SPDX-License-Identifier: Apache-2.0
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef PAL_HEADER_SOTP_FS_FREERTOS
#define PAL_HEADER_SOTP_FS_FREERTOS

#define PAL_USE_HW_ROT 0
#define PAL_USE_HW_RTC 0
#define PAL_USE_HW_TRNG 1
#define PAL_USE_INTERNAL_FLASH 1
#define PAL_USE_SECURE_TIME 0

/* ************************************************************************* */
/* RX65N - R5F565NE flash mapping */
/// \todo Move defines to proper, board-specific, place

#define PAL_INT_FLASH_NUM_SECTIONS              2
#define PAL_INTERNAL_FLASH_SECTION_1_ADDRESS    0xFFFFC000   // FLASH_CF_BLOCK_1
#define PAL_INTERNAL_FLASH_SECTION_1_SIZE       0x2000       // 8KB
#define PAL_INTERNAL_FLASH_SECTION_2_ADDRESS    0xFFFFA000   // FLASH_CF_BLOCK_2
#define PAL_INTERNAL_FLASH_SECTION_2_SIZE       0x2000       // 8KB

#include "FreeRTOS_default.h"

#endif //PAL_HEADER_SOTP_FS_FREERTOS
