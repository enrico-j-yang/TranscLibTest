#include "StdAfx.h"
#include "ReportWriter.h"

T_BOOL ConvertASCII2Unicode(T_VOID);
T_BOOL ReleaseUncode(T_VOID);

FILE *g_fpXML;
#ifdef _UNICODE
T_pWSTR LogSummaryHeadLabel = (T_pWSTR)AK_NULL;			
T_pWSTR LogSummaryEndLabel = (T_pWSTR)AK_NULL;
// Strings of WriteTestInfo2XML
T_pWSTR TestInfoHeadLabel = (T_pWSTR)AK_NULL;
T_pWSTR TestInfoEndLabel = (T_pWSTR)AK_NULL;
T_pWSTR TestModuleHeadLabel = (T_pWSTR)AK_NULL;
T_pWSTR TestModuleEndLabel = (T_pWSTR)AK_NULL;
T_pWSTR TestVerHeadLabel = (T_pWSTR)AK_NULL;		
T_pWSTR TestVerEndLabel = (T_pWSTR)AK_NULL;
T_pWSTR TestTypeHeadLabel = (T_pWSTR)AK_NULL;	
T_pWSTR TestTypeEndLabel = (T_pWSTR)AK_NULL;		
T_pWSTR TesterHeadLabel = (T_pWSTR)AK_NULL;
T_pWSTR TesterEndLabel = (T_pWSTR)AK_NULL;
T_pWSTR TestDateHeadLabel = (T_pWSTR)AK_NULL;
T_pWSTR TestDateEndLabel = (T_pWSTR)AK_NULL;
T_pWSTR TestDateLinkWord = (T_pWSTR)AK_NULL;
// Strings of WriteALogResultBlock
T_pWSTR TestDataHeadLabelFront = (T_pWSTR)AK_NULL;
T_pWSTR TestDataTotalCount = (T_pWSTR)AK_NULL;
T_pWSTR TestDataPassCount = (T_pWSTR)AK_NULL;
T_pWSTR TestDataHeadLabelEnd = (T_pWSTR)AK_NULL;
T_pWSTR TestDataEndLabel = (T_pWSTR)AK_NULL;
T_pWSTR TestTitleHeadLabel = (T_pWSTR)AK_NULL;
T_pWSTR TestTitleEndLabel = (T_pWSTR)AK_NULL;
T_pWSTR LogResultHeadLabelFront = (T_pWSTR)AK_NULL;
T_pWSTR LogResultHeadLabelLinkWord = (T_pWSTR)AK_NULL;
T_pWSTR LogResultHeadLabelResult = (T_pWSTR)AK_NULL;
T_pWSTR LogResultPass = (T_pWSTR)AK_NULL;
T_pWSTR LogResultFail = (T_pWSTR)AK_NULL;
T_pWSTR LogResultNotAvail = (T_pWSTR)AK_NULL;
T_pWSTR LogResultHeadLabelEnd = (T_pWSTR)AK_NULL;
T_pWSTR LogResultEndLabel = (T_pWSTR)AK_NULL;
const T_U16 uStartCode = 0xfeff;

#endif // #ifdef _UNICODE

T_BOOL ReleaseRecXML(T_VOID)
{	
	if ((FILE *)AK_NULL == g_fpXML)
	{
		return AK_FALSE;
	}

#ifdef _UNICODE

	fputws(LogSummaryEndLabel, g_fpXML);
	ReleaseUncode();
#else
	fputs(LOG_SUMMARY_END_LABEL, g_fpXML);
#endif

	fclose(g_fpXML);
	g_fpXML = (FILE *)AK_NULL;

	return AK_TRUE;
}


#ifdef _UNICODE
T_BOOL InitialRecXML(T_pCWSTR XMLFileName)
{
	if ((T_pCWSTR)AK_NULL == XMLFileName)
	{
		return AK_FALSE;
	}
	
	if ((FILE *)AK_NULL != g_fpXML)
	{
		return AK_FALSE;
	}
	
	g_fpXML = (FILE *)AK_NULL;
	
	g_fpXML = _wfopen(XMLFileName, _T("wb+"));
	
	if ((FILE *)AK_NULL == g_fpXML)
	{
		return AK_FALSE;
	}
	
	fwrite(&uStartCode, 2, 1, g_fpXML);
	fclose(g_fpXML);
	
	g_fpXML = _wfopen(XMLFileName, _T("ab"));
	
	if ((FILE *)AK_NULL == g_fpXML)
	{
		return AK_FALSE;
	}
	
	ConvertASCII2Unicode();
	fputws(LogSummaryHeadLabel, g_fpXML);		
	
	return AK_TRUE;
}

T_BOOL WriteALogResultBlock(T_pCWSTR pszCaseID, 
							TE_GENERAL_TEST_RESULT eCaseResult,
							T_pCWSTR pszTitle,
							T_pCWSTR pszTestData,
							T_U32 ulDataFileCount,
							T_U32 ulDataPassCount)
{
	T_pWSTR pszStrBuf = (T_pWSTR)AK_NULL;
	T_U32 ulMaxStrLen = 0;
	T_pWSTR pszDataFileCount = (T_pWSTR)AK_NULL;
	T_pWSTR pszDataPassCount = (T_pWSTR)AK_NULL;

	if ((FILE *)AK_NULL == g_fpXML)
	{
		return AK_FALSE;
	}

	if ((T_pCWSTR)AK_NULL == pszCaseID)
	{
		return AK_FALSE;
	}

	if ((T_pCWSTR)AK_NULL == pszTitle)
	{
		return AK_FALSE;
	}

	if ((T_pCWSTR)AK_NULL == pszTestData)
	{
		return AK_FALSE;
	}

	ulMaxStrLen = wcslen(TestDataHeadLabelFront)
				+ wcslen(TestDataHeadLabelEnd)
				+ wcslen(TestDataTotalCount)
				+ T_U32_MAX_STR_LEN
				+ wcslen(TestDataPassCount)
				+ T_U32_MAX_STR_LEN
				+ wcslen(TestDataHeadLabelEnd)
				+ wcslen(TestDataEndLabel) 
				+ wcslen(pszTestData);

	if (ulMaxStrLen < wcslen(TestTitleHeadLabel) 
					+ wcslen(TestTitleEndLabel)
					+ wcslen(pszTitle))
	{
		ulMaxStrLen = wcslen(TestTitleHeadLabel) 
					+ wcslen(TestTitleEndLabel)
					+ wcslen(pszTitle);
	}
	
	if (ulMaxStrLen < wcslen(LogResultHeadLabelFront)
					+ wcslen(pszCaseID)
					+ wcslen(LogResultHeadLabelLinkWord)
					+ wcslen(LogResultHeadLabelResult)
					+ wcslen(LogResultPass)
					+ wcslen(LogResultHeadLabelEnd))
	{
		ulMaxStrLen = wcslen(LogResultHeadLabelFront)
					+ wcslen(pszCaseID)
					+ wcslen(LogResultHeadLabelLinkWord)
					+ wcslen(LogResultHeadLabelResult)
					+ wcslen(LogResultPass)
					+ wcslen(LogResultHeadLabelEnd);
	}

	pszStrBuf = (T_pWSTR)malloc(ulMaxStrLen * 2 + 2);
	
	if (AK_NULL == pszStrBuf)
	{
		return AK_FALSE;
	}

	pszDataFileCount = (T_pWSTR)malloc(T_U32_MAX_STR_LEN);
	
	if (AK_NULL == pszDataFileCount)
	{
		free(pszStrBuf);
		return AK_FALSE;
	}

	pszDataPassCount = (T_pWSTR)malloc(T_U32_MAX_STR_LEN);
	
	if (AK_NULL == pszDataPassCount)
	{
		free(pszDataFileCount);
		free(pszStrBuf);
		return AK_FALSE;
	}

	memset(pszStrBuf, 0, ulMaxStrLen * 2 + 2);
	memset(pszDataFileCount, 0, T_U32_MAX_STR_LEN);
	memset(pszDataPassCount, 0, T_U32_MAX_STR_LEN);

	memset(pszStrBuf, 0, ulMaxStrLen * 2 + 2);
	wcscpy(pszStrBuf, LogResultHeadLabelFront);
	wcscat(pszStrBuf, pszCaseID);
	wcscat(pszStrBuf, LogResultHeadLabelLinkWord);
	wcscat(pszStrBuf, LogResultHeadLabelResult);

	switch(eCaseResult)
	{
	case TGR_PASS:
		wcscat(pszStrBuf, LogResultPass);
		break;
	case TGR_FAIL:
		wcscat(pszStrBuf, LogResultFail);
		break;
	case TGR_NA:
	default:
 		wcscat(pszStrBuf, LogResultNotAvail);
		break;
	}

	wcscat(pszStrBuf, LogResultHeadLabelEnd);
	fputws(pszStrBuf, g_fpXML);

	if(wcslen(pszTitle) != 0)
	{
		memset(pszStrBuf, 0, ulMaxStrLen * 2 + 2);
		wcscat(pszStrBuf, TestTitleHeadLabel);
		wcscat(pszStrBuf, pszTitle);
		wcscat(pszStrBuf, TestTitleEndLabel);
		fputws(pszStrBuf, g_fpXML);
	}

	if (ulDataFileCount != 0)
	{
		memset(pszStrBuf, 0, ulMaxStrLen * 2 + 2);
		wcscat(pszStrBuf, TestDataHeadLabelFront);
		wcscat(pszStrBuf, TestDataTotalCount);
		_itow(ulDataFileCount, pszDataFileCount, 10);
		wcscat(pszStrBuf, pszDataFileCount);
		wcscat(pszStrBuf, TestDataPassCount);
		_itow(ulDataPassCount, pszDataPassCount, 10);
		wcscat(pszStrBuf, pszDataPassCount);
		wcscat(pszStrBuf, TestDataHeadLabelEnd);	
		wcscat(pszStrBuf, pszTestData);
		wcscat(pszStrBuf, TestDataEndLabel);
	//	fputws(pszStrBuf, g_fpXML);
		fwrite(pszStrBuf, wcslen(pszStrBuf) * 2, 1, g_fpXML);
	}

	memset(pszStrBuf, 0, ulMaxStrLen * 2 + 2);
	swprintf(pszStrBuf, LogResultEndLabel);
	fputws(pszStrBuf, g_fpXML);

	free(pszDataFileCount);
	pszDataFileCount = (T_pWSTR)AK_NULL;
	free(pszDataPassCount);
	pszDataPassCount = (T_pWSTR)AK_NULL;
	free(pszStrBuf);
	pszStrBuf = (T_pWSTR)AK_NULL;

	return AK_TRUE;
}


#else

T_BOOL InitialRecXML(T_pCSTR XMLFileName)
{
	if ((T_pCSTR)AK_NULL == XMLFileName)
	{
		return AK_FALSE;
	}
	
	if ((FILE *)AK_NULL != g_fpXML)
	{
		return AK_FALSE;
	}
	
	g_fpXML = (FILE *)AK_NULL;
	
	g_fpXML = fopen(XMLFileName, "ab");
	
	if ((FILE *)AK_NULL == g_fpXML)
	{
		return AK_FALSE;
	}

	fputs(LOG_SUMMARY_HEAD_LABEL, g_fpXML);
	
	return AK_TRUE;
}


T_BOOL WriteALogResultBlock(T_pCSTR pszCaseID, 
							TE_GENERAL_TEST_RESULT eCaseResult,
							T_pCSTR pszTitle,
							T_pCSTR pszTestData,
							T_U32 ulDataFileCount,
							T_U32 ulDataPassCount)
{
	T_pSTR pszStrBuf = (T_pSTR)AK_NULL;
	T_U32 ulMaxStrLen = 0;
	T_pSTR pszDataFileCount = (T_pSTR)AK_NULL;
	T_pSTR pszDataPassCount = (T_pSTR)AK_NULL;

	if ((FILE *)AK_NULL == g_fpXML)
	{
		return AK_FALSE;
	}

	if ((T_pCSTR)AK_NULL == pszCaseID)
	{
		return AK_FALSE;
	}

	if ((T_pCSTR)AK_NULL == pszTitle)
	{
		return AK_FALSE;
	}

	if ((T_pCSTR)AK_NULL == pszTestData)
	{
		return AK_FALSE;
	}

	ulMaxStrLen = strlen(TEST_DATA_HEAD_LABEL_FRONT) 
				+ strlen(TEST_DATA_TOTAL_COUNT)
				+ T_U32_MAX_STR_LEN
				+ strlen(TEST_DATA_PASS_COUNT)
				+ T_U32_MAX_STR_LEN
				+ strlen(TEST_DATA_HEAD_LABEL_END)
				+ strlen(TEST_DATA_END_LABEL) 
				+ strlen(pszTestData);

	if (ulMaxStrLen < strlen(TEST_TITLE_HEAD_LABEL) 
					+ strlen(TEST_TITLE_END_LABEL)
					+ strlen(pszTitle))
	{
		ulMaxStrLen = strlen(TEST_TITLE_HEAD_LABEL) 
					+ strlen(TEST_TITLE_END_LABEL)
					+ strlen(pszTitle);
	}
	
	if (ulMaxStrLen < strlen(LOG_RESULT_HEAD_LABEL_FRONT)
					+ strlen(pszCaseID)
					+ strlen(LOG_RESULT_HEAD_LABEL_LINK_WORD)
					+ strlen(LOG_RESULT_HEAD_LABEL_RESULT)
					+ strlen(LOG_RESULT_PASS)
					+ strlen(LOG_RESULT_HEAD_LABEL_END))
	{
		ulMaxStrLen = strlen(LOG_RESULT_HEAD_LABEL_FRONT)
					+ strlen(pszCaseID)
					+ strlen(LOG_RESULT_HEAD_LABEL_LINK_WORD)
					+ strlen(LOG_RESULT_HEAD_LABEL_RESULT)
					+ strlen(LOG_RESULT_PASS)
					+ strlen(LOG_RESULT_HEAD_LABEL_END);
	}

	pszStrBuf = (T_pSTR)malloc(ulMaxStrLen + 1);
	
	if (AK_NULL == pszStrBuf)
	{
		return AK_FALSE;
	}

	pszDataFileCount = (T_pSTR)malloc(T_U32_MAX_STR_LEN);
	
	if (AK_NULL == pszDataFileCount)
	{
		return AK_FALSE;
	}

	pszDataPassCount = (T_pSTR)malloc(T_U32_MAX_STR_LEN);
	
	if (AK_NULL == pszDataPassCount)
	{
		return AK_FALSE;
	}

	memset(pszStrBuf, 0, ulMaxStrLen + 1);
	memset(pszDataFileCount, 0, T_U32_MAX_STR_LEN);
	memset(pszDataPassCount, 0, T_U32_MAX_STR_LEN);

	memset(pszStrBuf, 0, ulMaxStrLen + 1);
	strcpy(pszStrBuf, LOG_RESULT_HEAD_LABEL_FRONT);
	strcat(pszStrBuf, pszCaseID);
	strcat(pszStrBuf, LOG_RESULT_HEAD_LABEL_LINK_WORD);
	strcat(pszStrBuf, LOG_RESULT_HEAD_LABEL_RESULT);

	switch(eCaseResult)
	{
	case TGR_PASS:
		strcat(pszStrBuf, LOG_RESULT_PASS);
		break;
	case TGR_FAIL:
		strcat(pszStrBuf, LOG_RESULT_FAIL);
		break;
	case TGR_NA:
	default:
		strcat(pszStrBuf, LOG_RESULT_NOT_AVAILABLE);
		break;
	}

	strcat(pszStrBuf, LOG_RESULT_HEAD_LABEL_END);
	fputs(pszStrBuf, g_fpXML);

	if(wcslen(pszTitle) != 0)
	{
		memset(pszStrBuf, 0, ulMaxStrLen + 1);
		strcat(pszStrBuf, TEST_TITLE_HEAD_LABEL);
		strcat(pszStrBuf, pszTitle);
		strcat(pszStrBuf, TEST_TITLE_END_LABEL);
		fputs(pszStrBuf, g_fpXML);
	}

	if (ulDataFileCount != 0)
	{
		memset(pszStrBuf, 0, ulMaxStrLen + 1);
		strcat(pszStrBuf, TEST_DATA_HEAD_LABEL_FRONT);
		strcat(pszStrBuf, TEST_DATA_TOTAL_COUNT);
		itoa(ulDataFileCount, pszDataFileCount, 10);
		strcat(pszStrBuf, pszDataFileCount);
		strcat(pszStrBuf, TEST_DATA_PASS_COUNT);
		itoa(ulDataPassCount, pszDataPassCount, 10);
		strcat(pszStrBuf, pszDataPassCount);
		strcat(pszStrBuf, TEST_DATA_HEAD_LABEL_END);	
		strcat(pszStrBuf, pszTestData);
		strcat(pszStrBuf, TEST_DATA_END_LABEL);
		fputs(pszStrBuf, g_fpXML);
	}

	memset(pszStrBuf, 0, ulMaxStrLen + 1);
	sprintf(pszStrBuf, LOG_RESULT_END_LABEL);
	fputs(pszStrBuf, g_fpXML);
	
	free(pszDataFileCount);
	pszDataFileCount = (T_pSTR)AK_NULL;
	free(pszDataPassCount);
	pszDataPassCount = (T_pSTR)AK_NULL;
	free(pszStrBuf);
	pszStrBuf = (T_pSTR)AK_NULL;

	return AK_TRUE;
}
#endif

#ifdef _UNICODE
T_BOOL WriteTestInfo2XML(T_pCWSTR pszModule, 
						T_pCWSTR pszVersion,
						T_pCWSTR pszTestType,
						T_pCWSTR pszTester,
						T_pCWSTR pszStartDate,
						T_pCWSTR pszEndDate)
{
	T_pWSTR pszStrBuf = (T_pWSTR)AK_NULL;
	T_U32 ulMaxStrLen = 0;
	
	if ((FILE *)AK_NULL == g_fpXML)
	{
		return AK_FALSE;
	}
	
	if ((T_pCWSTR)AK_NULL == pszModule)
	{
		return AK_FALSE;
	}

	if ((T_pCWSTR)AK_NULL == pszVersion)
	{
		return AK_FALSE;
	}

	if ((T_pCWSTR)AK_NULL == pszTestType)
	{
		return AK_FALSE;
	}

	if ((T_pCWSTR)AK_NULL == pszTester)
	{
		return AK_FALSE;
	}

	if ((T_pCWSTR)AK_NULL == pszStartDate)
	{
		return AK_FALSE;
	}

	if ((T_pCWSTR)AK_NULL == pszEndDate)
	{
		return AK_FALSE;
	}
	// Initialize ulMaxStrLen to test module total string length.
	// Pick out the maximum string length.
	ulMaxStrLen = wcslen(TestModuleHeadLabel)
				+ wcslen(pszModule) 
				+ wcslen(TestModuleEndLabel);

	if (ulMaxStrLen < (wcslen(TestVerHeadLabel)
					   + wcslen(pszVersion) 
					   + wcslen(TestVerEndLabel)))
	{
		ulMaxStrLen = (wcslen(TestVerHeadLabel)
					   + wcslen(pszVersion) 
					   + wcslen(TestVerEndLabel));
	}

	if (ulMaxStrLen < (wcslen(TestTypeHeadLabel)
					   + wcslen(pszTestType) 
					   + wcslen(TestTypeEndLabel)))
	{
		ulMaxStrLen = (wcslen(TestTypeHeadLabel)
					   + wcslen(pszTestType) 
					   + wcslen(TestTypeEndLabel));
	}

	if (ulMaxStrLen < (wcslen(TesterHeadLabel)
					   + wcslen(pszTester) 
					   + wcslen(TesterEndLabel)))
	{
		ulMaxStrLen = (wcslen(TesterHeadLabel)
					   + wcslen(pszTester) 
					   + wcslen(TesterEndLabel));
	}

	if (ulMaxStrLen < (wcslen(TestDateHeadLabel)
					   + wcslen(pszStartDate) 
					   + wcslen(TestDateLinkWord)
					   + wcslen(pszEndDate)
					   + wcslen(TestDateEndLabel)))
	{
		ulMaxStrLen = (wcslen(TestDateHeadLabel)
					   + wcslen(pszStartDate) 
					   + wcslen(TestDateLinkWord)
					   + wcslen(pszEndDate)
					   + wcslen(TestDateEndLabel));
	}
	// End of ulMaxStrLen picking out.

	pszStrBuf = (T_pWSTR)malloc(ulMaxStrLen * 2 + 2);// ulMaxStrLen + 1 to prevent boundary leak.

	if (AK_NULL == pszStrBuf)
	{
		return AK_FALSE;
	}

	// Write to file string by string.
	fputws(TestInfoHeadLabel, g_fpXML);
	
	memset(pszStrBuf, 0, ulMaxStrLen * 2 + 2);
	wcscpy(pszStrBuf, TestModuleHeadLabel);
	wcscat(pszStrBuf, pszModule);
	wcscat(pszStrBuf, TestModuleEndLabel);
	fputws(pszStrBuf, g_fpXML);
	
	memset(pszStrBuf, 0, ulMaxStrLen * 2 + 2);
	wcscpy(pszStrBuf, TestVerHeadLabel);
	wcscat(pszStrBuf, pszVersion);
	wcscat(pszStrBuf, TestVerEndLabel);
	fputws(pszStrBuf, g_fpXML);
	
	memset(pszStrBuf, 0, ulMaxStrLen * 2 + 2);
	wcscpy(pszStrBuf, TestTypeHeadLabel);
	wcscat(pszStrBuf, pszTestType);
	wcscat(pszStrBuf, TestTypeEndLabel);
	fputws(pszStrBuf, g_fpXML);
	
	memset(pszStrBuf, 0, ulMaxStrLen * 2 + 2);
	wcscpy(pszStrBuf, TesterHeadLabel);
	wcscat(pszStrBuf, pszTester);
	wcscat(pszStrBuf, TesterEndLabel);
	fputws(pszStrBuf, g_fpXML);
	
	memset(pszStrBuf, 0, ulMaxStrLen * 2 + 2);
	wcscpy(pszStrBuf, TestDateHeadLabel);
	wcscat(pszStrBuf, pszStartDate);
	wcscat(pszStrBuf, TestDateLinkWord);
	wcscat(pszStrBuf, pszEndDate);
	wcscat(pszStrBuf, TestDateEndLabel);
	fputws(pszStrBuf, g_fpXML);

	memset(pszStrBuf, 0, ulMaxStrLen * 2 + 2);
	fputws(TestInfoEndLabel, g_fpXML);
	// End of writing.

	free(pszStrBuf);
	pszStrBuf = (T_pWSTR)AK_NULL;

	return AK_TRUE;
}

#else

T_BOOL WriteTestInfo2XML(T_pCSTR pszModule, 
						T_pCSTR pszVersion,
						T_pCSTR pszTestType,
						T_pCSTR pszTester,
						T_pCSTR pszStartDate,
						T_pCSTR pszEndDate)
{
	T_pSTR pszStrBuf = (T_pSTR)AK_NULL;
	T_U32 ulMaxStrLen = 0;
	
	if ((FILE *)AK_NULL == g_fpXML)
	{
		return AK_FALSE;
	}
	
	if ((T_pCSTR)AK_NULL == pszModule)
	{
		return AK_FALSE;
	}

	if ((T_pCSTR)AK_NULL == pszVersion)
	{
		return AK_FALSE;
	}

	if ((T_pCSTR)AK_NULL == pszTestType)
	{
		return AK_FALSE;
	}

	if ((T_pCSTR)AK_NULL == pszTester)
	{
		return AK_FALSE;
	}

	if ((T_pCSTR)AK_NULL == pszStartDate)
	{
		return AK_FALSE;
	}

	if ((T_pCSTR)AK_NULL == pszEndDate)
	{
		return AK_FALSE;
	}
	// Initialize ulMaxStrLen to test module total string length.
	// Pick out the maximum string length.
	ulMaxStrLen = strlen(TEST_MODULE_HEAD_LABEL)
				+ strlen(pszModule) 
				+ strlen(TEST_MODULE_END_LABEL);

	if (ulMaxStrLen < (strlen(TEST_VER_HEAD_LABEL)
					   + strlen(pszVersion) 
					   + strlen(TEST_VER_END_LABEL)))
	{
		ulMaxStrLen = (strlen(TEST_VER_HEAD_LABEL)
					   + strlen(pszVersion) 
					   + strlen(TEST_VER_END_LABEL));
	}

	if (ulMaxStrLen < (strlen(TEST_TYPE_HEAD_LABEL)
					   + strlen(pszTestType) 
					   + strlen(TEST_TYPE_END_LABEL)))
	{
		ulMaxStrLen = (strlen(TEST_TYPE_HEAD_LABEL)
					   + strlen(pszTestType) 
					   + strlen(TEST_TYPE_END_LABEL));
	}

	if (ulMaxStrLen < (strlen(TESTER_HEAD_LABEL)
					   + strlen(pszTester) 
					   + strlen(TESTER_END_LABEL)))
	{
		ulMaxStrLen = (strlen(TESTER_HEAD_LABEL)
					   + strlen(pszTester) 
					   + strlen(TESTER_END_LABEL));
	}

	if (ulMaxStrLen < (strlen(TEST_DATE_HEAD_LABEL)
					   + strlen(pszStartDate) 
					   + strlen(TEST_DATE_LINK_WORD)
					   + strlen(pszEndDate)
					   + strlen(TEST_DATE_END_LABEL)))
	{
		ulMaxStrLen = (strlen(TEST_DATE_HEAD_LABEL)
					   + strlen(pszStartDate) 
					   + strlen(TEST_DATE_LINK_WORD)
					   + strlen(pszEndDate)
					   + strlen(TEST_DATE_END_LABEL));
	}
	// End of ulMaxStrLen picking out.

	pszStrBuf = (T_pSTR)malloc(ulMaxStrLen + 1);// ulMaxStrLen + 1 to prevent boundary leak.

	if (AK_NULL == pszStrBuf)
	{
		return AK_FALSE;
	}

	// Write to file string by string.
	fputs(TEST_INFO_HEAD_LABEL, g_fpXML);
	
	memset(pszStrBuf, 0, ulMaxStrLen + 1);
	strcpy(pszStrBuf, TEST_MODULE_HEAD_LABEL);
	strcat(pszStrBuf, pszModule);
	strcat(pszStrBuf, TEST_MODULE_END_LABEL);
	fputs(pszStrBuf, g_fpXML);
	
	memset(pszStrBuf, 0, ulMaxStrLen + 1);
	strcpy(pszStrBuf, TEST_VER_HEAD_LABEL);
	strcat(pszStrBuf, pszVersion);
	strcat(pszStrBuf, TEST_VER_END_LABEL);
	fputs(pszStrBuf, g_fpXML);
	
	memset(pszStrBuf, 0, ulMaxStrLen + 1);
	strcpy(pszStrBuf, TEST_TYPE_HEAD_LABEL);
	strcat(pszStrBuf, pszTestType);
	strcat(pszStrBuf, TEST_TYPE_END_LABEL);
	fputs(pszStrBuf, g_fpXML);
	
	memset(pszStrBuf, 0, ulMaxStrLen + 1);
	strcpy(pszStrBuf, TESTER_HEAD_LABEL);
	strcat(pszStrBuf, pszTester);
	strcat(pszStrBuf, TESTER_END_LABEL);
	fputs(pszStrBuf, g_fpXML);
	
	memset(pszStrBuf, 0, ulMaxStrLen + 1);
	strcpy(pszStrBuf, TEST_DATE_HEAD_LABEL);
	strcat(pszStrBuf, pszStartDate);
	strcat(pszStrBuf, TEST_DATE_LINK_WORD);
	strcat(pszStrBuf, pszEndDate);
	strcat(pszStrBuf, TEST_DATE_END_LABEL);
	fputs(pszStrBuf, g_fpXML);

	memset(pszStrBuf, 0, ulMaxStrLen + 1);
	fputs(TEST_INFO_END_LABEL, g_fpXML);
	// End of writing.

	free(pszStrBuf);
	pszStrBuf = (T_pSTR)AK_NULL;

	return AK_TRUE;
}
#endif

#ifdef _UNICODE

T_BOOL ConvertASCII2Unicode(T_VOID)
{
	LogSummaryHeadLabel = (T_pWSTR)malloc(strlen(LOG_SUMMARY_HEAD_LABEL) * 2 + 2);	
	ZeroMemory(LogSummaryHeadLabel, strlen(LOG_SUMMARY_HEAD_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							LOG_SUMMARY_HEAD_LABEL, strlen(LOG_SUMMARY_HEAD_LABEL), 
							LogSummaryHeadLabel, strlen(LOG_SUMMARY_HEAD_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	LogSummaryEndLabel = (T_pWSTR)malloc(strlen(LOG_SUMMARY_END_LABEL) * 2 + 2);
	ZeroMemory(LogSummaryEndLabel, strlen(LOG_SUMMARY_END_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							LOG_SUMMARY_END_LABEL, strlen(LOG_SUMMARY_END_LABEL), 
							LogSummaryEndLabel, strlen(LOG_SUMMARY_END_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	// Strings of WriteTestInfo2XML
	TestInfoHeadLabel = (T_pWSTR)malloc(strlen(TEST_INFO_HEAD_LABEL) * 2 + 2);
	ZeroMemory(TestInfoHeadLabel, strlen(TEST_INFO_HEAD_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_INFO_HEAD_LABEL, strlen(TEST_INFO_HEAD_LABEL), 
							TestInfoHeadLabel, strlen(TEST_INFO_HEAD_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestInfoEndLabel = (T_pWSTR)malloc(strlen(TEST_INFO_END_LABEL) * 2 + 2);
	ZeroMemory(TestInfoEndLabel, strlen(TEST_INFO_END_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_INFO_END_LABEL, strlen(TEST_INFO_END_LABEL), 
							TestInfoEndLabel, strlen(TEST_INFO_END_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestModuleHeadLabel = (T_pWSTR)malloc(strlen(TEST_MODULE_HEAD_LABEL) * 2 + 2);
	ZeroMemory(TestModuleHeadLabel, strlen(TEST_MODULE_HEAD_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_MODULE_HEAD_LABEL, strlen(TEST_MODULE_HEAD_LABEL), 
							TestModuleHeadLabel, strlen(TEST_MODULE_HEAD_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestModuleEndLabel = (T_pWSTR)malloc(strlen(TEST_MODULE_END_LABEL) * 2 + 2);
	ZeroMemory(TestModuleEndLabel, strlen(TEST_MODULE_END_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_MODULE_END_LABEL, strlen(TEST_MODULE_END_LABEL), 
							TestModuleEndLabel, strlen(TEST_MODULE_END_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestVerHeadLabel = (T_pWSTR)malloc(strlen(TEST_VER_HEAD_LABEL) * 2 + 2);	
	ZeroMemory(TestVerHeadLabel, strlen(TEST_VER_HEAD_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_VER_HEAD_LABEL, strlen(TEST_VER_HEAD_LABEL), 
							TestVerHeadLabel, strlen(TEST_VER_HEAD_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestVerEndLabel = (T_pWSTR)malloc(strlen(TEST_VER_END_LABEL) * 2 + 2);
	ZeroMemory(TestVerEndLabel, strlen(TEST_VER_END_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_VER_END_LABEL, strlen(TEST_VER_END_LABEL), 
							TestVerEndLabel, strlen(TEST_VER_END_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestTypeHeadLabel = (T_pWSTR)malloc(strlen(TEST_TYPE_HEAD_LABEL) * 2 + 2);	
	ZeroMemory(TestTypeHeadLabel, strlen(TEST_TYPE_HEAD_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_TYPE_HEAD_LABEL, strlen(TEST_TYPE_HEAD_LABEL), 
							TestTypeHeadLabel, strlen(TEST_TYPE_HEAD_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestTypeEndLabel = (T_pWSTR)malloc(strlen(TEST_TYPE_END_LABEL) * 2 + 2);
	ZeroMemory(TestTypeEndLabel, strlen(TEST_TYPE_END_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_TYPE_END_LABEL, strlen(TEST_TYPE_END_LABEL), 
							TestTypeEndLabel, strlen(TEST_TYPE_END_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TesterHeadLabel = (T_pWSTR)malloc(strlen(TESTER_HEAD_LABEL) * 2 + 2);
	ZeroMemory(TesterHeadLabel, strlen(TESTER_HEAD_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TESTER_HEAD_LABEL, strlen(TESTER_HEAD_LABEL), 
							TesterHeadLabel, strlen(TESTER_HEAD_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TesterEndLabel = (T_pWSTR)malloc(strlen(TESTER_END_LABEL) * 2 + 2);
	ZeroMemory(TesterEndLabel, strlen(TESTER_END_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TESTER_END_LABEL, strlen(TESTER_END_LABEL), 
							TesterEndLabel, strlen(TESTER_END_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestDateHeadLabel = (T_pWSTR)malloc(strlen(TEST_DATE_HEAD_LABEL) * 2 + 2);
	ZeroMemory(TestDateHeadLabel, strlen(TEST_DATE_HEAD_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_DATE_HEAD_LABEL, strlen(TEST_DATE_HEAD_LABEL), 
							TestDateHeadLabel, strlen(TEST_DATE_HEAD_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestDateEndLabel = (T_pWSTR)malloc(strlen(TEST_DATE_END_LABEL) * 2 + 2);
	ZeroMemory(TestDateEndLabel, strlen(TEST_DATE_END_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_DATE_END_LABEL, strlen(TEST_DATE_END_LABEL), 
							TestDateEndLabel, strlen(TEST_DATE_END_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestDateLinkWord = (T_pWSTR)malloc(strlen(TEST_DATE_LINK_WORD) * 2 + 2);
	ZeroMemory(TestDateLinkWord, strlen(TEST_DATE_LINK_WORD) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_DATE_LINK_WORD, strlen(TEST_DATE_LINK_WORD), 
							TestDateLinkWord, strlen(TEST_DATE_LINK_WORD) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	// Strings of WriteALogResultBlock
	TestDataHeadLabelFront = (T_pWSTR)malloc(strlen(TEST_DATA_HEAD_LABEL_FRONT) * 2 + 2);
	ZeroMemory(TestDataHeadLabelFront, strlen(TEST_DATA_HEAD_LABEL_FRONT) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_DATA_HEAD_LABEL_FRONT, strlen(TEST_DATA_HEAD_LABEL_FRONT), 
							TestDataHeadLabelFront, strlen(TEST_DATA_HEAD_LABEL_FRONT) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestDataTotalCount = (T_pWSTR)malloc(strlen(TEST_DATA_TOTAL_COUNT) * 2 + 2);
	ZeroMemory(TestDataTotalCount, strlen(TEST_DATA_TOTAL_COUNT) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_DATA_TOTAL_COUNT, strlen(TEST_DATA_TOTAL_COUNT), 
							TestDataTotalCount, strlen(TEST_DATA_TOTAL_COUNT) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestDataPassCount = (T_pWSTR)malloc(strlen(TEST_DATA_PASS_COUNT) * 2 + 2);
	ZeroMemory(TestDataPassCount, strlen(TEST_DATA_PASS_COUNT) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_DATA_PASS_COUNT, strlen(TEST_DATA_PASS_COUNT), 
							TestDataPassCount, strlen(TEST_DATA_PASS_COUNT) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestDataHeadLabelEnd = (T_pWSTR)malloc(strlen(TEST_DATA_HEAD_LABEL_END) * 2 + 2);
	ZeroMemory(TestDataHeadLabelEnd, strlen(TEST_DATA_HEAD_LABEL_END) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_DATA_HEAD_LABEL_END, strlen(TEST_DATA_HEAD_LABEL_END), 
							TestDataHeadLabelEnd, strlen(TEST_DATA_HEAD_LABEL_END) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestDataEndLabel = (T_pWSTR)malloc(strlen(TEST_DATA_END_LABEL) * 2 + 2);
	ZeroMemory(TestDataEndLabel, strlen(TEST_DATA_END_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_DATA_END_LABEL, strlen(TEST_DATA_END_LABEL), 
							TestDataEndLabel, strlen(TEST_DATA_END_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestTitleHeadLabel = (T_pWSTR)malloc(strlen(TEST_TITLE_HEAD_LABEL) * 2 + 2);
	ZeroMemory(TestTitleHeadLabel, strlen(TEST_TITLE_HEAD_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_TITLE_HEAD_LABEL, strlen(TEST_TITLE_HEAD_LABEL), 
							TestTitleHeadLabel, strlen(TEST_TITLE_HEAD_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	TestTitleEndLabel = (T_pWSTR)malloc(strlen(TEST_TITLE_END_LABEL) * 2 + 2);
	ZeroMemory(TestTitleEndLabel, strlen(TEST_TITLE_END_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							TEST_TITLE_END_LABEL, strlen(TEST_TITLE_END_LABEL), 
							TestTitleEndLabel, strlen(TEST_TITLE_END_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	LogResultHeadLabelFront = (T_pWSTR)malloc(strlen(LOG_RESULT_HEAD_LABEL_FRONT) * 2 + 2);
	ZeroMemory(LogResultHeadLabelFront, strlen(LOG_RESULT_HEAD_LABEL_FRONT) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							LOG_RESULT_HEAD_LABEL_FRONT, strlen(LOG_RESULT_HEAD_LABEL_FRONT), 
							LogResultHeadLabelFront, strlen(LOG_RESULT_HEAD_LABEL_FRONT) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	LogResultHeadLabelLinkWord = (T_pWSTR)malloc(strlen(LOG_RESULT_HEAD_LABEL_LINK_WORD) * 2 + 2);
	ZeroMemory(LogResultHeadLabelLinkWord, strlen(LOG_RESULT_HEAD_LABEL_LINK_WORD) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							LOG_RESULT_HEAD_LABEL_LINK_WORD, strlen(LOG_RESULT_HEAD_LABEL_LINK_WORD), 
							LogResultHeadLabelLinkWord, strlen(LOG_RESULT_HEAD_LABEL_LINK_WORD) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	LogResultHeadLabelResult = (T_pWSTR)malloc(strlen(LOG_RESULT_HEAD_LABEL_RESULT) * 2 + 2);
	ZeroMemory(LogResultHeadLabelResult, strlen(LOG_RESULT_HEAD_LABEL_RESULT) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							LOG_RESULT_HEAD_LABEL_RESULT, strlen(LOG_RESULT_HEAD_LABEL_RESULT), 
							LogResultHeadLabelResult, strlen(LOG_RESULT_HEAD_LABEL_RESULT) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	LogResultPass = (T_pWSTR)malloc(strlen(LOG_RESULT_PASS) * 2 + 2);
	ZeroMemory(LogResultPass, strlen(LOG_RESULT_PASS) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							LOG_RESULT_PASS, strlen(LOG_RESULT_PASS), 
							LogResultPass, strlen(LOG_RESULT_PASS) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	LogResultFail = (T_pWSTR)malloc(strlen(LOG_RESULT_FAIL) * 2 + 2);
	ZeroMemory(LogResultFail, strlen(LOG_RESULT_FAIL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							LOG_RESULT_FAIL, strlen(LOG_RESULT_FAIL), 
							LogResultFail, strlen(LOG_RESULT_FAIL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	LogResultNotAvail = (T_pWSTR)malloc(strlen(LOG_RESULT_NOT_AVAILABLE) * 2 + 2);
	ZeroMemory(LogResultNotAvail, strlen(LOG_RESULT_NOT_AVAILABLE) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							LOG_RESULT_NOT_AVAILABLE, strlen(LOG_RESULT_NOT_AVAILABLE), 
							LogResultNotAvail, strlen(LOG_RESULT_NOT_AVAILABLE) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	LogResultHeadLabelEnd = (T_pWSTR)malloc(strlen(LOG_RESULT_HEAD_LABEL_END) * 2 + 2);
	ZeroMemory(LogResultHeadLabelEnd, strlen(LOG_RESULT_HEAD_LABEL_END) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							LOG_RESULT_HEAD_LABEL_END, strlen(LOG_RESULT_HEAD_LABEL_END), 
							LogResultHeadLabelEnd, strlen(LOG_RESULT_HEAD_LABEL_END) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	LogResultEndLabel = (T_pWSTR)malloc(strlen(LOG_RESULT_END_LABEL) * 2 + 2);	
	ZeroMemory(LogResultEndLabel, strlen(LOG_RESULT_END_LABEL) * 2 + 2);
	
	if (MultiByteToWideChar(CP_ACP, NULL, 
							LOG_RESULT_END_LABEL, strlen(LOG_RESULT_END_LABEL), 
							LogResultEndLabel, strlen(LOG_RESULT_END_LABEL) * 2 + 2) == 0)
	{
		return AK_FALSE;
	}

	return AK_TRUE;
}

T_BOOL ConvResult2Unc(T_pWSTR *pwsTestDataBlock, 
					  T_pWSTR *pwsTestCaseID, 
					  T_pWSTR *pwsTestCaseDes,
					  T_pCSTR pszTestDataBlock,
					  T_pCSTR pszTestCaseID, 
					  T_pCSTR pszTestCaseDes)
{
	if (((T_pCSTR)AK_NULL == pszTestDataBlock)
		|| ((T_pCSTR)AK_NULL == pszTestCaseID)
		|| ((T_pCSTR)AK_NULL == pszTestCaseDes))
	{
		return AK_FALSE;
	}

	// Wide char pointer must be NULL or it may be a wild pointer.
	if ((AK_NULL != *pwsTestDataBlock)
		|| (AK_NULL != *pwsTestCaseID)
		|| (AK_NULL != *pwsTestCaseDes))
	{
		return AK_FALSE;
	}
	
	*pwsTestDataBlock = (T_pWSTR)malloc(strlen(pszTestDataBlock) * 2 + 2);

	if (AK_NULL == *pwsTestDataBlock)
	{
		return AK_FALSE;
	}

	ZeroMemory(*pwsTestDataBlock, strlen(pszTestDataBlock) * 2 + 2);
	MultiByteToWideChar(CP_ACP, 
						NULL, 
						pszTestDataBlock, 
						strlen(pszTestDataBlock), 
						*pwsTestDataBlock, 
						strlen(pszTestDataBlock) * 2); 

	*pwsTestCaseID = (T_pWSTR)malloc(strlen(pszTestCaseID) * 2 + 2);

	if (AK_NULL == *pwsTestCaseID)
	{
		free(*pwsTestDataBlock);		
		*pwsTestDataBlock = (T_pWSTR)AK_NULL;
		return AK_FALSE;
	}

	ZeroMemory(*pwsTestCaseID, strlen(pszTestCaseID) * 2 + 2);
	MultiByteToWideChar(CP_ACP,
						NULL, 
						pszTestCaseID, 
						strlen(pszTestCaseID), 
						*pwsTestCaseID, 
						strlen(pszTestCaseID) * 2); 

	*pwsTestCaseDes = (T_pWSTR)malloc(strlen(pszTestCaseDes) *2 + 2);

	if (AK_NULL == *pwsTestCaseDes)
	{
		free(*pwsTestDataBlock);		
		free(*pwsTestCaseID);
		*pwsTestDataBlock = (T_pWSTR)AK_NULL;
		*pwsTestCaseID = (T_pWSTR)AK_NULL;
		return AK_FALSE;
	}

	ZeroMemory(*pwsTestCaseDes, strlen(pszTestCaseDes) * 2 + 2);
	MultiByteToWideChar(CP_ACP,
						NULL, 
						pszTestCaseDes, 
						strlen(pszTestCaseDes), 
						*pwsTestCaseDes, 
						strlen(pszTestCaseDes) * 2); 
	
	return AK_TRUE;
}

T_BOOL ReleaseUncode(T_VOID)
{
	free(LogSummaryHeadLabel);
	free(LogSummaryEndLabel);
	free(TestInfoHeadLabel);
	free(TestInfoEndLabel);
	free(TestModuleHeadLabel);
	free(TestModuleEndLabel);
	free(TestVerHeadLabel);
	free(TestVerEndLabel);
	free(TestTypeHeadLabel);
	free(TestTypeEndLabel);
	free(TesterHeadLabel);
	free(TesterEndLabel);
	free(TestDateHeadLabel);
	free(TestDateEndLabel);
	free(TestDateLinkWord);
	free(TestDataHeadLabelFront);
	free(TestDataTotalCount);
	free(TestDataPassCount);
	free(TestDataHeadLabelEnd);
	free(TestDataEndLabel);
	free(TestTitleHeadLabel);
	free(TestTitleEndLabel);
	free(LogResultHeadLabelFront);
	free(LogResultHeadLabelLinkWord);
	free(LogResultHeadLabelResult);
	free(LogResultPass);
	free(LogResultFail);
	free(LogResultNotAvail);
	free(LogResultHeadLabelEnd);
	free(LogResultEndLabel);

	LogSummaryHeadLabel = (T_pWSTR)AK_NULL;			
	LogSummaryEndLabel = (T_pWSTR)AK_NULL;
	// Strings of WriteTestInfo2XML
	TestInfoHeadLabel = (T_pWSTR)AK_NULL;
	TestInfoEndLabel = (T_pWSTR)AK_NULL;
	TestModuleHeadLabel = (T_pWSTR)AK_NULL;
	TestModuleEndLabel = (T_pWSTR)AK_NULL;
	TestVerHeadLabel = (T_pWSTR)AK_NULL;		
	TestVerEndLabel = (T_pWSTR)AK_NULL;
	TestTypeHeadLabel = (T_pWSTR)AK_NULL;	
	TestTypeEndLabel = (T_pWSTR)AK_NULL;		
	TesterHeadLabel = (T_pWSTR)AK_NULL;
	TesterEndLabel = (T_pWSTR)AK_NULL;
	TestDateHeadLabel = (T_pWSTR)AK_NULL;
	TestDateEndLabel = (T_pWSTR)AK_NULL;
	TestDateLinkWord = (T_pWSTR)AK_NULL;
	// Strings of WriteALogResultBlock
	TestDataHeadLabelFront = (T_pWSTR)AK_NULL;
	TestDataTotalCount = (T_pWSTR)AK_NULL;
	TestDataPassCount = (T_pWSTR)AK_NULL;
	TestDataHeadLabelEnd = (T_pWSTR)AK_NULL;
	TestDataEndLabel = (T_pWSTR)AK_NULL;
	TestTitleHeadLabel = (T_pWSTR)AK_NULL;
	TestTitleEndLabel = (T_pWSTR)AK_NULL;
	LogResultHeadLabelFront = (T_pWSTR)AK_NULL;
	LogResultHeadLabelLinkWord = (T_pWSTR)AK_NULL;
	LogResultHeadLabelResult = (T_pWSTR)AK_NULL;
	LogResultPass = (T_pWSTR)AK_NULL;
	LogResultFail = (T_pWSTR)AK_NULL;
	LogResultNotAvail = (T_pWSTR)AK_NULL;
	LogResultHeadLabelEnd = (T_pWSTR)AK_NULL;
	LogResultEndLabel = (T_pWSTR)AK_NULL;	

	return AK_TRUE;
}

#endif
