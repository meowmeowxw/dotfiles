#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch example bar
polybar --config=$HOME/.config/polybar/monitor1.conf example &
polybar --config=$HOME/.config/polybar/monitor2.conf example &

echo "Top bar launched!"
