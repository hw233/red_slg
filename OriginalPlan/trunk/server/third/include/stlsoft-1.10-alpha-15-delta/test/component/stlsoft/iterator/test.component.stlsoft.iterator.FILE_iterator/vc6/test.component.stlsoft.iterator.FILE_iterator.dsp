# Microsoft Developer Studio Project File - Name="test.component.stlsoft.iterator.FILE_iterator" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=test.component.stlsoft.iterator.FILE_iterator - Win32 Debug NoX
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE
!MESSAGE NMAKE /f "test.component.stlsoft.iterator.FILE_iterator.mak".
!MESSAGE
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE
!MESSAGE NMAKE /f "test.component.stlsoft.iterator.FILE_iterator.mak" CFG="test.component.stlsoft.iterator.FILE_iterator - Win32 Debug NoX"
!MESSAGE
!MESSAGE Possible choices for configuration are:
!MESSAGE
!MESSAGE "test.component.stlsoft.iterator.FILE_iterator - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "test.component.stlsoft.iterator.FILE_iterator - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE "test.component.stlsoft.iterator.FILE_iterator - Win32 Debug NoX" (based on "Win32 (x86) Application")
!MESSAGE

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "test.component.stlsoft.iterator.FILE_iterator - Win32 Release"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_AFXDLL" /YX /FD /c
# ADD CPP /nologo /MD /W3 /WX /GR /GX /O2 /I "$(STLSOFT_1_10)/include" /I "$(XTESTS_C_ROOT)/include" /I "$(STLSOFT)/include" /D "WIN32" /D "NDEBUG" /D "_AFXDLL" /D "_MBCS" /D "_CONSOLE" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0xc09 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0xc09 /d "NDEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib advapi32.lib ole32.lib oleaut32.lib /nologo /subsystem:console /machine:I386 /libpath:"$(STLSOFT_1_10)" /libpath:"$(XTESTS_C_ROOT)/lib"

!ELSEIF  "$(CFG)" == "test.component.stlsoft.iterator.FILE_iterator - Win32 Debug"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_AFXDLL" /YX /FD /GZ /c
# ADD CPP /nologo /MDd /W3 /WX /Gm /GR /GX /Zi /Od /I "$(STLSOFT_1_10)/include" /I "$(XTESTS_C_ROOT)/include" /I "$(STLSOFT)/include" /D "WIN32" /D "_DEBUG" /D "_AFXDLL" /D "_MBCS" /D "_CONSOLE" /FR /YX /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0xc09 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0xc09 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 kernel32.lib advapi32.lib ole32.lib oleaut32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept /libpath:"$(STLSOFT_1_10)" /libpath:"$(XTESTS_C_ROOT)/lib"

!ELSEIF  "$(CFG)" == "test.component.stlsoft.iterator.FILE_iterator - Win32 Debug NoX"

# PROP BASE Use_MFC 2
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "test_unit_winstl_synch_w4mo___Win32_Debug_NoX"
# PROP BASE Intermediate_Dir "test_unit_winstl_synch_w4mo___Win32_Debug_NoX"
# PROP BASE Target_Dir ""
# PROP Use_MFC 2
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "DebugNoX"
# PROP Intermediate_Dir "DebugNoX"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MDd /W3 /WX /Gm /GR /GX /Zi /Od /I "$(STLSOFT_1_10)/include" /I "$(XTESTS_C_ROOT)/include" /I "$(STLSOFT)/include" /D "WIN32" /D "_DEBUG" /D "_AFXDLL" /D "_MBCS" /D "_CONSOLE" /FR /YX /FD /GZ /c
# ADD CPP /nologo /MDd /W3 /WX /Gm /GR /Zi /Od /I "$(STLSOFT_1_10)/include" /I "$(XTESTS_C_ROOT)/include" /I "$(STLSOFT)/include" /D "WIN32" /D "_DEBUG" /D "_AFXDLL" /D "_MBCS" /D "_CONSOLE" /FR /YX /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0xc09 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0xc09 /d "_DEBUG" /d "_AFXDLL"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib advapi32.lib ole32.lib oleaut32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept /libpath:"$(STLSOFT_1_10)" /libpath:"$(XTESTS_C_ROOT)/lib"
# ADD LINK32 kernel32.lib advapi32.lib ole32.lib oleaut32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept /libpath:"$(STLSOFT_1_10)" /libpath:"$(XTESTS_C_ROOT)/lib"

!ENDIF

# Begin Target

# Name "test.component.stlsoft.iterator.FILE_iterator - Win32 Release"
# Name "test.component.stlsoft.iterator.FILE_iterator - Win32 Debug"
# Name "test.component.stlsoft.iterator.FILE_iterator - Win32 Debug NoX"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=..\implicit_link.cpp
# End Source File
# Begin Source File

SOURCE=..\test.component.stlsoft.iterator.FILE_iterator.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Group "STLSoft Header Files"

# PROP Default_Filter ""
# Begin Group "STLSoft"

# PROP Default_Filter ""
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\memory\allocator_base.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\memory\allocator_features.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\memory\allocator_selector.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\algorithms\std\alt.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\memory\auto_buffer.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\shims\access\string\std\basic_string.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\algorithms\bounded.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\shims\access\string\std\c_string.h"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\meta\capabilities.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\string\char_traits.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\collections\util\collections.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\util\constraints.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT_1_10)\include\stlsoft\quality\contract.h"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT_1_10)\include\stlsoft\quality\cover.h"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\shims\access\string\std\exception.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\util\exception_string.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\error\exceptions.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT_1_10)\include\stlsoft\iterator\FILE_iterator.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\shims\access\string\fwd.h"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\meta\is_integral_type.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\meta\is_same_type.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\meta\is_signed_type.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\util\std\iterator_generators.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\util\std\iterator_helper.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\util\std\library_discriminator.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\util\limit_traits.h"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\meta\util\meta_.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\util\minmax.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\internal\cccap\msvc.h"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\internal\cccap\obsolete.h"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\error\os_exception.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\algorithms\pod.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\error\project_exception.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\internal\safestr.h"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\conversion\sap_cast.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\smartptr\scoped_handle.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\meta\select_first_type_if.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\util\sign_traits.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT_1_10)\include\stlsoft\string\simple_string.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\meta\size_of.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\util\size_traits.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\util\std_swap.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\stlsoft.h"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT_1_10)\include\stlsoft\stlsoft_1_10.h"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\shims\access\string.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\string\string_tokeniser.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\string\string_traits_fwd.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\string\string_view.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\error\throw_policies.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT_1_10)\include\stlsoft\conversion\truncation_cast.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\conversion\truncation_test.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\meta\yesno.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\meta\is_character_type.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\meta\is_floating_point_type.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\meta\is_pointer_type.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT_1_10)\include\stlsoft\meta\is_printf_type.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\stlsoft\meta\n_types.hpp"
# End Source File
# End Group
# Begin Group "PlatformSTL"

# PROP Default_Filter ""
# Begin Source File

SOURCE="$(STLSOFT)\include\platformstl\filesystem\file_lines.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\platformstl\filesystem\memory_mapped_file.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\platformstl\platformstl.h"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\platformstl\platformstl.hpp"
# End Source File
# End Group
# Begin Group "WinSTL"

# PROP Default_Filter ""
# Begin Source File

SOURCE="$(STLSOFT)\include\winstl\error\error_functions.h"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\winstl\error\exceptions.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\winstl\filesystem\memory_mapped_file.hpp"
# End Source File
# Begin Source File

SOURCE="$(STLSOFT)\include\winstl\winstl.h"
# End Source File
# End Group
# End Group
# Begin Group "xTests Header Files"

# PROP Default_Filter ""
# Begin Source File

SOURCE="$(XTESTS_C_ROOT)\include\xtests\implicit_link.h"
# End Source File
# Begin Source File

SOURCE="$(XTESTS_C_ROOT)\include\xtests\xtests.h"
# End Source File
# End Group
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
