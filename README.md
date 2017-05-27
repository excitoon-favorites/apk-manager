# Apk-Manager
## Decompile, recompile, sign, and install apk files.

### This Project is incomplete. More features are coming and more bugs will be fixed.

### Licensing
All files in ./Bin are used from the Android Development kit. Please view the [Android developement kit license](https://raw.githubusercontent.com/jordanbancino/apk-manager/master/AndroidSDKLicense.txt).

This excludes the following: signature.keystore, tee.exe, and win32gnu.dll

Tee.exe and win32gnu.dll are Licensed under the GNU General Public License version 2.0 (GPLv2). 

Signature.keystore is the default signing database used by APK-Manager, which is licensed under the Apache License 2.0.

### About APK-Manager
APK-Manager is a series of scripts to make developing Android apps easier. Currently, this project is only availible for Windows, but porting over to Bash is a work in progress.

### Downloads
You can Download the offical build For Windows [Here](https://github.com/jordanbancino/apk-manager/raw/master/Downloads/Binaries/apk-manager_Install.exe)
The installer contains both portable and system installations.
NOTE! This binary is over a month old! For a fresh version, use the executable source code.

An Offical build for Linux is in progress. 

### APK-Manager Requirements:
In order to run properly, apk-manager requires the following components to be installed:
- Java jdk (Tested on V8 build 121)
- Java jre (Tested on V8 build 121)

### Developement notes
So far, we still have a couple bugs to kill, so we haven't released an offial build yet. 
The Windows version was developed and tested on:
- Windows 7 (With all updates installed)
- Windows 10 (Creators Update)

The (Very Incomplete) Linux version was developed and tested on:
- Ubuntu 16.04.2
- Ubuntu 17.04

The last Windows binary was built over a month ago, and since then, Apk-Manager has changed a lot. Do not download this binary. Use the source code (as it is executable on a Windows computer) for the latest updates and bug fixes.
There are also many features lacking, such as a GUI. This program is not intended for use by the general public YET. We do plan on making the program much more feature-rich, and easier to use, along with automation support, to make it easier for non-developers. 

### Contribute
If you want to contribute, take a look at the issues page. All those issues won't fix themselves! Pick an issue that you want to work on. Fork my repository, then make your changes. Please make sure you have tested all your changes and that everything works properly. When everything looks good, submit a pull request. It will be reviewed, and if the issue is properly solved, the request will be merged.

Spot something odd that isn't on the issues page? Don't be afraid to submit a new issue. Then, if you think you can fix it, by all means, go for it! Just follow the directions above.

If you have questions, feel free to contact me at factshackstips@gmail.com
