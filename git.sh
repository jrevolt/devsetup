#!/bin/bash

version="${GIT_VERSION:-2.10.0}"
prefix="/usr/local"
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
withlog pact install make autoconf python perl tcl curl gettext gcc-g++ libcurl-devel libexpat-devel libiconv gettext-devel libiconv-devel cygwin64-libiconv

echo "Downloading Git..."
curl -s $sources | withlog tar xJv && cd git-${version} && (
  echo "Building and installing Git..."
  withlog make configure
  withlog ./configure --prefix="$prefix"
  withlog make -i 
  withlog pact remove git
  withlog make -i install 
) 

echo "Downloading Git docs..."
curl -s $manpages | withlog tar xJv -C /usr/share/man --no-same-owner --no-overwrite-dir

echo "Downloading and installing GitFlow..."
withlog git clone --recursive https://github.com/nvie/gitflow.git && cd gitflow && withlog make install prefix="$prefix"

echo "DONE. Git version: $(git --version)"
