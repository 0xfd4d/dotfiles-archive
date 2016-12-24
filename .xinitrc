#!/bin/sh

xrdb -merge ~/dotfiles/.Xresources
xsetroot -cursor_name left_ptr

redshift -l 59.9343:30.3351 &
./.fehbg &
xcompmgr &

(sleep 2 ; bspc desktop -f ^2 && urxvt -e sh -c "tmux attach || tmux new" ) &

sxhkd &
exec bspwm
