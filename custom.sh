#!/bin/bash

timestamp="$(date +%Y%m%d-%H%M%S)"

echo "## Installing apt-cyg utility..."
curl -sL rawgit.com/transcode-open/apt-cyg/master/apt-cyg > /bin/apt-cyg && chmod +x /bin/apt-cyg

echo "## Relocating user home..."
curl -sL rawgit.com/jrevolt/devsetup/master/user.sh | bash

echo "## Installing oh-my-zsh..."
[ -d ~/.oh-my-zsh ] && mv -v ~/.oh-my-zsh ~/.oh-my-zsh.${timestamp}
curl -sL rawgit.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

echo "## Enabling ZSH for user $(whoami)..."
[ -f /etc/passwd ] && mv -v /etc/passwd /etc/passwd.${timestamp}
mkpasswd -c | sed 's/bash$/zsh/' > /etc/passwd

echo "## Installing winpty..."
[ -f /usr/local/bin/winpty ] && echo "... already installed!" || \
  curl -sL https://github.com/rprichard/winpty/releases/download/0.4.3/winpty-0.4.3-cygwin-2.8.0-x64.tar.gz \
    | tar xzv --strip-components=2 -C /usr/local/bin winpty-0.4.3-cygwin-2.8.0-x64/bin
    
