#Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://goo.gl/hx3juk'))
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y cygwin conemu
start /wait c:\tools\cygwin\cygwinsetup.exe -q -P curl,wget,git
cygwin
