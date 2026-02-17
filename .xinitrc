#!/bin/env bash

# Start background apps:
nm-applet &
dwmblocks &
xrdb $HOME/.Xresources &
xrandr --auto &
picom -b
dunst &
setxkbmap -layout us,ru -variant ,phonetic -option grp:alt_shift_toggle &

# Start pipewire:
pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &

# Starts DWM
exec dbus-launch --exit-with-session dwm
