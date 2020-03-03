#include "mcc_common_setup.h"
#include "mcc_common_config.h"
#include "pal.h"

// ****************************************************************************
// *** Common ***

int mcc_platform_init(void)
{
    /// \todo

    return 0;
}

int mcc_platform_run_program(main_t mainFunc)
{
    mainFunc();
    return 1;
}

void mcc_platform_sw_build_info() {
    // printf("RX65N App ready. Build at: " __DATE__ " " __TIME__ "\n");
}

void mcc_platform_do_wait(int timeout_ms)
{
    /// \todo
}

// ****************************************************************************
// *** Network ***

void mcc_platform_interface_init(void)
{
    /// \todo
}

int mcc_platform_init_connection(void)
{
    return mcc_platform_interface_connect();
}

void* mcc_platform_get_network_interface(void)
{
    return mcc_platform_interface_get();
}

int mcc_platform_interface_connect(void)
{
    /// \todo

    return 0;
}

void* mcc_platform_interface_get(void)
{
    /// \todo

    return NULL;
}

int mcc_platform_interface_close() {
    /// \todo
    return 0;
}

// ****************************************************************************
// *** Storage ***

int mcc_platform_storage_init(void)
{
    palStatus_t status = PAL_SUCCESS;

    /// \todo

    return status;
}

int mcc_platform_reformat_storage(void)
{
    /// \todo

    return 0;
}