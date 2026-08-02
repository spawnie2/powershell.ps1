# Terminal look 
Invoke-Expression (&starship init powershell)

# Autocomplete for general commands, coloring, and other utility.
Import-Module PSReadLine

Set-PSReadlineOption -Colors @{ "InlinePrediction"="DarkGray"}
Set-PSReadlineOption -Colors @{ "Command"="DarkCyan"}
Set-PSReadlineOption -Colors @{ "Parameter"="Green"}
Set-PSReadlineOption -Colors @{ "String"="Yellow"}

# Colors for fd, etc...
$env:LS_COLORS = $(vivid.exe generate rose-pine-dawn)

# Mute irritating beeps
Set-PSReadlineOption -BellStyle None

# More readable color for directories
$PSStyle.FileInfo.Directory = "`e[31;1m"

# Fix a bug where sometimes nvim is not cleared after exiting.
$env:TERM='xterm-256color'

# Make wsl start in home
function wslh {
    wsl ~ @args
}

function gst {
	git status
}

function gog {
	param ( $1 )
	git lg $1
}

function gaa {
	git add *
}

# Set nvim config path to a more practical place
$env:XDG_CONFIG_HOME="$HOME"

# eza
function ezal { 
	param (
		$1
	)
	eza --icons -a $1
}

# eza
function ezal { 
	param (
		$1
	)
	eza --icons -a $1
}

function ezall { 
	param (
		$1
	)
	eza --icons -al $1
}

# Aliases
sal -Name ls -Value ezal
sal -Name ll -value ezall
sal -Name fp -Value FPilot.exe
sal -Name n -Value nvim 
sal -Name cat -Value bat
sal -Name grep -Value rg
