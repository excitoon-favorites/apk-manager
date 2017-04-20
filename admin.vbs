Set UAC = CreateObject("Shell.Application")
set params = Wscript.Arguments
UAC.ShellExecute "apk-manager.bat", "install-system", "install-system", "runas", 1