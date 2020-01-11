#!/bin/bash
var=$(ip addr show wlxa0f3c11bc5ad | awk 'NR==3' | awk '{print $2}')
var=${var::-3}
echo " : $var"
