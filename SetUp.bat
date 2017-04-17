cls
@echo off

echo /-------------------------------------------------------------------------
echo.
echo                     打包程序
echo.
echo -------------------------------------------------------------------------/
set /p verVar="请输入版本号(例如‘3.0’):"
set /p dirVar="请打包的文件夹路径:"
cls

set installVar=Setup
set updateVar=Update


%~dp0\nsi\NSIS\makensis.exe /DPRODUCT_VERSION=%verVar% /DPRODUCT_DIR=%dirVar% %~dp0\Titan_Setup.nsi
md %~dp0\electron_app
echo --------------------------------------------------------------------------
echo 按任意键退出
pause>nul
exit
