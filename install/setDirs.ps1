$tempDir = Get-Location
$user = Read-Host -prompt 'What Userfile?'
$dirs = Get-Content "$tempDir\$user"
$names = @("homeDir","startupDir","logondir","launcherDir")
$dirMap = @{homeDir = " ";logonDir = " ";startupdir = " ";launcherDir = " "}
Write-Host $dir.GetType

for($i=0;$i -le $dirs.Length-1;$i++){
	Write-Host $dirs[$i]
	Write-Host $names[$i]
	$dirMap.Set_Item($names[$i],$dirs[$i])
}

Move-Item -Path $tempDir\Repo\startup.bat -Destination $dirMap.Get_Item($names[1]) 
Move-Item -Path $tempDir\Repo\logon.ps1 -Destination $dirMap.Get_Item($names[2]) 
Move-Item -Path $tempDir\Repo\JavaLauncher.bat -Destination $dirMap.Get_Item($names[3]) 
Move-Item -Path $tempDir\Repo\ScriptLauncher.bat -Destination $dirMap.Get_Item($names[3]) 
Move-Item -Path $tempDir\Repo\* -Destination $dirMap.Get_Item($names[0])

Write-Host "...done"
