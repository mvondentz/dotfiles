#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar -c ~/.config/polybar/config.ini main &

polybar workspaces-eDP1 >>/tmp/polybar1.log 2>&1 &
polybar workspaces-HDMI1 >>/tmp/polybar11.log 2>&1 &

polybar title-eDP1 >>/tmp/polybar4.log 2>&1 &
polybar title-HDMI1 >>/tmp/polybar41.log 2>&1 &

polybar music-eDP1 >>/tmp/polybar2.log 2>&1 &
polybar music-HDMI1 >>/tmp/polybar21.log 2>&1 &

polybar status-eDP1 >>/tmp/polybar3.log 2>&1 &
polybar status-HDMI1 >>/tmp/polybar31.log 2>&1 &

polybar info-eDP1 >>/tmp/polybar5.log 2>&1 &
polybar info-HDMI1 >>/tmp/polybar51.log 2>&1 &

