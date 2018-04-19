#!/bin/bash

echo "## Installing apt-cyg utility..."
curl -sL rawgit.com/transcode-open/apt-cyg/master/apt-cyg > /bin/apt-cyg && chmod +x /bin/apt-cyg

echo "## Relocating user home..."
curl -sL rawgit.com/jrevolt/devsetup/master/user.sh | bash

echo "## Installing oh-my-zsh..."
curl -sL rawgit.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

echo "## Enabling ZSH for user $(whoami)..."
mkpasswd -c | sed 's/bash$/zsh/' > /etc/passwd
