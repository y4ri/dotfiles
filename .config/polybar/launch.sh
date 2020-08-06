#!/bin/bash
#Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar main_bar &

second_monitor=$(xrandr --query | grep 'DP-0')
if [[ $second_monitor = *connected* ]]; then
	    polybar second_bar &
fi

