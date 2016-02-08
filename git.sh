#!/bin/bash

version=2.7.1
sources="https://www.kernel.org/pub/software/scm/git/git-${version}.tar.xz"
manpages="https://www.kernel.org/pub/software/scm/git/git-manpages-${version}.tar.xz"

workdir="$(mktemp -d)"

cd $workdir

pact remove git
pact install make autoconf python perl tcl curl gettext gcc-g++ libcurl-devel libexpat-devel libiconv gettext-devel libiconv-devel cygwin64-libiconv

echo "Downloading Git..."
curl -s $sources | tar xJv && cd git-${version} && (
  echo "Building and installing Git..." >&2
  make configure && ./configure --prefix=/usr
  make -i && make -i install 
) >> ~/devsetup.log

echo "Installing Git docs..."
curl -s $manpages | tar xJv -C /usr/share/man --no-same-owner --no-overwrite-dir >> ~/devsetup.log

git clone --recursive https://github.com/nvie/gitflow.git && cd gitflow && make install prefix=/usr

echo "DONE. Git version: $(git --version)"
