oh-my-posh --init --shell pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/catppuccin_mocha.omp.json | Invoke-Expression

Import-Module PSReadLine
Set-PSReadLineOption -Colors @{ "Default"="cyan" }
Set-PSReadLineOption -Colors @{ "Parameter"="white" }
Set-PSReadLineOption -Colors @{ "ContinuationPrompt"="cyan"}
Set-PSReadLineOption -Colors @{ "Operator"="yellow" }   
Set-PSReadLineOption -Colors @{ "Emphasis"="red" }
Set-PSReadLineOption -Colors @{ "Number"="white" }
Set-PSReadLineOption -Colors @{ "String"="green" }
Set-PSReadLineOption -Colors @{ "Command"="cyan"}
