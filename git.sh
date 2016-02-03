#!/bin/bash

version=2.7.0
sources="https://www.kernel.org/pub/software/scm/git/git-${version}.tar.xz"
manpages="https://www.kernel.org/pub/software/scm/git/git-manpages-${version}.tar.xz"

pact remove git
pact install make autoconf python perl tcl curl gettext gcc-g++ libcurl-devel libexpat-devel libiconv gettext-devel libiconv-devel cygwin64-libiconv

curl -s $sources | tar xJv && cd git-${version} && (
  make configure && ./configure --prefix=/usr
  make -i && make -i install 
)
curl -s $manpages \
  | tar xJv -C /usr/share/man --no-same-owner --no-overwrite-dir
  
git --version
