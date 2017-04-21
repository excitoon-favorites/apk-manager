:: This is installed to %systemdrive%\Windows
:: it executes apk-manager from it's path. Only Used if installed to system
:: WARNING! This feature may be removed completely
@echo off
echo Loading...
set runin=%cd%
cd "%userprofile%\apk-manager\"
apk-manager.bat %1 %2 %3
cd %runin%