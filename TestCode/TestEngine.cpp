#include <stdafx.h>

#ifdef __cplusplus
extern "C"{
#endif 

#include "TestEngine.h"

#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"
#include "anyka_types.h"
#include "transc.h"
#include "BTTestCode.h"
#include "loglib.h"
#include "ResultEngine.h"
#include "ReportWriter.h"

#ifdef __cplusplus
};
#endif 

extern HANDLE g_semInit;
extern HANDLE g_semAttachUSB;
extern HANDLE g_semDetachUSB;
extern HANDLE g_semStart;
extern HANDLE g_semSetRamParam;
extern HANDLE g_semDownloadProducer;
extern HANDLE g_semSwitchUSBHighSpeed;
extern HANDLE g_semTestConnection;
extern HANDLE g_semSetMode;
extern HANDLE g_semGetFlashID;
extern HANDLE g_semSetNandParam;
//extern HANDLE g_semDetectNandParam;
extern HANDLE g_semInitSecArea;
extern HANDLE g_semSetResvAreaSize;
extern HANDLE g_semDownloadBin;
extern HANDLE g_semCreatePartition;
extern HANDLE g_semFormatDriver;
extern HANDLE g_semMountDriver;
extern HANDLE g_semDownloadBoot;
extern HANDLE g_semDownloadImg;
extern HANDLE g_semDownloadFile;
extern HANDLE g_semClose;
extern HANDLE g_semSetGPIO;
//extern HANDLE g_semUploadFile;
extern HANDLE g_semUploadBoot;
extern HANDLE g_semUploadBin;
extern HANDLE g_semResetDevice;
extern HANDLE g_semGetRegValue;
extern HANDLE g_semWriteMobileDeviceCode;
extern HANDLE g_semGetDiskInfo;
extern HANDLE g_semWriteASAFile;

extern HANDLE g_EvtBurnCmd[BURN_CMD_COUNT];
extern HANDLE g_EvtInit;
extern HANDLE g_EvtAttachUSB;
extern HANDLE g_EvtDetachUSB;
extern HANDLE g_EvtStart;
//extern HANDLE g_EvtSetRamParam;
//extern HANDLE g_EvtDownloadProducer;
extern HANDLE g_EvtSwitchUSBHighSpeed;
extern HANDLE g_EvtTestConnection;
extern HANDLE g_EvtSetMode;
extern HANDLE g_EvtGetFlashID;
extern HANDLE g_EvtSetNandParam;
//extern HANDLE g_EvtDetectNandParam;
extern HANDLE g_EvtInitSecArea;
extern HANDLE g_EvtSetResvAreaSize;
extern HANDLE g_EvtDownloadBin;
extern HANDLE g_EvtCreatePartition;
extern HANDLE g_EvtFormatDriver;
extern HANDLE g_EvtMountDriver;
extern HANDLE g_EvtDownloadBoot;
extern HANDLE g_EvtDownloadImg;
extern HANDLE g_EvtDownloadFile;
extern HANDLE g_EvtClose;
extern HANDLE g_EvtSetGPIO;
//extern HANDLE g_EvtUploadFile;
extern HANDLE g_EvtUploadBoot;
extern HANDLE g_EvtUploadBin;
extern HANDLE g_EvtResetDevice;
extern HANDLE g_EvtGetRegValue;
extern HANDLE g_EvtWriteMobileDeviceCode;
extern HANDLE g_EvtGetDiskInfo;
extern HANDLE g_EvtWriteASAFile;

extern HANDLE g_EvtInitEnd;
extern HANDLE g_EvtAttachUSBEnd;
extern HANDLE g_EvtDetachUSBEnd;
extern HANDLE g_EvtStartEnd;
extern HANDLE g_EvtSetRamParamEnd;
extern HANDLE g_EvtDownloadProducerEnd;
extern HANDLE g_EvtSwitchUSBHighSpeedEnd;
extern HANDLE g_EvtTestConnectionEnd;
extern HANDLE g_EvtSetModeEnd;
extern HANDLE g_EvtGetFlashIDEnd;
extern HANDLE g_EvtSetNandParamEnd;
//extern HANDLE g_EvtDetectNandParamEnd;
extern HANDLE g_EvtInitSecAreaEnd;
extern HANDLE g_EvtSetResvAreaSizeEnd;
extern HANDLE g_EvtDownloadBinEnd;
extern HANDLE g_EvtCreatePartitionEnd;
extern HANDLE g_EvtFormatDriverEnd;
extern HANDLE g_EvtMountDriverEnd;
extern HANDLE g_EvtDownloadBootEnd;
extern HANDLE g_EvtDownloadImgEnd;
extern HANDLE g_EvtDownloadFileEnd;
extern HANDLE g_EvtCloseEnd;
extern HANDLE g_EvtSetGPIOEnd;
//extern HANDLE g_EvtUploadFileEnd;
extern HANDLE g_EvtUploadBootEnd;
extern HANDLE g_EvtUploadBinEnd;
extern HANDLE g_EvtResetDeviceEnd;
extern HANDLE g_EvtGetRegValueEnd;
extern HANDLE g_EvtWriteMobileDeviceCodeEnd;
extern HANDLE g_EvtGetDiskInfoEnd;
extern HANDLE g_EvtBurnProcessEnd;
extern HANDLE g_EvtWriteASAFileEnd;

extern T_BOOL g_PerformanceTest;

static lua_State *s_pLua;
T_CHR pszModuleName[MAX_PATH] = {0};
static T_CHR pszScriptName[MAX_PATH] = {0};
static T_CHR pszLogFileName[MAX_PATH] = {0};
static T_CHR pszReportFileName[MAX_PATH] = {0};
static T_CHR pszTestObjectVersion[MAX_PATH] = {0};
static T_CHR pszTestType[MAX_PATH] = {0};
static T_CHR pszTester[MAX_PATH] = {0};

static SYSTEMTIME stBeginTime;
static SYSTEMTIME stEndTime;

ReportCurCaseID g_pfnRepCurCaseID;
ReportCaseResult g_pfnRepCaseRsl;
ReportTestStepData g_pfnRepTestStepData;
ReportTestStepResult g_pfnRepTestStepRsl;

T_TEST_CASE_LIST *g_ptTestCaseList = (T_TEST_CASE_LIST *)AK_NULL;

T_VOID EmptyFunc(T_VOID)
{
    return ;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

static T_U32 TestEngine(T_TEST_MSG tTestMsg);

T_U32 TE_InitEnvironment(T_TEST_MSG tTestMsg, t_TestProgressCBFuncs tCBfuncs)
{
    // Create semaphores for test functions
    g_semInit = CreateSemaphore(NULL, 1, 1, _T("semInit"));
    g_semAttachUSB = CreateSemaphore(NULL, 1, 1, _T("semAttachUSB"));
    g_semDetachUSB = CreateSemaphore(NULL, 1, 1, _T("semDetachUSB"));
    g_semStart = CreateSemaphore(NULL, 1, 1, _T("semStart"));
    g_semSetRamParam = CreateSemaphore(NULL, 1, 1, _T("semSetRamParam"));
    g_semDownloadProducer = CreateSemaphore(NULL, 1, 1, _T(
        "semDownloadProducer"));
    g_semSwitchUSBHighSpeed = CreateSemaphore(NULL, 1, 1, _T(
        "semSwitchUSBHighSpeed"));
    g_semTestConnection = CreateSemaphore(NULL, 1, 1, _T("semTestConnection"));
    g_semSetMode = CreateSemaphore(NULL, 1, 1, _T("semSetMode"));
    g_semGetFlashID = CreateSemaphore(NULL, 1, 1, _T("semGetFlashID"));
    g_semSetNandParam = CreateSemaphore(NULL, 1, 1, _T("semSetNandParam"));
//    g_semDetectNandParam = CreateSemaphore(NULL, 1, 1, _T("semDetectNandParam"))
        ;
    g_semInitSecArea = CreateSemaphore(NULL, 1, 1, _T("semInitSecArea"));
    g_semSetResvAreaSize = CreateSemaphore(NULL, 1, 1, _T("semSetResvAreaSize"))
        ;
    g_semDownloadBin = CreateSemaphore(NULL, 1, 1, _T("semDownloadBin"));
    g_semCreatePartition = CreateSemaphore(NULL, 1, 1, _T("semCreatePartition"))
        ;
    g_semFormatDriver = CreateSemaphore(NULL, 1, 1, _T("semFormatDriver"));
    g_semMountDriver = CreateSemaphore(NULL, 1, 1, _T("semMountDriver"));
    g_semDownloadBoot = CreateSemaphore(NULL, 1, 1, _T("semDownloadBoot"));
    g_semDownloadImg = CreateSemaphore(NULL, 1, 1, _T("semDownloadImg"));
    g_semDownloadFile = CreateSemaphore(NULL, 1, 1, _T("semDownloadFile"));
    g_semClose = CreateSemaphore(NULL, 1, 1, _T("semClose"));
    g_semSetGPIO = CreateSemaphore(NULL, 1, 1, _T("semSetGPIO"));
//    g_semUploadFile = CreateSemaphore(NULL, 1, 1, _T("semUploadFile"));
	g_semUploadBoot = CreateSemaphore(NULL, 1, 1, _T("semUploadBoot"));
    g_semUploadBin = CreateSemaphore(NULL, 1, 1, _T("semUploadBin"));
    g_semResetDevice = CreateSemaphore(NULL, 1, 1, _T("semResetDevice"));
    g_semGetRegValue = CreateSemaphore(NULL, 1, 1, _T("semGetRegValue"));
	g_semWriteMobileDeviceCode = CreateSemaphore(NULL, 1, 1, _T("semWriteMobileDeviceCode"));
	g_semGetDiskInfo = CreateSemaphore(NULL, 1, 1, _T("semGetDiskInfo"));
	g_semWriteASAFile = CreateSemaphore(NULL, 1, 1, _T("semWriteASAFile"));

    // Create events for test functions
    g_EvtInit = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtAttachUSB = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtDetachUSB = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtStart = CreateEvent(NULL, TRUE, FALSE, NULL);

    g_EvtInitEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtAttachUSBEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtDetachUSBEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtStartEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtSetRamParamEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtDownloadProducerEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtSwitchUSBHighSpeedEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtTestConnectionEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtSetModeEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtGetFlashIDEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtSetNandParamEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
//    g_EvtDetectNandParamEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtInitSecAreaEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtSetResvAreaSizeEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtDownloadBinEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtCreatePartitionEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtFormatDriverEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtMountDriverEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtDownloadBootEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtDownloadImgEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtDownloadFileEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtCloseEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtSetGPIOEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
//    g_EvtUploadFileEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
	g_EvtUploadBootEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtUploadBinEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtResetDeviceEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtGetRegValueEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
    g_EvtBurnProcessEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
	g_EvtWriteMobileDeviceCodeEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
	g_EvtGetDiskInfoEnd = CreateEvent(NULL, TRUE, FALSE, NULL);
	g_EvtWriteASAFileEnd = CreateEvent(NULL, TRUE, FALSE, NULL);

	for (int i=0;i<BURN_CMD_COUNT;i++)
	{
		g_EvtBurnCmd[i] = CreateEvent(NULL, TRUE, FALSE, NULL);
	}


    // Initial case result report call-back function
    if ((AK_NULL == tCBfuncs.pfnReportCurCaseID) || (AK_NULL ==
        tCBfuncs.pfnReportCaseResult) || (AK_NULL ==
        tCBfuncs.pfnReportTestStepData) || (AK_NULL ==
        tCBfuncs.pfnReportTestStepResult))

    {
        g_pfnRepCurCaseID = (ReportCurCaseID)EmptyFunc;
        g_pfnRepCaseRsl = (ReportCaseResult)EmptyFunc;
        g_pfnRepTestStepData = (ReportTestStepData)EmptyFunc;
        g_pfnRepTestStepRsl = (ReportTestStepResult)EmptyFunc;
        return TM_BAD_PARA;
    }

	g_pfnRepCurCaseID = tCBfuncs.pfnReportCurCaseID;
    g_pfnRepCaseRsl = tCBfuncs.pfnReportCaseResult;
    g_pfnRepTestStepData = tCBfuncs.pfnReportTestStepData;
    g_pfnRepTestStepRsl = tCBfuncs.pfnReportTestStepResult;

    // Initial lua environment
    return TestEngine(tTestMsg);
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_U32 TE_DeInit(T_TEST_MSG tTestMsg)
{		


    CloseHandle((HANDLE)g_semInit);
    CloseHandle((HANDLE)g_semAttachUSB);
    CloseHandle((HANDLE)g_semDetachUSB);
    CloseHandle((HANDLE)g_semStart);
    CloseHandle((HANDLE)g_semSetRamParam);
    CloseHandle((HANDLE)g_semDownloadProducer);
    CloseHandle((HANDLE)g_semSwitchUSBHighSpeed);
    CloseHandle((HANDLE)g_semTestConnection);
    CloseHandle((HANDLE)g_semSetMode);
    CloseHandle((HANDLE)g_semGetFlashID);
    CloseHandle((HANDLE)g_semSetNandParam);
//    CloseHandle((HANDLE)g_semDetectNandParam);
    CloseHandle((HANDLE)g_semInitSecArea);
    CloseHandle((HANDLE)g_semSetResvAreaSize);
    CloseHandle((HANDLE)g_semDownloadBin);
    CloseHandle((HANDLE)g_semCreatePartition);
    CloseHandle((HANDLE)g_semFormatDriver);
    CloseHandle((HANDLE)g_semMountDriver);
    CloseHandle((HANDLE)g_semDownloadBoot);
    CloseHandle((HANDLE)g_semDownloadImg);
    CloseHandle((HANDLE)g_semDownloadFile);
    CloseHandle((HANDLE)g_semClose);
    CloseHandle((HANDLE)g_semSetGPIO);
//    CloseHandle((HANDLE)g_semUploadFile);
	CloseHandle((HANDLE)g_semUploadBin);
    CloseHandle((HANDLE)g_semResetDevice);
    CloseHandle((HANDLE)g_semGetRegValue);
	CloseHandle((HANDLE)g_semWriteMobileDeviceCode);
	CloseHandle((HANDLE)g_semGetDiskInfo);

    CloseHandle((HANDLE)g_EvtInit);
    CloseHandle((HANDLE)g_EvtAttachUSB);
    CloseHandle((HANDLE)g_EvtDetachUSB);
    CloseHandle((HANDLE)g_EvtStart);

    CloseHandle((HANDLE)g_EvtInitEnd);
    CloseHandle((HANDLE)g_EvtAttachUSBEnd);
    CloseHandle((HANDLE)g_EvtDetachUSBEnd);
    CloseHandle((HANDLE)g_EvtStartEnd);
    CloseHandle((HANDLE)g_EvtSetRamParamEnd);
    CloseHandle((HANDLE)g_EvtDownloadProducerEnd);
    CloseHandle((HANDLE)g_EvtSwitchUSBHighSpeedEnd);
    CloseHandle((HANDLE)g_EvtTestConnectionEnd);
    CloseHandle((HANDLE)g_EvtSetModeEnd);
    CloseHandle((HANDLE)g_EvtGetFlashIDEnd);
    CloseHandle((HANDLE)g_EvtSetNandParamEnd);
//    CloseHandle((HANDLE)g_EvtDetectNandParamEnd);
    CloseHandle((HANDLE)g_EvtInitSecAreaEnd);
    CloseHandle((HANDLE)g_EvtSetResvAreaSizeEnd);
    CloseHandle((HANDLE)g_EvtDownloadBinEnd);
    CloseHandle((HANDLE)g_EvtCreatePartitionEnd);
    CloseHandle((HANDLE)g_EvtFormatDriverEnd);
    CloseHandle((HANDLE)g_EvtMountDriverEnd);
    CloseHandle((HANDLE)g_EvtDownloadBootEnd);
    CloseHandle((HANDLE)g_EvtDownloadImgEnd);
    CloseHandle((HANDLE)g_EvtDownloadFileEnd);
    CloseHandle((HANDLE)g_EvtCloseEnd);
    CloseHandle((HANDLE)g_EvtSetGPIOEnd);
//    CloseHandle((HANDLE)g_EvtUploadFileEnd);
	CloseHandle((HANDLE)g_EvtUploadBinEnd);
    CloseHandle((HANDLE)g_EvtResetDeviceEnd);
    CloseHandle((HANDLE)g_EvtGetRegValueEnd);
    CloseHandle((HANDLE)g_EvtBurnProcessEnd);
	CloseHandle((HANDLE)g_EvtWriteMobileDeviceCodeEnd);
	CloseHandle((HANDLE)g_EvtGetDiskInfoEnd);

	for (int i=0;i<BURN_CMD_COUNT;i++)
	{
		 CloseHandle((HANDLE)g_EvtBurnCmd[i]);
	}

    return TestEngine(tTestMsg);
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_U32 TE_ResetSemEvt(T_VOID)
{
    ReleaseSemaphore(g_semInit, 1, 0);
    ReleaseSemaphore(g_semAttachUSB, 1, 0);
    ReleaseSemaphore(g_semDetachUSB, 1, 0);
    ReleaseSemaphore(g_semStart, 1, 0);
    ReleaseSemaphore(g_semSetRamParam, 1, 0);
    ReleaseSemaphore(g_semDownloadProducer, 1, 0);
    ReleaseSemaphore(g_semSwitchUSBHighSpeed, 1, 0);
    ReleaseSemaphore(g_semTestConnection, 1, 0);
    ReleaseSemaphore(g_semSetMode, 1, 0);
    ReleaseSemaphore(g_semGetFlashID, 1, 0);
    ReleaseSemaphore(g_semSetNandParam, 1, 0);
//    ReleaseSemaphore(g_semDetectNandParam, 1, 0);
    ReleaseSemaphore(g_semInitSecArea, 1, 0);
    ReleaseSemaphore(g_semSetResvAreaSize, 1, 0);
    ReleaseSemaphore(g_semDownloadBin, 1, 0);
    ReleaseSemaphore(g_semCreatePartition, 1, 0);
    ReleaseSemaphore(g_semFormatDriver, 1, 0);
    ReleaseSemaphore(g_semMountDriver, 1, 0);
    ReleaseSemaphore(g_semDownloadBoot, 1, 0);
    ReleaseSemaphore(g_semDownloadImg, 1, 0);
    ReleaseSemaphore(g_semDownloadFile, 1, 0);
    ReleaseSemaphore(g_semClose, 1, 0);
    ReleaseSemaphore(g_semSetGPIO, 1, 0);
//    ReleaseSemaphore(g_semUploadFile, 1, 0);
//    ReleaseSemaphore(g_semUploadBin, 1, 0);
    ReleaseSemaphore(g_semResetDevice, 1, 0);
    ReleaseSemaphore(g_semGetRegValue, 1, 0);

    ResetEvent(g_EvtInit);
    ResetEvent(g_EvtAttachUSB);
    ResetEvent(g_EvtDetachUSB);
    ResetEvent(g_EvtStart);
 //   ResetEvent(g_EvtSetRamParam);
 //   ResetEvent(g_EvtDownloadProducer);
//     ResetEvent(g_EvtSwitchUSBHighSpeed);
//     ResetEvent(g_EvtTestConnection);
//     ResetEvent(g_EvtSetMode);
//     ResetEvent(g_EvtGetFlashID);
//     ResetEvent(g_EvtSetNandParam);
// //    ResetEvent(g_EvtDetectNandParam);
//     ResetEvent(g_EvtInitSecArea);
//     ResetEvent(g_EvtSetResvAreaSize);
//     ResetEvent(g_EvtDownloadBin);
//     ResetEvent(g_EvtCreatePartition);
//     ResetEvent(g_EvtFormatDriver);
//     ResetEvent(g_EvtMountDriver);
//     ResetEvent(g_EvtDownloadBoot);
//     ResetEvent(g_EvtDownloadImg);
//     ResetEvent(g_EvtDownloadFile);
//     ResetEvent(g_EvtClose);
//     ResetEvent(g_EvtSetGPIO);
// //    ResetEvent(g_EvtUploadFile);
// //    ResetEvent(g_EvtUploadBin);
//     ResetEvent(g_EvtResetDevice);
//     ResetEvent(g_EvtGetRegValue);

    ResetEvent(g_EvtInitEnd);
    ResetEvent(g_EvtAttachUSBEnd);
    ResetEvent(g_EvtDetachUSBEnd);
    ResetEvent(g_EvtStartEnd);
    ResetEvent(g_EvtSetRamParamEnd);
    ResetEvent(g_EvtDownloadProducerEnd);
    ResetEvent(g_EvtSwitchUSBHighSpeedEnd);
    ResetEvent(g_EvtTestConnectionEnd);
    ResetEvent(g_EvtSetModeEnd);
    ResetEvent(g_EvtGetFlashIDEnd);
    ResetEvent(g_EvtSetNandParamEnd);
//    ResetEvent(g_EvtDetectNandParamEnd);
    ResetEvent(g_EvtInitSecAreaEnd);
    ResetEvent(g_EvtSetResvAreaSizeEnd);
    ResetEvent(g_EvtDownloadBinEnd);
    ResetEvent(g_EvtCreatePartitionEnd);
    ResetEvent(g_EvtFormatDriverEnd);
    ResetEvent(g_EvtMountDriverEnd);
    ResetEvent(g_EvtDownloadBootEnd);
    ResetEvent(g_EvtDownloadImgEnd);
    ResetEvent(g_EvtDownloadFileEnd);
    ResetEvent(g_EvtCloseEnd);
    ResetEvent(g_EvtSetGPIOEnd);
//    ResetEvent(g_EvtUploadFileEnd);
//    ResetEvent(g_EvtUploadBinEnd);
    ResetEvent(g_EvtResetDeviceEnd);
    ResetEvent(g_EvtGetRegValueEnd);
    ResetEvent(g_EvtBurnProcessEnd);
    return AK_TRUE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_U32 TE_Launch(T_TEST_MSG tTestMsg)
{
    return TestEngine(tTestMsg);
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_U32 TE_SetTestModuleName(T_pCSTR pstrModuleName)
{
    if ((T_pCSTR)AK_NULL == pstrModuleName)
    {
        return 0;
    }

    memset(pszModuleName, 0, MAX_PATH);
    strcpy(pszModuleName, pstrModuleName);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_U32 TE_SetLogFileName(T_pCSTR pstrLogFileName)
{
    if ((T_pCSTR)AK_NULL == pstrLogFileName)
    {
        return 0;
    }

    memset(pszLogFileName, 0, MAX_PATH);
    strcpy(pszLogFileName, pstrLogFileName);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_U32 TE_SetTestScriptName(T_pCSTR pstrScriptName)
{
    if ((T_pCSTR)AK_NULL == pstrScriptName)
    {
        return 0;
    }

    memset(pszScriptName, 0, MAX_PATH);
    strcpy(pszScriptName, pstrScriptName);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_U32 TE_SetReportFileName(T_pCSTR pstrReportFileName)
{
    if ((T_pCSTR)AK_NULL == pstrReportFileName)
    {
        return 0;
    }
	
    memset(pszReportFileName, 0, MAX_PATH);
    strcpy(pszReportFileName, pstrReportFileName);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_U32 TE_SetTestObjectVersion(T_pCSTR pstrTestObjectVersion)
{
    if ((T_pCSTR)AK_NULL == pstrTestObjectVersion)
    {
        return 0;
    }
	
    memset(pszTestObjectVersion, 0, MAX_PATH);
    strcpy(pszTestObjectVersion, pstrTestObjectVersion);
    return 1;
}


///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_U32 TE_SetTestType(T_pCSTR pstrTestType)
{
    if ((T_pCSTR)AK_NULL == pstrTestType)
    {
        return 0;
    }
	
    memset(pszTestType, 0, MAX_PATH);
    strcpy(pszTestType, pstrTestType);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_U32 TE_SetTester(T_pCSTR pstrTester)
{
    if ((T_pCSTR)AK_NULL == pstrTester)
    {
        return 0;
    }
	
    memset(pszTester, 0, MAX_PATH);
    strcpy(pszTester, pstrTester);
    return 1;
}


///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_U32 TE_StartCase(T_VOID)
{
	T_U16 pwsReportFileName[MAX_PATH] = {0};

	g_PerformanceTest = AK_FALSE;

	// Get begin time.
	GetSystemTime(&stBeginTime);
	// Time zone GMT+08:00
	if (stBeginTime.wHour + 8 >= 24)
	{
		stBeginTime.wHour = stBeginTime.wHour + 8 - 24;
	}
	else
	{
		stBeginTime.wHour = stBeginTime.wHour + 8;
	}
	
	memset(pwsReportFileName, 0, sizeof(T_U16) * MAX_PATH);
	
	MultiByteToWideChar(CP_ACP,
		NULL,
		pszReportFileName,
		strlen(pszReportFileName),
		pwsReportFileName,
		strlen(pszReportFileName));
	
	InitialRecXML(pwsReportFileName);
    return 1;
}


///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_U32 TE_EndCase(T_VOID)
{	
	T_U16 pwsModuleName[MAX_PATH] = {0};
	T_U16 pwsTestObjectVersion[MAX_PATH] = {0};
	T_U16 pwsTestType[MAX_PATH] = {0};
	T_U16 pwsTester[MAX_PATH] = {0};
	T_U16 pwsStartDate[MAX_PATH] = {0};
	T_U16 pwsEndDate[MAX_PATH] = {0};

	// Get end time.
	GetSystemTime(&stEndTime);
	// Time zone GMT+08:00
	if (stEndTime.wHour + 8 >= 24)
	{
		stEndTime.wHour = stEndTime.wHour + 8 - 24;
	}
	else
	{
		stEndTime.wHour = stEndTime.wHour + 8;
	}
	
	
	swprintf(pwsStartDate, _T("%d-%d-%d %d:%d:%d"), 
		stBeginTime.wYear, 
		stBeginTime.wMonth, 
		stBeginTime.wDay, 
		stBeginTime.wHour, 
		stBeginTime.wMinute, 
		stBeginTime.wSecond);		
	
	swprintf(pwsEndDate, _T("%d-%d-%d %d:%d:%d"), 
		stEndTime.wYear, 
		stEndTime.wMonth, 
		stEndTime.wDay, 
		stEndTime.wHour, 
		stEndTime.wMinute, 
		stEndTime.wSecond);		
	
	
	MultiByteToWideChar(CP_ACP,
		NULL,
		pszModuleName,
		strlen(pszModuleName),
		pwsModuleName,
		strlen(pszModuleName));
	
	MultiByteToWideChar(CP_ACP,
		NULL,
		pszTestObjectVersion,
		strlen(pszTestObjectVersion),
		pwsTestObjectVersion,
		strlen(pszTestObjectVersion));
	
	MultiByteToWideChar(CP_ACP,
		NULL,
		pszTestType,
		strlen(pszTestType),
		pwsTestType,
		strlen(pszTestType));
	
	MultiByteToWideChar(CP_ACP,
		NULL,
		pszTester,
		strlen(pszTester),
		pwsTester,
		strlen(pszTester));
	
	
	WriteTestInfo2XML(pwsModuleName, pwsTestObjectVersion, pwsTestType, 
		pwsTester, pwsStartDate, pwsEndDate);
	
	ReleaseRecXML();
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_U32 TestEngine(T_TEST_MSG tTestMsg)
{
    T_U32 ret = TM_SUCCESS;

    switch (tTestMsg.eMsg)
    {
        default:
            break;
        case TE_INIT:
            if (AK_NULL != s_pLua)
            {
                lua_close(s_pLua);
                s_pLua = (lua_State*)AK_NULL;
            }

            if (s_pLua == (lua_State*)AK_NULL)
            {
                s_pLua = lua_open();

                if (s_pLua == AK_NULL)
                {
                    ret = TM_BAD_MEMORY; // Not enough memory
                }
                else
                {
                    int error;
                    int d;

                    luaL_openlibs(s_pLua);

                    // register test functions
                    lua_pushcfunction(s_pLua, luaopen_burntool3libtest);
                    lua_pushstring(s_pLua, LUA_LOADBURNTOOLTEST);
                    lua_call(s_pLua, 1, 0);

                    lua_pushcfunction(s_pLua, luaopen_loglib);
                    lua_pushstring(s_pLua, LUA_LOGLIBNAME);
                    lua_call(s_pLua, 1, 0);

                    lua_pushcfunction(s_pLua, luaopen_testresultlib);
                    lua_pushstring(s_pLua, LUA_RESULTLIBNAME);
                    lua_call(s_pLua, 1, 0);

                    error = luaL_dofile(s_pLua, pszScriptName); 
                                        // 解释分析lua文件

                    if (error != 0)
                    // 
                    {
                        ret = TM_LOAD_SCRIPT_FAIL;
                        break;
                    }

                    // Setting log file
                    lua_getglobal(s_pLua, "SetLogFileName"); 
                                  // 取到一个全局标号SetTestCaseCount，取的同时会把SetTestCaseCount函数压栈	
                    lua_pushstring(s_pLua, pszLogFileName); 
                                   // 把第一个参数压入栈里				
                    error = lua_pcall(s_pLua, 1, 1, 0);

                    if (error != 0)
                    // 
                    {
                        ret = TM_SET_LOG_FILE_FAIL;
                        break;
                    }

                    d = (int)lua_tonumber(s_pLua,  - 1); 
                         // 函数执行完了，执行结果被压栈，所以取得最顶端的一个数就是结果值，-1就是指取栈顶的值
                    lua_pop(s_pLua, 1); // 把值从栈里清除，pop（弹出）一个值

                    d = (int)lua_tonumber(s_pLua,  - 1); 
                         // 函数执行完了，执行结果被压栈，所以取得最顶端的一个数就是结果值，-1就是指取栈顶的值
                    lua_pop(s_pLua, 1); // 把值从栈里清除，pop（弹出）一个值

                    // Initial test case table
                    lua_getglobal(s_pLua, "InitialTestCaseTable"); 
                                  // 取到一个全局标号SetTestCaseCount，取的同时会把SetTestCaseCount函数压栈	
                    error = lua_pcall(s_pLua, 0, 1, 0);

                    if (error != 0)
                    // 
                    {
                        ret = TM_INIT_TEST_CASE_TAB_FAIL;
                        break;
                    }

                    d = (int)lua_tonumber(s_pLua,  - 1); 
                         // 函数执行完了，执行结果被压栈，所以取得最顶端的一个数就是结果值，-1就是指取栈顶的值
                    lua_pop(s_pLua, 1); // 把值从栈里清除，pop（弹出）一个值
                    ret = TM_SUCCESS;
                }
            }
            else
            {
                ret = TM_UNKNOWN_FAIL; // lua state not cleared 
            }

            break;
        case TE_DEINIT:
            if (s_pLua != (lua_State*)AK_NULL)
            {
                lua_close(s_pLua);
            }
            else
            {
                ret = TM_BAD_INITIAL; // lua state invalid 
            }

            break;
        case TE_RUNNING_TEST:
            // Pass the massage to script function
            if (s_pLua != (lua_State*)AK_NULL)
            {
                int error;

                lua_getglobal(s_pLua, "TestCoOrdinator"); 
                              // 取到一个全局标号TestCoOrdinator，取的同时会把TestCoOrdinator函数压栈	
                lua_pushnumber(s_pLua, tTestMsg.eMsg); // 把第一个参数压入栈里	
                lua_pushnumber(s_pLua, tTestMsg.eStartID + 1); 
                               // 第二个参数压栈	加一是因为脚本中的函数表元素是从1开始计算的，为了适应脚本而作的转换
                lua_pushnumber(s_pLua, tTestMsg.eEndID + 1); 
                               // 第三个参数压栈	加一是因为脚本中的函数表元素是从1开始计算的，为了适应脚本而作的转换
                lua_pushnumber(s_pLua, tTestMsg.ulRepeatTime); 
                               // 第四个参数压栈	

                error = lua_pcall(s_pLua, 4, 1, 0);

                if (error != 0)
                // TestCoOrdinator
                {
                    ret = TM_LAUNCH_TEST_FAIL;
                    SetEvent(g_EvtBurnProcessEnd);
                    break;
                }

                int d = (int)lua_tointeger(s_pLua,  - 1); 
                         // 函数执行完了，执行结果被压栈，所以取得最顶端的一个数就是结果值，-1就是指取栈顶的值
                lua_pop(s_pLua, 1); // 把值从栈里清除，pop（弹出）一个值			
            }
            else
            {
                ret = TM_BAD_INITIAL; // lua state invalid 
            }
            break;
    }

    return ret;
}
