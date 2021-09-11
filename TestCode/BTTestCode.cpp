#include "stdafx.h"
#include "transc.h"
#include "BTTestCode.h"
#include "TestEngine.h"
#include "loglib.h"
#include "Test_Utils.h"

#include <process.h>

#define ERROR_CHIP_ID			0xFFFFFFFF
#define TEST_CODE_VERSION		"V0.2.0"

extern T_CHR pszModuleName[MAX_PATH];
extern T_U32 ulUSBNameLen;
extern T_NAND_PHY_INFO SUPPORT_NAND_TABLE[];
extern T_TEST_CASE_LIST *g_ptTestCaseList;

T_BOOL g_PerformanceTest = AK_FALSE;
t_TestData tTestData;
T_U32 g_ulTestCaseCnt = 0;

HANDLE g_semInit = NULL;
HANDLE g_semAttachUSB = NULL;
HANDLE g_semDetachUSB = NULL;
HANDLE g_semStart = NULL;
HANDLE g_semSetRamParam = NULL;
HANDLE g_semDownloadProducer = NULL;
HANDLE g_semSwitchUSBHighSpeed = NULL;
HANDLE g_semTestConnection = NULL;
HANDLE g_semSetMode = NULL;
HANDLE g_semGetFlashID = NULL;
HANDLE g_semSetNandParam = NULL;
//HANDLE g_semDetectNandParam = NULL;
HANDLE g_semInitSecArea = NULL;
HANDLE g_semSetResvAreaSize = NULL;
HANDLE g_semDownloadBin = NULL;
HANDLE g_semCreatePartition = NULL;
HANDLE g_semFormatDriver = NULL;
HANDLE g_semMountDriver = NULL;
HANDLE g_semDownloadBoot = NULL;
HANDLE g_semDownloadImg = NULL;
HANDLE g_semDownloadFile = NULL;
HANDLE g_semClose = NULL;
HANDLE g_semSetGPIO = NULL;
HANDLE g_semUploadBoot = NULL;
HANDLE g_semUploadBin = NULL;
HANDLE g_semResetDevice = NULL;
HANDLE g_semGetRegValue = NULL;
HANDLE g_semGetVersion = NULL;
HANDLE g_semGetDiskInfo = NULL;
HANDLE g_semWriteASAFile = NULL;
HANDLE g_semWriteMobileDeviceCode = NULL;

HANDLE g_EvtBurnCmd[BURN_CMD_COUNT];
HANDLE g_EvtInit = NULL;
HANDLE g_EvtAttachUSB = NULL;
HANDLE g_EvtDetachUSB = NULL;
HANDLE g_EvtStart = NULL;

HANDLE g_EvtInitEnd = NULL;
HANDLE g_EvtAttachUSBEnd = NULL;
HANDLE g_EvtDetachUSBEnd = NULL;
HANDLE g_EvtStartEnd = NULL;
HANDLE g_EvtSetRamParamEnd = NULL;
HANDLE g_EvtDownloadProducerEnd = NULL;
HANDLE g_EvtSwitchUSBHighSpeedEnd = NULL;
HANDLE g_EvtTestConnectionEnd = NULL;
HANDLE g_EvtSetModeEnd = NULL;
HANDLE g_EvtGetFlashIDEnd = NULL;
HANDLE g_EvtSetNandParamEnd = NULL;
//HANDLE g_EvtDetectNandParamEnd = NULL;
HANDLE g_EvtInitSecAreaEnd = NULL;
HANDLE g_EvtSetResvAreaSizeEnd = NULL;
HANDLE g_EvtDownloadBinEnd = NULL;
HANDLE g_EvtCreatePartitionEnd = NULL;
HANDLE g_EvtFormatDriverEnd = NULL;
HANDLE g_EvtMountDriverEnd = NULL;
HANDLE g_EvtDownloadBootEnd = NULL;
HANDLE g_EvtDownloadImgEnd = NULL;
HANDLE g_EvtDownloadFileEnd = NULL;
HANDLE g_EvtCloseEnd = NULL;
HANDLE g_EvtSetGPIOEnd = NULL;
//HANDLE g_EvtUploadFileEnd = NULL;
HANDLE g_EvtUploadBootEnd = NULL;
HANDLE g_EvtUploadBinEnd = NULL;
HANDLE g_EvtResetDeviceEnd = NULL;
HANDLE g_EvtGetRegValueEnd = NULL;
HANDLE g_EvtGetVersionEnd = NULL;
HANDLE g_EvtWriteMobileDeviceCodeEnd = NULL;
HANDLE g_EvtGetDiskInfoEnd = NULL;
HANDLE g_EvtWriteASAFileEnd = NULL;
HANDLE g_EvtBurnProcessEnd = NULL;

static T_U32 g_ulThreadCnt = 0;

//global variables about ram registers config
//RAM TYPE MCP
static UINT reg_addr_mcp[] = 
{
    0x2002d004, 0x2002d000, 0x66668888, 0x2002d000, 0x2002d000, 0x66668888,
        0x2002d000, 0x66668888, 0x88888888
};

static UINT reg_value_mcp[] = 
{
    0x09527214, 0xe0110000, 0x0007d000, 0xe0120400, 0xe0100033, 0x000000c8,
        0xe0108000, 0x000000c8, 0x00000000
};

//RAM TYPE SDRAM
static UINT reg_addr_sdr[] = 
{
    0x2002d008, 0x2002d004, 0x2002d000, 0x2002d000, 0x2002d000, 0x66668888,
        0x2002d000, 0x2002d000, 0x2002d000, 0x88888888
};
static UINT reg_value_sdr[] = 
{
    0x00067d00, 0x09527214, 0xe0170000, 0xe0120400, 0xe0100033, 0x000000c8,
        0xe0124400, 0xe0110000, 0xe0110000, 0x00000000
};

//RAM TYPE DDR
// ASIC = 124M
static UINT reg_addr_ddr[] = 
{
    0x080000dc, 0x08000004, 0x66668888, 0x66668888,  // pll = 248Mhz
    0x20026000, 0x66668888, 0x66668888,  // set uart baudrate
    0x08000064, 0x080000a8,  // use sstl2 , open ien, 
    0x2002d004, 0x66668888, 0x2002d000, 0x2002d000, 0x66668888, 0x2002d000,
        0x66668888, 0x2002d000, 0x66668888, 0x2002d000, 0x66668888, 0x2002d000,
        0x66668888, 0x2002d000, 0x66668888, 0x2002d000, 0x66668888, 0x2002d000,
        0x2002d008
};
static UINT reg_value_ddr[] = 
{
    0x0000000c, 0x00021051, 0x000000c8, 0x000000c8, 0x30200433, 0x000000c8,
        0x000000c8, 0x08000000, 0x44000000, 0x0f706b95, 0x000000c8, 0x40170000,
        0x40120400, 0x000000c8, 0x40104000, 0x000000c8, 0x40100123, 0x000000c8,
        0x40120400, 0x000000c8, 0x40110000, 0x000000c8, 0x40110000, 0x000000c8,
        0x40100023, 0x000000c8, 0x60170000, 0x01027c58
};

BOOL TestBurnProcess(UINT nID);

VOID TestBurnProgress(UINT nID, UINT nDataLen);

T_pSTR TC_GetBTTestCodeVersion(T_VOID)
{
    return TEST_CODE_VERSION;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_Init(lua_State *L)
{
    enum ARG
    {
        ARG_BURNOBJECT = 1, ARG_BURNPROCESS, ARG_BURNPROGRESS, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nBurnObject = 0;
    tpfnBurnProcess pfnBurnProcess = (tpfnBurnProcess)AK_NULL;
    tpfnBurnProgress pfnBurnProgress = (tpfnBurnProgress)AK_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 3)
    {
        lua_pushnil(L);
        return 1;
    }

    nBurnObject = (T_U32)lua_tointeger(L, ARG_BURNOBJECT);

    if (lua_isuserdata(L, ARG_BURNPROCESS))
    {
        pfnBurnProcess = (tpfnBurnProcess)lua_touserdata(L, ARG_BURNPROCESS);
    }
    else
    {
        if (lua_isnumber(L, ARG_BURNPROCESS))
        {
            pfnBurnProcess = (tpfnBurnProcess)lua_tointeger(L, ARG_BURNPROCESS);
        }
        else
        {
            //		LOG("ERR: Lua_BT_Init--argv[2] is not userdata\n");			
            lua_pushnil(L);
            return 1;
        }
    }

    if (lua_isuserdata(L, ARG_BURNPROGRESS))
    {
        pfnBurnProgress = (tpfnBurnProgress)lua_touserdata(L, ARG_BURNPROGRESS);
    }
    else
    {
        if (lua_isnumber(L, ARG_BURNPROGRESS))
        {
            pfnBurnProgress = (tpfnBurnProgress)lua_tointeger(L,
                               ARG_BURNPROGRESS);
        }
        else
        {
            //		LOG("ERR: Lua_BT_Init--argv[3] is not userdata\n");
            lua_pushnil(L);
            return 1;
        }

    }

    WaitForSingleObject(g_semInit, INFINITE);
    rsl = BT_Init(nBurnObject, pfnBurnProcess, pfnBurnProgress);
    ReleaseSemaphore(g_semInit, 1, 0);

    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_AttachUSB(lua_State *L)
{
    enum ARG
    {
        ARG_USBNAME = 1, ARG_USBTYPE, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    TCHAR *pwstrUSBName = (TCHAR*)AK_NULL;
    E_USB_TYPE usbType = USB_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 2)
    {
        lua_pushnil(L);
        return 1;
    }

    if (lua_isuserdata(L, ARG_USBNAME))
    {
        pwstrUSBName = (TCHAR*)lua_touserdata(L, ARG_USBNAME);
    }
    else
    {
        if (lua_isnumber(L, ARG_USBNAME))
        {
            pwstrUSBName = (TCHAR*)lua_tointeger(L, ARG_USBNAME);
        }
        else
        {
            //			LOG("ERR: Lua_BT_AttachUSB--argv[1] is not userdata\n");
            lua_pushnil(L);
        }
    }

    usbType = (E_USB_TYPE)lua_tointeger(L, ARG_USBTYPE);

    WaitForSingleObject(g_semAttachUSB, INFINITE);
#ifdef MASK_TEST_OBJECT
    rsl = 1;
#else 
    rsl = BT_AttachUSB(pwstrUSBName, usbType);
#endif 
    ReleaseSemaphore(g_semAttachUSB, 1, 0);

    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_DetachUSB(lua_State *L)
{
    enum ARG
    {
        ARG_USBNAME = 1, ARG_USBTYPE, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_pSTR pstrUSBName = (T_pSTR)AK_NULL;
    TCHAR *LpstrUSBName = (TCHAR*)AK_NULL;
    E_USB_TYPE usbType = USB_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 2)
    {
        lua_pushnil(L);
        return 1;
    }

    if (lua_isuserdata(L, ARG_USBNAME))
    {
        pstrUSBName = (T_pSTR)lua_touserdata(L, ARG_USBNAME);
    }
    else
    {
        //		LOG("ERR: Lua_BT_AttachUSB--argv[1] is not userdata\n");
        lua_pushnil(L);
    }

    usbType = (E_USB_TYPE)lua_tointeger(L, ARG_USBTYPE);

    WaitForSingleObject(g_semDetachUSB, INFINITE);
#ifdef MASK_TEST_OBJECT
    rsl = 1;
#else 
    rsl = BT_DetachUSB(_T(pstrUSBName), usbType);
#endif 
    ReleaseSemaphore(g_semDetachUSB, 1, 0);

    lua_pushnumber(L, rsl);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_Start(lua_State *L)
{
    T_U32 argcnt = 0;
    T_U32 rsl = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 0)
    {
        lua_pushnil(L);
        return 1;
    }

    WaitForSingleObject(g_semStart, INFINITE);
#ifdef MASK_TEST_OBJECT
    _beginthread((void(__cdecl*)(void*))TestBurnProcess, 0, NULL);
    rsl = AK_TRUE;
#else 
    rsl = BT_Start();
#endif 
    ReleaseSemaphore(g_semStart, 1, 0);

    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_SetRamParam(lua_State *L)
{
    enum ARG
    {
        ARG_ID = 1, ARG_RAMREG, ARG_NUMREG, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_RAM_REG *RamReg = (T_RAM_REG*)AK_NULL;
    T_U32 nNumReg = 0;

    argcnt = lua_gettop(L);

     if (argcnt != 3)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);


    if (lua_isuserdata(L, ARG_RAMREG))
    {
        RamReg = (T_RAM_REG*)lua_touserdata(L, ARG_RAMREG);
    }
    else
    {
        if (lua_isnumber(L, ARG_RAMREG))
        {
            RamReg = (T_RAM_REG*)lua_tointeger(L, ARG_RAMREG);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }

    nNumReg = lua_tointeger(L, ARG_NUMREG);



    tTestData.td_SetRamParam.nID = nID;
    tTestData.td_SetRamParam.RamReg = RamReg;
    tTestData.td_SetRamParam.nNumReg = nNumReg;

    //SetEvent(g_EvtSetRamParam);
	SetEvent(g_EvtBurnCmd[SET_RAM_PARAM]);
    ResetEvent(g_EvtSetRamParamEnd);
    WaitForSingleObject(g_EvtSetRamParamEnd, INFINITE);
    rsl = tTestData.td_SetRamParam.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_DownloadProducer(lua_State *L)
{
    enum ARG
    {
        ARG_ID = 1, ARG_PATH, ARG_RUNADDR, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_pSTR pszPath = (T_pSTR)AK_NULL;
    T_pSTR pszTemp = (T_pSTR)AK_NULL;
    T_U32 runAddr = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 3)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    if (lua_isstring(L, ARG_PATH))
    {
        pszTemp = (T_pSTR)lua_tostring(L, ARG_PATH);
        ConvertAbsolutePath(&pszPath, pszTemp);
    }
    else
    {
        if (lua_isnumber(L, ARG_PATH))
        {
            pszTemp = (T_pSTR)lua_tointeger(L, ARG_PATH);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }

    runAddr = lua_tointeger(L, ARG_RUNADDR);


    tTestData.td_DownloadProducer.nID = nID;

    tTestData.td_DownloadProducer.pstrPath = (TCHAR*)malloc(strlen(pszTemp) *2
        +2);

    if (AK_NULL == tTestData.td_DownloadProducer.pstrPath)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset(tTestData.td_DownloadProducer.pstrPath, 0, strlen(pszTemp) *2+2);
    }

    MultiByteToWideChar(CP_ACP, NULL, pszTemp, strlen(pszTemp) + 1,
                        tTestData.td_DownloadProducer.pstrPath, strlen(pszTemp)
                        *2+2);

    tTestData.td_DownloadProducer.runAddr = runAddr;
 //   SetEvent(g_EvtDownloadProducer);
	SetEvent(g_EvtBurnCmd[DOWNLOAD_PRODUCER]);
    ResetEvent(g_EvtDownloadProducerEnd);

    WaitForSingleObject(g_EvtDownloadProducerEnd, INFINITE);
    rsl = tTestData.td_DownloadProducer.Ret;

    free(tTestData.td_DownloadProducer.pstrPath);
    tTestData.td_DownloadProducer.pstrPath = (TCHAR*)AK_NULL;

    free(pszPath);

    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_SwitchUSBHighSpeed(lua_State *L)
{
    enum
    {
        ARG_ID = 1, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 1)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    
    tTestData.td_SwitchUSBHighSpeed.nID = nID;
    //SetEvent(g_EvtSwitchUSBHighSpeed);
	SetEvent(g_EvtBurnCmd[SWITCH_USB_HIGH_SPEED]);
    ResetEvent(g_EvtSwitchUSBHighSpeedEnd);
    WaitForSingleObject(g_EvtSwitchUSBHighSpeedEnd, INFINITE);
    rsl = tTestData.td_SwitchUSBHighSpeed.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_TestConnection(lua_State *L)
{
    enum
    {
        ARG_ID = 1, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 1)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    
    tTestData.td_TestConnection.nID = nID;
    //SetEvent(g_EvtTestConnection);
	SetEvent(g_EvtBurnCmd[TEST_CONNECTION]);
    ResetEvent(g_EvtTestConnectionEnd);
    WaitForSingleObject(g_EvtTestConnectionEnd, INFINITE);
    rsl = tTestData.td_TestConnection.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_SetMode(lua_State *L)
{
    enum ARG
    {
        ARG_ID = 1, ARG_MODE, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    E_BURN_MODE mode = MODE_NEWBURN;

    argcnt = lua_gettop(L);

    if (argcnt != 2)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    mode = (E_BURN_MODE)lua_tointeger(L, ARG_MODE);

    
    tTestData.td_SetMode.nID = nID;
    tTestData.td_SetMode.mode = mode;
//     SetEvent(g_EvtSetMode);
	SetEvent(g_EvtBurnCmd[SET_MODE]);
    ResetEvent(g_EvtSetModeEnd);
    WaitForSingleObject(g_EvtSetModeEnd, INFINITE);
    rsl = tTestData.td_SetMode.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_GetFlashID(lua_State *L)
{
    enum
    {
        ARG_ID = 1, 
		ARG_Ce2_g,
		ARG_Ce3_g,
		ARG_FLASHID, 
		ARG_CHIPCNT, 
    };


    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
	T_U32 ce2_gpio = 0;
	T_U32 ce3_gpio = 0;
    UINT *FlashID = (UINT*)AK_NULL;
    UINT *nChipCnt = (UINT*)AK_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 5)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);
	ce2_gpio = lua_tointeger(L, ARG_Ce2_g);
	ce3_gpio = lua_tointeger(L, ARG_Ce3_g);
    if (lua_isuserdata(L, ARG_FLASHID))
    {
        FlashID = (UINT*)lua_touserdata(L, ARG_FLASHID);
    }
    else
    {
        if (lua_isnumber(L, ARG_FLASHID))
        {
            FlashID = (UINT*)lua_tointeger(L, ARG_FLASHID);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }

    if (lua_isuserdata(L, ARG_CHIPCNT))
    {
        nChipCnt = (UINT*)lua_touserdata(L, ARG_CHIPCNT);
    }
    else
    {
        if (lua_isnumber(L, ARG_CHIPCNT))
        {
            nChipCnt = (UINT*)lua_tointeger(L, ARG_CHIPCNT);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }

    
    tTestData.td_GetFlashID.nID = nID;
	tTestData.td_GetFlashID.ce2_gpio = ce2_gpio;
	tTestData.td_GetFlashID.ce3_gpio = ce3_gpio;
    tTestData.td_GetFlashID.FlashID = FlashID;
    tTestData.td_GetFlashID.nChipCnt = nChipCnt;
//     SetEvent(g_EvtGetFlashID);
	SetEvent(g_EvtBurnCmd[GET_FLASH_ID]);
    ResetEvent(g_EvtGetFlashIDEnd);
    WaitForSingleObject(g_EvtGetFlashIDEnd, INFINITE);
    rsl = tTestData.td_GetFlashID.Ret;
    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_SetNandParam(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_NANDPHYINFO, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_NAND_PHY_INFO *NandPhyInfo = (T_NAND_PHY_INFO*)AK_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 2)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    if (lua_isuserdata(L, ARG_NANDPHYINFO))
    {
        NandPhyInfo = (T_NAND_PHY_INFO*)lua_touserdata(L, ARG_NANDPHYINFO);
    }
    else
    {
        if (lua_isnumber(L, ARG_NANDPHYINFO))
        {
            NandPhyInfo = (T_NAND_PHY_INFO*)lua_tointeger(L, ARG_NANDPHYINFO);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }

    
    tTestData.td_SetNandParam.nID = nID;
    tTestData.td_SetNandParam.NandPhyInfo = NandPhyInfo;
//     SetEvent(g_EvtSetNandParam);
	SetEvent(g_EvtBurnCmd[SET_NAND_PARAM]);
    ResetEvent(g_EvtSetNandParamEnd);
    WaitForSingleObject(g_EvtSetNandParamEnd, INFINITE);
    rsl = tTestData.td_SetNandParam.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////
/*
static int Lua_BT_DetectNandParam(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_NANDPHYINFO, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_NAND_PHY_INFO *NandPhyInfo = (T_NAND_PHY_INFO*)AK_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 2)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    if (lua_isuserdata(L, ARG_NANDPHYINFO))
    {
        NandPhyInfo = (T_NAND_PHY_INFO*)lua_touserdata(L, ARG_NANDPHYINFO);
    }
    else
    {
        if (lua_isnumber(L, ARG_NANDPHYINFO))
        {
            NandPhyInfo = (T_NAND_PHY_INFO*)lua_tointeger(L, ARG_NANDPHYINFO);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }

    WaitForSingleObject(g_semDetectNandParam, INFINITE);
    tTestData.td_DetectNandParam.nID = nID;
    tTestData.td_DetectNandParam.pNandPhyInfo = NandPhyInfo;
    SetEvent(g_EvtDetectNandParam);
    ResetEvent(g_EvtDetectNandParamEnd);
    WaitForSingleObject(g_EvtDetectNandParamEnd, INFINITE);
    rsl = tTestData.td_DetectNandParam.Ret;
    ReleaseSemaphore(g_semDetectNandParam, 1, 0);

    lua_pushnumber(L, rsl);

    return 1;
}
*/
///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_InitSecArea(lua_State *L)
{
    enum
    {
        ARG_ID = 1, 
		ARG_Type,
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
	T_U32 Type = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 2)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);
	Type = lua_tointeger(L, ARG_Type);
    
    tTestData.td_InitSecArea.nID = nID;
	tTestData.td_InitSecArea.Type = Type;
//     SetEvent(g_EvtInitSecArea);
	SetEvent(g_EvtBurnCmd[INIT_SEC_AREA]);
    ResetEvent(g_EvtInitSecAreaEnd);
    WaitForSingleObject(g_EvtInitSecAreaEnd, INFINITE);
    rsl = tTestData.td_InitSecArea.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_SetResvAreaSize(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_SIZE, ARG_bErase,
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_U32 nSize = 0;
	BOOL bErase = 0; 

    argcnt = lua_gettop(L);

    if (argcnt != 3)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    nSize = lua_tointeger(L, ARG_SIZE);
	bErase = lua_tointeger(L, ARG_bErase);
    
    tTestData.td_SetResvAreaSize.nID = nID;
    tTestData.td_SetResvAreaSize.nSize = nSize;
	tTestData.td_SetResvAreaSize.bErase = bErase;
//     SetEvent(g_EvtSetResvAreaSize);
	SetEvent(g_EvtBurnCmd[SET_RESV_AREA_SIZE]);
    ResetEvent(g_EvtSetResvAreaSizeEnd);
    WaitForSingleObject(g_EvtSetResvAreaSizeEnd, INFINITE);
    rsl = tTestData.td_SetResvAreaSize.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_DownloadBin(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_DOWNLOADBIN, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_DOWNLOAD_BIN *pDownloadBin = (T_DOWNLOAD_BIN*)AK_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 2)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    if (lua_isuserdata(L, ARG_DOWNLOADBIN))
    {
        pDownloadBin = (T_DOWNLOAD_BIN*)lua_touserdata(L, ARG_DOWNLOADBIN);
    }
    else
    {
        if (lua_isnumber(L, ARG_DOWNLOADBIN))
        {
            pDownloadBin = (T_DOWNLOAD_BIN*)lua_tointeger(L, ARG_DOWNLOADBIN);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }

    
    tTestData.td_DownloadBin.nID = nID;
    tTestData.td_DownloadBin.pDownloadBin = pDownloadBin;
//     SetEvent(g_EvtDownloadBin);
	SetEvent(g_EvtBurnCmd[DOWNLOAD_BIN]);
    ResetEvent(g_EvtDownloadBinEnd);
    WaitForSingleObject(g_EvtDownloadBinEnd, INFINITE);
    rsl = tTestData.td_DownloadBin.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_CreatePartition(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_PARTITIONINFO, ARG_NUMPARTITION, ARG_RESCSIZE, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_PARTION_INFO *PartitionInfo = (T_PARTION_INFO*)AK_NULL;
    T_U32 nNumPartition = 0;
    T_U32 resvSize = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 4)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    if (lua_isuserdata(L, ARG_PARTITIONINFO))
    {
        PartitionInfo = (T_PARTION_INFO*)lua_touserdata(L, ARG_PARTITIONINFO);
    }
    else
    {
        if (lua_isnumber(L, ARG_PARTITIONINFO))
        {
            PartitionInfo = (T_PARTION_INFO*)lua_tointeger(L, ARG_PARTITIONINFO)
                             ;
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }

    }

    nNumPartition = lua_tointeger(L, ARG_NUMPARTITION);

    resvSize = lua_tointeger(L, ARG_RESCSIZE);

    
    tTestData.td_CreatePartition.nID = nID;
    tTestData.td_CreatePartition.PartitionInfo = PartitionInfo;
    tTestData.td_CreatePartition.nNumPartition = nNumPartition;
    tTestData.td_CreatePartition.resvSize = resvSize;
//     SetEvent(g_EvtCreatePartition);
	SetEvent(g_EvtBurnCmd[CREATE_PARTITION]);
    ResetEvent(g_EvtCreatePartitionEnd);
    WaitForSingleObject(g_EvtCreatePartitionEnd, INFINITE);
    rsl = tTestData.td_CreatePartition.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_FormatDriver(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_FORMATDRIVER, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_FORMAT_DRIVER *formatDriver = (T_FORMAT_DRIVER*)AK_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 2)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    if (lua_isuserdata(L, ARG_FORMATDRIVER))
    {
        formatDriver = (T_FORMAT_DRIVER*)lua_touserdata(L, ARG_FORMATDRIVER);
    }
    else
    {
        if (lua_isnumber(L, ARG_FORMATDRIVER))
        {
            formatDriver = (T_FORMAT_DRIVER*)lua_tointeger(L, ARG_FORMATDRIVER);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }

    
    tTestData.td_FormatDriver.nID = nID;
    tTestData.td_FormatDriver.formatDriver = formatDriver;
//     SetEvent(g_EvtFormatDriver);
	SetEvent(g_EvtBurnCmd[FORMAT_DRIVER]);
    ResetEvent(g_EvtFormatDriverEnd);
    WaitForSingleObject(g_EvtFormatDriverEnd, INFINITE);
    rsl = tTestData.td_FormatDriver.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_MountDriver(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_DRIVERNAME, ARG_NUMPARTITION, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_pSTR driverName = (T_pSTR)AK_NULL;
    T_U32 nDriverNum = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 3)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    if (lua_isstring(L, ARG_DRIVERNAME))
    {
        driverName = (T_pSTR)lua_tostring(L, ARG_DRIVERNAME);
    }
    else
    {
		if (lua_isnumber(L, ARG_DRIVERNAME))
		{
			driverName = (T_pSTR)lua_tointeger(L, ARG_DRIVERNAME);
		}
		else
		{
			lua_pushnil(L);
			return 1;
		}
    }

    nDriverNum = lua_tointeger(L, ARG_NUMPARTITION);

    
    tTestData.td_MountDriver.nID = nID;
    tTestData.td_MountDriver.driverName = driverName;
    tTestData.td_MountDriver.nDriverNum = nDriverNum;
//     SetEvent(g_EvtMountDriver);
	SetEvent(g_EvtBurnCmd[MOUNT_DRIVER]);
    ResetEvent(g_EvtMountDriverEnd);
    WaitForSingleObject(g_EvtMountDriverEnd, INFINITE);
    rsl = tTestData.td_MountDriver.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_DownloadBoot(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_PATH, ARG_CHIPTYPE, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_pSTR pstrPath = (T_pSTR)AK_NULL;
    T_pSTR pszTemp = (T_pSTR)AK_NULL;
    E_CHIP_TYPE ChipType = CHIP_RESERVER;

    argcnt = lua_gettop(L);

    if (argcnt != 3)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    if (lua_isstring(L, ARG_PATH))
    {
        pszTemp = (T_pSTR)lua_tostring(L, ARG_PATH);
        ConvertAbsolutePath(&pstrPath, pszTemp);

    }
    else
    {
		if (lua_isnumber(L, ARG_PATH))
		{
			pszTemp = (T_pSTR)lua_tointeger(L, ARG_PATH);
		}
		else
		{
			lua_pushnil(L);
			return 1;
		}
    }

    ChipType = (E_CHIP_TYPE)lua_tointeger(L, ARG_CHIPTYPE);

    
    tTestData.td_DownloadBoot.nID = nID;

    tTestData.td_DownloadBoot.pstrPath = (TCHAR*)malloc(strlen(pstrPath) *2+2);

    if (AK_NULL == tTestData.td_DownloadBoot.pstrPath)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset(tTestData.td_DownloadBoot.pstrPath, 0, strlen(pstrPath) * + 2);
    }

    MultiByteToWideChar(CP_ACP, NULL, pstrPath, strlen(pstrPath) + 1,
                        tTestData.td_DownloadBoot.pstrPath, strlen(pstrPath) *2
                        +2);

    tTestData.td_DownloadBoot.ChipType = ChipType;
//     SetEvent(g_EvtDownloadBoot);
	SetEvent(g_EvtBurnCmd[DOWNLOAD_BOOT]);
    ResetEvent(g_EvtDownloadBootEnd);
    WaitForSingleObject(g_EvtDownloadBootEnd, INFINITE);
    rsl = tTestData.td_DownloadBoot.Ret;

    free(tTestData.td_DownloadBoot.pstrPath);
    tTestData.td_DownloadBoot.pstrPath = (TCHAR*)AK_NULL;

    free(pstrPath);


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_DownloadImg(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_DOWNLOADIMG, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_DOWNLOAD_IMG *pDownloadImg = (T_DOWNLOAD_IMG*)AK_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 2)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    if (lua_isuserdata(L, ARG_DOWNLOADIMG))
    {
        pDownloadImg = (T_DOWNLOAD_IMG*)lua_touserdata(L, ARG_DOWNLOADIMG);
    }
    else
    {
        if (lua_isnumber(L, ARG_DOWNLOADIMG))
        {
            pDownloadImg = (T_DOWNLOAD_IMG*)lua_tointeger(L, ARG_DOWNLOADIMG);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }

    
    tTestData.td_DownloadImg.nID = nID;
    tTestData.td_DownloadImg.pDownloadImg = pDownloadImg;
//     SetEvent(g_EvtDownloadImg);
	SetEvent(g_EvtBurnCmd[DOWNLOAD_IMG]);
    ResetEvent(g_EvtDownloadImgEnd);
    WaitForSingleObject(g_EvtDownloadImgEnd, INFINITE);
    rsl = tTestData.td_DownloadImg.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_DownloadFile(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_DOWNLOADFILE, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_DOWNLOAD_FILE *pDownloadFile = (T_DOWNLOAD_FILE*)AK_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 2)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    if (lua_isuserdata(L, ARG_DOWNLOADFILE))
    {
        pDownloadFile = (T_DOWNLOAD_FILE*)lua_touserdata(L, ARG_DOWNLOADFILE);
    }
    else
    {
        if (lua_isnumber(L, ARG_DOWNLOADFILE))
        {
            pDownloadFile = (T_DOWNLOAD_FILE*)lua_tointeger(L, ARG_DOWNLOADFILE);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }


    
    tTestData.td_DownloadFile.nID = nID;
    tTestData.td_DownloadFile.pDownloadFile = pDownloadFile;
//     SetEvent(g_EvtDownloadFile);
	SetEvent(g_EvtBurnCmd[DOWNLOAD_FILE]);
    ResetEvent(g_EvtDownloadFileEnd);
    WaitForSingleObject(g_EvtDownloadFileEnd, INFINITE);
    rsl = tTestData.td_DownloadFile.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_Close(lua_State *L)
{
    enum
    {
        ARG_ID = 1, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 1)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    
    tTestData.td_Close.nID = nID;
//     SetEvent(g_EvtClose);
	SetEvent(g_EvtBurnCmd[CLOSE]);
    ResetEvent(g_EvtCloseEnd);
    WaitForSingleObject(g_EvtCloseEnd, INFINITE);
    rsl = tTestData.td_Close.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_SetGPIO(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_GPIOPARAM, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_GPIO_PARAM *GpioParam = (T_GPIO_PARAM*)AK_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 2)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    if (lua_isuserdata(L, ARG_GPIOPARAM))
    {
        GpioParam = (T_GPIO_PARAM*)lua_touserdata(L, ARG_GPIOPARAM);
    }
    else
    {
        if (lua_isnumber(L, ARG_GPIOPARAM))
        {
            GpioParam = (T_GPIO_PARAM*)lua_tointeger(L, ARG_GPIOPARAM);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }

    
    tTestData.td_SetGPIO.nID = nID;
    tTestData.td_SetGPIO.GpioParam = GpioParam;
//     SetEvent(g_EvtSetGPIO);
	SetEvent(g_EvtBurnCmd[SET_GPIO]);
    ResetEvent(g_EvtSetGPIOEnd);
    WaitForSingleObject(g_EvtSetGPIOEnd, INFINITE);
    rsl = tTestData.td_SetGPIO.Ret;


    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////
/*
static int Lua_BT_UploadFile(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_FILEPATH, ARG_PCPATH, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_pSTR strFilePath = (T_pSTR)AK_NULL;
    T_pSTR strPCPath = (T_pSTR)AK_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 3)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    if (lua_isstring(L, ARG_FILEPATH))
    {
        strFilePath = (T_pSTR)lua_tostring(L, ARG_FILEPATH);
    }
    else
    {
		if (lua_isnumber(L, ARG_FILEPATH))
		{
			strFilePath = (T_pSTR)lua_tointeger(L, ARG_FILEPATH);
		}
		else
		{
			lua_pushnil(L);
			return 1;
		}
    }

    if (lua_isstring(L, ARG_PCPATH))
    {
        strPCPath = (T_pSTR)lua_tostring(L, ARG_PCPATH);
    }
    else
    {
		if (lua_isnumber(L, ARG_PCPATH))
		{
			strPCPath = (T_pSTR)lua_tointeger(L, ARG_PCPATH);
		}
		else
		{
			lua_pushnil(L);
			return 1;
		}
    }

    WaitForSingleObject(g_semUploadFile, INFINITE);
    tTestData.td_UploadFile.nID = nID;
    tTestData.td_UploadFile.strFilePath = (TCHAR*)malloc(strlen(strFilePath) *2
        +2);

    if (AK_NULL == tTestData.td_UploadFile.strFilePath)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset(tTestData.td_UploadFile.strFilePath, 0, strlen(strFilePath) *2+2)
               ;
    }

    MultiByteToWideChar(CP_ACP, NULL, strFilePath, strlen(strFilePath) + 1,
                        tTestData.td_UploadFile.strFilePath, strlen(strFilePath)
                        *2+2);



    tTestData.td_UploadFile.strPCPath = (TCHAR*)malloc(strlen(strPCPath) *2+2);

    if (AK_NULL == tTestData.td_UploadFile.strPCPath)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset(tTestData.td_UploadFile.strPCPath, 0, strlen(strPCPath) *2+2);
    }

    MultiByteToWideChar(CP_ACP, NULL, strPCPath, strlen(strPCPath) + 1,
                        tTestData.td_UploadFile.strPCPath, strlen(strPCPath) *2
                        +2);



    SetEvent(g_EvtUploadFile);
    ResetEvent(g_EvtUploadFileEnd);
    WaitForSingleObject(g_EvtUploadFileEnd, INFINITE);
    rsl = tTestData.td_UploadFile.Ret;
    free(tTestData.td_UploadFile.strFilePath);
    free(tTestData.td_UploadFile.strPCPath);
    ReleaseSemaphore(g_semUploadFile, 1, 0);

    lua_pushnumber(L, rsl);

    return 1;
}
*/
///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_UploadBin(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_PUPbin, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_UPLOAD_BIN* pUploadBin = (T_UPLOAD_BIN*)AK_NULL;
	
    argcnt = lua_gettop(L);

    if (argcnt != 2)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    if (lua_isuserdata(L, ARG_PUPbin))
    {
        pUploadBin = (T_UPLOAD_BIN*)lua_touserdata(L, ARG_PUPbin);
    }
    else
    {
        if (lua_isnumber(L, ARG_PUPbin))
        {
            pUploadBin = (T_UPLOAD_BIN*)lua_tointeger(L, ARG_PUPbin);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }



    WaitForSingleObject(g_semUploadBin, INFINITE);
    tTestData.td_UploadBin.nID = nID;
	memcpy(tTestData.td_UploadBin.pUploadBin, pUploadBin, sizeof(T_UPLOAD_BIN));
//	strcpy(tTestData.td_UploadBin.pUploadBin->file_name, pUploadBin->file_name);
//	wcscpy(tTestData.td_UploadBin.pUploadBin->pc_path, pUploadBin->pc_path);  
//    SetEvent(g_EvtUploadBin);
	SetEvent(g_EvtBurnCmd[UPLOAD_BIN]);
    ResetEvent(g_EvtUploadBinEnd);
    WaitForSingleObject(g_EvtUploadBinEnd, INFINITE);
    rsl = tTestData.td_UploadBin.Ret;
    ReleaseSemaphore(g_semUploadBin, 1, 0);

    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////
static int Lua_BT_UploadBoot(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_BOOTPATH, ARG_FILELEN, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    TCHAR* pstrPath = (TCHAR*)AK_NULL;
    T_U32 fileLen = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 3)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    if (lua_isstring(L, ARG_BOOTPATH))
    {
        pstrPath = (TCHAR*)lua_tostring(L, ARG_BOOTPATH);
    }
    else
    {
		if (lua_isnumber(L, ARG_BOOTPATH))
		{
			pstrPath = (TCHAR*)lua_tointeger(L, ARG_BOOTPATH);
		}
		else
		{
			lua_pushnil(L);
			return 1;
		}
    }
	fileLen = lua_tointeger(L, ARG_FILELEN);

    WaitForSingleObject(g_semUploadBoot, INFINITE);
    tTestData.td_UploadBoot.nID = nID;   
	tTestData.td_UploadBoot.pstrPath = (TCHAR*)malloc(wcslen(pstrPath) *2
        +2);



	if (AK_NULL == tTestData.td_UploadBoot.pstrPath)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset(tTestData.td_UploadBoot.pstrPath, 0, wcslen(pstrPath) *2+2)
               ;
    }

//     MultiByteToWideChar(CP_ACP, NULL, pstrPath, wcslen(pstrPath) + 1,
//                         tTestData.td_UploadBoot.pstrPath, wcslen(pstrPath)
//                         *2+2);

/*  
	strcpy(tTestData.td_UploadBoot.pstrPath, pstrPath);
*/
	tTestData.td_UploadBoot.fileLen = fileLen;

   


//    SetEvent(g_EvtUploadBoot);
	SetEvent(g_EvtBurnCmd[UPLOAD_BOOT]);
    ResetEvent(g_EvtUploadBootEnd);
    WaitForSingleObject(g_EvtUploadBootEnd, INFINITE);
    rsl = tTestData.td_UploadBoot.Ret;

    free(tTestData.td_UploadBoot.pstrPath);

    ReleaseSemaphore(g_semUploadBoot, 1, 0);

    lua_pushnumber(L, rsl);

    return 1;
}
///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_ResetDevice(lua_State *L)
{
    enum
    {
        ARG_ID = 1, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 1)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    
    tTestData.td_ResetDevice.nID = nID;
//     SetEvent(g_EvtResetDevice);
	SetEvent(g_EvtBurnCmd[RESET_DEVICE]);
    ResetEvent(g_EvtResetDeviceEnd);
    WaitForSingleObject(g_EvtResetDeviceEnd, INFINITE);
    rsl = tTestData.td_ResetDevice.Ret;

    lua_pushnumber(L, rsl);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_GetRegValue(lua_State *L)
{
    enum
    {
        ARG_ID = 1, ARG_REGADDR, ARG_REGVALUE, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
    T_U32 RegAddr = 0;
    UINT *RegValue = (UINT*)AK_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 3)
    {
        lua_pushnil(L);
        return 1;
    }

    nID = lua_tointeger(L, ARG_ID);

    RegAddr = lua_tointeger(L, ARG_REGADDR);

    if (lua_isuserdata(L, ARG_REGVALUE))
    {
        RegValue = (UINT*)lua_touserdata(L, ARG_REGVALUE);
    }
    else
    {
        if (lua_isnumber(L, ARG_REGVALUE))
        {
            RegValue = (UINT*)lua_tointeger(L, ARG_REGVALUE);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }

    
    tTestData.td_GetRegValue.nID = nID;
    tTestData.td_GetRegValue.regAddr = RegAddr;
    tTestData.td_GetRegValue.regValue = RegValue;
//     SetEvent(g_EvtGetRegValue);
	SetEvent(g_EvtBurnCmd[GET_REG_VALUE]);
    ResetEvent(g_EvtGetRegValueEnd);
    WaitForSingleObject(g_EvtGetRegValueEnd, INFINITE);
    rsl = tTestData.td_GetRegValue.Ret;

	if (tTestData.td_GetRegValue.regValue != 0)
	{
		lua_pushinteger(L, *(tTestData.td_GetRegValue.regValue));
	}
	
    lua_pushnumber(L, rsl);


	

    return 2;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_GetVersion(lua_State *L)
{
    enum
    {
        ARG_MAIN_VERSION = 1, ARG_SUB_VERSION, 
    };

    T_U32 argcnt = 0;
    UINT *MainVersion = (UINT*)AK_NULL;
    UINT *SubVersion = (UINT*)AK_NULL;
    T_U32 rsl = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 2)
    {
        lua_pushnil(L);
        return 1;
    }

    if (lua_isuserdata(L, ARG_MAIN_VERSION))
    {
        MainVersion = (UINT*)lua_touserdata(L, ARG_MAIN_VERSION);
    }
    else
    {
        if (lua_isnumber(L, ARG_MAIN_VERSION))
        {
            MainVersion = (UINT*)lua_tointeger(L, ARG_MAIN_VERSION);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }

    }

    if (lua_isuserdata(L, ARG_SUB_VERSION))
    {
        SubVersion = (UINT*)lua_touserdata(L, ARG_SUB_VERSION);
    }
    else
    {
        if (lua_isnumber(L, ARG_MAIN_VERSION))
        {
            SubVersion = (UINT*)lua_tointeger(L, ARG_SUB_VERSION);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }

    WaitForSingleObject(g_semGetVersion, INFINITE);
    tTestData.td_GetVersion.MainVersion = MainVersion;
    tTestData.td_GetVersion.SubVersion = SubVersion;
//     SetEvent(g_EvtGetVersion);
	SetEvent(g_EvtBurnCmd[GET_VERSION]);
    ResetEvent(g_EvtGetVersionEnd);
    WaitForSingleObject(g_EvtGetVersionEnd, INFINITE);
    BT_GetVersion(tTestData.td_GetVersion.MainVersion,
                  tTestData.td_GetVersion.SubVersion);
    rsl = AK_TRUE;
    ReleaseSemaphore(g_semGetVersion, 1, 0);

    lua_pushnumber(L, rsl);

    return 1;
}
///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////
static int Lua_BT_WriteMobileDeviceCode(lua_State *L)
{
	enum
    {
        ARG_ID = 1, 
    };
	
    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
	
    argcnt = lua_gettop(L);
	
    if (argcnt != 1)
    {
        lua_pushnil(L);
        return 1;
    }
	
    nID = lua_tointeger(L, ARG_ID);
	
    
    tTestData.td_WriteMobileDeviceCode.nID = nID;
//    SetEvent(g_EvtWriteMobileDeviceCode);
	SetEvent(g_EvtBurnCmd[WRITE_MOBILE_DEVICE_CODE]);
    ResetEvent(g_EvtWriteMobileDeviceCodeEnd);
    WaitForSingleObject(g_EvtWriteMobileDeviceCodeEnd, INFINITE);
    rsl = tTestData.td_WriteMobileDeviceCode.Ret;
	
	
    lua_pushnumber(L, rsl);
	
    return 1;
	
}
///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BT_GetDiskInfo(lua_State *L)
{
	enum
    {
        ARG_ID = 1, 
		ARG_DNum,
		ARG_pDriverInfo,
    };
	
    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
	UINT *DriverNum = (UINT*)AK_NULL;
	T_DRIVER_INFO* pDriverInfo = (T_DRIVER_INFO*)AK_NULL;

	
    argcnt = lua_gettop(L);
	
    if (argcnt != 3)
    {
        lua_pushnil(L);
        return 1;
    }
	
    nID = lua_tointeger(L, ARG_ID);

	if (lua_isuserdata(L, ARG_DNum))
    {
        DriverNum = (UINT*)lua_touserdata(L, ARG_DNum);
    }
    else
    {
        if (lua_isnumber(L, ARG_DNum))
        {
            DriverNum = (UINT*)lua_tointeger(L, ARG_DNum);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
	}
	if (lua_isuserdata(L, ARG_pDriverInfo))
    {
        pDriverInfo = (T_DRIVER_INFO* )lua_touserdata(L, ARG_pDriverInfo);
    }
    else
    {
        if (lua_isnumber(L, ARG_pDriverInfo))
        {
            pDriverInfo = (T_DRIVER_INFO* )lua_tointeger(L, ARG_pDriverInfo);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
	}
    
    tTestData.td_GetDiskInfo.nID = nID;
	tTestData.td_GetDiskInfo.DriverNum = DriverNum;
	tTestData.td_GetDiskInfo.pDriverInfo = pDriverInfo;

//    SetEvent(g_EvtGetDiskInfo);
	SetEvent(g_EvtBurnCmd[GET_DISK_INFO]);
    ResetEvent(g_EvtGetDiskInfoEnd);
    WaitForSingleObject(g_EvtGetDiskInfoEnd, INFINITE);
    rsl = tTestData.td_GetDiskInfo.Ret;
	
	
    lua_pushnumber(L, rsl);
	
    return 1;
	
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////
static int Lua_BT_WriteASAFile(lua_State *L)
{
	enum
    {
        ARG_ID = 1, 
		ARG_FILENAME,
		ARG_PBUF,
		ARG_PBUFsize,
		ARG_MODE,
    };
	
    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 nID = 0;
	char* fileName = (char*)AK_NULL;
	BYTE* pBuf = (BYTE*)AK_NULL;
	UINT bufSize = 0;
	UINT mode = 0;
	
	
    argcnt = lua_gettop(L);
	
    if (argcnt != 5)
    {
        lua_pushnil(L);
        return 1;
    }
	
    nID = lua_tointeger(L, ARG_ID);
	
	if (lua_isstring(L, ARG_FILENAME))
    {
        fileName = (char* )lua_tostring(L, ARG_FILENAME);
    }
    else
    {
        if (lua_isnumber(L, ARG_FILENAME))
        {
            fileName = (char* )lua_tointeger(L, ARG_FILENAME);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
	}

	if (lua_isuserdata(L, ARG_PBUF))
    {
        pBuf = (BYTE* )lua_touserdata(L, ARG_PBUF);
    }
    else
    {
        if (lua_isnumber(L, ARG_PBUF))
        {
            pBuf = (BYTE* )lua_tointeger(L, ARG_PBUF);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
	}

	
    bufSize = lua_tointeger(L, ARG_PBUFsize);
	mode = lua_tointeger(L, ARG_MODE);

	
    tTestData.td_WriteASAFile.nID = nID;
	tTestData.td_WriteASAFile.fileName = fileName;
	
	tTestData.td_WriteASAFile.pBuf = pBuf;

	tTestData.td_WriteASAFile.bufSize = bufSize;
	tTestData.td_WriteASAFile.mode = mode;
	
    //SetEvent(g_EvtGetDiskInfo);
	SetEvent(g_EvtBurnCmd[WRITE_ASA_FILE]);
    ResetEvent(g_EvtWriteASAFileEnd);
    WaitForSingleObject(g_EvtWriteASAFileEnd, INFINITE);
    rsl = tTestData.td_WriteASAFile.Ret;
	
    lua_pushnumber(L, rsl);
	
    return 1;
	
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_GetBurnProcess(lua_State *L)
{
    lua_pushlightuserdata(L, TestBurnProcess);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_GetBurnProgress(lua_State *L)
{
    lua_pushlightuserdata(L, TestBurnProgress);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_GetUSBName(lua_State *L)
{
#ifndef MASK_TEST_OBJECT
    WaitForSingleObject(g_EvtAttachUSB, INFINITE);
    tTestData.td_AttachUSB.pstrUSBName = (TCHAR*)lua_newuserdata(L,
        ulUSBNameLen);
    SetEvent(g_EvtAttachUSBEnd);
    ResetEvent(g_EvtAttachUSB);
    WaitForSingleObject(g_EvtAttachUSB, INFINITE);
    lua_pushlightuserdata(L, tTestData.td_AttachUSB.pstrUSBName);
    ResetEvent(g_EvtAttachUSB);
#else 
    tTestData.td_AttachUSB.pstrUSBName = (TCHAR*)lua_newuserdata(L,
        ulUSBNameLen);
    lua_pushlightuserdata(L, tTestData.td_AttachUSB.pstrUSBName);
#endif 
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////
typedef enum
{
	MEMORY_TYPE_SDRAM = 0,		//SDRAM
		MEMORY_TYPE_SRAM ,			//SRAM
}E_MEMORY_TYPE;

typedef struct
{
	BYTE type;		//RAM类型
	UINT size;					//RAM大小
	UINT banks;					//RAM Banks
	UINT row;					//RAM row
	UINT column;				//RAM Column
	UINT control_addr;			//RAM Control register address
	UINT control_value;			//RAM Control value
}T_RAM_PARAM;


UINT get_ram_control_value(T_RAM_PARAM ram_param)
{
	UINT value = 0;
	
    if(ram_param.type == MEMORY_TYPE_SDRAM)
    {
        value = 0x0000f400;
		{
			if(ram_param.banks == 4)
			{
				if(ram_param.row == 12)
				{
					if(ram_param.column == 9)
						value |= 5 << 24;
					else if(ram_param.column == 10)
						value |= 6 << 24;
				}
				else if(ram_param.row == 13)
				{
					if(ram_param.column == 9)
						value |= 9 << 24;
					else if(ram_param.column == 10)
						value |= 0xa << 24;
				}
			}
			
			if(ram_param.banks == 4 || ram_param.banks == 2)
			{
				if(ram_param.row == 11)
				{
					if(ram_param.column == 8)
						value |= 0 << 24;
					else if(ram_param.column == 9)
						value |= 1 << 24;
				}
				else if(ram_param.row == 12)
				{
					if(ram_param.column == 8)
						value |= 4 << 24;
				}
			}
		}
    }
    else
    {
        value = 0x00130000;
    }
	
	return value;
}



static int Lua_SetRamReg(lua_State *L)
{
    int i;
    int regCnt;
    int indSize;
    T_RAM_REG ram[64];
	//memory concerned parameter
	T_RAM_PARAM		ram_param;

    regCnt = sizeof(reg_addr_sdr) / sizeof(UINT);
    indSize = 1;

#if 0
	// for aspen
    for (i = 0; i < regCnt; i++)
    {
        ram[i].reg_addr = reg_addr_sdr[i];
        ram[i].reg_value = reg_value_sdr[i];
    }
    ram[0].reg_value |= (1 << 25); 

#else
	// for sundance


	ram_param.type = MEMORY_TYPE_SDRAM;
	ram_param.size = 16;
    ram_param.banks = 4;
    ram_param.row = 12;
    ram_param.column = 9;
	ram_param.control_addr = 0x200b0000;

    ram[0].reg_addr = 0x200b0000;
	ram[0].reg_value = get_ram_control_value(ram_param);
#endif
    tTestData.td_SetRamParam.RamReg = (T_RAM_REG*)lua_newuserdata(L, sizeof(ram));
    memcpy(tTestData.td_SetRamParam.RamReg, &ram, sizeof(ram));
    lua_pushlightuserdata(L, tTestData.td_SetRamParam.RamReg);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_SetRegNum(lua_State *L)
{
  {
    int regCnt;

#if 0
    //aspen 
    regCnt = sizeof(reg_addr_sdr) / sizeof(UINT);
#else
    //sundance
    regCnt = 1;
#endif
    lua_pushinteger(L, regCnt);
    return 1;
  }

}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_AllocFlashID(lua_State *L)
{
    T_U32 *pFlashID = (T_U32*)lua_newuserdata(L, sizeof(T_U32));
    lua_pushlightuserdata(L, pFlashID);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_AllocnChipCnt(lua_State *L)
{
    T_U32 *pChipCnt = (T_U32*)lua_newuserdata(L, sizeof(T_U32));
    lua_pushlightuserdata(L, pChipCnt);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_SetNandInfo(lua_State *L)
{
    enum
    {
        ARG_FLASHID = 1, 
    };

    T_U32 argcnt = 0;
    UINT *FlashID = (UINT*)AK_NULL;
    T_NAND_PHY_INFO *pNandPhyInfo = (T_NAND_PHY_INFO*)AK_NULL;
    T_U32 i = 0;
    T_U32 nandflash_parameter_count = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 1)
    {
        lua_pushnil(L);
        return 1;
    }

    if (lua_isuserdata(L, ARG_FLASHID))
    {
        FlashID = (UINT*)lua_touserdata(L, ARG_FLASHID);
    }
    else
    {
        lua_pushnil(L);
        return 1;
    }

    pNandPhyInfo = (T_NAND_PHY_INFO*)lua_newuserdata(L, sizeof(T_NAND_PHY_INFO))
                    ;

    if (AK_NULL == pNandPhyInfo)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset(pNandPhyInfo, 0, sizeof(T_NAND_PHY_INFO));
    }

    //load nandlist from SUPPORT_NAND_TABLE

    while (ERROR_CHIP_ID != SUPPORT_NAND_TABLE[i].chip_id)
    {
        i++;
    }

    nandflash_parameter_count = i;

    for (i = 0; i < nandflash_parameter_count; i++)
    {
        if (*FlashID == SUPPORT_NAND_TABLE[i].chip_id)
        {
            memcpy(pNandPhyInfo, &SUPPORT_NAND_TABLE[i], sizeof(T_NAND_PHY_INFO)
                   );
            break;
        }
    }

    lua_pushlightuserdata(L, pNandPhyInfo);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


static int Lua_SetDownloadBinStruct(lua_State *L)
{
    enum
    {
        ARG_COMPARE = 1, ARG_BACKUP, ARG_UPDATESELF, ARG_PC_PATH, ARG_LD_ADDR,
            ARG_FILE_NAME, 
    };
	
    T_U32 argcnt = 0;
    T_BOOL bCompare = AK_FALSE;
    T_BOOL bBackup = AK_FALSE;
    T_BOOL bUpdateSelf = AK_FALSE;
    T_pSTR pc_path = (T_pSTR)AK_NULL;
    T_pSTR pszTemp = (T_pSTR)AK_NULL;
    T_U32 ld_addr = 0;
    T_pSTR file_name = (T_pSTR)AK_NULL;
	
    argcnt = lua_gettop(L);
	
    if (argcnt != 6)
    {
        lua_pushnil(L);
        return 1;
    }
	
    bCompare = lua_tointeger(L, ARG_COMPARE);
	
    bBackup = lua_tointeger(L, ARG_BACKUP);
	
    bUpdateSelf = lua_tointeger(L, ARG_UPDATESELF);
	
    if (lua_isstring(L, ARG_PC_PATH))
    {
        pszTemp = (T_pSTR)lua_tostring(L, ARG_PC_PATH);
        ConvertAbsolutePath(&pc_path, pszTemp);
    }
    else
    {
		if (lua_isnumber(L, ARG_PC_PATH))
		{
			pc_path = (T_pSTR)lua_tointeger(L, ARG_PC_PATH);
		}
		else
		{
			lua_pushnil(L);
			return 1;
		}
    }
	
    ld_addr = lua_tointeger(L, ARG_LD_ADDR);
	
    if (lua_isstring(L, ARG_FILE_NAME))
    {
        file_name = (T_pSTR)lua_tostring(L, ARG_FILE_NAME);
    }
    else
    {
		if (lua_isnumber(L, ARG_FILE_NAME))
		{
			file_name = (T_pSTR)lua_tointeger(L, ARG_FILE_NAME);
		}
		else
		{
			lua_pushnil(L);
			return 1;
		}
    }
	
    WaitForSingleObject(g_semDownloadBin, INFINITE);
	
    tTestData.td_DownloadBin.pDownloadBin = (T_DOWNLOAD_BIN*)lua_newuserdata(L,
        sizeof(T_DOWNLOAD_BIN));
	
    if (AK_NULL == tTestData.td_DownloadBin.pDownloadBin)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset(tTestData.td_DownloadBin.pDownloadBin, 0, sizeof(T_DOWNLOAD_BIN));
    }
	
    tTestData.td_DownloadBin.pDownloadBin->bCompare = bCompare;
    tTestData.td_DownloadBin.pDownloadBin->bBackup = bBackup;
    tTestData.td_DownloadBin.pDownloadBin->bUpdateSelf = bUpdateSelf;
    MultiByteToWideChar(CP_ACP, NULL, pc_path, strlen(pc_path) + 1,
		tTestData.td_DownloadBin.pDownloadBin->pc_path, strlen
		(pc_path) *2+2);
	
    tTestData.td_DownloadBin.pDownloadBin->ld_addr = ld_addr;
    strcpy(tTestData.td_DownloadBin.pDownloadBin->file_name, file_name);
	
    free(pc_path);
    ReleaseSemaphore(g_semDownloadBin, 1, 0);
	
    lua_pushlightuserdata(L, tTestData.td_DownloadBin.pDownloadBin);
	
    return 1;
}


static int Lua_SetUploadBinStruct(lua_State *L)
{
    enum
    {
        ARG_FILE_NAME = 1, ARG_PC_PATH, 
    };
	
    T_U32 argcnt = 0;
    T_pSTR file_name = (T_pSTR)AK_NULL;
	T_pSTR pc_path = (T_pSTR)AK_NULL;
	T_pSTR pszTemp = (T_pSTR)AK_NULL;
    argcnt = lua_gettop(L);
	
    if (argcnt != 2)
    {
        lua_pushnil(L);
        return 1;
    }
	

	
	if (lua_isstring(L, ARG_PC_PATH))
    {
        pszTemp = (T_pSTR)lua_tostring(L, ARG_PC_PATH);
        ConvertAbsolutePath(&pc_path, pszTemp);
    }
    else
    {
		if (lua_isnumber(L, ARG_PC_PATH))
		{
			pc_path = (T_pSTR)lua_tointeger(L, ARG_PC_PATH);
		}
		else
		{
			lua_pushnil(L);
			return 1;
		}
    }
	
	
    if (lua_isstring(L, ARG_FILE_NAME))
    {
        file_name = (T_pSTR)lua_tostring(L, ARG_FILE_NAME);
    }
    else
    {
		if (lua_isnumber(L, ARG_FILE_NAME))
		{
			file_name = (T_pSTR)lua_tointeger(L, ARG_FILE_NAME);
		}
		else
		{
			lua_pushnil(L);
			return 1;
		}
    }
	
    WaitForSingleObject(g_semUploadBin, INFINITE);
	
    tTestData.td_UploadBin.pUploadBin = (T_UPLOAD_BIN*)lua_newuserdata(L,
        sizeof(T_UPLOAD_BIN));
	
    if (AK_NULL == tTestData.td_UploadBin.pUploadBin)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset(tTestData.td_UploadBin.pUploadBin, 0, sizeof(T_UPLOAD_BIN));
    }
	

    MultiByteToWideChar(CP_ACP, NULL, pc_path, strlen(pc_path) + 1,
		tTestData.td_UploadBin.pUploadBin->pc_path, strlen
		(pc_path) *2+2);
	
    strcpy(tTestData.td_UploadBin.pUploadBin->file_name, file_name);
	
    free(pc_path);
	
    lua_pushlightuserdata(L, tTestData.td_UploadBin.pUploadBin);
    ReleaseSemaphore(g_semUploadBin, 1, 0);
	
    return 1;
}





///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_SetPartitionInfo(lua_State *L)
{
    enum
    {
        ARG_DISK_NAME = 1, ARG_OPEN_ZONE, ARG_PROTECT_TYPE, ARG_ZONE_TYPE,
            ARG_SIZE, 
    };

    T_U32 argcnt = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 5)
    {
        lua_pushnil(L);
        return 1;
    }

    tTestData.td_CreatePartition.PartitionInfo = (T_PARTION_INFO*)
        lua_newuserdata(L, sizeof(T_PARTION_INFO));

    if (AK_NULL == tTestData.td_CreatePartition.PartitionInfo)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset(tTestData.td_CreatePartition.PartitionInfo, 0, sizeof
               (T_PARTION_INFO));
    }

    tTestData.td_CreatePartition.PartitionInfo->Disk_Name = (T_CHR)
        lua_tointeger(L, ARG_DISK_NAME);
    tTestData.td_CreatePartition.PartitionInfo->bOpenZone = lua_tointeger(L,
        ARG_OPEN_ZONE);
    tTestData.td_CreatePartition.PartitionInfo->ProtectType = lua_tointeger(L,
        ARG_PROTECT_TYPE);
    tTestData.td_CreatePartition.PartitionInfo->ZoneType = lua_tointeger(L,
        ARG_ZONE_TYPE);
    tTestData.td_CreatePartition.PartitionInfo->Size = lua_tointeger(L,
        ARG_SIZE);

    lua_pushlightuserdata(L, tTestData.td_CreatePartition.PartitionInfo);

    return 1;
}
///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////
static int Lua_SetpDriverInfo(lua_State *L)
{

    T_U32 argcnt = 0;
	
    argcnt = lua_gettop(L);
	
    if (argcnt != 0)
    {
        lua_pushnil(L);
        return 1;
    }
	
    tTestData.td_GetDiskInfo.pDriverInfo = (T_DRIVER_INFO*)
        lua_newuserdata(L, sizeof(T_DRIVER_INFO));
	
    if (AK_NULL ==  tTestData.td_GetDiskInfo.pDriverInfo)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset( tTestData.td_GetDiskInfo.pDriverInfo, 0, sizeof
			(T_DRIVER_INFO));
    }
	
	
    lua_pushlightuserdata(L, tTestData.td_GetDiskInfo.pDriverInfo);
	
    return 1;
}
///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////
static int Lua_SetDriverNum(lua_State *L)
{
	
    T_U32 argcnt = 0;
	
    argcnt = lua_gettop(L);
	
    if (argcnt != 0)
    {
        lua_pushnil(L);
        return 1;
    }
	
    tTestData.td_GetDiskInfo.DriverNum = (UINT*)
        lua_newuserdata(L, sizeof(UINT));
	
    if (AK_NULL ==  tTestData.td_GetDiskInfo.DriverNum)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset( tTestData.td_GetDiskInfo.DriverNum, 0, sizeof
			(UINT));
    }
	
	
    lua_pushlightuserdata(L, tTestData.td_GetDiskInfo.DriverNum);
	
    return 1;
}
///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////
static int Lua_SetPartitionInfoStruct(lua_State *L)
{
    enum
    {
        ARG_PARTITION_INFO = 1, 
    };

    T_U32 argcnt = 0;
    T_PARTION_INFO partitionInfo[27];
    T_U32 ulPartitionCnt = 0;

    memset(&partitionInfo, 0, sizeof(partitionInfo));

    argcnt = lua_gettop(L);

    if (argcnt != 1)
    {
        lua_pushnil(L);
        return 1;
    }

    while (lua_gettop(L))
    {
        switch (lua_type(L, lua_gettop(L)))
        {
            case LUA_TTABLE:
                {
                    // 简单的遍历表的功能  
                    // ***好像lua不保存表的元素的添加顺序***  

                    // 压入第一个键  
                    lua_pushnil(L); /* 第一个 key */
                    int t =  - 2;

                    while (lua_next(L, t) != 0)
                    {
                        /* 'key' (索引-2) 和 'value' (索引-1) */
                        const char *key = "unknown";
                        const char *value;

                        if (lua_type(L,  - 2) == LUA_TSTRING)
                        {
                            key = lua_tostring(L,  - 2);
                            value = lua_tostring(L,  - 1);
                        }
                        else if (lua_type(L,  - 2) == LUA_TNUMBER)
                        {
                            // 因为lua_tostring会更改栈上的元素，  
                            // 所以不能直接在key上进行lua_tostring  
                            // 因此，复制一个key，压入栈顶，进行lua_tostring  
                            lua_pushvalue(L,  - 2);
                            key = lua_tostring(L,  - 1);
                            lua_pop(L, 1);
                            if (lua_type(L,  - 1) != LUA_TLIGHTUSERDATA)
                            {
                                lua_pushnil(L);
                                return 1;
                            }
                            else
                            {
                                memcpy(&partitionInfo[ulPartitionCnt++],
                                       lua_touserdata(L,  - 1), sizeof
                                       (T_PARTION_INFO));
                            }
                        }
                        else
                        {
                            value = lua_tostring(L,  - 1);
                        }


                        /* 移除 'value' ；保留 'key' 做下一次迭代 */
                        lua_pop(L, 1);
                    }

                    break;
                }
            case LUA_TSTRING:
                {
                    //std::cout << "script returned " << lua_tostring( L, lua_gettop( L ) ) << std::endl;  
                    char *temp = (char*)lua_tostring(L, lua_gettop(L));
                    break;
                }
            case LUA_TBOOLEAN:
                {
                    //std::cout << "script returned " << lua_toboolean( L, lua_gettop( L ) ) << std::endl;  
                    BOOL temp = lua_toboolean(L, lua_gettop(L));
                    break;
                }
            default:
                //std::cout << "script returned unknown param" << std::endl;   
                break;
        }
        lua_pop(L, 1);
    }

    tTestData.td_CreatePartition.PartitionInfo = (T_PARTION_INFO*)
        lua_newuserdata(L, sizeof(T_PARTION_INFO) *ulPartitionCnt);
    memcpy(tTestData.td_CreatePartition.PartitionInfo, partitionInfo, sizeof
           (T_PARTION_INFO) *ulPartitionCnt);
    lua_pushlightuserdata(L, tTestData.td_CreatePartition.PartitionInfo);
    return 1;
}


///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_SetformatDriverStruct(lua_State *L)
{
    enum
    {
        ARG_ENLARGE_SIZE = 1, ARG_DRIVER_NAME, ARG_VOLUME_LABLE, 
    };

    T_U32 argcnt = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 3)
    {
        lua_pushnil(L);
        return 1;
    }

    tTestData.td_FormatDriver.formatDriver = (T_FORMAT_DRIVER*)lua_newuserdata
        (L, sizeof(T_FORMAT_DRIVER));

    if (AK_NULL == tTestData.td_FormatDriver.formatDriver)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset(tTestData.td_FormatDriver.formatDriver, 0, sizeof
               (T_FORMAT_DRIVER));
    }

    tTestData.td_FormatDriver.formatDriver->nSize_enlarge = lua_tointeger(L,
        ARG_ENLARGE_SIZE);
    tTestData.td_FormatDriver.formatDriver->driver_Name = lua_tointeger(L,
        ARG_DRIVER_NAME);
    strcpy(tTestData.td_FormatDriver.formatDriver->pstrVolumeLable,
           lua_tostring(L, ARG_VOLUME_LABLE));

    lua_pushlightuserdata(L, tTestData.td_FormatDriver.formatDriver);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_SetDownloadFileStruct(lua_State *L)
{
    enum
    {
        ARG_COMPARE = 1, ARG_PC_PATH, ARG_UDICK_PATH, 
    };

    T_U32 argcnt = 0;
	T_pSTR pszTemp = (T_pSTR)AK_NULL;
	T_pSTR pc_path = (T_pSTR)AK_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 3)
    {
        lua_pushnil(L);
        return 1;
    }

    tTestData.td_DownloadFile.pDownloadFile = (T_DOWNLOAD_FILE*)lua_newuserdata
        (L, sizeof(T_DOWNLOAD_FILE));

    if (AK_NULL == tTestData.td_DownloadFile.pDownloadFile)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset(tTestData.td_DownloadFile.pDownloadFile, 0, sizeof
               (T_DOWNLOAD_FILE));
    }

    tTestData.td_DownloadFile.pDownloadFile->bCompare = lua_tointeger(L,
        ARG_COMPARE);

	if (lua_isnumber(L, ARG_PC_PATH))
	{		
		if (lua_tointeger(L, ARG_PC_PATH) == 0)
		{
			memset(tTestData.td_DownloadFile.pDownloadFile->pc_path, 
			       0, 
				   sizeof(TCHAR) * (MAX_PATH+1));
		}		
	}
	else
	{
		if (lua_isstring(L, ARG_PC_PATH))
		{
			pszTemp = (T_pSTR)lua_tostring(L, ARG_PC_PATH);
			ConvertAbsolutePath(&pc_path, pszTemp);
			
			MultiByteToWideChar(CP_ACP, 
				NULL, 
				pc_path, 
				strlen(pc_path) + 1,
				tTestData.td_DownloadFile.pDownloadFile->pc_path,
				strlen(pc_path) + 1);


		}
		else
		{
			lua_pushnil(L);
			return 1;						
		}	
	}

    strcpy(tTestData.td_DownloadFile.pDownloadFile->udisk_path, lua_tostring(L,
           ARG_UDICK_PATH));

	free(pc_path);
    lua_pushlightuserdata(L, tTestData.td_DownloadFile.pDownloadFile);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_SetDownloadImgStruct(lua_State *L)
{
    enum
    {
        ARG_COMPARE = 1, ARG_PC_PATH, ARG_DRIVER_NAME, 
    };

    T_U32 argcnt = 0;
    T_pSTR pszTemp = (T_pSTR)AK_NULL;
    T_pSTR pc_path = (T_pSTR)AK_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 3)
    {
        lua_pushnil(L);
        return 1;
    }

    tTestData.td_DownloadImg.pDownloadImg = (T_DOWNLOAD_IMG*)lua_newuserdata(L,
        sizeof(T_DOWNLOAD_IMG));

    if (AK_NULL == tTestData.td_DownloadImg.pDownloadImg)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset(tTestData.td_DownloadImg.pDownloadImg, 0, sizeof(T_DOWNLOAD_IMG))
               ;
    }

    tTestData.td_DownloadImg.pDownloadImg->bCompare = lua_tointeger(L,
        ARG_COMPARE);

    if (lua_isstring(L, ARG_PC_PATH))
    {
        pszTemp = (T_pSTR)lua_tostring(L, ARG_PC_PATH);
        ConvertAbsolutePath(&pc_path, pszTemp);

        MultiByteToWideChar(CP_ACP, NULL, pc_path, strlen(pc_path) + 1,
                            tTestData.td_DownloadImg.pDownloadImg->pc_path,
                            strlen(pc_path) *2+2);
    }
    else
    {
        if (lua_isnumber(L, ARG_PC_PATH))
        {
            pszTemp = (T_pSTR)lua_tointeger(L, ARG_PC_PATH);
        }
        else
        {
            lua_pushnil(L);
            return 1;
        }
    }

    tTestData.td_DownloadImg.pDownloadImg->driver_name = lua_tointeger(L,
        ARG_DRIVER_NAME);

    lua_pushlightuserdata(L, tTestData.td_DownloadImg.pDownloadImg);

    free(pc_path);

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_AllocNandPhyInfo(lua_State *L)
{
    T_NAND_PHY_INFO *pNandPhyInfo = (T_NAND_PHY_INFO*)lua_newuserdata(L, sizeof
                                     (T_NAND_PHY_INFO));
    lua_pushlightuserdata(L, pNandPhyInfo);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_SetGPIOParam(lua_State *L)
{
    enum
    {
        ARG_NUM = 1, ARG_DIR, ARG_LEVEL,ARG_PULLUP,ARG_PULLDOWN, 
    };

    T_U32 argcnt = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 5)
    {
        lua_pushnil(L);
        return 1;
    }

    tTestData.td_SetGPIO.GpioParam = (T_GPIO_PARAM*)lua_newuserdata(L, sizeof
                                      (T_GPIO_PARAM));

    if (AK_NULL == tTestData.td_SetGPIO.GpioParam)
    {
        lua_pushnil(L);
        return 1;
    }
    else
    {
        memset(tTestData.td_SetGPIO.GpioParam, 0, sizeof(T_GPIO_PARAM));
    }

    tTestData.td_SetGPIO.GpioParam->num = lua_tointeger(L, ARG_NUM);

    tTestData.td_SetGPIO.GpioParam->dir = lua_tointeger(L, ARG_DIR);

    tTestData.td_SetGPIO.GpioParam->level = lua_tointeger(L, ARG_LEVEL);
	tTestData.td_SetGPIO.GpioParam->Pullup = lua_tointeger(L, ARG_PULLUP);
	tTestData.td_SetGPIO.GpioParam->Pulldown = lua_tointeger(L, ARG_PULLDOWN);

    lua_pushlightuserdata(L, tTestData.td_SetGPIO.GpioParam);

    return 1;
}



///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


static int Lua_AllocateBuf(lua_State *L)
{
	enum
	{
		ARG_BUF_SIZE = 1,
	};

	T_U32 argcnt = 0;
	T_U32 bufSize = 0;
	
    argcnt = lua_gettop(L);
	
    if (argcnt != 1)
    {
        lua_pushnil(L);
        return 1;
    }

	bufSize = lua_tointeger(L, ARG_BUF_SIZE);

    T_U32 *pBuf = (T_U32*)lua_newuserdata(L, bufSize);
	memset(pBuf, 0, bufSize);
    lua_pushlightuserdata(L, pBuf);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


static int Lua_AllocMainVersion(lua_State *L)
{
    T_U32 *MainVersion = (T_U32*)lua_newuserdata(L, sizeof(T_U32));
    lua_pushlightuserdata(L, MainVersion);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


static int Lua_AllocSubVersion(lua_State *L)
{
    T_U32 *SubVersion = (T_U32*)lua_newuserdata(L, sizeof(T_U32));
    lua_pushlightuserdata(L, SubVersion);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


static int Lua_StartPerformanceTest(lua_State *L)
{
    g_PerformanceTest = AK_TRUE;
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_AllocRegValue(lua_State *L)
{
    T_U32 *RegValue = (T_U32*)lua_newuserdata(L, sizeof(T_U32));
    lua_pushlightuserdata(L, RegValue);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_SetTestCaseCount(lua_State *L)
{
	enum
	{
		ARG_TEST_CASE_CNT = 1,
	};
    
	T_U32 argcnt = 0;

	argcnt = lua_gettop(L);

    if (argcnt != 1)
    {
        lua_pushboolean(L, false);
        return 1;
    }

	g_ulTestCaseCnt = lua_tointeger(L, ARG_TEST_CASE_CNT);

	g_ptTestCaseList = (T_TEST_CASE_LIST *)lua_newuserdata(L, sizeof(T_TEST_CASE_LIST) * g_ulTestCaseCnt);

	if (g_ptTestCaseList != AK_NULL)
	{
		memset(g_ptTestCaseList, 0, sizeof(T_TEST_CASE_LIST) * g_ulTestCaseCnt);		
	}
	else
	{
		lua_pushboolean(L, false);
		return 1;
	}

	lua_pushboolean(L, true);
	return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


static int Lua_SetCaseTable(lua_State *L)
{
    enum
    {
        ARG_CASE_ID = 1, ARG_CASE_NAME, ARG_CASE_STEP, 
    };

    T_U32 argcnt = 0;
    T_U32 ulCaseID = 0;
    T_pSTR pszCaseName = (T_pSTR)AK_NULL;
    T_U32 ulCaseStep = 0;

    argcnt = lua_gettop(L);

    if (argcnt != 3)
    {
        lua_pushnil(L);
        return 1;
    }

    ulCaseID = lua_tointeger(L, ARG_CASE_ID);

    if (lua_isstring(L, ARG_CASE_NAME))
    {
        pszCaseName = (T_pSTR)lua_tostring(L, ARG_CASE_NAME);
    }
    else
    {
		if (lua_isnumber(L, ARG_CASE_NAME))
		{
			pszCaseName = (T_pSTR)lua_tointeger(L, ARG_CASE_NAME);
		}
		else
		{
			lua_pushnil(L);
			return 1;
		}
    }

    ulCaseStep = lua_tointeger(L, ARG_CASE_STEP);

    g_ptTestCaseList[ulCaseID - 1].eID = ulCaseID;
    strcpy(g_ptTestCaseList[ulCaseID - 1].pszID, pszCaseName);
    g_ptTestCaseList[ulCaseID - 1].ulCaseStep = ulCaseStep;

    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_BeginTest(lua_State *L)
{
    ResetEvent(g_EvtBurnProcessEnd);
	memset(&tTestData, 0, sizeof(tTestData));
	
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int Lua_EndTest(lua_State *L)
{
    SetEvent(g_EvtBurnProcessEnd);
	
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static int debug(lua_State *L)
{
    enum
    {
        ARG_1 = 1, 
    };

    T_U32 argcnt = 0;
    T_U32 rsl = 0;
    T_U32 ulArg = 0;
	T_pSTR pszArg = (T_pSTR)AK_NULL;

    argcnt = lua_gettop(L);

    if (argcnt != 1)
    {
        lua_pushinteger(L, 0);
        return 1;
    }

    ulArg = lua_type(L, ARG_1);

    switch (ulArg)
    {
        case LUA_TNIL:
            lua_pushnil(L);
            break;
        case LUA_TBOOLEAN:
            ulArg = lua_toboolean(L, ARG_1);
            break;
        case LUA_TLIGHTUSERDATA:
            ulArg = (T_U32)lua_touserdata(L, ARG_1);
            break;
        case LUA_TNUMBER:
            ulArg = (T_U32)lua_tonumber(L, ARG_1);
            break;
        case LUA_TSTRING:
            pszArg = (T_pSTR)lua_tostring(L, ARG_1);
            break;
        case LUA_TTABLE:
            ulArg = ulArg;
            break;
        case LUA_TFUNCTION:
            ulArg = ulArg;
            break;
        case LUA_TUSERDATA:
            ulArg = (T_U32)lua_touserdata(L, ARG_1);
            break;
        case LUA_TTHREAD:
            ulArg = lua_tointeger(L, ARG_1);
            break;
    }

    lua_pushinteger(L, ulArg);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static const struct luaL_reg burntool3libtest[] = 
{
    {"Init", Lua_BT_Init}, 
    {"AttachUSB", Lua_BT_AttachUSB}, 
    {"DetachUSB", Lua_BT_DetachUSB}, 
    {"Start", Lua_BT_Start}, 
    {"SetRamParam", Lua_BT_SetRamParam}, 
    {"DownloadProducer", Lua_BT_DownloadProducer}, 
    {"SwitchUSBHighSpeed", Lua_BT_SwitchUSBHighSpeed}, 
    {"TestConnection", Lua_BT_TestConnection}, 
    {"SetMode", Lua_BT_SetMode}, 
    {"GetFlashID", Lua_BT_GetFlashID}, 
    {"SetNandParam", Lua_BT_SetNandParam}, 
//    {"DetectNandParam", Lua_BT_DetectNandParam}, 
    {"InitSecArea", Lua_BT_InitSecArea}, 
    {"SetResvAreaSize", Lua_BT_SetResvAreaSize}, 
    {"DownloadBin", Lua_BT_DownloadBin}, 
    {"CreatePartition", Lua_BT_CreatePartition}, 
    {"FormatDriver", Lua_BT_FormatDriver}, 
    {"MountDriver", Lua_BT_MountDriver}, 
    {"DownloadBoot", Lua_BT_DownloadBoot}, 
    {"DownloadImg", Lua_BT_DownloadImg}, 
    {"DownloadFile", Lua_BT_DownloadFile}, 
    {"Close", Lua_BT_Close}, 
    {"SetGPIO", Lua_BT_SetGPIO}, 
//    {"UploadFile", Lua_BT_UploadFile}, 
    {"UploadBin", Lua_BT_UploadBin},
	{"UploadBoot", Lua_BT_UploadBoot},
	{"GetDiskInfo", Lua_BT_GetDiskInfo},
	{"WriteASAFile", Lua_BT_WriteASAFile},
	{"WriteMobileDeviceCode", Lua_BT_WriteMobileDeviceCode},

    {"ResetDevice", Lua_BT_ResetDevice}, 
    {"GetRegValue", Lua_BT_GetRegValue}, 
    {"GetVersion", Lua_GetVersion}, 

    // Auxiliary  functions
    {"GetBurnProcess", Lua_GetBurnProcess}, 
    {"GetBurnProgress", Lua_GetBurnProgress}, 
    {"GetUSBName", Lua_GetUSBName}, 
	{"SetRamReg", Lua_SetRamReg}, 
	{"SetRegNum", Lua_SetRegNum}, 
    {"AllocFlashID", Lua_AllocFlashID}, 
    {"AllocnChipCnt", Lua_AllocnChipCnt}, 
    {"SetNandInfo", Lua_SetNandInfo}, 
    {"SetDownloadBinStruct", Lua_SetDownloadBinStruct}, 
	{"SetUploadBinStruct", Lua_SetUploadBinStruct},
    {"SetPartitionInfo", Lua_SetPartitionInfo}, 
	{"SetpDriverInfo", Lua_SetpDriverInfo}, 
	{"SetDriverNum", Lua_SetDriverNum},
    {"SetPartitionInfoStruct", Lua_SetPartitionInfoStruct}, 
    {"SetformatDriverStruct", Lua_SetformatDriverStruct}, 
    {"SetDownloadFileStruct", Lua_SetDownloadFileStruct}, 
    {"SetDownloadImgStruct", Lua_SetDownloadImgStruct}, 
    {"AllocNandPhyInfo", Lua_AllocNandPhyInfo}, 
    {"SetGPIOParam", Lua_SetGPIOParam}, 
    {"AllocMainVersion", Lua_AllocMainVersion}, 
    {"AllocSubVersion", Lua_AllocSubVersion}, 
	{"AllocateBuf", Lua_AllocateBuf},
    {"StartPerformanceTest", Lua_StartPerformanceTest}, 
    {"AllocRegValue", Lua_AllocRegValue},
	{"SetTestCaseCount", Lua_SetTestCaseCount},
    {"SetCaseTable", Lua_SetCaseTable}, 
    {"BeginTest", Lua_BeginTest}, 
    {"EndTest", Lua_EndTest}, 
#if 1
    {"debug", debug}, 
#endif 
    {NULL, NULL} /* sentinel */
};

LUALIB_API int luaopen_burntool3libtest(lua_State *L)
{
    luaL_register(L, pszModuleName, burntool3libtest);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


inline T_BOOL TestSetRamParam(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
    WaitForSingleObject(g_semSetRamParam, INFINITE);

//    dwRet = WaitForSingleObject(g_EvtSetRamParam, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                T_RAM_REG *RamReg = (T_RAM_REG*)AK_NULL;
                T_U32 nNumReg = 0;

                nID = tTestData.td_SetRamParam.nID;
                RamReg = tTestData.td_SetRamParam.RamReg;
                nNumReg = tTestData.td_SetRamParam.nNumReg;

#ifdef DEBUG_PARAM
                
				fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                if (RamReg != AK_NULL)
                {
                    fprintf(logfile, 
                            "TestBurnProcess : RamReg->reg_addr :0x%x\n",
                            RamReg->reg_addr);
                    fprintf(logfile, 
                            "TestBurnProcess : RamReg->reg_value :0x%x\n",
                            RamReg->reg_value);
                }
                else
                {
                    fprintf(logfile, "TestBurnProcess : RamReg :%d\n", RamReg);
                }

                fprintf(logfile, "TestBurnProcess : nNumReg :%d\n", nNumReg);

#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_SetRamParam.Ret = 1;
#else 
                tTestData.td_SetRamParam.Ret = BT_SetRamParam(nID, RamReg,
                    nNumReg);
#endif 

                SetEvent(g_EvtSetRamParamEnd);
                //ResetEvent(g_EvtSetRamParam);
				ResetEvent(g_EvtBurnCmd[SET_RAM_PARAM]);
				ReleaseSemaphore(g_semSetRamParam, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

    ReleaseSemaphore(g_semSetRamParam, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

inline T_BOOL TestGetRegValue(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semGetRegValue, INFINITE);
    
//     dwRet = WaitForSingleObject(g_EvtGetRegValue, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                T_U32 regAddr = 0;
                UINT *regValue = (UINT*)AK_NULL;

                nID = tTestData.td_GetRegValue.nID;
                regAddr = tTestData.td_GetRegValue.regAddr;
                regValue = tTestData.td_GetRegValue.regValue;

#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                fprintf(logfile, "TestBurnProcess : regAddr :%d\n", regAddr);

                if (regValue != AK_NULL)
                {
                    fprintf(logfile, 
                            "TestBurnProcess : regValue address :0x%x\n",
                            regValue);
                    fprintf(logfile, "TestBurnProcess : regValue value :%d\n", 
                            *regValue);
                }
                else
                {
                    fprintf(logfile, "TestBurnProcess : regValue :%d\n",
                            regValue);
                }

#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_GetRegValue.Ret = 1;
#else 
                tTestData.td_GetRegValue.Ret = BT_GetRegValue(nID, regAddr,
                    regValue);

#endif 

                SetEvent(g_EvtGetRegValueEnd);
//                 ResetEvent(g_EvtGetRegValue);
				ResetEvent(g_EvtBurnCmd[GET_REG_VALUE]);
				ReleaseSemaphore(g_semGetRegValue, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semGetRegValue, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////



inline T_BOOL TestDownloadProducer(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	
    WaitForSingleObject(g_semDownloadProducer, INFINITE);

//    dwRet = WaitForSingleObject(g_EvtDownloadProducer, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                TCHAR *pstrPath = (TCHAR*)AK_NULL;
                UINT runAddr = 0;

                nID = tTestData.td_DownloadProducer.nID;
                pstrPath = tTestData.td_DownloadProducer.pstrPath;
                runAddr = tTestData.td_DownloadProducer.runAddr;

#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                fwprintf(logfile, _T("TestBurnProcess : pstrPath :%s\n"),
                         pstrPath);
                fprintf(logfile, "TestBurnProcess : runAddr :0x%x\n", runAddr);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_DownloadProducer.Ret = 1;
#else 
                if (g_PerformanceTest)
                {
                    FILE *fp = (FILE*)AK_NULL;
                    T_U32 ulFileLen = 0;
                    T_U32 ulDuration = 0;
                    T_U32 ulSpeed = 0;
                    SYSTEMTIME stBeginTime;
                    SYSTEMTIME stEndTime;

                    fp = _wfopen(pstrPath, _T("rb"));

                    if (AK_NULL == fp)
                    {
                        tTestData.td_DownloadProducer.Ret = 0;
                        SetEvent(g_EvtDownloadProducerEnd);
                        //ResetEvent(g_EvtDownloadProducer);
						ResetEvent(g_EvtBurnCmd[DOWNLOAD_PRODUCER]);
                        return FALSE;
                    }

                    fseek(fp, 0, SEEK_END);
                    ulFileLen = ftell(fp);
                    rewind(fp);
                    fclose(fp);
                    fp = (FILE*)AK_NULL;

                    GetSystemTime(&stBeginTime);
                    tTestData.td_DownloadProducer.Ret = BT_DownloadProducer(nID,
                        pstrPath, runAddr);
                    GetSystemTime(&stEndTime);

                    ulDuration = stEndTime.wMinute * 60 * 1000 +
                        stEndTime.wSecond * 1000 + stEndTime.wMilliseconds -
                        stBeginTime.wMinute * 60 * 1000 - stBeginTime.wSecond *
                        1000 - stBeginTime.wMilliseconds;

                    ulSpeed = ulFileLen / ulDuration;

                    fprintf(logfile, 
                            "TestBurnProcess : BT_DownloadProducer download speed :filesize:%dbyte(s), duration:%dms, speed:%dk bytes/second\n", ulFileLen, ulDuration, ulSpeed);
                    //wait for producer initial finish
                    Sleep(1000);
                }
                else
                {
                    tTestData.td_DownloadProducer.Ret = BT_DownloadProducer(nID,
                        pstrPath, runAddr);
                    //wait for producer initial finish
                    Sleep(1000);
                }
#endif 


                SetEvent(g_EvtDownloadProducerEnd);
//                ResetEvent(g_EvtDownloadProducer);
				ResetEvent(g_EvtBurnCmd[DOWNLOAD_PRODUCER]);
				ReleaseSemaphore(g_semDownloadProducer, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semDownloadProducer, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

inline T_BOOL TestSwitchUSBHighSpeed(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semSwitchUSBHighSpeed, INFINITE);

//    dwRet = WaitForSingleObject(g_EvtSwitchUSBHighSpeed, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;

                nID = tTestData.td_SwitchUSBHighSpeed.nID;

#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_SwitchUSBHighSpeed.Ret = 1;
#else 
                tTestData.td_SwitchUSBHighSpeed.Ret = BT_SwitchUSBHighSpeed(nID)
                    ;
#endif 

                SetEvent(g_EvtSwitchUSBHighSpeedEnd);
                //ResetEvent(g_EvtSwitchUSBHighSpeed);
				ResetEvent(g_EvtBurnCmd[SWITCH_USB_HIGH_SPEED]);
				ReleaseSemaphore(g_semSwitchUSBHighSpeed, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semSwitchUSBHighSpeed, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////



inline T_BOOL TestTestConnection(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semTestConnection, INFINITE);
    
//    dwRet = WaitForSingleObject(g_EvtTestConnection, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;

                nID = tTestData.td_TestConnection.nID;

#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_TestConnection.Ret = 1;
#else 
                tTestData.td_TestConnection.Ret = BT_TestConnection(nID);
#endif 

                SetEvent(g_EvtTestConnectionEnd);
                //ResetEvent(g_EvtTestConnection);
				ResetEvent(g_EvtBurnCmd[TEST_CONNECTION]);
				ReleaseSemaphore(g_semTestConnection, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semTestConnection, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

inline T_BOOL TestSetMode(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semSetMode, INFINITE);
    
//     dwRet = WaitForSingleObject(g_EvtSetMode, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                E_BURN_MODE mode = MODE_NEWBURN;

                nID = tTestData.td_SetMode.nID;
                mode = tTestData.td_SetMode.mode;
#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                fprintf(logfile, "TestBurnProcess : mode :%d\n", mode);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_SetMode.Ret = 1;
#else 
                tTestData.td_SetMode.Ret = BT_SetMode(nID, mode);
#endif 


                SetEvent(g_EvtSetModeEnd);
//                 ResetEvent(g_EvtSetMode);
				ResetEvent(g_EvtBurnCmd[SET_MODE]);
				ReleaseSemaphore(g_semSetMode, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semSetMode, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


inline T_BOOL TestSetGPIO(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semSetGPIO, INFINITE);
    
    
//     dwRet = WaitForSingleObject(g_EvtSetGPIO, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                T_GPIO_PARAM *GpioParam = (T_GPIO_PARAM*)AK_NULL;

                nID = tTestData.td_SetGPIO.nID;
                GpioParam = tTestData.td_SetGPIO.GpioParam;
#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                fprintf(logfile, "TestBurnProcess : GpioParam :0x%x\n",
                        GpioParam);
                fprintf(logfile, 
                        "TestBurnProcess : GpioParam->numGpioParam :%d\n",
                        GpioParam->num);
                fprintf(logfile, "TestBurnProcess : GpioParam->dir :%d\n", 
                        GpioParam->dir);
                fprintf(logfile, "TestBurnProcess : GpioParam->level :%d\n",
                        GpioParam->level);
				fprintf(logfile, "TestBurnProcess : GpioParam->Pullup :%d\n",
                        GpioParam->Pullup);
				fprintf(logfile, "TestBurnProcess : GpioParam->Pulldown :%d\n",
                        GpioParam->Pulldown);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_SetGPIO.Ret = 1;
#else 
                tTestData.td_SetGPIO.Ret = BT_SetGPIO(nID, GpioParam);
#endif 


                SetEvent(g_EvtSetGPIOEnd);
//                 ResetEvent(g_EvtSetGPIO);
				ResetEvent(g_EvtBurnCmd[SET_GPIO]);
				ReleaseSemaphore(g_semSetGPIO, 1, 0);	
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semSetGPIO, 1, 0);	
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////



inline T_BOOL TestGetFlashID(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semGetFlashID, INFINITE);
    
//     dwRet = WaitForSingleObject(g_EvtGetFlashID, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
				T_U32 ce2_gpio = 0;
				T_U32 ce3_gpio = 0;
                UINT *FlashID = (UINT*)AK_NULL;
                UINT *nChipCnt = (UINT*)AK_NULL;

                nID = tTestData.td_GetFlashID.nID;
				ce2_gpio = tTestData.td_GetFlashID.ce2_gpio;
				ce3_gpio = tTestData.td_GetFlashID.ce3_gpio;
                FlashID = tTestData.td_GetFlashID.FlashID;
                nChipCnt = tTestData.td_GetFlashID.nChipCnt;



#ifdef MASK_TEST_OBJECT
                tTestData.td_GetFlashID.Ret = 1;
				
				if ((FlashID != AK_NULL) && (nChipCnt != AK_NULL))
				{
					*(FlashID) = 0xa514d3ad;
					*(nChipCnt) = 1;
				}
#else 
				
                tTestData.td_GetFlashID.Ret = BT_GetFlashID(nID,ce2_gpio,ce3_gpio, FlashID,
                    nChipCnt);

#endif 
#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
				fprintf(logfile, "TestBurnProcess : ce2_gpio :%d\n", ce2_gpio);
				fprintf(logfile, "TestBurnProcess : ce3_gpio :%d\n", ce3_gpio);
                fprintf(logfile, "TestBurnProcess : FlashID :0x%x\n", *FlashID);
//                fprintf(logfile, "TestBurnProcess : nChipCnt :0x%x\n", *nChipCnt);
#endif 

                SetEvent(g_EvtGetFlashIDEnd);
//                 ResetEvent(g_EvtGetFlashID);
				ResetEvent(g_EvtBurnCmd[GET_FLASH_ID]);
				ReleaseSemaphore(g_semGetFlashID, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semGetFlashID, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


inline T_BOOL TestSetNandParam(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semSetNandParam, INFINITE);
    
//     dwRet = WaitForSingleObject(g_EvtSetNandParam, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                T_NAND_PHY_INFO *NandPhyInfo = (T_NAND_PHY_INFO*)AK_NULL;

                nID = tTestData.td_SetNandParam.nID;
                NandPhyInfo = tTestData.td_SetNandParam.NandPhyInfo;

#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                fprintf(logfile, "TestBurnProcess : NandPhyInfo :0x%x\n",
                        NandPhyInfo);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_SetNandParam.Ret = 1;
#else 
                tTestData.td_SetNandParam.Ret = BT_SetNandParam(nID,
                    NandPhyInfo);
#endif 

                SetEvent(g_EvtSetNandParamEnd);
//                 ResetEvent(g_EvtSetNandParam);
				ResetEvent(g_EvtBurnCmd[SET_NAND_PARAM]);
				ReleaseSemaphore(g_semSetNandParam, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semSetNandParam, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////
/*
inline T_BOOL TestDetectNandParam(T_U32 ulDelay)
{
    T_U32 dwRet = 0;

    dwRet = WaitForSingleObject(g_EvtDetectNandParam, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                T_NAND_PHY_INFO *pNandPhyInfo = (T_NAND_PHY_INFO*)AK_NULL;

                nID = tTestData.td_DetectNandParam.nID;
                pNandPhyInfo = tTestData.td_DetectNandParam.pNandPhyInfo;

#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                fprintf(logfile, "TestBurnProcess : NandPhyInfo :0x%x\n",
                        pNandPhyInfo);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_DetectNandParam.Ret = 1;
#else 
                tTestData.td_DetectNandParam.Ret = BT_DetectNandParam(nID,
                    pNandPhyInfo);
#endif 

                SetEvent(g_EvtDetectNandParamEnd);
                ResetEvent(g_EvtDetectNandParam);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }
ReleaseSemaphore(g_semDetectNandParam, 1, 0);
    return AK_FALSE;
}
*/
///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

inline T_BOOL TestInitSecArea(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semInitSecArea, INFINITE);
//     dwRet = WaitForSingleObject(g_EvtInitSecArea, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
				T_U32 Type = 0;

                nID = tTestData.td_InitSecArea.nID;
				Type = tTestData.td_InitSecArea.Type;

#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
				fprintf(logfile, "TestBurnProcess : Type :%d\n", Type);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_InitSecArea.Ret = 1;
#else 
                tTestData.td_InitSecArea.Ret = BT_InitSecArea(nID,Type);
#endif 

                SetEvent(g_EvtInitSecAreaEnd);
//                 ResetEvent(g_EvtInitSecArea);
				ResetEvent(g_EvtBurnCmd[INIT_SEC_AREA]);
				ReleaseSemaphore(g_semInitSecArea, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semInitSecArea, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


inline T_BOOL TestSetResvAreaSize(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semSetResvAreaSize, INFINITE);
    
//     dwRet = WaitForSingleObject(g_EvtSetResvAreaSize, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                UINT nSize = 0;
				BOOL bErase = 0;

                nID = tTestData.td_SetResvAreaSize.nID;
                nSize = tTestData.td_SetResvAreaSize.nSize;
				bErase = tTestData.td_SetResvAreaSize.bErase;
#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                fprintf(logfile, "TestBurnProcess : nSize :%d\n", nSize);
				fprintf(logfile, "TestBurnProcess : bErase :%d\n", bErase);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_SetResvAreaSize.Ret = 1;
#else 
                tTestData.td_SetResvAreaSize.Ret = BT_SetResvAreaSize(nID,
                    nSize,bErase);
#endif 

                SetEvent(g_EvtSetResvAreaSizeEnd);
//                 ResetEvent(g_EvtSetResvAreaSize);
				ResetEvent(g_EvtBurnCmd[SET_RESV_AREA_SIZE]);
				ReleaseSemaphore(g_semSetResvAreaSize, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semSetResvAreaSize, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


inline T_BOOL TestDownloadBin(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semDownloadBin, INFINITE);
    
//     dwRet = WaitForSingleObject(g_EvtDownloadBin, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                T_DOWNLOAD_BIN *pDownloadBin = (T_DOWNLOAD_BIN*)AK_NULL;

                nID = tTestData.td_DownloadBin.nID;
                pDownloadBin = tTestData.td_DownloadBin.pDownloadBin;

#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                if (pDownloadBin != AK_NULL)
                {
                    fprintf(logfile, 
                            "TestBurnProcess : pDownloadBin->bBackup :%d\n",
                            pDownloadBin->bBackup);
                    fprintf(logfile, 
                            "TestBurnProcess : pDownloadBin->bCompare :%d\n",
                            pDownloadBin->bCompare);
                    fprintf(logfile, 
                            "TestBurnProcess : pDownloadBin->bUpdateSelf :%d\n",
                            pDownloadBin->bUpdateSelf);
                    fprintf(logfile, 
                            "TestBurnProcess : pDownloadBin->file_name :%s\n",
                            pDownloadBin->file_name);
                    fprintf(logfile, 
                            "TestBurnProcess : pDownloadBin->ld_addr :0x%x\n",
                            pDownloadBin->ld_addr);
                    fwprintf(logfile, _T(
                             "TestBurnProcess : pDownloadBin->pc_path :%s\n"),
                             pDownloadBin->pc_path);
                }
                else
                {
                    fprintf(logfile, "TestBurnProcess : pDownloadBin :%d\n",
                            pDownloadBin);
                }


#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_DownloadBin.Ret = 1;
#else 

                if (g_PerformanceTest)
                {
                    FILE *fp = (FILE*)AK_NULL;
                    T_U32 ulFileLen = 0;
                    T_U32 ulDuration = 0;
                    T_U32 ulSpeed = 0;
                    SYSTEMTIME stBeginTime;
                    SYSTEMTIME stEndTime;

                    fp = _wfopen(pDownloadBin->pc_path, _T("rb"));

                    if (AK_NULL == fp)
                    {
                        tTestData.td_DownloadBin.Ret = 0;
                        SetEvent(g_EvtDownloadBinEnd);
//                         ResetEvent(g_EvtDownloadBin);
						ResetEvent(g_EvtBurnCmd[DOWNLOAD_BIN]);
                        return FALSE;
                    }

                    fseek(fp, 0, SEEK_END);
                    ulFileLen = ftell(fp);
                    rewind(fp);
                    fclose(fp);
                    fp = (FILE*)AK_NULL;

                    GetSystemTime(&stBeginTime);
                    tTestData.td_DownloadBin.Ret = BT_DownloadBin(nID,
                        pDownloadBin);
                    GetSystemTime(&stEndTime);

                    ulDuration = stEndTime.wMinute * 60 * 1000 +
                        stEndTime.wSecond * 1000 + stEndTime.wMilliseconds -
                        stBeginTime.wMinute * 60 * 1000 - stBeginTime.wSecond *
                        1000 - stBeginTime.wMilliseconds;

                    ulSpeed = ulFileLen / ulDuration;

                    fprintf(logfile, 
                            "TestBurnProcess : BT_DownloadBin download speed :filesize:%dbyte(s), duration:%dms, speed:%dk bytes/second\n", ulFileLen, ulDuration, ulSpeed);
                }
                else
                {
                    tTestData.td_DownloadBin.Ret = BT_DownloadBin(nID,
                        pDownloadBin);
                }
#endif 


                SetEvent(g_EvtDownloadBinEnd);
//                 ResetEvent(g_EvtDownloadBin);
				ResetEvent(g_EvtBurnCmd[DOWNLOAD_BIN]);
				ReleaseSemaphore(g_semDownloadBin, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semDownloadBin, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


inline T_BOOL TestCreatePartition(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semCreatePartition, INFINITE);
    
//     dwRet = WaitForSingleObject(g_EvtCreatePartition, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                T_PARTION_INFO *PartitionInfo = (T_PARTION_INFO*)AK_NULL;
                UINT nNumPartition = 0;
                UINT resvSize = 0;

                nID = tTestData.td_CreatePartition.nID;
                PartitionInfo = tTestData.td_CreatePartition.PartitionInfo;
                nNumPartition = tTestData.td_CreatePartition.nNumPartition;
                resvSize = tTestData.td_CreatePartition.resvSize;

#ifdef DEBUG_PARAM

                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                fprintf(logfile, "TestBurnProcess : PartitionInfo :0x%x\n",
                        PartitionInfo);
                fprintf(logfile, 
                        "TestBurnProcess : PartitionInfo->bOpenZone :%d\n",
                        PartitionInfo->bOpenZone);
                fprintf(logfile, 
                        "TestBurnProcess : PartitionInfo->Disk_Name :%c\n",
                        PartitionInfo->Disk_Name);
                fprintf(logfile, 
                        "TestBurnProcess : PartitionInfo->ProtectType :%d\n",
                        PartitionInfo->ProtectType);
                fprintf(logfile, "TestBurnProcess : PartitionInfo->Size :%d\n",
                        PartitionInfo->Size);
                fprintf(logfile, 
                        "TestBurnProcess : PartitionInfo->ZoneType :%d\n",
                        PartitionInfo->ZoneType);
                fprintf(logfile, "TestBurnProcess : nNumPartition :%d\n",
                        nNumPartition);
                fprintf(logfile, "TestBurnProcess : resvSize :%d\n", resvSize);

#endif 
#ifdef MASK_TEST_OBJECT			
                tTestData.td_CreatePartition.Ret = 1;
#else 
                tTestData.td_CreatePartition.Ret = BT_CreatePartion(nID,
                    PartitionInfo, nNumPartition, resvSize);
#endif 


                SetEvent(g_EvtCreatePartitionEnd);
//                 ResetEvent(g_EvtCreatePartition);
				ResetEvent(g_EvtBurnCmd[CREATE_PARTITION]);
				ReleaseSemaphore(g_semCreatePartition, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semCreatePartition, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


inline T_BOOL TestFormatDriver(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semFormatDriver, INFINITE);
    
//     dwRet = WaitForSingleObject(g_EvtFormatDriver, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                T_FORMAT_DRIVER *formatDriver = (T_FORMAT_DRIVER*)AK_NULL;

                nID = tTestData.td_FormatDriver.nID;
                formatDriver = tTestData.td_FormatDriver.formatDriver;

#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                fprintf(logfile, "TestBurnProcess : formatDriver :0x%x\n",
                        formatDriver);
                fprintf(logfile, 
                        "TestBurnProcess : formatDriver->driver_Name :%c\n",
                        formatDriver->driver_Name);
                fprintf(logfile, 
                        "TestBurnProcess : formatDriver->nSize_enlarge :%d\n",
                        formatDriver->nSize_enlarge);
                fprintf(logfile, 
                        "TestBurnProcess : formatDriver->pstrVolumeLable :%s\n",
                        formatDriver->pstrVolumeLable);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_FormatDriver.Ret = 1;
#else 
                tTestData.td_FormatDriver.Ret = BT_FormatDriver(nID,
                    formatDriver);
#endif 

                SetEvent(g_EvtFormatDriverEnd);
//                 ResetEvent(g_EvtFormatDriver);
				ResetEvent(g_EvtBurnCmd[FORMAT_DRIVER]);
				ReleaseSemaphore(g_semFormatDriver, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semFormatDriver, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

inline T_BOOL TestMountDriver(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semMountDriver, INFINITE);
    
//     dwRet = WaitForSingleObject(g_EvtMountDriver, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                T_CHR *driverName;
                T_U32 nDriverNum;

                nID = tTestData.td_MountDriver.nID;
                driverName = tTestData.td_MountDriver.driverName;
                nDriverNum = tTestData.td_MountDriver.nDriverNum;

#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                fprintf(logfile, "TestBurnProcess : driverName :%s\n",
                        driverName);
                fprintf(logfile, "TestBurnProcess : nDriverNum :%d\n",
                        nDriverNum);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_MountDriver.Ret = 1;
#else 
                tTestData.td_MountDriver.Ret = BT_MountDriver(nID, driverName,
                    nDriverNum);
#endif 

                SetEvent(g_EvtMountDriverEnd);
//                 ResetEvent(g_EvtMountDriver);
				ResetEvent(g_EvtBurnCmd[MOUNT_DRIVER]);
				ReleaseSemaphore(g_semMountDriver, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semMountDriver, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

inline T_BOOL TestDownloadImg(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semDownloadImg, INFINITE);
    
//     dwRet = WaitForSingleObject(g_EvtDownloadImg, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                T_DOWNLOAD_IMG *pDownloadImg = (T_DOWNLOAD_IMG*)AK_NULL;

                nID = tTestData.td_DownloadImg.nID;
                pDownloadImg = tTestData.td_DownloadImg.pDownloadImg;

#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                fprintf(logfile, "TestBurnProcess : pDownloadImg :0x%x\n",
                        pDownloadImg);
                fprintf(logfile, 
                        "TestBurnProcess : pDownloadImg->bCompare :%d\n",
                        pDownloadImg->bCompare);
                fprintf(logfile, 
                        "TestBurnProcess : pDownloadImg->driver_name :%c\n",
                        pDownloadImg->driver_name);
                fwprintf(logfile, _T(
                         "TestBurnProcess : pDownloadImg->pc_path :%s\n"),
                         pDownloadImg->pc_path);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_DownloadImg.Ret = 1;
#else 

                if (g_PerformanceTest)
                {
                    FILE *fp = (FILE*)AK_NULL;
                    T_U32 ulFileLen = 0;
                    T_U32 ulDuration = 0;
                    T_U32 ulSpeed = 0;
                    SYSTEMTIME stBeginTime;
                    SYSTEMTIME stEndTime;

                    fp = _wfopen(pDownloadImg->pc_path, _T("rb"));

                    if (AK_NULL == fp)
                    {
                        tTestData.td_DownloadImg.Ret = 0;
                        SetEvent(g_EvtDownloadImgEnd);
//                         ResetEvent(g_EvtDownloadImg);
						ResetEvent(g_EvtBurnCmd[DOWNLOAD_IMG]);
                        return FALSE;
                    }

                    fseek(fp, 0, SEEK_END);
                    ulFileLen = ftell(fp);
                    rewind(fp);
                    fclose(fp);
                    fp = (FILE*)AK_NULL;

                    GetSystemTime(&stBeginTime);
                    tTestData.td_DownloadImg.Ret = BT_DownloadImg(nID,
                        pDownloadImg);
                    GetSystemTime(&stEndTime);

                    ulDuration = stEndTime.wMinute * 60 * 1000 +
                        stEndTime.wSecond * 1000 + stEndTime.wMilliseconds -
                        stBeginTime.wMinute * 60 * 1000 - stBeginTime.wSecond *
                        1000 - stBeginTime.wMilliseconds;

                    ulSpeed = ulFileLen / ulDuration;

                    fprintf(logfile, 
                            "TestBurnProcess : BT_DownloadImg download speed :filesize:%dbyte(s), duration:%dms, speed:%dk bytes/second\n", ulFileLen, ulDuration, ulSpeed);
                }
                else
                {
                    tTestData.td_DownloadImg.Ret = BT_DownloadImg(nID,
                        pDownloadImg);
                }
#endif 

                SetEvent(g_EvtDownloadImgEnd);
//                 ResetEvent(g_EvtDownloadImg);
				ResetEvent(g_EvtBurnCmd[DOWNLOAD_IMG]);
				ReleaseSemaphore(g_semDownloadImg, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semDownloadImg, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


inline T_BOOL TestDownloadFile(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semDownloadFile, INFINITE);
    
//     dwRet = WaitForSingleObject(g_EvtDownloadFile, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                T_DOWNLOAD_FILE *pDownloadFile = (T_DOWNLOAD_FILE*)AK_NULL;

                nID = tTestData.td_DownloadFile.nID;
                pDownloadFile = tTestData.td_DownloadFile.pDownloadFile;
#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                fprintf(logfile, "TestBurnProcess : pDownloadFile :0x%x\n",
                        pDownloadFile);
                fprintf(logfile, 
                        "TestBurnProcess : pDownloadFile->bCompare :%d\n",
                        pDownloadFile->bCompare);
                fwprintf(logfile, _T(
                         "TestBurnProcess : pDownloadFile->pc_path :%s\n"),
                         pDownloadFile->pc_path);
                fprintf(logfile, 
                         "TestBurnProcess : pDownloadFile->udisk_path :%s\n",
                         pDownloadFile->udisk_path);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_DownloadFile.Ret = 1;
#else 

                if (g_PerformanceTest)
                {
                    FILE *fp = (FILE*)AK_NULL;
                    T_U32 ulFileLen = 0;
                    T_U32 ulDuration = 0;
                    T_U32 ulSpeed = 0;
                    SYSTEMTIME stBeginTime;
                    SYSTEMTIME stEndTime;

                    fp = _wfopen(pDownloadFile->pc_path, _T("rb"));

                    if (AK_NULL == fp)
                    {
                        tTestData.td_DownloadFile.Ret = 0;
                        SetEvent(g_EvtDownloadFileEnd);
                        //ResetEvent(g_EvtDownloadFile);
						ResetEvent(g_EvtBurnCmd[DOWNLOAD_FILE]);
                        return FALSE;
                    }

                    fseek(fp, 0, SEEK_END);
                    ulFileLen = ftell(fp);
                    rewind(fp);
                    fclose(fp);
                    fp = (FILE*)AK_NULL;

                    GetSystemTime(&stBeginTime);
                    tTestData.td_DownloadFile.Ret = BT_DownloadFile(nID,
                        pDownloadFile);
                    GetSystemTime(&stEndTime);

                    ulDuration = stEndTime.wMinute * 60 * 1000 +
                        stEndTime.wSecond * 1000 + stEndTime.wMilliseconds -
                        stBeginTime.wMinute * 60 * 1000 - stBeginTime.wSecond *
                        1000 - stBeginTime.wMilliseconds;

                    ulSpeed = ulFileLen / ulDuration;

                    fprintf(logfile, 
                            "TestBurnProcess : BT_DownloadFile download speed :filesize:%dbyte(s), duration:%dms, speed:%dk bytes/second\n", ulFileLen, ulDuration, ulSpeed);
                }
                else
                {
                    tTestData.td_DownloadFile.Ret = BT_DownloadFile(nID,
                        pDownloadFile);
                }
#endif 


                SetEvent(g_EvtDownloadFileEnd);
//                 ResetEvent(g_EvtDownloadFile);
				ResetEvent(g_EvtBurnCmd[DOWNLOAD_FILE]);
				ReleaseSemaphore(g_semDownloadFile, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semDownloadFile, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


inline T_BOOL TestDownloadBoot(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semDownloadBoot, INFINITE);
   
//     dwRet = WaitForSingleObject(g_EvtDownloadBoot, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
                TCHAR *pstrPath = (TCHAR*)AK_NULL;
                E_CHIP_TYPE ChipType = CHIP_RESERVER;

                nID = tTestData.td_DownloadBoot.nID;
                pstrPath = tTestData.td_DownloadBoot.pstrPath;
                ChipType = tTestData.td_DownloadBoot.ChipType;
#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                fwprintf(logfile, _T("TestBurnProcess : pstrPath :%s\n"),
                         pstrPath);
                fprintf(logfile, "TestBurnProcess : ChipType :%d\n", ChipType);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_DownloadBoot.Ret = 1;
#else 

                if (g_PerformanceTest)
                {
                    FILE *fp = (FILE*)AK_NULL;
                    T_U32 ulFileLen = 0;
                    T_U32 ulDuration = 0;
                    T_U32 ulSpeed = 0;
                    SYSTEMTIME stBeginTime;
                    SYSTEMTIME stEndTime;

                    fp = _wfopen(pstrPath, _T("rb"));

                    if (AK_NULL == fp)
                    {
                        tTestData.td_DownloadFile.Ret = 0;
                        SetEvent(g_EvtDownloadBootEnd);
                        //ResetEvent(g_EvtDownloadFile);
						ResetEvent(g_EvtBurnCmd[DOWNLOAD_BOOT]);
                        return FALSE;
                    }

                    fseek(fp, 0, SEEK_END);
                    ulFileLen = ftell(fp);
                    rewind(fp);
                    fclose(fp);
                    fp = (FILE*)AK_NULL;

                    GetSystemTime(&stBeginTime);
                    tTestData.td_DownloadBoot.Ret = BT_DownloadBoot(nID,
                        pstrPath, ChipType);
                    GetSystemTime(&stEndTime);

                    ulDuration = stEndTime.wMinute * 60 * 1000 +
                        stEndTime.wSecond * 1000 + stEndTime.wMilliseconds -
                        stBeginTime.wMinute * 60 * 1000 - stBeginTime.wSecond *
                        1000 - stBeginTime.wMilliseconds;

                    ulSpeed = ulFileLen / ulDuration;

                    fprintf(logfile, 
                            "TestBurnProcess : BT_DownloadBoot download speed :filesize:%dbyte(s), duration:%dms, speed:%dk bytes/second\n", ulFileLen, ulDuration, ulSpeed);
                }
                else
                {
                    tTestData.td_DownloadBoot.Ret = BT_DownloadBoot(nID,
                        pstrPath, ChipType);
                }
#endif 


                SetEvent(g_EvtDownloadBootEnd);
//                 ResetEvent(g_EvtDownloadBoot);
				ResetEvent(g_EvtBurnCmd[DOWNLOAD_BOOT]);
				ReleaseSemaphore(g_semDownloadBoot, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semDownloadBoot, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////
/*
inline T_BOOL TestUploadFile(T_U32 ulDelay)
{
T_U32 dwRet = 0;

  dwRet = WaitForSingleObject(g_EvtUploadFile, ulDelay);
  
    switch (dwRet)
    {
	case WAIT_OBJECT_0:
	{
	T_U32 nID = 0;
	TCHAR *strFilePath = (TCHAR*)AK_NULL;
	TCHAR *strPCPath = (TCHAR*)AK_NULL;
	
	  nID = tTestData.td_UploadFile.nID;
	  strFilePath = tTestData.td_UploadFile.strFilePath;
	  strPCPath = tTestData.td_UploadFile.strPCPath;
	  #ifdef DEBUG_PARAM
	  fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
	  fwprintf(logfile, _T("TestBurnProcess : strFilePath :%s\n"),
	  strFilePath);
	  fprintf(logfile, "TestBurnProcess : strPCPath :%s\n", strPCPath)
	  ;
	  #endif 
	  #ifdef MASK_TEST_OBJECT
	  tTestData.td_UploadFile.Ret = 1;
	  #else 
	  tTestData.td_UploadFile.Ret = BT_UploadFile(nID, strFilePath,
	  strPCPath);
	  #endif 
	  
		
		  SetEvent(g_EvtUploadFileEnd);
		  ResetEvent(g_EvtUploadFile);
		  return AK_TRUE;
		  }
		  break;
		  case WAIT_TIMEOUT:
		  break;
		  default:
		  break;
		  }
		  
		return AK_FALSE;
}
inline T_BOOL TestUploadFile(T_U32 ulDelay)
{
T_U32 dwRet = 0;

  dwRet = WaitForSingleObject(g_EvtUploadFile, ulDelay);
  
    switch (dwRet)
    {
	case WAIT_OBJECT_0:
	{
	T_U32 nID = 0;
	TCHAR *strFilePath = (TCHAR*)AK_NULL;
	TCHAR *strPCPath = (TCHAR*)AK_NULL;
	
	  nID = tTestData.td_UploadFile.nID;
	  strFilePath = tTestData.td_UploadFile.strFilePath;
	  strPCPath = tTestData.td_UploadFile.strPCPath;
	  #ifdef DEBUG_PARAM
	  fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
	  fwprintf(logfile, _T("TestBurnProcess : strFilePath :%s\n"),
	  strFilePath);
	  fprintf(logfile, "TestBurnProcess : strPCPath :%s\n", strPCPath)
	  ;
	  #endif 
	  #ifdef MASK_TEST_OBJECT
	  tTestData.td_UploadFile.Ret = 1;
	  #else 
	  tTestData.td_UploadFile.Ret = BT_UploadFile(nID, strFilePath,
	  strPCPath);
	  #endif 
	  
		
		  SetEvent(g_EvtUploadFileEnd);
		  ResetEvent(g_EvtUploadFile);
		  return AK_TRUE;
		  }
		  break;
		  case WAIT_TIMEOUT:
		  break;
		  default:
		  break;
		  }
		  
    return AK_FALSE;
}
*/

inline T_BOOL TestUploadBoot(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	
//     dwRet = WaitForSingleObject(g_EvtUploadBoot, ulDelay);
	
    switch (dwRet)
    {
	case WAIT_OBJECT_0:
		{
			T_U32 nID = 0;
			TCHAR *pstrPath = (TCHAR*)AK_NULL;
			 UINT fileLen = 0;
			
			nID = tTestData.td_UploadBoot.nID;
			pstrPath = tTestData.td_UploadBoot.pstrPath;
			fileLen = tTestData.td_UploadBoot.fileLen;
#ifdef DEBUG_PARAM
			fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
			fwprintf(logfile, _T("TestBurnProcess : pstrPath :%s\n"),
				pstrPath);
			fprintf(logfile, "TestBurnProcess : pstrPath :%d\n", fileLen)
				;
#endif 
#ifdef MASK_TEST_OBJECT
			tTestData.td_UploadBoot.Ret = 1;
#else 
			tTestData.td_UploadBoot.Ret = BT_UploadBoot(nID, pstrPath,
				fileLen);
#endif 
			
			
			SetEvent(g_EvtUploadBootEnd);
//			ResetEvent(g_EvtUploadBoot);
			ResetEvent(g_EvtBurnCmd[UPLOAD_BOOT]);
			return AK_TRUE;
		}
		break;
	case WAIT_TIMEOUT:
		break;
	default:
		break;
    }
	
    return AK_FALSE;
}
///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


inline T_BOOL TestUploadBin(T_U32 ulDelay)
{
    T_U32 dwRet = 0;

//     dwRet = WaitForSingleObject(g_EvtUploadBin, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;
				T_UPLOAD_BIN* pUploadBin = (T_UPLOAD_BIN*)AK_NULL;
               
                nID = tTestData.td_UploadBin.nID;
                pUploadBin = tTestData.td_UploadBin.pUploadBin;
                
#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
                fwprintf(logfile, _T("TestBurnProcess : pUploadBin :%s\n"),
                         pUploadBin);
                
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_UploadBin.Ret = 1;
#else 
                tTestData.td_UploadBin.Ret = BT_UploadBin(nID, pUploadBin);
#endif 


                SetEvent(g_EvtUploadBinEnd);
//                ResetEvent(g_EvtUploadBin);
				ResetEvent(g_EvtBurnCmd[UPLOAD_BIN]);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

    return AK_FALSE;
}

inline T_BOOL TestGetDiskInfo(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	
//     dwRet = WaitForSingleObject(g_EvtGetDiskInfo, ulDelay);
	
    switch (dwRet)
    {
	case WAIT_OBJECT_0:
		{
			T_U32 nID = 0;
			UINT *DriverNum = (UINT*)AK_NULL;
			T_DRIVER_INFO *pDriverInfo = (T_DRIVER_INFO*)AK_NULL;
			
			nID = tTestData.td_GetDiskInfo.nID;
			DriverNum = tTestData.td_GetDiskInfo.DriverNum;
			pDriverInfo = tTestData.td_GetDiskInfo.pDriverInfo;
			
#ifdef DEBUG_PARAM
			fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
			fprintf(logfile, "TestBurnProcess : DriverNum :0x%x\n",DriverNum);
			fprintf(logfile, "TestBurnProcess : pDriverInfo :0x%x\n",
                        pDriverInfo);
			fprintf(logfile, "TestBurnProcess : pDriverInfo->DiskName :%c\n",
                        pDriverInfo->DiskName);
			fprintf(logfile, "TestBurnProcess : pDriverInfo->PageCnt :%d\n",
                        pDriverInfo->PageCnt);
#endif 
#ifdef MASK_TEST_OBJECT
			tTestData.td_GetDiskInfo.Ret = 1;
#else 
			tTestData.td_GetDiskInfo.Ret = BT_GetDiskInfo(nID, DriverNum,pDriverInfo);
#endif 
			
			
			SetEvent(g_EvtGetDiskInfoEnd);
//			ResetEvent(g_EvtGetDiskInfo);
			ResetEvent(g_EvtBurnCmd[GET_DISK_INFO]);
			return AK_TRUE;
		}
		break;
	case WAIT_TIMEOUT:
		break;
	default:
		break;
    }
	
    return AK_FALSE;
}

inline T_BOOL TestWriteASAFile(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	
//    dwRet = WaitForSingleObject(g_EvtWriteASAFile, ulDelay);
	
    switch (dwRet)
    {
	case WAIT_OBJECT_0:
		{
			T_U32 nID = 0;
			char* fileName = (char*)AK_NULL;
			BYTE* pBuf = (BYTE*)AK_NULL;
			T_U32 bufSize = 0;
			T_U32 mode = 0;
			
			nID = tTestData.td_WriteASAFile.nID;
			fileName = tTestData.td_WriteASAFile.fileName;
			pBuf = tTestData.td_WriteASAFile.pBuf;
			bufSize = tTestData.td_WriteASAFile.bufSize;
			mode = tTestData.td_WriteASAFile.mode;
			
#ifdef DEBUG_PARAM
			fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
			fprintf(logfile, "TestBurnProcess : fileName :%s\n",
				fileName);
			fprintf(logfile, "TestBurnProcess : pBuf :%s\n",
				pBuf);
			fprintf(logfile, "TestBurnProcess : bufSize :%d\n", bufSize);
			fprintf(logfile, "TestBurnProcess : mode :%d\n", mode);
#endif 
#ifdef MASK_TEST_OBJECT
			tTestData.td_WriteASAFile.Ret = 1;
#else 
			tTestData.td_WriteASAFile.Ret = BT_WriteASAFile(nID, fileName,pBuf,bufSize,mode);
#endif 
			
			
			SetEvent(g_EvtWriteASAFileEnd);
// 			ResetEvent(g_EvtWriteASAFile);
			ResetEvent(g_EvtBurnCmd[WRITE_ASA_FILE]);
			return AK_TRUE;
		}
		break;
	case WAIT_TIMEOUT:
		break;
	default:
		break;
    }
	
    return AK_FALSE;
}

inline T_BOOL TestWriteMobileDeviceCode(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	
//    dwRet = WaitForSingleObject(g_EvtWriteMobileDeviceCode, ulDelay);
	
    switch (dwRet)
    {
	case WAIT_OBJECT_0:
		{
			T_U32 nID = 0;
			
			nID = tTestData.td_WriteMobileDeviceCode.nID;
			
#ifdef DEBUG_PARAM
			fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);

#endif 
#ifdef MASK_TEST_OBJECT
			tTestData.td_WriteMobileDeviceCode.Ret = 1;
#else 
			tTestData.td_WriteMobileDeviceCode.Ret = BT_WriteMobileDeviceCode(nID);
#endif 
			
			
			SetEvent(g_EvtWriteMobileDeviceCodeEnd);
//			ResetEvent(g_EvtWriteMobileDeviceCode);
			ResetEvent(g_EvtBurnCmd[WRITE_MOBILE_DEVICE_CODE]);
			return AK_TRUE;
		}
		break;
	case WAIT_TIMEOUT:
		break;
	default:
		break;
    }
	
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

inline T_BOOL TestResetDevice(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semResetDevice, INFINITE);
    
//     dwRet = WaitForSingleObject(g_EvtResetDevice, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;

                nID = tTestData.td_ResetDevice.nID;
#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_ResetDevice.Ret = 1;
#else 
                tTestData.td_ResetDevice.Ret = BT_ResetDevice(nID);
#endif 

                SetEvent(g_EvtResetDeviceEnd);
//                 ResetEvent(g_EvtResetDevice);
				ResetEvent(g_EvtBurnCmd[RESET_DEVICE]);
				ReleaseSemaphore(g_semResetDevice, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semResetDevice, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////



inline T_BOOL TestClose(T_U32 ulDelay)
{
    T_U32 dwRet = 0;
	WaitForSingleObject(g_semClose, INFINITE);
    
//     dwRet = WaitForSingleObject(g_EvtClose, ulDelay);

    switch (dwRet)
    {
        case WAIT_OBJECT_0:
            {
                T_U32 nID = 0;

                nID = tTestData.td_Close.nID;
#ifdef DEBUG_PARAM
                fprintf(logfile, "TestBurnProcess : nID :%d\n", nID);
#endif 
#ifdef MASK_TEST_OBJECT
                tTestData.td_Close.Ret = 1;
#else 
                tTestData.td_Close.Ret = BT_Close(nID);
#endif 

                SetEvent(g_EvtCloseEnd);
//                 ResetEvent(g_EvtClose);
				ResetEvent(g_EvtBurnCmd[CLOSE]);
				ReleaseSemaphore(g_semClose, 1, 0);
                return AK_TRUE;
            }
            break;
        case WAIT_TIMEOUT:
            break;
        default:
            break;
    }

	ReleaseSemaphore(g_semClose, 1, 0);
    return AK_FALSE;
}

///////////////////////////////////////////////////////////////////////////
//  Brief: This test thread function implemented by using a event loop. ///
//         When certain event occurred, it will invoked corresponding   ///
//         test function to get test input data and invoke test object  ///
//         API. In order to release the CPU resource, ulDelayDuration   ///
//         will be increased when no test function invoked.             ///
///////////////////////////////////////////////////////////////////////////

BOOL TestBurnProcess(UINT nID)
{
    DWORD dwRet = 0;
	T_U32 ulRet = 0;
    T_BOOL bExit = AK_FALSE;
	T_U32 ulDelayDuration = 1000;
	T_U32 ulThreadID = 0;
	
	g_ulThreadCnt += 1;
	ulThreadID = g_ulThreadCnt;

    while (!bExit)
    {
		dwRet = WaitForMultipleObjects(BURN_CMD_COUNT, g_EvtBurnCmd, FALSE, INFINITE);
//		Sleep(1000);
			
        switch (dwRet)
        {
		case SET_RAM_PARAM:
			{
				dwRet = TestSetRamParam(ulDelayDuration);
			}
			break;
		case DOWNLOAD_PRODUCER:
			{
				dwRet = TestDownloadProducer(ulDelayDuration);
			}
//			Sleep(2000);
			break;
		case SWITCH_USB_HIGH_SPEED:
			{
				dwRet = TestSwitchUSBHighSpeed(ulDelayDuration);
				
			}
			break;
		case TEST_CONNECTION:
			{
				dwRet = TestTestConnection(ulDelayDuration);				
			}
			break;
		case SET_MODE:
			{
				dwRet = TestSetMode(ulDelayDuration);			
			}
			break;
		case GET_FLASH_ID:
			{
				dwRet = TestGetFlashID(ulDelayDuration);				
			}
			break;
		case SET_NAND_PARAM:
			{				
				dwRet = TestSetNandParam(ulDelayDuration);				
			}
			break;
		//case DETECT_NAND_PARAM:
			{
			//      dwRet = TestDetectNandParam(ulDelayDuration);			
			}
			break;
		case INIT_SEC_AREA:
			{
				dwRet = TestInitSecArea(ulDelayDuration);				
			}
			break;
		case SET_RESV_AREA_SIZE:
			{
				dwRet = TestSetResvAreaSize(ulDelayDuration);			
			}
			break;
		case DOWNLOAD_BIN:
			{
				dwRet = TestDownloadBin(ulDelayDuration);			
			}
			break;
		case CREATE_PARTITION:
			{
				dwRet = TestCreatePartition(ulDelayDuration);				
			}
			break;
		case FORMAT_DRIVER:
			{
				dwRet = TestFormatDriver(ulDelayDuration);			
			}
			break;
		case MOUNT_DRIVER:
			{
				dwRet = TestMountDriver(ulDelayDuration);				
			}
			break;
		case DOWNLOAD_BOOT:
			{
				dwRet = TestDownloadBoot(ulDelayDuration);				
			}
			break;
		case DOWNLOAD_IMG:
			{
				dwRet = TestDownloadImg(ulDelayDuration);				
			}
			break;
		case DOWNLOAD_FILE:
			{
				dwRet = TestDownloadFile(ulDelayDuration);				
			}
			break;
		case CLOSE:
			{
				dwRet = TestClose(ulDelayDuration);					
			}
			break;
		case SET_GPIO:
			{
				dwRet = TestSetGPIO(ulDelayDuration);			
			}
			break;
		case UPLOAD_BOOT:
			{
				dwRet = TestUploadBoot(ulDelayDuration);				
			}
			break;
		case UPLOAD_BIN:
			{
				dwRet = TestUploadBin(ulDelayDuration);			
			}
			break;
		case RESET_DEVICE:
			{
				dwRet = TestResetDevice(ulDelayDuration);				
			}
			break;
		case GET_REG_VALUE:
			{
				dwRet = TestGetRegValue(ulDelayDuration);
			}
			break;
		case GET_VERSION:
			{
				
			}
			break;
		case WRITE_MOBILE_DEVICE_CODE:
			{
				dwRet = TestWriteMobileDeviceCode(ulDelayDuration);
			}
			break;
		case GET_DISK_INFO:
			{
				dwRet = TestGetDiskInfo(ulDelayDuration);
			}
			break;			
		case WRITE_ASA_FILE:
			{
				dwRet = TestWriteASAFile(ulDelayDuration);
			}
			break;
		case WAIT_TIMEOUT:
			break;
		default:
			break;
        }

        dwRet = WaitForSingleObject(g_EvtBurnProcessEnd, 50);

        switch (dwRet)
        {
            case WAIT_OBJECT_0:
                {
                    bExit = AK_TRUE;
                }
                break;
            case WAIT_TIMEOUT:
                break;
            default:
                break;
        }
    }

    return AK_TRUE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

VOID TestBurnProgress(UINT nID, UINT nDataLen)
{
    //	nDataLen = nDataLen;
}
