;
HM NIS Edit Wizard helper defines

!define EXE_NAME "Titan"
!define PRODUCT_VERSION "1.5.1"
!define APP_DIR "electron\resources"

; MUI 1.67 compatible ------
!include "MUI.nsh"
!include "nsProcess.nsh"
!include "WinVer.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "logo.ico"

!insertmacro MUI_PAGE_INSTFILES

!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\${EXE_NAME}.exe"

; MUI end ------

OutFile "${EXE_NAME}_${PRODUCT_VERSION}_app.exe"

Function .onInit

SetSilent silent
${nsProcess::KillProcess} "${EXE_NAME}.exe" $R2
Sleep 2000

${If} ${AtLeastWin7}
DetailPrint "OS版本为: windows 7+"
${Else}
MessageBox MB_OK "本程序只能安装在 Windows 7 版本以上的操作系统！"
Abort
${EndIf}

ReadRegStr $R0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\${EXE_NAME}.exe" "Path"
Strcmp $R0 "" 0 NoAbort
MessageBox MB_ICONEXCLAMATION|MB_OK "未找到程序安装目录，请运行完整安装程序后再运行本更新程序！"
Abort
NoAbort:
DetailPrint "程序已经安装"
FunctionEnd

Section "MainSection" SEC01
SetOverwrite on
ReadRegStr $R0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\${EXE_NAME}.exe" "Path"

SetOutPath "$R0\resources\"
File /r "${APP_DIR}\*.*"
SectionEnd

Function .onInstSuccess
Exec "$R0\${EXE_NAME}.exe"
FunctionEnd