#!/bin/bash

#
# Figure out if homebrew is installed
#
which brew > /dev/null

if  [ $? -ne 0 ]
	then
		echo "Install Homebrew first"
		echo "http://brew.sh"
		exit 1
fi

USERNAME=`whoami`
HOMEDIR=$HOME

# Figure out where homebrew is installed
HOMEBREWDIR="/usr/local"
if [[ -e /opt/boxen/homebrew ]]; then
	HOMEBREWDIR="/opt/boxen/homebrew"
fi

if [ ! -d "/etc/salt" ]; then
        sudo mkdir /etc/salt
fi

if [ ! -d "/var/log/salt" ]; then
        sudo mkdir /var/log/salt
fi

echo "Using homebrew at $HOMEBREWDIR"

sudo sh -c "echo $USERNAME-cpdm > /etc/salt/minion_id"
sudo sh -c "echo file_client: local > /etc/salt/minion"
sudo sh -c "echo user: $USERNAME > /etc/salt/grains"
sudo sh -c "echo homedir: $HOMEDIR >> /etc/salt/grains"
sudo sh -c "echo homebrew_home: $HOMEBREWDIR >> /etc/salt/grains"

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
	echo "Installing Salt"

	#
	# Swig 3.0.5 will cause salt stack to fail to install.
	#
	SWIG_VERSION=`brew info swig  | grep swig\: | cut -d " " -f 3`
	if [ $SWIG_VERSION == "3.0.5" ]; then
		echo ""
		echo "[Error]"
		echo "Broken swig version detected ($SWIG_VERSION). Seek help installing salt"
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
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
echo "$DIR/bin/mac_salt state.highstate"
