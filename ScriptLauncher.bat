PowerShell -Command "Set-ExecutionPolicy Unrestricted" -Scope CurrentUser
cd C:\Users\CooperR\OneDrive\Documents
set /p name="filename?"
powershell.exe -noexit "& '.\%name%.ps1'"
set /p again="run again?"
IF "%again%"=="yes" (
	cls
	cd C:\Users\CooperR\OneDrive\Documents\Launchers
	call "ScriptLauncher.bat"
)
ELSE (
	exit
)