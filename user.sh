#!/bin/bash

if [ -L $HOME ]; then
  echo "$HOME seems to be already relocated:"
  ls -lad $HOME
  exit
fi

cd $HOME
WHOME="/cygdrive/c/Users/$(whoami)"
echo "Relocating $HOME -> $WHOME"
timestamp="$(date +%Y%m%d-%H%M%S)"
for i in $(find -type f); do
  [ -f "${WHOME}/${i}" ] && mv -v "${WHOME}/${i}" "${WHOME}/${i}.${timestamp}"
done
tar cv . | tar x -C $WHOME 
cd /
rm -rf $HOME
ln -s $WHOME $HOME
ls -lad $HOME

