#Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://goo.gl/hx3juk'))
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y cygwin conemu
c:\tools\cygwin\bin\bash.exe -lc "curl -sL rawgit.com/jrevolt/devsetup/master/custom.sh | bash"
