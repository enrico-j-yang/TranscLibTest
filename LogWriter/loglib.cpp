#include "stdafx.h"
#include <string.h>
#include <stdio.h>
#include "loglib.h"

/* 库使用说明：
 * 该库为在测试代码及脚本中记录程序运行过程环境而设
 * 涉及库操作的过程包括：1测试接口、2测试脚本、3虚拟机执行调用过程（暂未有计划）
 * 1测试接口主要包括前台终端打印及日志记录，日志记录及终端可选
 * 2测试脚本为显式调用，也区别终端打印及日志记录(已实现)
 * 库使用的接口为标准C库的接口，原则上与lua环境有同样的依赖，但与mtd/fs无关
 */

#define LOGFILE "logfile.txt"
FILE *logfile = (FILE*)AK_NULL;

/* 使用loglib库前先调用，用于初始化环境 及 设定记录日志文件 
 * 参数为日志文件名,没有参数则默认logfile.txt 
 * 成功打开，则返回ture，否则返回false */
static int l_logopen(lua_State *L)
{
    T_U32 argcnt = 0;
    const T_U8 *logfilename = (const T_U8*)AK_NULL;

    argcnt = lua_gettop(L);

    if (0 == argcnt)
    {
        if (AK_NULL == logfile)
        {
            PRINT("create logfile.txt\r\n");
            logfile = fopen(LOGFILE, "a");
            if (AK_NULL == logfile)
            {
                PRINT("Err: l_logopen -- fopen fail \r\n");
                lua_pushboolean(L, 0);
                return 1;
            }
        }
        else
        {
            PRINT("warning: logfile.txt is open\r\n");
        }
    }
    else if (1 == argcnt)
    {
        if (!lua_isstring(L, 1))
        {
            PRINT("Err: l_logopen -- argv[1] mustbe string\r\n");
            lua_pushboolean(L, 0);
            return 1;
        }

        logfilename = (const T_U8*)lua_tostring(L, 1);

        if (AK_NULL == logfile)
        {
            PRINT("create logfile: %s \r\n", logfilename);
            logfile = fopen((T_pSTR)logfilename, "a");
            if (AK_NULL == logfile)
            {
                PRINT("Err: l_logopen -- fopen %s fail \r\n", logfilename);
                lua_pushboolean(L, 0);
                return 1;
            }
        }
        else
        {
            /* 为免原记录文件与现打开的记录文件不一样，先关闭原日志记录文件 */
            fclose(logfile);
            logfile = fopen((T_pSTR)logfilename, "a");
            if (AK_NULL == logfile)
            {
                PRINT("Err: l_logopen -- fopen %s fail \r\n", logfilename);
                lua_pushboolean(L, 0);
                return 1;
            }
        }


    }
    else
    {
        PRINT("Err: l_logopen mustbe <= 1 \r\n");
        lua_pushboolean(L, 0);
        return 1;
    }

    lua_pushboolean(L, 1);
    return 1;
}

/* 显式关闭日志文件
 * 
 */
static int l_logclose(lua_State *L)
{
    if (AK_NULL == logfile)
    {
        PRINT("Warning: l_logexit -- logfile has be closed \n");
        lua_pushnil(L);
        return 1;
    }

    fflush(logfile);
    fclose(logfile);
    logfile = (FILE*)AK_NULL;

    lua_pushnil(L);
    return 1;
}

/* 往日志中写记录信息 */
static int l_logmsg(lua_State *L)
{
    T_U32 argcnt = 0;
    const T_U8 *msg = (const T_U8*)AK_NULL;
    UINT msglen = 0;
    T_U32 writelen = 0;

    argcnt = lua_gettop(L);

    if (1 != argcnt)
    {
        PRINT("Err: l_logmsg mustbe = 1 \r\n");
        lua_pushboolean(L, 0);
        return 1;
    }

    if (!lua_isstring(L, 1))
    {
        PRINT("Err: l_logmsg -- argv[1] mustbe string\r\n");
        lua_pushboolean(L, 0);
        return 1;
    }

    if (AK_NULL == logfile)
    {
        PRINT("Err: l_logmsg logfile = AK_NULL \r\n");
        lua_pushboolean(L, 0);
        return 1;
    }

    msg = (const T_U8*)lua_tolstring(L, 1, &msglen);
    writelen = fwrite(msg, 1, msglen, logfile);
    if (msglen != writelen)
    {
        PRINT("Err: l_logmsg -- fwrite - msglen:%d, writelen:%d", msglen,
              writelen);
        lua_pushboolean(L, 0);
        return 1;
    }
    fflush(logfile);

    lua_pushboolean(L, 1);
    return 1;
}

/* 清除指定的记录文件，清除后文件指针指向指定的记录文件。
 * 如文件不存在，则创建一个空的日志文件
 * 没有参数则默认为logfile.txt */
static int l_logclean(lua_State *L)
{
    T_U32 argcnt = 0;
    const T_U8 *logfilename = (const T_U8*)AK_NULL;

    argcnt = lua_gettop(L);

    if (0 == argcnt)
    {

        PRINT("clean logfile.txt\r\n");
        logfile = fopen(LOGFILE, "w");
        if (AK_NULL == logfile)
        {
            PRINT("Err: l_logclean -- fopen fail \r\n");
            lua_pushboolean(L, 0);
            return 1;
        }
    }
    else if (1 == argcnt)
    {
        if (!lua_isstring(L, 1))
        {
            PRINT("Err: l_logclean -- argv[1] mustbe string\r\n");
            lua_pushboolean(L, 0);
            return 1;
        }

        logfilename = (const T_U8*)lua_tostring(L, 1);

        if (AK_NULL == logfile)
        {
            PRINT("create logfile: %s \r\n", logfilename);
            logfile = fopen((T_pSTR)logfilename, "w");
            if (AK_NULL == logfile)
            {
                PRINT("Err: l_logclean -- fopen %s fail \r\n", logfilename);
                lua_pushboolean(L, 0);
                return 1;
            }
        }
        else
        {
            /* 已打开的文件的，先关闭，再重新创建一个指定的日志文件 */
            fclose(logfile);
            logfile = fopen((T_pSTR)logfilename, "w");
            if (AK_NULL == logfile)
            {
                PRINT("Err: l_logclean -- fopen %s fail \r\n", logfilename);
                lua_pushboolean(L, 0);
                return 1;
            }
        }
    }
    else
    {
        PRINT("Err: l_logopen mustbe <= 1 \r\n");
        lua_pushboolean(L, 0);
        return 1;
    }

    lua_pushboolean(L, 1);
    return 1;
}

///////////////////////////////////////////////////////////////////////////
//                                                                      ///
///////////////////////////////////////////////////////////////////////////


static const struct luaL_reg loglib[] = 
{
    {"open", l_logopen}, 
    {"close", l_logclose}, 
    {"msg", l_logmsg}, 
    {"clean", l_logclean}, 
    {NULL, NULL} /* sentinel */
};


LUALIB_API int luaopen_loglib(lua_State *L)
{
    luaL_register(L, LUA_LOGLIBNAME, loglib);
    return 1;
}
