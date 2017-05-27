@echo off
if not exist "apk-manager.bat" (
    if not exist "apk-manager.exe" (
        goto Fail
    )
    goto Fail
)

apk-manager.bat %1 %2 %3 | .\Bin\tee.exe apk-manager_debug.txt
echo. >> apk-manager_debug.txt
goto :eof

:Fail
echo Unable to proceed. Components Missing, or improperly placed.
goto :eof