Set-ExecutionPolicy RemoteSigned

# Install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

$command = @'

Install-PackageProvider -Name NuGet -Force
Install-Module -Name PSWindowsUpdate -Force
Import-Module -Name PSWindowsUpdate
Add-WUServiceManager -ServiceID 7971f918-a847-4430-9279-4a52d1efe18d -Confirm:$false
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot
Get-WuInstall -AcceptAll -IgnoreReboot
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot
Get-WuInstall -AcceptAll -IgnoreReboot

'@
Start-Process powershell -ArgumentList 'Command',$command

choco install powershell-core googlechrome firefox foxitreader corretto8jre corretto21jdk libreoffice-fresh notepadplusplus obs-studio sysinternals vlc 7zip -y
