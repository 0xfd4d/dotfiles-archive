#!/bin/sh

# eval $(dbus-launch)
# export DBUS_SESSION_BUS_ADDRESS
# export DBUS_SESSION_BUS_PID

xrdb -merge ~/dotfiles/.Xresources
xsetroot -cursor_name left_ptr
xset r off

./.fehbg

2bwm &

redshift -l 59.9343:30.3351 -b 1:0.95 &
xbanish &
dunst &
xdotool set_desktop 4 exec pidgin &

statusbar &

exec wm
