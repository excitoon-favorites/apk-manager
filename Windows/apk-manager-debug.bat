@echo off
:: we need to run a verify of our own

:: invoke apk-manager, but in debug mode, otherwise known as "log all output to a text file"
:: This only works if you have windows 7 or higher, because of PowerShell
powershell ".\apk-manager %1 %2 | tee -Append apk-manager_debug.txt"
echo. >> apk-manager_debug.txt
:: For some reason, all output by the JAVA Programs used in this project output Asian characters.
:: we are working on this