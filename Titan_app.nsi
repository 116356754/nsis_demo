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
DetailPrint "OS�汾Ϊ: windows 7+"
${Else}
MessageBox MB_OK "������ֻ�ܰ�װ�� Windows 7 �汾���ϵĲ���ϵͳ��"
Abort
${EndIf}

ReadRegStr $R0 HKLM "SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\${EXE_NAME}.exe" "Path"
Strcmp $R0 "" 0 NoAbort
MessageBox MB_ICONEXCLAMATION|MB_OK "δ�ҵ�����װĿ¼��������������װ����������б����³���"
Abort
NoAbort:
DetailPrint "�����Ѿ���װ"
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