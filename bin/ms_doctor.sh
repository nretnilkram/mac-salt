#   ---------------------------------------
#   Mac Salt Doctor
#   ---------------------------------------

#   Check that bash_config is being sourced
#   ---------------------------------------
if !( grep -Fq "source ~/.mac_salt/bash_config" ~/.bash_profile ~/.bashrc 2&>1 )
then
	echo -e "
Add the following to .bash_profile or .bashrc to source the MAC SALT bash configuration: 

if [ -f ~/.mac_salt/bash_config ]; then
	source ~/.mac_salt/bash_config
fi
	"
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
fi