@echo off
echo Loading...
set runin=%cd%
cd "%userprofile%\apk-manager\"
apk-manager.bat %1 %2 %3
cd %runin%