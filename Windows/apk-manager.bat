@echo off
:: Verify The parameters
:paramchk
if "%1"=="" echo Missing Parameters. && echo For help, use %0 help. && goto :eof
if "%1"=="verify" goto verify
if "%1"=="decompile" goto verify
if "%1"=="compile" goto verify
if "%1"=="help" goto help
if "%1"=="about" goto about
if "%1"=="install" goto install
if "%1"=="devices" goto devices
if "%1"=="sign" goto sign
if "%1"=="keystore" goto keystore
echo That is not valid input.
echo For help, use %0 help
goto :eof
:: verify everything is in the right place.
:: APK-Manage cannot work properly without these files
:verify
:: This block was an expiriment that thew errors, so for now, it is not executed.
:: it will verify that the name has not changed

echo Verifying file name...
if "%~nx0"=="apk-manager.bat" goto continue
if "%~nx0"=="apk-manager.exe" goto continue
echo Unfortunatly, The program cannot operate under a different name. Please rename this file to "apk-manager.bat", or "apk-manager.exe", Depending on which version you downloaded.
goto :eof
:continue
:: Check for the existance of all external resources.
echo Verifying Run Path...
for /f "tokens=2" %%a in ("%cd%") do (
    echo Error. The path you are running %0 from contains spaces.
    echo Unfortunatly, the program cannot operate properly when there is spaces in it's run in directory
    echo Please move %0 and all of it's assets to a directory that's path contains no spaces, such as %systemdrive%\Apk-Manager\
    goto :eof
)
echo Verifying Java JDK...
if not exist "%systemdrive%\Program Files\Java\jdk*" echo Java JDK not properly installed. && goto :eof
echo Verifying Java JRE...
if not exist "%systemdrive%\Program Files\Java\jre*" echo   Not in Program files. Checking 64 bit location...
if not exist "%systemdrive%\Program Files (x86)\Java\jre*" echo Java JRE not properly installed. && goto :eof
echo Java is installed properly.
echo Verifying Powershell...
if not exist "%systemdrive%\Windows\System32\WindowsPowershell\v*" echo Powershell is not properly installed on this machine. Perhaps you are using Windows Vista or below? && goto :eof
:: verify the required files exist in their right locations
echo Verifying Required Binaries...
echo - adb.exe
if not exist ".\Bin\adb.exe" goto comfail
echo - adbwinapi.dll
if not exist ".\Bin\AdbWinApi.dll" goto comfail
echo - adbwinusbapi.dll
if not exist ".\Bin\AdbWinUsbApi.dll" goto comfail
echo - apktool.jar
if not exist ".\Bin\apktool.jar" goto comfail
echo - keytool.exe 
if not exist ".\Bin\keytool.exe" goto comfail
echo - signature.keystore
if not exist ".\Bin\Signature.keystore" goto comfail
echo - zipalign.exe 
if not exist ".\Bin\zipalign.exe" goto comfail
echo - tee.exe 
if not exist ".\Bin\tee.exe" goto comfail
echo - win32gnu.dll
if not exist ".\Bin\win32gnu.dll" goto comfail
echo.



echo.
echo Loading Configurations...
if exist "apk-manager_config.bat" (
    echo Configuration file exists.
    echo Loading config data...
    Call apk-manager_config.bat
    echo Configurations Loaded.
) else (
    echo The configuration file "apk-manager_config.bat" does not exist.
    echo Aborting...
    goto :eof
)
echo.
echo Verifying Configurations...
echo Powershell : %PowerShell%
echo Java (32-bit) : %Java32%
echo Java (64-bit) : %Java64%
echo Java Developement Kit : %JDK%
echo.
if "%PowerShell%"=="" goto configfail
if "%Java32%"=="" goto configfail
if "%Java64%"=="" goto configfail
if "%JDK%"=="" goto configfail

if "%KEYALIAS"=="" goto configfail
if "%RUNIN%"=="" set RUNIN=%cd%
goto verifynext

:configfail
echo The configurations were not set up properly.
echo Aborting...
goto :eof

:verifynext
echo All Components are Verified and ready for use.
echo Checking OS Version...
if %PROCESSOR_ARCHITECTURE%==x86 (
    echo OS Version is : 32 bit
    echo Configuring Java...
    set Java="%Java32%"
) else (
    echo OS Version is : 64 bit
    echo Configuring Java...
    set Java="%Java64%"
)
echo The Java location was set to %Java%
echo Verification complete. All components are configured properly
if "%1"=="verify" (
    goto :eof
) else (
    echo Proceeding with operation : %1 ...
    goto %1
)

:decompile
Call :verify
:: begin the decompile proccess
:: make sure we are working with a APK file 
set tempvar=%2
echo  Attempting Decompile of '%tempvar%'
echo With extension '%tempvar:~-4%'
echo Actual file name: %tempvar:~0,-4%
if not "%tempvar:~-3%"=="apk" echo That's not an APK file! && goto :eof
:: make sure it exists
if not exist "%2" echo The APK file specified does not exist. && goto :eof
:: make sure the dir to decompile to doesn't exist
if exist "%tempvar:~0,-4%" (
    echo The directory to decompile to already exists.
	echo Renaming it now...
	rename "%tempvar:~0,-4%" "%tempvar:~0,-4%-%random%"
)
echo Installing Framework to APK...
cd %Java% && cd .\bin
Java.exe -jar %RUNIN%\Bin\apktool.jar if %RUNIN%\%2
echo Decompiling APK...
Java.exe -jar %RUNIN%\Bin\apktool.jar d %RUNIN%\%2 -o %RUNIN%\%tempvar:~0,-4%
cd %RUNIN%
echo.
echo.
echo.
echo The APK has been decompiled.
goto :eof

:compile
Call :verify
:: compile an apk from source folder 
if not exist "%2" echo That source folder doesn't exist. && goto :eof
echo Checking for potential file collisions...
if exist "compiled.apk" (
    echo compiled.apk exists, it will be renamed temporarily
    rename compiled.apk compiled_1.apk
    set colfin=1
)
if exist "final.apk" (
    echo final.apk exists, it will be renamed temporarily
    rename final.apk final_1.apk
    set colfin=1
)
echo Building APK from Source Folder...
cd %Java% && cd .\bin
java.exe -jar %RUNIN%\Bin\apktool.jar b %RUNIN%\%2 -o %RUNIN%\%2\dist\%2.apk
echo Extracting APK from Compiled Location...
cd %RUNIN%
move .\%2\dist\%2.apk Compiled.apk
echo Aligning the APK...
.\Bin\zipalign -v 4 Compiled.apk Final.apk
echo Cleaning up...
del compiled.apk
echo Signing APK...
cd %JDK% && cd .\bin
echo Keystore Alias : %KEYSTOREALIAS%
echo If you have not modified the keystore, then the password is "compile"
echo If you have modified the keystore, then enter your password.
jarsigner.exe -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore %RUNIN%\Bin\signature.keystore %RUNIN%\final.apk %KEYSTOREALIAS%
echo Wrapping up...
cd /d %RUNIN%
if exist "%2_Compiled.apk" (
    echo The compiled apk file already exists.
    echo Renaming old compiled apk...
    rename "%2_Compiled.apk" "%2_Compiled_Old_%random%%random%.apk"
)
rename final.apk %2_Compiled.apk
if "%colfin%"=="1" (
    echo Fixing file names...
    if exist "compiled_1.apk" rename compiled_1.apk compiled.apk
    if exist "final_1.apk" rename final_1.apk final.apk
)
echo.
echo.
echo.
echo The APK Was Compiled.
goto :eof

:comfail
:: at this point some components are missing, so operation cannot continue
echo The required components were not found in .\Bin
goto :eof

:about
:: now that I look back, I'm not sure this section is nessesary.
:: it may be eliminated completly in future commits
echo Creator: Jordan Bancino
echo Original File name: apk-manager
echo Current file name: %0
echo.
echo Version: 1.0 (Unreleased)
echo This software is unreleased. It could be unstable. Jordan Bancino is not responsible for any damage to your machine by use of this program
goto :eof

:install
Call :verify
:: using ADB, install an apk to a connected device
if "%2"=="" echo You must specify an APK File to install. && goto :eof
if not exist "%2" echo That APK file was not found. && goto :eof
echo Installing APK to Connected Device...
echo Executing Commands...
echo Running Install Operation...
.\Bin\adb.exe install "%2"
echo.
echo The Operation was completed
echo If the Operation failed, Make sure your device:
echo -Has The proper drivers installed on your system
echo -Has ADB Debugging on in it's settings
echo -Is properly connected to the PC
goto :eof

:devices
call :verify
:: checks the connected devices.
echo Checking For connected Devices...
echo Loading Device Drivers...
echo Starting ADB Daemon...
.\bin\adb.exe start-server
echo Listing Devices...
echo.
.\Bin\Adb.exe devices
echo.
echo Operation Completed.
goto :eof

:sign
call :verify
echo Checking APK File...
if not exist "%2" echo The Specified APK does not exist. && goto :eof
echo Checking Tools...
Call :Verify
cd %JDK% && cd .\bin
echo If you have not modified the keystore, then the password is "compile"
echo If you have modified the keystore, then enter your password.
jarsigner.exe -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore %RUNIN%\Bin\signature.keystore %RUNIN%\final.apk %KEYSTOREALIAS%
echo Wrapping up...
cd /d %RUNIN%
echo Done.
echo.
echo.
echo The APK file Was signed.
goto :eof


:: CUSTOM KEYSTORE SUPPORT
:keystore
call :verify
echo.
if "%2"=="" (
    echo Please argue a keystore to use.
    goto :eof
)
if not exist "%2" (
    echo That keystore doesn't exist. Please argue a valid keystore.
    goto :eof
)
:: the keystore file does exist
echo Checking for previous backups of keystore...
if exist ".\Bin\signature.keystore.backup" rename ".\Bin\signature.keystore.backup" ".\Bin\signature.keystore.backup%random%%random%" && echo Renaming old backup...
echo Backing up current keystore...
cd .\Bin && rename "signature.keystore" "signature.keystore.backup" && cd ..\
echo Copying new keystore to .\Bin...
copy "%2" ".\Bin\"
echo Verifying keystore name...
cd .\Bin && rename "%2" "signature.keystore" && cd ..\
echo Done.
echo Please enter your Keystore's alias in "apk-manager_config.bat"
notepad apk-manager_config.bat
goto :eof

:help
if not exist "helpdoc.txt" (
    echo The help documentary does not appear to be installed.
	echo Error: HelpDoc.txt is missing
	echo You can view and download the help docs from Github at https://www.gitub.com/jordanbancino/apk-manager
	start https://github.com/jordanbancino/apk-manager/blob/master/Windows/HelpDoc.txt
	goto :eof
)
type helpdoc.txt
goto :eof