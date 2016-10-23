set repo="https://github.com/Coops256/login-script"
set /p tempDest="where to clone the repo?"
set /p startup="where to place startup.bat?"
set /p logon="where to place logon.ps1?"
set /p launchers="where to place javaLauncher.bat and scriptLauncher.bat?"

git clone %repo% %tempDest%

cd %tempDest%

move %tempDest%\startup.bat %startup%
move %tempDest%\logon.ps1 %logon%
move %tempDest%\*.bat %launchers%

set /p exit="Press any key to exit"