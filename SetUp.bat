cls
@echo off

echo /-------------------------------------------------------------------------
echo.
echo                     �������
echo.
echo -------------------------------------------------------------------------/
set /p verVar="������汾��(���确3.0��):"
set /p dirVar="�������ļ���·��:"
cls

set installVar=Setup
set updateVar=Update


%~dp0\nsi\NSIS\makensis.exe /DPRODUCT_VERSION=%verVar% /DPRODUCT_DIR=%dirVar% %~dp0\Titan_Setup.nsi
md %~dp0\electron_app
echo --------------------------------------------------------------------------
echo ��������˳�
pause>nul
exit
