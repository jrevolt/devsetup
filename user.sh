#!/bin/bash

if [[ -d $HOME ]]; then
  WHOME="/c/Users/$(whoami)"
  echo "Relocating $HOME -> $WHOME"
  tar cv . | tar x -C $WHOME 
  cd /
  rm -rf $HOME
  ln -s $WHOME $HOME
  ls -l $HOME
else
  echo "$HOME is not a directory. Assuming it is already relocated"
fi

