#Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://goo.gl/hx3juk'))

# install Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# install Cygwin & ConEmu
choco install -y cygwin conemu

# update Cygwin setup
Invoke-WebRequest -Uri "https://www.cygwin.com/setup-x86_64.exe" -OutFile c:\tools\cygwin\cygwinsetup.exe

# install missing core packages
c:\tools\cygwin\bin\bash.exe -lc "rm -rf /http*; /cygdrive/c/tools/cygwin/cygwinsetup.exe -q --packages curl,wget,git,zsh"

# run customizations
c:\tools\cygwin\bin\bash.exe -lc "curl -sL rawgit.com/jrevolt/devsetup/master/custom.sh | bash"

# cleanup
c:\tools\cygwin\bin\bash.exe -lc "rm -rf /http*"
