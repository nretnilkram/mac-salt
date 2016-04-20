#!/bin/bash

#   ---------------------------------------
#   Mac Salt Doctor
#   ---------------------------------------

found_issue=false

#   Check to see if minion_id file exists
#   ---------------------------------------
if [[ ! -e "/etc/salt/minion_id" ]]
	then
	echo "
You need to setup your environment by running: mac_salt bootstrap
	"
	found_issue=true
fi

#   Check to see if minion file exists
#   ---------------------------------------
if [[ ! -e "/etc/salt/minion" ]]
	then
	echo "
You need to setup your environment by running: mac_salt bootstrap
	"
	found_issue=true
fi

#   Check if brew is installed
#   ---------------------------------------
which bredw > /dev/null

if [ $? -ne 0 ]
	then
	echo "
You need to install homebrew.  Paste the following into your terminal:

/usr/bin/ruby -e '\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)'

Or you can find instructions here: http://brew.sh
	"
	found_issue=true
fi

#   Check permissions on /usr/local/bin
#   ---------------------------------------
if [[ ! "$(whoami)" == "$(stat /usr/local/bin/ | awk '{print $5}')" ]]
	then
	echo "
/user/local/bin does not have $(whoami) as the owner which could cause issues with brew installs and updates.

run:

sudo chown -R $(whoami) /usr/local/bin

to resolve this issue.
	"
	found_issue=true
fi

#   Check permissions on /usr/local/lib
#   ---------------------------------------
if [[ ! "$(whoami)" == "$(stat /usr/local/lib/ | awk '{print $5}')" ]]
	then
	echo "
/user/local/bin does not have $(whoami) as the owner which could cause issues with brew installs and updates.

run:

sudo chown -R $(whoami) /usr/local/lib

to fix this.
	"
	found_issue=true
fi

#   Check that bash_config is being sourced
#   ---------------------------------------
if !( grep -Fq "source ~/.mac_salt/bash_config" ~/.bash_profile ~/.bashrc &> /dev/null )
	then
	echo -e "
Add the following to .bash_profile or .bashrc to source the MAC SALT bash configuration: 

if [ -f ~/.mac_salt/bash_config ]; then
	source ~/.mac_salt/bash_config
fi
	"
	found_issue=true
fi

#   Check that ssh/config is setup for corkscrew
#   ---------------------------------------
if !( grep -Fq "Host *" ~/.ssh/config )
	then
	echo -e "
You will want to setup a 'Host *' entry to your .ssh/config file to use corcskrew. 
Seperate your ssh Proxy settings with a comment at the bottom of your ssh config file.

Host *
	KeepAlive yes
	###### Do not place anything below this line.  It will be updated frequently by the proxy update functions.
	ProxyCommand /usr/local/bin/corkscrew 127.0.0.1 8840 %h %p
	"
	found_issue=true
fi

if !( $found_issue )
	then
	echo -e "
Ready to Go!
	"
fi