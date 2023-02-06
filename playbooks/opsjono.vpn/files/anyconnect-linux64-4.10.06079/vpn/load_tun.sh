#!/bin/sh
/sbin/lsmod | grep tun > /dev/null
if [ $? -ne 0 ]; then
 /sbin/modprobe tun > /dev/null 2> /dev/null
 if [ $? -ne 0 ]; then
   # check for /dev/net/tun
   [ -c "/dev/net/tun" ] || echo  Warning: Unable to verify that the tun/tap driver is loaded.  Contact your system administrator for assistance.
 fi
fi