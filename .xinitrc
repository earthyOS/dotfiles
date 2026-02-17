#!/bin/env bash

# Start background apps:
nm-applet &
dwmblocks &
xrdb $HOME/.Xresources &
xrandr --auto &
picom -b
setxkbmap -layout us,ru -variant ,phonetic -option grp:alt_shift_toggle &

# Starts DWM
exec dbus-launch --exit-with-session dwm
