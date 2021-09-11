# Microsoft Developer Studio Project File - Name="Burntool3LibTest" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=Burntool3LibTest - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Burntool3LibTest.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Burntool3LibTest.mak" CFG="Burntool3LibTest - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Burntool3LibTest - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "Burntool3LibTest - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Burntool3LibTest - Win32 Release"

# PROP BASE Use_MFC 5
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 5
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MT /W3 /GX /O2 /I "./ScriptEngine" /I "./TestObject" /I "./TestCode" /I "./LogWriter" /I "./ResultEngine" /I "./" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_UNICODE" /D "UNICODE" /D "LUA_LIB" /D "LUA_BUILD_AS_DLL" /Yu"stdafx.h" /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x804 /d "NDEBUG"
# ADD RSC /l 0x804 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# ADD LINK32 USBTransc.lib lua51.lib transc.lib /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /machine:I386

!ELSEIF  "$(CFG)" == "Burntool3LibTest - Win32 Debug"

# PROP BASE Use_MFC 5
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 5
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /Yu"stdafx.h" /FD /GZ /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I "./ScriptEngine" /I "./TestObject" /I "./TestCode" /I "./LogWriter" /I "./ResultEngine" /I "./" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_UNICODE" /D "UNICODE" /D "LUA_LIB" /D "LUA_BUILD_AS_DLL" /FR /Yu"stdafx.h" /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x804 /d "_DEBUG"
# ADD RSC /l 0x804 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 lua51.lib /nologo /entry:"wWinMainCRTStartup" /subsystem:windows /debug /machine:I386 /pdbtype:sept /libpath:"./ScriptEngine" /libpath:"./TestObject"
# SUBTRACT LINK32 /profile /pdb:none

!ENDIF 

# Begin Target

# Name "Burntool3LibTest - Win32 Release"
# Name "Burntool3LibTest - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\Burntool3LibTest.cpp
# End Source File
# Begin Source File

SOURCE=.\Burntool3LibTest.rc
# End Source File
# Begin Source File

SOURCE=.\Burntool3LibTestDlg.cpp
# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp
# ADD CPP /Yc"stdafx.h"
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\Burntool3LibTest.h
# End Source File
# Begin Source File

SOURCE=.\Burntool3LibTestDlg.h
# End Source File
# Begin Source File

SOURCE=.\Resource.h
# End Source File
# Begin Source File

SOURCE=.\StdAfx.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\res\Burntool3LibTest.ico
# End Source File
# Begin Source File

SOURCE=.\res\Burntool3LibTest.ico
# End Source File
# Begin Source File

SOURCE=.\res\Burntool3LibTest.rc2
# End Source File
# End Group
# Begin Group "ScriptEngine"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\ScriptEngine\lauxlib.h
# End Source File
# Begin Source File

SOURCE=.\ScriptEngine\lua.h
# End Source File
# Begin Source File

SOURCE=.\ScriptEngine\luaconf.h
# End Source File
# Begin Source File

SOURCE=.\ScriptEngine\lualib.h
# End Source File
# End Group
# Begin Group "TestCode"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\TestCode\anyka_types.h
# End Source File
# Begin Source File

SOURCE=.\TestCode\BTTestCode.cpp
# End Source File
# Begin Source File

SOURCE=.\TestCode\BTTestCode.h
# End Source File
# Begin Source File

SOURCE=.\TestCode\Test_Utils.cpp
# End Source File
# Begin Source File

SOURCE=.\TestCode\Test_Utils.h
# End Source File
# Begin Source File

SOURCE=.\TestCode\TestEngine.cpp
# End Source File
# Begin Source File

SOURCE=.\TestCode\TestEngine.h
# End Source File
# End Group
# Begin Group "TestObject"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\TestObject\transc.h
# End Source File
# Begin Source File

SOURCE=.\TestObject\USBTransc.h
# End Source File
# End Group
# Begin Group "LogWriter"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\LogWriter\loglib.cpp
# End Source File
# Begin Source File

SOURCE=.\LogWriter\loglib.h
# End Source File
# End Group
# Begin Group "ResultEngine"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\ResultEngine\ReportWriter.cpp
# End Source File
# Begin Source File

SOURCE=.\ResultEngine\ReportWriter.h
# End Source File
# Begin Source File

SOURCE=.\ResultEngine\ResultEngine.cpp
# End Source File
# Begin Source File

SOURCE=.\ResultEngine\ResultEngine.h
# End Source File
# End Group
# Begin Group "TestData"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\TestData\nand_list.cpp
# End Source File
# End Group
# Begin Source File

SOURCE=.\ReadMe.txt
# End Source File
# End Target
# End Project
