#!/bin/bash

[ -d $HOME ] && {
  tar cv . | tar x -C /c/Users/$(whoami) 
  cd /
  rm -rf $HOME
  ln -s /c/Users/$(whoami) $HOME
}
