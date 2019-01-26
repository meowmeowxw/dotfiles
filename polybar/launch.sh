#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch example bar
polybar --config=/home/giovanni/.config/polybar/monitor1 example &
polybar --config=/home/giovanni/.config/polybar/monitor2 example &
polybar --config=/home/giovanni/.config/polybar/tray-monitor1 example &
polybar --config=/home/giovanni/.config/polybar/tray-monitor2 example &

echo "Top bar launched!"
