#include "stdafx.h"
#include "anyka_types.h"
#include "ResultEngine.h"
#include "TestEngine.h"
#include "ReportWriter.h"

extern ReportCurCaseID g_pfnRepCurCaseID;
extern ReportCaseResult g_pfnRepCaseRsl;
extern ReportTestStepData g_pfnRepTestStepData;
extern ReportTestStepResult g_pfnRepTestStepRsl;

extern T_TEST_CASE_LIST *g_ptTestCaseList;

T_U32 m_ulTotalCaseCnt;
T_U32 m_ulPassCaseCnt;
T_U32 m_ulFailCaseCnt;
T_U32 m_ulNACaseCnt;

T_BOOL CR_Init(T_VOID)
{
	m_ulTotalCaseCnt = 0;
	m_ulPassCaseCnt = 0;
	m_ulFailCaseCnt = 0;
	m_ulNACaseCnt = 0;

	return AK_TRUE;
}

T_BOOL CR_GetResultSummary(T_U32 *pulTotalCaseCnt, T_U32 *pulPassCaseCnt,
						   T_U32 *pulFailCaseCnt, T_U32 *pulNACaseCnt)
{
	if ((AK_NULL == pulTotalCaseCnt) || (AK_NULL == pulPassCaseCnt) ||
		(AK_NULL == pulFailCaseCnt) || (AK_NULL == pulNACaseCnt))
	{
		return AK_FALSE;
	}

	*pulTotalCaseCnt = m_ulTotalCaseCnt;
	*pulPassCaseCnt = m_ulPassCaseCnt;
	*pulFailCaseCnt = m_ulFailCaseCnt;
	*pulNACaseCnt = m_ulNACaseCnt;

	return AK_TRUE;
}

static int Lua_CaseResult(lua_State *L)
{	
	enum
	{
		ARG_CASE_ID = 1,
		ARG_RESULT,
	};
	
	T_U32 argcnt = 0;
    T_U32 rsl = 0;
	T_U32 eCaseID = -1;
	TE_GENERAL_TEST_RESULT eCaseResult = (TE_GENERAL_TEST_RESULT)0;
	T_U16 pwsTestCaseID[MAX_PATH] = {0};
	
	argcnt = lua_gettop(L);
	
	if (argcnt != 2)
	{
		lua_pushinteger(L, 0);
		return 1;
	}
	
	// Initial CaseID in lua script is 1 while in c code is 0, eCaseID must be transformed
	eCaseID = (lua_tointeger(L, ARG_CASE_ID) - 1);
	eCaseResult = (TE_GENERAL_TEST_RESULT)lua_tointeger(L, ARG_RESULT);

	switch(eCaseResult)
	{
	case TGR_PASS:
		m_ulPassCaseCnt++;
		break;
	case TGR_FAIL:
		m_ulFailCaseCnt++;
		break;
	case TGR_NA:
	default:
		m_ulNACaseCnt++;
		break;
	}

	m_ulTotalCaseCnt++;

	memset(pwsTestCaseID, 0, sizeof(T_U16) * MAX_PATH);

	MultiByteToWideChar(CP_ACP,
						NULL,
						g_ptTestCaseList[eCaseID].pszID,
						strlen(g_ptTestCaseList[eCaseID].pszID),
						pwsTestCaseID,
						strlen(g_ptTestCaseList[eCaseID].pszID));

	WriteALogResultBlock(pwsTestCaseID, eCaseResult, _T(""), _T(""), 0, 0);

	rsl = g_pfnRepCaseRsl(eCaseID, eCaseResult);
	
	lua_pushinteger(L, rsl);

	return 1;
}

static int Lua_ReportCaseID(lua_State *L)
{
	enum
	{
		ARG_CASE_ID = 1,
			ARG_STEP,
	};
	
	T_U32 argcnt = 0;
    T_U32 rsl = 0;
	T_U32 eCaseID = -1;
	T_U32 ulStep = 0;
	
	argcnt = lua_gettop(L);
	
	if (argcnt != 2)
	{
		lua_pushinteger(L, 0);
		return 1;
	}
	// Initial CaseID in lua script is 1 while in c code is 0, eCaseID must be transformed
	eCaseID = (lua_tointeger(L, ARG_CASE_ID) - 1);
	ulStep = lua_tointeger(L, ARG_STEP);
	
	rsl = g_pfnRepCurCaseID(eCaseID, ulStep);
	
	lua_pushinteger(L, rsl);
	return 1;
}

static int Lua_ReportStepData(lua_State *L)
{
	enum
	{
		ARG_STEP = 1,
	};
	
	T_U32 argcnt = 0;
    T_U32 rsl = 0;	
	T_U32 ulStep = 0;
	
	argcnt = lua_gettop(L);
	
	if (argcnt != 1)
	{
		lua_pushinteger(L, 0);
		return 1;
	}
	
	ulStep = lua_tointeger(L, ARG_STEP);
	
	rsl = g_pfnRepTestStepData(ulStep);
	
	lua_pushinteger(L, rsl);
	return 1;
}

static int Lua_ReportStepResult(lua_State *L)
{
	enum
	{
		ARG_RESULT = 1,
	};
	
	T_U32 argcnt = 0;
    T_U32 rsl = 0;	
	TE_GENERAL_TEST_RESULT eCaseResult = (TE_GENERAL_TEST_RESULT)0;
	
	argcnt = lua_gettop(L);
	
	if (argcnt != 1)
	{
		lua_pushinteger(L, 0);
		return 1;
	}
	
	eCaseResult = (TE_GENERAL_TEST_RESULT)lua_tointeger(L, ARG_RESULT);
	
	rsl = g_pfnRepTestStepRsl(eCaseResult);
	
	lua_pushinteger(L, rsl);
	return 1;
}

static int Lua_ReportResultSummary(lua_State *L)
{
	T_U32 argcnt = 0;
	
	argcnt = lua_gettop(L);
	
	if (argcnt != 0)
	{
		lua_pushinteger(L, 0);
		return 1;
	}
	
	TE_EndCase();

	return 0;
}

static int Lua_ReportStart(lua_State *L)
{
	T_U32 argcnt = 0;
	
	argcnt = lua_gettop(L);
	
	if (argcnt != 0)
	{
		lua_pushinteger(L, 0);
		return 1;
	}
	
	TE_StartCase();

	return 0;
}


static const struct luaL_reg testresultlib [] = 
{
	{"ReportCaseResult", Lua_CaseResult},
	{"ReportCaseID", Lua_ReportCaseID},
	{"ReportStepData", Lua_ReportStepData},
	{"ReportStepResult", Lua_ReportStepResult},
	{"ReportResultSummary", Lua_ReportResultSummary},
	{"ReportStart", Lua_ReportStart},
	{NULL, NULL}  /* sentinel */
};

LUALIB_API int luaopen_testresultlib (lua_State *L)
{
    luaL_register(L, LUA_RESULTLIBNAME, testresultlib);
    return 1;
}
