#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar -c ~/.config/polybar/config.ini main &

polybar workspaces >>/tmp/polybar1.log 2>&1 &
polybar title >>/tmp/polybar4.log 2>&1 &
polybar music >>/tmp/polybar2.log 2>&1 &
polybar status >>/tmp/polybar3.log 2>&1 &
polybar info >>/tmp/polybar5.log 2>&1 &

