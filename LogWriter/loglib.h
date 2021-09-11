#ifndef LOGLIB_H
    #define LOGLIB_H

    #ifdef __cplusplus
        extern "C"
        {
        #endif 

        #include "lauxlib.h"
        #include "lualib.h"
        #include "anyka_types.h"
        #include "Test_Utils.h"

        #define PRINT			Muti_printf
        #define LUA_LOGLIBNAME	"log"
        extern FILE *logfile;

        /* LOG(N), 这里N代表的是要输出的变量个数。
         *  此是由于宏不能处理可变参数而用的做法 */
        #define LOG(str)  do{\
        PRINT(str);\
        if (logfile)\
        {\
        fprintf(logfile, str) ; \
        fflush(logfile); \
        }\
        } while(0)

        #define LOG1(str, s)  do{\
        PRINT(str, s);\
        if (logfile)\
        {\
        fprintf(logfile, str, s) ; \
        fflush(logfile); \
        }\
        } while(0)

        #define LOG2(str, s1, s2)  do{\
        PRINT(str, s1, s2);\
        if (logfile)\
        {\
        fprintf(logfile, str, s1, s2) ; \
        fflush(logfile); \
        }\
        } while(0)

        #define LOG3(str, s1, s2, s3)  do{\
        PRINT(str, s1, s2, s3);\
        if (logfile)\
        {\
        fprintf(logfile, str, s1, s2, s3) ; \
        fflush(logfile); \
        }\
        } while(0)

        #define LOG4(str, s1, s2, s3, s4)  do{\
        PRINT(str, s1, s2, s3, s4);\
        if (logfile)\
        {\
        fprintf(logfile, str, s1, s2, s3, s4) ; \
        fflush(logfile); \
        }\
        } while(0)

        LUALIB_API int luaopen_loglib(lua_State *L);

        #ifdef __cplusplus
        };
    #endif 

#endif // LOGLIB_H
