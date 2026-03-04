#!/bin/env bash

# Start background apps:
nm-applet &
pasystray &
syncthing --no-browser &
mullvad-vpn &
dwmblocks &
xrdb $HOME/.Xresources &
xrandr --output VGA-1 --off --output HDMI-1 --mode 1920x1080 --pos 0x277 --rotate normal --output DP-1 --off --output HDMI-2 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-2 --off
picom -b
dunst &
setxkbmap -layout us,ru -variant ,phonetic -option grp:alt_shift_toggle &

# Start pipewire:
pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &

# Wallpaper & Theming
loadwallpaper &

# Starts DWM
exec dbus-launch --exit-with-session dwm
