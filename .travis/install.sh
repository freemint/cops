#!/bin/bash -eux
# -e: Exit immediately if a command exits with a non-zero status.
# -u: Treat unset variables as an error when substituting.
# -x: Display expanded script commands

# HCP is defined as "/tmp/hcp/bin/hcp"
HCP_VERSION="1.0.3"
# UDO is defined as "/tmp/udo/udo"
UDO_VERSION="7.12"

cd /tmp
wget -q -O - "http://tho-otto.de/download/hcp-${HCP_VERSION}-linux.tar.bz2" | tar xjf -
mv "hcp-${HCP_VERSION}" hcp
cd -

mkdir -p "/tmp/udo"
cd "/tmp/udo"
wget -q -O - "http://www.tho-otto.de/download/udo-${UDO_VERSION}-linux.tar.bz2" | tar xjf -
cd -

if [ "${TRAVIS_PULL_REQUEST}" = "false" -a "${TRAVIS_REPO_SLUG}" = "freemint/cops" ]
then
	BINTRAY_REPO="travis" SYSROOT_DIR="/" ./.travis/install_bintray.sh m68k-atari-mint-binutils-gdb m68k-atari-mint-gcc mintbin
	BINTRAY_REPO="lib" ./.travis/install_bintray.sh mintlib gemlib
else
	sudo add-apt-repository -y ppa:vriviere/ppa
	sudo apt-get update
	sudo apt-get install binutils-m68k-atari-mint gcc-m68k-atari-mint mintbin-m68k-atari-mint mintlib-m68k-atari-mint gemlib-m68k-atari-mint
fi
