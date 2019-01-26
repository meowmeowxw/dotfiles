#!/bin/sh

sessions="$(lsof -Pi | grep ":22")"

if [ ! -z "$sessions" ]; then
    count=$(echo "$sessions" | wc -l)
    echo "%{u#a6c960} ($count): $(echo "$sessions" | cut -d ">" -f 2 | cut -d " " -f 1 | cut -d ":" -f 1 | tail -n 1)"
else
	echo ""
fi

