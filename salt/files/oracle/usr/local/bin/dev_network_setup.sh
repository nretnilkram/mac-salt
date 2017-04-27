#!/bin/bash

#SAML BOX
/sbin/ifconfig lo0 alias 127.0.0.19 netmask 255.255.255.0
#DEV BOX
/sbin/ifconfig lo0 alias 127.0.0.20 netmask 255.255.255.0

# Setup DNS Search domains
IFS=$'\n'
for NET_ADAPTER in $(/usr/sbin/networksetup -listallnetworkservices | egrep -v -i "(bluetooth|bridge|\*)"); do
	/usr/sbin/networksetup -setsearchdomains "$NET_ADAPTER" cpdm.oraclecorp.com oracle.com test-cpdm.oraclecorp.com us.oracle.com
done

# Run PF  Rules
/sbin/pfctl -evf /etc/pf.anchors/dev
