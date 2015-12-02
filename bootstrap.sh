#!/bin/bash

#
# Figure out if homebrew is installed
#
which brew > /dev/null

if  [ $? -ne 0 ]
	then
		echo "Install Homebrew first";
		echo "http://brew.sh";
		exit 1
fi

USERNAME=`whoami`
HOMEDIR=$HOME

# Figure out where homebrew is installed
HOMEBREWDIR="/usr/local"
if [[ -e /opt/boxen/homebrew ]]; then
	HOMEBREWDIR="/opt/boxen/homebrew";
fi

echo "Using homebrew at $HOMEBREWDIR";
echo ""
echo "We (may) need your password to set up some stuff in /etc"
cd /
sudo sh -c "echo file_client: local > /etc/salt/minion"
sudo sh -c 'echo "user: $USERNAME\nhomedir: $HOMEDIR\nhomebrew_home:\n$HOMEBREWDIR" > /etc/salt/grains'

#
# Check for salt
#

which salt-call > /dev/null
HAS_SALT=$?

if [ $HAS_SALT -eq 0 ]; then
	echo ""
	echo "Salt already installed"
	echo ""
fi

#
# Salt needs installed
#

if [ $HAS_SALT -ne 0 ]; then
	echo ""
	echo ""
	echo "Installing Salt"

	#
	# Swig 3.0.5 will cause salt stack to fail to install.
	#
	SWIG_VERSION=`brew info swig  | grep swig\: | cut -d " " -f 3`
	if [ $SWIG_VERSION == "3.0.5" ]; then
		echo ""
		echo ""
		echo "[Error]"
		echo "Broken swig version detected ($SWIG_VERSION). Seek help installing salt";
		echo ""
		echo "run 'brew edit saltstack'"
		echo "change the dependency on 'swig' to 'swig304'"
		echo "then run 'brew install saltstack'"
		echo ""
		exit 1
	fi

	brew install saltstack
fi

echo "installation complete"
echo ""
echo "You may now run:"
echo ""
DIR=$(pwd -L)
echo "$DIR/bin/mac_salt state.highstate"
