#!/bin/zsh
set -euo pipefail

#####
# Figure out if homebrew is installed
#####
which brew > /dev/null

if  [ $? -ne 0 ]
	then
		echo -e "Install Homebrew first"
		echo -e "http://brew.sh"
		exit 1
fi

if [ ! -d "/var/log/salt" ]; then
	sudo mkdir /var/log/salt
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]-}" )" && pwd )"

HOMEBREWDIR="/usr/local"

if [[ $@ != "silent" ]]; then
	echo -e "Using homebrew at $HOMEBREWDIR"
fi

#####
# Setup /etc/salt files
#####

if [ ! -d "/etc/salt" ]; then
	sudo mkdir /etc/salt
fi

sudo sh -c "echo $(whoami)-$(hostname) > /etc/salt/minion_id"
sudo sh -c "echo file_client: local > /etc/salt/minion"

#####
# Create / Update Grains File
#####

$DIR/bin/grains.sh

#####
# Check for salt
#####

which salt-call > /dev/null
HAS_SALT=$?

if [ $HAS_SALT -eq 0 ] && [[ $@ != "silent" ]]; then
	echo -e "\nSalt already installed"
fi

#####
# Salt needs installed
#####

if [ $HAS_SALT -ne 0 ]; then
	echo -e "\nInstalling Salt"

	#####
	# Swig 3.0.5 will cause salt stack to fail to install.
	#####
	SWIG_VERSION=`brew info swig  | grep swig\: | cut -d " " -f 3`
	if [ $SWIG_VERSION == "3.0.5" ]; then
		echo -e "\n[Error]"
		echo -e "Broken swig version detected ($SWIG_VERSION). Seek help installing salt"
		echo -e "\nrun 'brew edit saltstack'"
		echo -e "change the dependency on 'swig' to 'swig304'"
		echo -e "then run 'brew install saltstack'"
		exit 1
	fi

	brew install salt
fi

#####
# Check for oh-my-zsh
#####
stat ~/.oh-my-zsh/oh-my-zsh.sh > /dev/null
HAS_OMZ=$?

if [ $HAS_OMZ -eq 0 ]; then
	echo -e "\nOh-My-Zsh already installed"
fi

if [ $HAS_OMZ -ne 0 ]; then
	echo -e "\nInstalling Oh-My-Zsh"

	sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [[ $@ != "silent" ]]; then

	echo -e "\nBoostrap complete."
	echo -e "\nYou may now run:"
	echo -e "\n$DIR/bin/mac_salt state.highstate\n"

fi
