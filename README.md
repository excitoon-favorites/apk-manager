# Apk-Manager
## Decompile, recompile, sign, and install apk files.

### This Project is incomplete. More features are coming and more bugs will be fixed.

### Downloads
Download APK Manager for your platform [Here](https://github.com/jordanbancino/apk-manager/tree/master/Downloads)

### Licensing
All files in ./Bin are used from the Android Development kit. Please view the [Android developement kit license](https://raw.githubusercontent.com/jordanbancino/apk-manager/master/AndroidSDKLicense.txt).

Except the following:
- Tee.exe
- Win32GNU.dll

These are part of the [WinBash Project](https://sourceforge.net/projects/win-bash/) and are licensed under the [GNU General Public License v2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html).

- Signature.keystore

A Keystore created by Jordan Bancino, Licensed under the Apache 2.0 License, used for signing compiled APK-Files. This Keystore is to be used ONLY by APK-Manager for signing compiled APK-Files. If you wish to create your own keystore, use the Android app [ZipSigner](https://play.google.com/store/apps/details?id=kellinwood.zipsigner2)


### About APK-Manager
APK-Manager is a series of scripts to make developing Android apps easier. Currently, this project is only availible for Windows, but porting over to Bash is a work in progress.

Features:
- Decompile an APK File
- Compile an APK File from a source folder
- Sign an APK File (With the default signing keystore, or your own Keystore.)


### APK-Manager Requirements:
A Windows PC running:
- Windows 7
- Windows 8
- Windows 8.1
- Windows 10

The Windows version of Apk-Manger has not been tested on WINE on Linux. Please, try it and let me know how it works.

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


There are many features lacking, such as a GUI. This program is not intended for use by the general public YET. We do plan on making the program much more feature-rich, and easier to use, along with automation support, to make it easier for non-developers. 

### Contribute
If you want to contribute, take a look at the issues page. All those issues won't fix themselves! Pick an issue that you want to work on. Fork my repository, then make your changes. Please make sure you have tested all your changes and that everything works properly. When everything looks good, submit a pull request. It will be reviewed, and if the issue is properly solved, the request will be merged.

Spot something odd that isn't on the issues page? Don't be afraid to submit a new issue. Then, if you think you can fix it, by all means, go for it! Just follow the directions above.

If you have questions, feel free to contact me at factshackstips@gmail.com

What I need (and what you can contribute):
- Fixed Issues.
- A Build for Linux (Main Target: Ubuntu)
- A Build for Mac (Long Term Project)
- A Website. This will be hosted in this repository. I prefer following the Google Material Guidlines. Templates and examples availible at [GetMDL.io](https://getmdl.io)

If you can offer any of this, please do. I would like to continue to develop Apk-Manager
