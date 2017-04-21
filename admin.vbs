' Script to allow apk-manager to obtain admin permission.
' Currently does not work, This issue is being solved currently

' Set Variables
Set UAC = CreateObject("Shell.Application")
set params = Wscript.Arguments
' Open the prompt for Admin Permission
UAC.ShellExecute "apk-manager.bat", "install-system", "install-system", "runas", 1