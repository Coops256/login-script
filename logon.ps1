function menu {

	$menuText = " 
				Menu
				___________________________
					   1) Copy
					   2) Task Manager
					   3) launcher
					   4) telnet
					   5) compilers
					   Q) exit
				"
	$telnetLinks = "Helpful Links:
						rainmaker.wunderground.com :: weather via telnet!
						india.colorado.edu 13 (Get the time) :: get the time
						telehack.com 23 :: Telehack
						telehack.com :: Telehack - web
						freechess.org 5000 :: freechess.org
						towel.blinkenlights.nl 23 :: Star Wars asciimation
						towel.blinkenlights.nl 666 :: The Bofh Excuse Server
						mtrek.com:1701 :: mtrek (star trek themed game)
						xmltrek.com:1701 :: xmltrek (star trek themed game)"
	cls
	$request = Read-Host -prompt "$menuText"
	switch ($request){
		'1'{
			cls
			mover
		}
		'2'{
			cls
			TaskManager
		}
		'3'{
			cls
			launcher
		}
		'4'{
			cls
			Write-Host $telnetLinks
			$choice = Read-Host -prompt 'Where to go?'
			telnetLauncher -link $choice
		}
		'5'{
			cls
			$choice = Read-Host -prompt 'Java or Script?'
			Compiler -type $choice
		}
		'Q'{
			exit
			exit
		}
	}
	
}

function back{
	$again = Read-Host -prompt 'Return to Menu?'
	IF( $again -contains "yes" -or $again -contains "y"){
		menu
	}ELSE{
		exit
		exit
	}
}

function mover{
	Write-Host "69"
}

function TaskManager{
	Get-Process
	$action = Read-Host -prompt 'What would you like to do?'
	IF( $action -contains "kill"){
		$kill = Read-Host 'What process?'
		kill -processname $kill
		Write-Host "done"
		back
	}
	ELSE{
		Write-Host "not valid"
		back
	}
}

function launcher{
		function launch ($prgm, $location){
		cd $location
		$directory = $location + $prgm
		& $directory
		Write-Host "launching $prgm ..."
		}

	#launch -prgm eclipse.exe -location "C:\Users\CooperR\eclipse\java-neon\eclipse\"
	#launch -prgm chrome.exe -location "C:\Program Files (x86)\Google\Chrome\Application\"
	launch -prgm launcher.exe -location "C:\Program Files (x86)\Opera beta\"
	launch -prgm notepad++.exe -location "C:\Program Files (x86)\Notepad++\"
	
	Write-Host "...done"
	
	back
}

function telnetLauncher ($link){
	IF($link -eq $null){
		$link = rainmaker.wunderground.com
	}
	
	& cmd.exe /c telnet 
	#& telnet.exe /c o $link
	Write-Host "o $link"
}

function Compiler ($type){
	cd C:\Users\CooperR\OneDrive\Documents\Launchers
	IF($type -contains "Script" -or $type -contains "script"){
		&".\ScriptLauncher.bat"
		back
	}ELSE{
		&".\JavaLauncher.bat"
		back
	}
}

menu