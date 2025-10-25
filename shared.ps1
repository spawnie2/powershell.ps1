# Terminal look
oh-my-posh --init --shell pwsh --config 'C:\Users\jbarthel\AppData\Roaming\rose-pine-omp\dawn.omp.json' | Invoke-Expression

# Autocomplete for git commands
Import-Module git-completion

# Autocomplete for general commands, coloring, and other utility.
Import-Module PSReadLine

Set-PSReadLineOption -Colors @{ "Default"="cyan" }
Set-PSReadLineOption -Colors @{ "Parameter"="white" }
Set-PSReadLineOption -Colors @{ "ContinuationPrompt"="cyan"}
Set-PSReadLineOption -Colors @{ "Operator"="yellow" }   
Set-PSReadLineOption -Colors @{ "Emphasis"="red" }
Set-PSReadLineOption -Colors @{ "Number"="white" }
Set-PSReadLineOption -Colors @{ "String"="green" }
Set-PSReadLineOption -Colors @{ "Command"="green"}

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

# Set nvim config path to a more practical place
$env:XDG_CONFIG_HOME="$HOME"

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

