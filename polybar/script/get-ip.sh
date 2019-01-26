#!/bin/bash
var=$(ip addr show eth0 | awk 'NR==3' | awk '{print $2}')
var=${var::-3}
echo "%{u#a6c960}  : $var"
