#!/bin/bash

version=2.7.1
sources="https://www.kernel.org/pub/software/scm/git/git-${version}.tar.xz"
manpages="https://www.kernel.org/pub/software/scm/git/git-manpages-${version}.tar.xz"

workdir="$(mktemp -d)"

cd $workdir

withlog() {
  echo "### $@" >> ~/devsetup.log
  "$@" >> ~/devsetup.log 2>&1
}

echo "For progress details, see ~/devsetup.log"

echo "Updating dependencies..."
withlog pact remove git
withlog pact install make autoconf python perl tcl curl gettext gcc-g++ libcurl-devel libexpat-devel libiconv gettext-devel libiconv-devel cygwin64-libiconv

echo "Downloading Git..."
curl -s $sources | tar xJv && cd git-${version} && (
  echo "Building and installing Git... (for progress details, see ~/devsetup.log)"
  withlog make configure
  withlog ./configure --prefix=/usr
  withlog make -i 
  withlog make -i install 
)

echo "Downloading Git docs..."
curl -s $manpages | withlogs tar xJv -C /usr/share/man --no-same-owner --no-overwrite-dir

git clone --recursive https://github.com/nvie/gitflow.git && cd gitflow && make install prefix=/usr

echo "DONE. Git version: $(git --version)"
