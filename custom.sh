#!/bin/bash

rm -rf /http*
/cygdrive/c/tools/cygwin/cygwinsetup.exe -q --wait --packages curl,wget
rm -rf /http*

timestamp="$(date +%Y%m%d-%H%M%S)"

echo "## Installing apt-cyg utility..."
curl -sL rawgit.com/transcode-open/apt-cyg/master/apt-cyg > /bin/apt-cyg && chmod +x /bin/apt-cyg

echo "## Installing Git, Zsh..."
apt-cyg install git zsh

echo "## Relocating user home..."
curl -sL rawgit.com/jrevolt/devsetup/master/user.sh | bash

echo "## Installing oh-my-zsh..."
[ -d ~/.oh-my-zsh ] && mv -v ~/.oh-my-zsh ~/.oh-my-zsh.${timestamp}
curl -sL rawgit.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

echo "## Enabling ZSH for user $(whoami)..."
[ -f /etc/passwd ] && mv -v /etc/passwd /etc/passwd.${timestamp}
mkpasswd -c | sed 's/bash$/zsh/' > /etc/passwd
