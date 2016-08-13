#!/bin/sh
setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:caps,compose:ralt"

xsetroot -cursor_name left_ptr -mod 2 2 -fg "$(cat .Xdefaults | grep "*.background" | awk '{print $2}')" -bg "$(cat .Xdefaults | grep "*.color8:" | awk '{print $2}')"

xset r rate 500 60

redshift -l 59.9343:30.3351 &
btsync &
urxvtd &
unclutter &
sxhkd &
# compton &
# ~/.fehbg

~/dotfiles/scripts/border &
~/dotfiles/scripts/status &

exec bspwm
