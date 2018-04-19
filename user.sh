#!/bin/bash
set -u

fail() { echo "$@"; exit 1; }

if [ -L $HOME ]; then
  echo "## $HOME seems to be already relocated:"
  ls -lad $HOME
  exit
fi

WHOME="/cygdrive/c/Users/$(whoami)"

echo "## Relocating $HOME -> $WHOME"
timestamp="$(date +%Y%m%d-%H%M%S)"

echo "### Backup existing files..."
cd $HOME || fail
for i in $(find -type f -printf '%P\n'); do
  [ -f "${WHOME}/${i}" ] && (mv -v "${WHOME}/${i}" "${WHOME}/${i}.${timestamp}" || fail "Cannot backup ${WHOME}/${i}")
done

echo "## Relocating..."
cd $HOME || fail
for i in $(find -type f -printf '%P\n'); do
  mkdir -p "${WHOME}/$(dirname $i)"
  mv -v "$i" "${WHOME}/${i}" || fail "Cannot relocate ${i}"
done
(cd / && rmdir $HOME && ln -s $WHOME $HOME) || fail "Failed to create symlink $HOME->$WHOME"

echo "## DONE"
ls -lad $HOME
cygpath -wa $HOME

