#!/bin/bash
var=$(uptime --pretty | sed 's/up //' | sed 's/\ years\?,/y/' | sed 's/\ weeks\?,/w/' | sed 's/\ days\?,/d/' | sed 's/\ hours\?,\?/h/' | sed 's/\ minutes\?/m/')
#echo "%{u#cde062} Up time : $var"
echo " Up time : $var"
