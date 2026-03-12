#!/bin/env bash

# Start background apps:
nm-applet &
pasystray &
syncthing --no-browser &
mullvad-vpn &
dwmblocks &
xrdb $HOME/.Xresources &
xrandr --output DP1 --off --output DP2 --off --output HDMI1 --mode 1920x1080 --pos 0x239 --rotate normal --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output VGA1 --off --output VIRTUAL1 --off
picom -b
dunst &
setxkbmap -layout us,ru -variant ,phonetic -option grp:alt_shift_toggle &

# Start pipewire:
systemctl --user restart pipewire pipewire-pulse wireplumber &

# Wallpaper & Theming
loadwallpaper &

# Starts DWM
exec dbus-launch --exit-with-session dwm
