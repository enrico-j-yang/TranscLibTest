#include "stdafx.h"
#include <string.h>
#include <stdio.h>
#include "loglib.h"

/* ��ʹ��˵����
 * �ÿ�Ϊ�ڲ��Դ��뼰�ű��м�¼�������й��̻�������
 * �漰������Ĺ��̰�����1���Խӿڡ�2���Խű���3�����ִ�е��ù��̣���δ�мƻ���
 * 1���Խӿ���Ҫ����ǰ̨�ն˴�ӡ����־��¼����־��¼���ն˿�ѡ
 * 2���Խű�Ϊ��ʽ���ã�Ҳ�����ն˴�ӡ����־��¼(��ʵ��)
 * ��ʹ�õĽӿ�Ϊ��׼C��Ľӿڣ�ԭ������lua������ͬ��������������mtd/fs�޹�
 */

#define LOGFILE "logfile.txt"
FILE *logfile = (FILE*)AK_NULL;

/* ʹ��loglib��ǰ�ȵ��ã����ڳ�ʼ������ �� �趨��¼��־�ļ� 
 * ����Ϊ��־�ļ���,û�в�����Ĭ��logfile.txt 
 * �ɹ��򿪣��򷵻�ture�����򷵻�false */
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
            /* Ϊ��ԭ��¼�ļ����ִ򿪵ļ�¼�ļ���һ�����ȹر�ԭ��־��¼�ļ� */
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

/* ��ʽ�ر���־�ļ�
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

/* ����־��д��¼��Ϣ */
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

/* ���ָ���ļ�¼�ļ���������ļ�ָ��ָ��ָ���ļ�¼�ļ���
 * ���ļ������ڣ��򴴽�һ���յ���־�ļ�
 * û�в�����Ĭ��Ϊlogfile.txt */
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
            /* �Ѵ򿪵��ļ��ģ��ȹرգ������´���һ��ָ������־�ļ� */
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
