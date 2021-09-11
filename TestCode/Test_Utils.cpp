#include "stdafx.h"
#include "Test_Utils.h"
#include "loglib.h"
//#include "listlib.h"

static T_U32 WinSecond = 800000000;

//信号量定义 
HANDLE semphoreP = NULL; //打印信息 
HANDLE semphoreMem = NULL; //内存申请释放 
// HANDLE semphoreNand = NULL;		//模拟Nand读写 
// HANDLE semphoreG_W =  NULL;		
//虚拟盘的读写控制,这里暂只有Powerdown时用到，其余均用在对虚拟盘读写的接口中

T_BOOL semphoreP_init(T_VOID)
{
    if (NULL != semphoreP)
    {
        printf("Warning: semphoreP_init--semphoreP already init \n");
        return AK_TRUE;
    }

    semphoreP = CreateSemaphore(NULL, 1, 1, NULL);
    if (semphoreP == NULL)
    {
        printf("semphoreP_init -- Create semphoreP error\n");
        return AK_FALSE;
    }

    return AK_TRUE;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_BOOL semphoreMem_init(T_VOID)
{
    if (NULL != semphoreMem)
    {
        printf("Warning: semphoreMem_init--semphoreP already init \n");
        return AK_TRUE;
    }

    semphoreMem = CreateSemaphore(NULL, 1, 1, NULL);
    if (semphoreMem == NULL)
    {
        printf("semphoreMem_init -- Create semphoreP error\n");
        return AK_FALSE;
    }

    return AK_TRUE;
}

// 
// T_BOOL semphoreNand_init(T_VOID)
// {
// 	if(NULL != semphoreNand)
// 	{
// 		printf("Warning: semphoreNand_init--semphoreP already init \n");
// 		return AK_TRUE;
// 	}
// 
// 	semphoreNand = CreateSemaphore(NULL,1,1,NULL);
// 	if (semphoreNand == NULL)
// 	{
// 		printf("semphoreNand_init -- Create semphoreP error\n");
// 		return AK_FALSE;
// 	}
// 
// 	return AK_TRUE;
// }
// 
// T_BOOL semphoreG_W_init(T_VOID)
// {
// 	if(NULL != semphoreG_W)
// 	{
// 		printf("Warning: semphoreG_W_init--semphoreP already init \n");
// 		return AK_TRUE;
// 	}
// 
// 	semphoreG_W = CreateSemaphore(NULL,1,1,NULL);
// 	if (semphoreG_W == NULL)
// 	{
// 		printf("semphoreNand_init -- Create semphoreP error\n");
// 		return AK_FALSE;
// 	}
// 
// 	return AK_TRUE;
// }
// 
//执行以上四个信号量的初始化 
T_BOOL AllSemphore_Init()
{
    T_BOOL P_init = AK_FALSE;
    T_BOOL mem_init = AK_FALSE;
    // 	T_BOOL Nand_init = AK_FALSE;
    // 	T_BOOL G_W_init = AK_FALSE;
    T_BOOL rtn = AK_TRUE;

    P_init = semphoreP_init();
    mem_init = semphoreMem_init();
    // 	Nand_init = semphoreNand_init();
    // 	G_W_init = semphoreG_W_init();

    if (AK_FALSE == P_init)
    {
        printf("Err: AllSemphore_Init--semphoreP_init return FALSE\n");
        rtn = AK_FALSE;
    }

    if (AK_FALSE == mem_init)
    {
        printf("Err: AllSemphore_Init--semphoreMem_init return FALSE\n");
        rtn = AK_FALSE;
    }

    // 	if(AK_FALSE == Nand_init)
    // 	{
    // 		printf("Err: AllSemphore_Init--semphoreNand_init return FALSE\n");
    // 		rtn = AK_FALSE;
    // 	}
    // 
    // 	if(AK_FALSE == G_W_init)
    // 	{
    // 		printf("Err: AllSemphore_Init--semphoreG_W_init return FALSE\n");
    // 		rtn = AK_FALSE;
    // 	}

    return rtn;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

int Muti_printf(const char *format, ...)
{
    va_list ap;
    unsigned long arg;
    const char *str;
    char ch1;
    WaitForSingleObject(semphoreP, INFINITE);
    va_start(ap, format);
    while (*format != 0)
    {
        if (*format == '%')
        {
            format++;
            ch1 =  *format++;
            if (ch1 == 's')
            {
                str = (const char*)va_arg(ap, unsigned char*);
                printf("%s", str);
            }
            else if (ch1 == 'd')
            {
                arg = va_arg(ap, unsigned long);
                printf("%d", arg);
            }
            else if (ch1 == 'x')
            {
                arg = va_arg(ap, unsigned long);
                printf("%0x", arg);
            }
        }
        else
        {
            printf("%c",  *format++);
        }
    }
    va_end(ap);
    ReleaseSemaphore(semphoreP, 1, NULL);

    return 0;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_pVOID Test_RamAlloc(T_U32 size, T_S8 *filename, T_U32 fileline)
{
    T_pVOID ptr = NULL;

    WaitForSingleObject(semphoreMem, INFINITE);

    ptr = (T_pVOID)malloc(size);
    if (NULL == ptr)
    {
        printf("Test_RamAlloc -- Err: file: %s, line: %d \n", filename,
               fileline);
    }
    ReleaseSemaphore(semphoreMem, 1, NULL);

    return ptr;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_pVOID Test_RamRealloc(T_pVOID var, T_U32 size, T_S8 *filename, T_U32 fileline)
{
    T_pVOID ptr = NULL;
    WaitForSingleObject(semphoreMem, INFINITE);
    ptr = realloc(var, size);
    if (NULL == ptr)
    {
        printf("Test_RamRealloc -- Err: file: %s, line: %d \n", filename,
               fileline);
        ;
    }
    ReleaseSemaphore(semphoreMem, 1, NULL);
    return ptr;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_pVOID Test_RamFree(T_pVOID var, T_S8 *filename, T_U32 fileline)
{
    WaitForSingleObject(semphoreMem, INFINITE);

    if (var != AK_NULL)
    {
        free(var);
    }
    var = AK_NULL;
    ReleaseSemaphore(semphoreMem, 1, NULL);
    return AK_NULL;
}

// 
// #ifndef SUPPORT_MULTILAN
// T_U16 Test_UniToAsc(T_U16 uni, T_U32 code)
// {
// 	return  gb_UC2GBK[uni];
// }
// T_U16 Test_AscToUni(T_U16 asc, T_U32 code)
// {
// 	return gb_GBK2UC[asc];
// }
// #else
// T_S32 Test_UniToAsc(const T_U16 *unicode, T_U32 ucLen,
//                                 T_pSTR pDestBuf, T_U32 destLen, T_U32 code)
// {
//     T_U32 i;
// 
//     if (AK_NULL z!= pDestBuf && destLen > 0)
//     {
//         for(i=0; (i<ucLen && i<(destLen-1) && 0 != unicode[0]); i++)
//             pDestBuf[i] = (T_U8)(unicode[i]);
//         
// 
//         pDestBuf[i] = 0;
//         if (i == destLen-1 && i < ucLen)
//         i = 0xffffffff;
//     }
//     else
//     {   
//         i = ucLen << 1;
//     }
// 
//     return (T_S32)i;
// }
// 
// T_S32 Test_AscToUni(const T_pSTR src, T_U32 srcLen,
//                                 T_U16 *ucBuf, T_U32 ucBufLen, T_U32 code)
// {
//    T_U32 i;
// 
//     if (AK_NULL != ucBuf && ucBufLen > 0)
//     {
//         for(i=0; (i<srcLen && i<(ucBufLen-1) && 0 != src[i]); i++)
//             ucBuf[i] = ((T_U16)(src[i])) & 0xff;
// 
//         ucBuf[i] = 0;
// 
//         if (i == ucBufLen-1 && i != srcLen)
//             i = 0xffffffff;
//     }
//     else
//     {
//         i = srcLen;
//     }
// 
//     return (T_S32)i;
// }
// #endif
// 
// T_S8 Test_InStream(T_VOID)
// {
// 	T_S8 ch;
// 	ch = getchar() & 0xff;
// 	return ch;
// }
// 
// T_VOID Test_OutStream(T_U16 ch)
// {
// 	T_S8 ch1;
// 	ch1 = ch & 0xff;
// 	putchar(ch1);
// }
// 
// T_U32 Test_GetSecond(T_VOID)
// {
// 	return clock() ;
// }
// 
// T_VOID Test_SetSecond(T_U32 seconds)
// {
// 	WinSecond = seconds;
// }
// 
// T_U32 Test_GetChipID(T_VOID)
// {
// 	return AK_TRUE;
// } 

T_S32 Test_CrtSem(T_U32 initial_count, T_U8 suspend_type, T_S8 *FuncName, T_U32
                  Line)
{
    HANDLE handle = NULL;

    handle = CreateSemaphore(NULL, initial_count, initial_count, NULL);
    if (handle == NULL)
    {
        printf("CreateSemaphore error !!!\n");
    }
    return (T_S32)handle;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_S32 Test_RelSem(T_S32 semaphore, T_S8 *FuncName, T_U32 Line)
{
    T_S8 result = 0;

    result = ReleaseSemaphore((HANDLE)semaphore, 1, NULL);
    return 0;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_S32 Test_DelSem(T_S32 semaphore, T_S8 *FuncName, T_U32 Line)
{

    if (CloseHandle((HANDLE)semaphore))
    {
        return 0;
    }
    else
    {
        return  - 1;
    }

}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////

T_S32 Test_ObtSem(T_S32 semaphore, T_U32 suspend, T_S8 *FuncName, T_U32 Line)
{
    WaitForSingleObject((HANDLE)semaphore, INFINITE);
    return 0;
}

/**
//  * @brief Compare characters of two strings without regard to case by length
//  * @param T_pDATA s one string pointer
//  * @param T_pDATA d another string pointer
//  * @param T_U16 length
//  * @return T_S16
//  * @retval 0: s substring identical to d substring
//  *     1: s substring greater than d substring
//  *     -1: s substring less than d substring
//  */
// T_S8 Utl_StrCmpNC(T_pCSTR str1, T_pCSTR str2, T_U16 length)
// {
// 	T_S8 c1,c2;
// 	T_U16  i;
// 	T_pDATA pStr1 = ( T_pDATA )str1;
// 	T_pDATA pStr2 = ( T_pDATA )str2;
//  
// 	if (0 == str1)
// 	{
// 		return -1;
// 	}
// 	if (0 == str2)
// 	{
// 		return 1;
// 	}
// 
// 	for( i=0; i<length; i++, pStr1++, pStr2++ )
// 	{
// 		c1 = ( T_S8 )( *pStr1 );
// 		if( c1 >= 'A' && c1 <= 'Z' )
// 		c1 += 0x20;
// 		c2 = ( T_S8 )( *pStr2 );
// 		if( c2 >= 'A' && c2 <= 'Z' )
// 		c2 += 0x20;
//  
// 		if(c1 > c2) 
// 		{
// 		return 1;
// 		}
// 		if(c1 < c2)
// 		{
// 		return -1;
// 		}
// 	}
// 	return 0;
// }

///////////////////////////////////////////////////////////////////////////
// Brief: It converts path to absolutely path.                          ///
//        Buffer allocated in this function must be freed outside       ///
///////////////////////////////////////////////////////////////////////////
T_BOOL ConvertAbsolutePath(T_CHR **pszDstPath, T_CHR *pszSrcPath)
{
    TCHAR curPath[MAX_PATH] = {0};
    T_CHR pszCurPath[MAX_PATH] = {0};
    T_CHR filePath[MAX_PATH] = {0};

    if ((AK_NULL == pszDstPath) || (AK_NULL == pszSrcPath))
    {
        return AK_FALSE;
    }


    GetCurrentDirectory(MAX_PATH *sizeof(T_CHR), curPath);

    WideCharToMultiByte(CP_ACP, NULL, curPath, wcslen(curPath), pszCurPath,
                        wcslen(curPath), NULL, NULL);

    strcpy(filePath, pszSrcPath);

    *pszDstPath = (T_CHR*)malloc(wcslen(curPath) + strlen(pszSrcPath) + 1);

    if (AK_NULL ==  *pszDstPath)
    {
        return AK_FALSE;
    }
    else
    {
        memset(*pszDstPath, 0, wcslen(curPath) + strlen(filePath) + 1);
    }

	if (strlen(filePath) > 0)
	{
		strcpy(*pszDstPath, pszCurPath);
		strcat(*pszDstPath, filePath);
	}
	else
	{
		strcpy(*pszDstPath, filePath);
	}    

    return AK_TRUE;
}
