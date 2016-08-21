#!/bin/sh
setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:caps,compose:ralt"

xrdb -merge ~/dotfiles/.Xresources
xsetroot -cursor_name left_ptr -mod 2 2 -fg "$(xrdb -query | grep "*.background" | awk '{print $2}')" -bg "$(xrdb -query | grep "*.foreground:" | awk '{print $2}')"

xset r rate 500 60

redshift -l 59.9343:30.3351 &
btsync &
urxvtd &
sxhkd &
# ~/.fehbg

~/dotfiles/scripts/status &
~/dotfiles/scripts/border &

exec bspwm
