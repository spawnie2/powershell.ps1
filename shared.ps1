# Terminal look
oh-my-posh --init --shell pwsh --config "$HOME\AppData\Roaming\rose-pine-omp\dawn.omp.json" | Invoke-Expression

# Autocomplete for git commands
Import-Module git-completion

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
	eza -a -T -L=1 --icons $1
}
sal -Name ls -Value ezal

# Aliases
sal -Name fp -Value FPilot.exe
sal -Name n -Value nvim 

# yazi
$env:YAZI_FILE_ONE="C:\Program Files\Git\usr\bin\file.exe"
$env:EDITOR="nvim"
function y {
    $tmp = (New-TemporaryFile).FullName
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
}

