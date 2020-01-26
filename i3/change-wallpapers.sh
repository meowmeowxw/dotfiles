#!/bin/bash

images=$(ls $HOME/Pictures/wallpapers/slideshow | xargs)

while true
do
    for i in $images
    do
        feh --bg-scale $HOME/Pictures/wallpapers/slideshow/$i
        sleep 900
    done
done

