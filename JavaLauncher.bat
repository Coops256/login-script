cd C:\Users\CooperR\OneDrive\Documents\JavaFiles
set /p file="file name?"
:AGAIN
javac %file%.java
java %file%
set /p again="run again?"
IF "%again%"=="yes" (
	cls
	GOTO AGAIN
)
IF NOT "%again%"=="yes" (
	exit
)
