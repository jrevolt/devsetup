#Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://goo.gl/hx3juk'))
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y cygwin conemu
cmd /c c:\tools\cygwin\cygwinsetup.exe -q -P curl,wget,git
c:\tools\cygwin\bin\bash.exe -lc "cd /tmp && wget rawgit.com/transcode-open/apt-cyg/master/apt-cyg && install apt-cyg /bin"
c:\tools\cygwin\bin\bash.exe -lc "curl -sL rawgit.com/jrevolt/devsetup/blob/master/user.sh | bash"
