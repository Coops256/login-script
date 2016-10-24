cd C:\Users\CooperR\OneDrive\Documents\JavaFiles
set /p file="file name?"
javac %file%.java
java %file%
set /p again="run again?"
IF "%again%"=="yes" (
	cls
	cd C:\Users\CooperR\OneDrive\Documents\Launchers
	call "JavaLauncher.bat"
)
ELSE(
	exit
)
