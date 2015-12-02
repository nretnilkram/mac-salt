#!/bin/bash

#SAML BOX
/sbin/ifconfig lo0 alias 127.0.0.19 netmask 255.255.255.0
#DEV BOX
/sbin/ifconfig lo0 alias 127.0.0.20 netmask 255.255.255.0

# Run PF  Rules
/sbin/pfctl -evf /etc/pf.anchors/dev