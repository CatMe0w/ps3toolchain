#!/bin/sh -e
# psl1ght.sh by Naomi Peori (naomi@peori.ca)

## Download the source code.
wget --no-check-certificate https://github.com/ps3dev/PSL1GHT/tarball/master -O psl1ght.tar.gz

## Unpack the source code.
rm -Rf psl1ght && mkdir psl1ght && tar --strip-components=1 --directory=psl1ght -xvzf psl1ght.tar.gz

## Create the build directory.
cd psl1ght

## Compile and install.

# on macOS host tools must not see PS3 headers before Darwin SDK headers
# else apple's stdio.h can break includes
if [ "$(uname -s)" = "Darwin" ]; then
  unset CPATH
  unset C_INCLUDE_PATH
  unset CPLUS_INCLUDE_PATH
  unset OBJC_INCLUDE_PATH
fi
${MAKE:-make} install-ctrl && ${MAKE:-make} && ${MAKE:-make} install
