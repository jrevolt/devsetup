#!/bin/bash
set -u

fail() { echo "$@"; exit 1; }

if [ -L $HOME ]; then
  echo "## $HOME seems to be already relocated:"
  ls -lad $HOME
  exit
fi

WHOME="/cygdrive/c/Users/$(whoami)"

#QDH
WHOME="$WHOME/QDH"
mkdir -p $WHOME

echo "## Relocating $HOME -> $WHOME"
timestamp="$(date +%Y%m%d-%H%M%S)"
cd $HOME || fail "Missing $HOME"

echo "### Backup existing files..."
for i in $(find -type f -printf '%P\n'); do
  [ -f "${WHOME}/${i}" ] && (mv -v "${WHOME}/${i}" "${WHOME}/${i}.${timestamp}" || fail "Cannot backup ${WHOME}/${i}")
done

echo "## Relocating..."
for i in $(find -type f -printf '%P\n'); do
  mkdir -p "${WHOME}/$(dirname $i)"
  mv -v "$i" "${WHOME}/${i}" || fail "Cannot relocate ${i}"
done
cd / && rmdir $HOME && ln -sv $WHOME $HOME

echo "## DONE"
ls -lad $HOME
cygpath -wa $HOME

