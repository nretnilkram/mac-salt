#!/bin/bash

#####
# Create / Update Grains File
#####

USERNAME=`whoami`
HOMEDIR=$HOME
GRAINSFILE='/etc/salt/grains'

HOMEBREWDIR="/usr/local"

if [ ! -d "/etc/salt" ]; then
	sudo mkdir /etc/salt
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

#####
# This determines if legacy .macsalt file is still present so that it can be removed.
#####
MACSALTFILEEXISTS=true
if [ -d "$HOMEDIR/.mac_salt" ]; then
	MACSALTFILEEXISTS=false
fi
#####

sudo sh -c "echo user: $USERNAME > $GRAINSFILE"
sudo sh -c "echo homedir: $HOMEDIR >> $GRAINSFILE"
sudo sh -c "echo homebrew_home: $HOMEBREWDIR >> $GRAINSFILE"
sudo sh -c "echo mac_salt_home: $DIR >> $GRAINSFILE"
sudo sh -c "echo mac_salt_file_exists: $MACSALTFILEEXISTS >> $GRAINSFILE"
