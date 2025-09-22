oh-my-posh --init --shell pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/catppuccin_mocha.omp.json | Invoke-Expression

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Import-Module PSReadLine
Set-PSReadLineOption -Colors @{ "Default"="cyan" }
Set-PSReadLineOption -Colors @{ "Parameter"="white" }
Set-PSReadLineOption -Colors @{ "ContinuationPrompt"="cyan"}
Set-PSReadLineOption -Colors @{ "Operator"="yellow" }   
Set-PSReadLineOption -Colors @{ "Emphasis"="red" }
Set-PSReadLineOption -Colors @{ "Number"="white" }
Set-PSReadLineOption -Colors @{ "String"="green" }
Set-PSReadLineOption -Colors @{ "Command"="cyan"}
