#!/bin/bash

cd /
[ -d $HOME ] && {
  rm -rf $HOME
  ln -s /c/Users/$(whoami) $HOME
}
