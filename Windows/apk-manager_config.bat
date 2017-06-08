@echo off
:: This is the apk-manager configuration file. It is called when apk-manager is executed.

:: Set the locations of the following items below
Set PowerShell=C:\Windows\System32\Windows Powershell\v*\
Set Java32=C:\Program Files\Java\jre*\
Set Java64=C:\Program Files (x86)\Java\jre*\
Set JDK=C:\Program Files\Java\jdk*\
:: ONLY IF YOU HAVE MODIFIED THE KEYSTORE: Adjust KEYSTOREALIAS for your keystore's alias
Set KEYSTOREALIAS=Key





:: DO NOT MODIFY BELOW THIS LINE
Set RUNIN=%cd%
goto :eof