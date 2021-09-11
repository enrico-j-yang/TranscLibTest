#ifndef _BURNTOOL3LIBTEST_H_
    #define _BURNTOOL3LIBTEST_H_

    #ifdef __cplusplus
extern "C"
{
    #endif 

	// Unmask this macro to ignore test object, all return values are supposed 
	// to be TRUE.
	#define MASK_TEST_OBJECT

    // Unmask this macro to print parameters of API to log file
    #define DEBUG_PARAM

    // Unmask this macro to use debug version test object
    #define DEBUG_TEST_OBJECT

    #pragma comment(lib, "USBTransc.lib")

    #ifndef DEBUG_TEST_OBJECT
        #pragma comment(lib, "transc.lib")
    #else 
        #pragma comment(lib, "transc_debug.lib")
    #endif 

	
	enum 
	{
		SET_RAM_PARAM = 0,
		DOWNLOAD_PRODUCER,		
		SWITCH_USB_HIGH_SPEED,
		TEST_CONNECTION,
		SET_MODE,
		GET_FLASH_ID,
		SET_NAND_PARAM,
		//DETECT_NAND_PARAM,
		INIT_SEC_AREA,
		SET_RESV_AREA_SIZE,
		DOWNLOAD_BIN,
		CREATE_PARTITION,
		FORMAT_DRIVER,
		MOUNT_DRIVER,
		DOWNLOAD_BOOT,
		DOWNLOAD_IMG,
		DOWNLOAD_FILE,
		CLOSE,
		SET_GPIO,
		UPLOAD_BOOT,
		UPLOAD_BIN,
		RESET_DEVICE,
		GET_REG_VALUE,
		GET_VERSION,
		WRITE_MOBILE_DEVICE_CODE,
		GET_DISK_INFO,
		WRITE_ASA_FILE,
		BURN_CMD_COUNT,// for event count
	};

    #include "lua.h"
    #include "lauxlib.h"
    #include "lualib.h"
    #include "anyka_types.h"

    typedef BOOL(*tpfnBurnProcess)(UINT nID);
    typedef VOID(*tpfnBurnProgress)(UINT nID, UINT nDataLen);

	// test data structure is according to test object API parameters and return
	// types
    typedef struct t_TestData
    {
        struct 
        {
            UINT nBurrnObject;
            tpfnBurnProcess pfnBurnProcess;
            tpfnBurnProgress pfnBurnProgress;
            UINT Ret;
        } td_Init;

        struct
        {
            TCHAR *pstrUSBName;
            E_USB_TYPE usbType;
            UINT Ret;
        } td_AttachUSB;

        struct
        {
            TCHAR *pstrUSBName;
            E_USB_TYPE usbType;
            UINT Ret;
        } td_DetachUSB;

        struct td_Start{}
        ;

        struct
        {
            UINT nID;
            T_RAM_REG *RamReg;
            UINT nNumReg;
            UINT Ret;
        } td_SetRamParam;

        struct
        {
            UINT nID;
            TCHAR *pstrPath;
            UINT runAddr;
            UINT Ret;
        } td_DownloadProducer;

        struct
        {
            UINT nID;
            UINT Ret;
        } td_SwitchUSBHighSpeed;

        struct
        {
            UINT nID;
            UINT Ret;
        } td_TestConnection;

        struct
        {
            UINT nID;
            E_BURN_MODE mode;
            UINT Ret;
        } td_SetMode;

        struct
        {
            UINT nID;
			UINT ce2_gpio;
			UINT ce3_gpio;
            UINT *FlashID;
            UINT *nChipCnt;
            UINT Ret;
        } td_GetFlashID;

        struct
        {
            UINT nID;
            T_NAND_PHY_INFO *NandPhyInfo;
            UINT Ret;
        } td_SetNandParam;
/*
        struct
        {
            UINT nID;
            T_NAND_PHY_INFO *pNandPhyInfo;
            UINT Ret;
        } td_DetectNandParam;
*/
        struct
        {
            UINT nID;
			UINT Type;
            UINT Ret;
        } td_InitSecArea;

        struct
        {
            UINT nID;
            UINT nSize;
			BOOL bErase;
            UINT Ret;
        } td_SetResvAreaSize;

        struct
        {
            UINT nID;
            T_DOWNLOAD_BIN *pDownloadBin;
            UINT Ret;
        } td_DownloadBin;

        struct
        {
            UINT nID;
            T_PARTION_INFO *PartitionInfo;
            UINT nNumPartition;
            UINT resvSize;
            UINT Ret;
        } td_CreatePartition;

        struct
        {
            UINT nID;
            T_FORMAT_DRIVER *formatDriver;
            UINT Ret;
        } td_FormatDriver;

        struct
        {
            UINT nID;
            char *driverName;
            UINT nDriverNum;
            UINT Ret;
        } td_MountDriver;

        struct
        {
            UINT nID;
            TCHAR *pstrPath;
            E_CHIP_TYPE ChipType;
            UINT Ret;
        } td_DownloadBoot;

        struct
        {
            UINT nID;
            T_DOWNLOAD_IMG *pDownloadImg;
            UINT Ret;
        } td_DownloadImg;

        struct
        {
            UINT nID;
            T_DOWNLOAD_FILE *pDownloadFile;
            UINT Ret;
        } td_DownloadFile;

        struct
        {
            UINT nID;
            UINT Ret;
        } td_Close;

        struct
        {
            UINT nID;
            T_GPIO_PARAM *GpioParam;
            UINT Ret;
        } td_SetGPIO;

/*
        struct
        {
            UINT nID;
            TCHAR *strFilePath;
            TCHAR *strPCPath;
            UINT Ret;
        } td_UploadFile;
*/

		struct
        {
            UINT nID;
            TCHAR *pstrPath;
            UINT fileLen;
            UINT Ret;
        } td_UploadBoot;

		struct
        {
            UINT nID;
			T_UPLOAD_BIN* pUploadBin;
            UINT Ret;
        } td_UploadBin;
		

        struct
        {
            UINT nID;
            UINT Ret;
        } td_ResetDevice;

        struct
        {
            UINT nID;
            UINT regAddr;
            UINT *regValue;
            UINT Ret;
        } td_GetRegValue;

        struct
        {
            UINT *MainVersion;
            UINT *SubVersion;
            UINT Ret;
        } td_GetVersion;
		
		struct
        {
			UINT nID;
            UINT Ret;
        } td_WriteMobileDeviceCode;

		struct
        {
			UINT nID;
			UINT *DriverNum;
            T_DRIVER_INFO *pDriverInfo;
            UINT Ret;
        } td_GetDiskInfo;
		
		struct
        {
			UINT nID;
			char* fileName;
            BYTE* pBuf;
			UINT bufSize;
			UINT mode;
            UINT Ret;
        } td_WriteASAFile;


    }

    T_TEST_INPUT_DATA;



    extern LUALIB_API int luaopen_burntool3libtest(lua_State *L);

    extern T_pSTR TC_GetBTTestCodeVersion(T_VOID);

    #ifdef __cplusplus
};
    #endif 

#endif // _BURNTOOL3LIBTEST_H_
