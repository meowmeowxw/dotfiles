#!/bin/bash
var=$(ip addr show wlp0s20u10 | awk 'NR==3' | awk '{print $2}')
if [ -z $var ]
then
	echo ""
else
	var=${var::-3}
	echo " $var"

fi
