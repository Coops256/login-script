function menu{
	cls
	$menu = "
		    Options
	--------------------------------
	1) Launch Programs
	2) Copy Files
	3) Task Manager
	4) Message
	5) Quit
	"
	cls
	$prompt =  Read-Host -prompt "$menu"

	Switch ($prompt){
		"1"{
			launch
		}
		"2"{
			duplicate
		}
		"3"{
			manager
		}
		"4"{
			message
		}
		"5"{
			quit
		}
		default{
			menu
		}
	}
}

function launch{
	function Launch($program, $location){
		cd $location
		$path = $location + $program
		& $path
	}
	Write-Host "Launching Eclipse..."
	Launch -program "eclipse.exe" -location "H:\AP Computer Science\Eclipse\eclipse\"
	Write-Host "Launching Chrome..."
	Launch -program "chrome.exe" -location "C:\Program Files (x86)\Google\Chrome\Application\"
	Write-Host "Launching Windows Explorer..."
	Launch -program "explorer.exe" -location "C:\Windows\SysWOW64\"
	menu
}

function duplicate{
	cd K:\Technology_Education\Student_Data\SARNOWSKI\Share\APCS\
	ls
	$loc = Read-Host -prompt "What file to copy?"
	Write-Host "Copying..."
	Copy-Item .\"$loc" "C:\Users\asingh11\Desktop" -recurse -container
	Write-Host "Done."
	menu
}

function manager{
	Get-Process
	$quit = Read-Host -prompt "What program would you like to force-quit?"
	Get-Process $quit | Stop-Process -force
	menu
}

function message{
	$name = Read-Host -prompt "What comptuter would you like to send the message to?"
	$msg = Read-Host -prompt "Message?"
	
	Invoke-Command -ComputerName $name -ScriptBlock{
		 $CmdMessage = {C:\windows\system32\msg.exe * $msg}
		 $CmdMessage | Invoke-Expression
	}
}

function quit{
	Get-Process powershell | Stop-Process -force
}

menu