set repo="https://github.com/Coops256/login-script"
PowerShell -Command "Set-ExecutionPolicy Unrestricted" -Scope CurrentUser
git clone %repo% %~dp0\Repo
powershell.exe -noexit "& '.\setDirs.ps1'"
set /p exit="Press enter to exit"