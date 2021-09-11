#ifndef _RESULTENGINE_H_
#define _RESULTENGINE_H_

#ifdef __cplusplus
extern "C"{
#endif
	
#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

#define LUA_RESULTLIBNAME	"result"
	
    enum TE_GENERAL_TEST_RESULT
    {
        TGR_PASS = 1,  // case pass
		TGR_FAIL = 0,  // case failed
		TGR_NA =  - 1,  // result not avialable
    };

	extern LUALIB_API int luaopen_testresultlib (lua_State *L);
	
	extern T_BOOL CR_GetResultSummary(T_U32 *pulTotalCaseCnt, T_U32 *pulPassCaseCnt,
									  T_U32 *pulFailCaseCnt, T_U32 *pulNACaseCnt);
#ifdef __cplusplus
};
#endif

#endif // _RESULTENGINE_H_