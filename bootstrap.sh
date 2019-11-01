#!/bin/zsh

#####
# Figure out if homebrew is installed
#####
which brew > /dev/null

if  [ $? -ne 0 ]
	then
		echo "Install Homebrew first"
		echo "http://brew.sh"
		exit 1
fi

if [ ! -d "/var/log/salt" ]; then
	sudo mkdir /var/log/salt
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

HOMEBREWDIR="/usr/local"

if [[ $@ != "silent" ]]; then
	echo "Using homebrew at $HOMEBREWDIR"
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
	echo ""
	echo "Salt already installed"
fi

#####
# Salt needs installed
#####

if [ $HAS_SALT -ne 0 ]; then
	echo ""
	echo "Installing Salt"

	#####
	# Swig 3.0.5 will cause salt stack to fail to install.
	#####
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

#####
# Check for oh-my-zsh
#####
stat ~/.oh-my-zsh/oh-my-zsh.sh > /dev/null
HAS_OMZ=$?

if [ $HAS_OMZ -eq 0 ]; then
	echo ""
	echo "Oh-My-Zsh already installed"
fi

if [ $HAS_SALT -ne 0 ]; then
	echo ""
	echo "Installing Oh-My-Zsh"

	sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [[ $@ != "silent" ]]; then

	echo "installation complete"
	echo ""
	echo "You may now run:"
	echo ""
	echo "$DIR/bin/mac_salt state.highstate"

fi
