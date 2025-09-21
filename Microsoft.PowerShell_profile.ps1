oh-my-posh --init --shell pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/p10k_classic.omp.json | Invoke-Expression

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
Set-PSReadLineOption -Colors @{ "Default"="green" }
Set-PSReadLineOption -Colors @{ "Parameter"="Blue" }
Set-PSReadLineOption -Colors @{ "ContinuationPrompt"="yellow"}
Set-PSReadLineOption -Colors @{ "Operator"="green" }   
