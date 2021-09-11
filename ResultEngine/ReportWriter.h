#ifndef _RESULT_HANDLING_H_
#define _RESULT_HANDLING_H_

#ifdef __cplusplus
extern "C"{
#endif

#include "StdAfx.h"
#include "anyka_types.h"
#include "ResultEngine.h"

// Strings of InitialRecXML and ReleaseRecXML
#define LOG_SUMMARY_HEAD_LABEL			"<LOGSUMMARY>"
#define LOG_SUMMARY_END_LABEL			"</LOGSUMMARY>\n"
// Strings of WriteTestInfo2XML
#define TEST_INFO_HEAD_LABEL			"<TESTINFO>"
#define TEST_INFO_END_LABEL				"</TESTINFO>\n"
#define TEST_MODULE_HEAD_LABEL			"<Module>"
#define TEST_MODULE_END_LABEL			"</Module>\n"
#define TEST_VER_HEAD_LABEL				"<Version>"
#define TEST_VER_END_LABEL				"</Version>\n"
#define TEST_TYPE_HEAD_LABEL			"<TestType>"
#define TEST_TYPE_END_LABEL				"</TestType>\n"
#define TESTER_HEAD_LABEL				"<Tester>"
#define TESTER_END_LABEL				"</Tester>\n"
#define TEST_DATE_HEAD_LABEL			"<TestDate>"
#define TEST_DATE_END_LABEL				"</TestDate>\n"
#define TEST_DATE_LINK_WORD				" to "
// Strings of WriteALogResultBlock
#define TEST_DATA_HEAD_LABEL_FRONT		"<TestData"
#define TEST_DATA_TOTAL_COUNT			" Total=\""
#define TEST_DATA_PASS_COUNT			"\" Pass=\""	
#define TEST_DATA_HEAD_LABEL_END		"\">"
#define TEST_DATA_END_LABEL				"</TestData>\n"
#define TEST_TITLE_HEAD_LABEL			"<Title>"
#define TEST_TITLE_END_LABEL			"</Title>\n"
#define LOG_RESULT_HEAD_LABEL_FRONT		"<LOGRESULTS CaseID=\""
#define LOG_RESULT_HEAD_LABEL_LINK_WORD	"\" "
#define LOG_RESULT_HEAD_LABEL_RESULT	"Result=\""
#define LOG_RESULT_PASS					"Pass"
#define LOG_RESULT_FAIL					"Fail"
#define LOG_RESULT_NOT_AVAILABLE		"N/A"
#define LOG_RESULT_HEAD_LABEL_END		"\">\n"
#define LOG_RESULT_END_LABEL			"</LOGRESULTS>\n"

#define T_U32_MAX_STR_LEN				10

typedef enum TESTMODE
{
	TEST_MODE_VERI = 1,
	TEST_MODE_FUNC,
	TEST_MODE_PERF,
	TEST_MODE_FULL	
}E_TESTMODE;

typedef struct TESTINFO
{
	T_pSTR pszModule; 								
	T_pSTR pszVersion;
	T_pSTR pszTestType;
	T_pSTR pszTester;
	T_pSTR pszStartDate;
	T_pSTR pszEndDate;
}T_TESTINFO;

#ifdef _UNICODE
extern T_BOOL InitialRecXML(T_pCWSTR XMLFileName);
#else
extern T_BOOL InitialRecXML(T_pCSTR XMLFileName);
#endif

extern T_BOOL ReleaseRecXML(T_VOID);

#ifdef _UNICODE
extern T_BOOL WriteALogResultBlock(T_pCWSTR pszCaseID, 
								   TE_GENERAL_TEST_RESULT eCaseResult,
								   T_pCWSTR pszTitle,
								   T_pCWSTR pszTestData,
								   T_U32 ulDataFileCount,
								   T_U32 ulDataPassCount);

extern T_BOOL WriteTestInfo2XML(T_pCWSTR pszModule, 
								T_pCWSTR pszVersion,
								T_pCWSTR pszTestType,
								T_pCWSTR pszTester,
								T_pCWSTR pszStartDate,
								T_pCWSTR pszEndDate);

extern T_BOOL ConvResult2Unc(T_pWSTR *pwsTestDataBlock, 
							 T_pWSTR *pwsTestCaseID, 
							 T_pWSTR *pwsTestCaseDes,
							 T_pCSTR pszTestDataBlock,
							 T_pCSTR pszTestCaseID, 
							 T_pCSTR pszTestCaseDes);

#else
extern T_BOOL WriteALogResultBlock(T_pCSTR pszCaseID, 
								   TE_GENERAL_TEST_RESULT eCaseResult,
								   T_pCSTR pszTitle,
								   T_pCSTR pszTestData,
								   T_U32 ulDataFileCount,
								   T_U32 ulDataPassCount);

extern T_BOOL WriteTestInfo2XML(T_pCSTR pszModule, 
								T_pCSTR pszVersion,
								T_pCSTR pszTestType,
								T_pCSTR pszTester,
								T_pCSTR pszStartDate,
								T_pCSTR pszEndDate);

#endif // #ifdef _UNICODE

#ifdef __cplusplus
};
#endif

#endif

