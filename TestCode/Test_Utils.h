#ifndef _TEST_UTILS_H_
    #define _TEST_UTILS_H_

    #ifdef __cplusplus
extern "C"
{
    #endif 

    // #include	<windows.h>
    // #include	<Windowsx.h>
    #include "anyka_types.h"
    //#include	"mmlib.h"

    // extern  T_U16 gb_UC2GBK[];
    // extern  T_U16 gb_GBK2UC[];

    int Muti_printf(const char *format, ...);

    T_pVOID Test_RamAlloc(T_U32 size, T_S8 *filename, T_U32 fileline);

    T_pVOID Test_RamRealloc(T_pVOID var, T_U32 size, T_S8 *filename, T_U32
                            fileline);

    T_pVOID Test_RamFree(T_pVOID var, T_S8 *filename, T_U32 fileline);
    // 
    // #ifndef SUPPORT_MULTILAN
    // 	T_U16 Test_UniToAsc(T_U16 uni, T_U32 code);
    // 	T_U16 Test_AscToUni(T_U16 asc, T_U32 code);
    // #else
    // 	T_S32 Test_UniToAsc(const T_U16 *unicode, T_U32 ucLen,
    // 						T_pSTR pDestBuf, T_U32 destLen, T_U32 code);
    // 	T_S32 Test_AscToUni(const T_pSTR src, T_U32 srcLen,
    // 						T_U16 *ucBuf, T_U32 ucBufLen, T_U32 code);
    // #endif
    // 
    // T_S8 Test_InStream(T_VOID);
    // 
    // T_VOID Test_OutStream(T_U16 ch);
    // 
    // T_U32 Test_GetSecond(T_VOID);
    // 
    // T_VOID Test_SetSecond(T_U32 seconds);
    // 
    // T_U32 Test_GetChipID(T_VOID);

    T_S32 Test_CrtSem(T_U32 initial_count, T_U8 suspend_type, T_S8 *FuncName,
                      T_U32 Line);

    T_S32 Test_RelSem(T_S32 semaphore, T_S8 *FuncName, T_U32 Line);

    T_S32 Test_DelSem(T_S32 semaphore, T_S8 *FucName, T_U32 Line);

    T_S32 Test_ObtSem(T_S32 semaphore, T_U32 suspend, T_S8 *FuncName, T_U32
                      Line);

    /* No input
     * Return: Fail(AK_FAILE) or Success(AK_TRUE)*/
    T_BOOL test_nandbase_init(T_VOID);

    //执行以上四个信号量的初始化 
    T_BOOL AllSemphore_Init();

    /* No input
     * Return: Fail(AK_FAILE) or Success(AK_TRUE)*/
    T_BOOL test_fslib_init(T_VOID);

    T_S8 Utl_StrCmpNC(T_pCSTR str1, T_pCSTR str2, T_U16 length);

    T_BOOL ConvertAbsolutePath(T_CHR **pszDstPath, T_CHR *pszSrcPath);

    #ifdef __cplusplus
};
    #endif 

#endif
