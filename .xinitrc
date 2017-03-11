#!/bin/sh

# eval $(dbus-launch)
# export DBUS_SESSION_BUS_ADDRESS
# export DBUS_SESSION_BUS_PID

xrdb -merge ~/dotfiles/.Xresources
xrdb -merge ~/dotfiles/.Xresources.d/hybrid
xsetroot -cursor_name left_ptr
xset r rate 300 30

# wall
./.fehbg

redshift -l 59.9343:30.3351 -b 1:0.95 &
# xcompmgr &
dunst &
pidgin &

statusbar &

sxhkd &
exec bspwm
