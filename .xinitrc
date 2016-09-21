#!/bin/sh
xrdb -merge ~/dotfiles/.Xresources
xsetroot -cursor_name left_ptr

xset r rate 500 60

redshift -l 59.9343:30.3351 &
./.fehbg &

urxvtd &

statusbar &

sxhkd &
exec bspwm
