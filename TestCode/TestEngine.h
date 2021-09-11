//
//
//
//
//

#ifndef _TEST_MAIN_H_
    #define _TEST_MAIN_H_


    #ifdef __cplusplus
extern "C"
{
    #endif 

    #include "anyka_types.h"
    #include "ResultEngine.h"

    #define LUA_LOADBURNTOOLTEST	"burntool3lib"

    #define TEST_CASE_ID_LEN			20

	enum TM_RET
    {
        TM_SUCCESS = 1,  // success
        TM_BAD_MEMORY,  // memory error
        TM_UNKNOWN_FAIL,  // unknown failed
        TM_BAD_PARA,  // parameter error
        TM_LOAD_SCRIPT_FAIL,  // script error
        TM_SET_TEST_CASE_CNT_FAIL,  // setting test case count error
        TM_INIT_TEST_CASE_TAB_FAIL,  // initial test case table error
        TM_BAD_INITIAL,  // handle did not initialized
        TM_LAUNCH_TEST_FAIL,  // launch test error
        TM_SET_LOG_FILE_FAIL,  // set log file error
    };

    enum TE_TEST_MSG
    {
        TE_INIT,  // Initial test engine
        TE_DEINIT,  // Deinitial test engine
        TE_RUNNING_TEST,  // Run test case 
    };

    typedef struct t_TestCaseList
    {
        T_U32 eID;
        T_CHR pszID[TEST_CASE_ID_LEN];
        T_U32 ulCaseStep;
    } T_TEST_CASE_LIST;

    typedef struct t_TestMsg
    {
        TE_TEST_MSG eMsg; // Test massage
        T_U32 eStartID; // Start test case ID
        T_U32 eEndID; // End test case ID
        T_U32 ulRepeatTime; // Repeat times
    } T_TEST_MSG;

    typedef T_BOOL(*ReportCurCaseID)(T_U32 eCaseID, T_U32 ulStepCnt);

    typedef T_BOOL(*ReportCaseResult)(T_U32 eCaseID,
                   TE_GENERAL_TEST_RESULT eResult);

    typedef T_BOOL(*ReportTestStepData)(T_U32 ulStepCnt);

    typedef T_BOOL(*ReportTestStepResult)(TE_GENERAL_TEST_RESULT eStepResult);

    struct t_TestProgressCBFuncs
    {		
        ReportCurCaseID pfnReportCurCaseID;
        ReportCaseResult pfnReportCaseResult;
        ReportTestStepData pfnReportTestStepData;
        ReportTestStepResult pfnReportTestStepResult;
    };

    extern T_U32 TE_Launch(T_TEST_MSG tTestMsg);

    extern T_U32 TE_InitEnvironment(T_TEST_MSG tTestMsg, t_TestProgressCBFuncs
                                   tCBfuncs);

    extern T_U32 TE_DeInit(T_TEST_MSG tTestMsg);

    extern T_U32 TE_SetLogFileName(T_pCSTR pstrLogFileName);

    extern T_U32 TE_SetTestModuleName(T_pCSTR pstrModuleName);

    extern T_U32 TE_SetTestScriptName(T_pCSTR pstrScriptName);

	extern T_U32 TE_SetReportFileName(T_pCSTR pstrReportFileName);

	extern T_U32 TE_SetTestObjectVersion(T_pCSTR pstrTestObjectVersion);

	extern T_U32 TE_SetTestType(T_pCSTR pstrTestType);

	extern T_U32 TE_SetTester(T_pCSTR pstrTester);

    extern T_U32 TE_ResetSemEvt(T_VOID);

	extern T_U32 TE_StartCase(T_VOID);

	extern T_U32 TE_EndCase(T_VOID);

    #ifdef __cplusplus
};
    #endif 

#endif
