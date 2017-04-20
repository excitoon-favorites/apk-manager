@echo off
:: we need to run a verify of our own
:: invoke apk-manager, but in debug mode, otherwise known as "log all output to a text file"
powershell ".\apk-manager %1 %2 | tee -Append apk-manager_debug.txt"
echo. >> apk-manager_debug.txt