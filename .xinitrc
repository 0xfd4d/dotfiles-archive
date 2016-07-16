#!/bin/sh
setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:caps,compose:ralt"
xsetroot -cursor_name left_ptr
setterm -blank 0 -powersave off -powerdown 0
xset s off -dpms 
xset r rate 500 60
./.fehbg &
redshift -l 59.9343:30.3351 &
btsync &
urxvtd &
compton &
sxhkd &
~/dotfiles/scripts/status &
exec bspwm
