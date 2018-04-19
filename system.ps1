#Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://goo.gl/hx3juk'))
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y cygwin conemu
cmd /c c:\tools\cygwin\cygwinsetup.exe -q -P curl
c:\tools\cygwin\bin\bash.exe -lc "curl -sL rawgit.com/transcode-open/apt-cyg/master/apt-cyg > /bin/apt-cyg && chmod +x /bin/apt-cyg"
c:\tools\cygwin\bin\bash.exe -lc "curl -sL rawgit.com/jrevolt/devsetup/master/user.sh | bash"
c:\tools\cygwin\bin\bash.exe -lc "apt-cyg install wget git zsh"
c:\tools\cygwin\bin\bash.exe -lc "curl -sL rawgit.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash"
