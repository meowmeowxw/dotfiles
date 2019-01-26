#!/bin/sh

IFACE=$(ifconfig | grep tun | awk '{print $1}')

if [ "$IFACE" = "tun0:" ]; then
    echo "%{u#a6c960}  : $(ifconfig tun0 | grep inet | awk '{print $2}' | cut -f2 -d ':')%{u-}"
else
    echo ""
fi
