#!/bin/sh
setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:caps,compose:ralt"
xsetroot -cursor_name left_ptr -mod 2 2 -bg \#2D3753 -fg \#000000
setterm -blank 0 -powersave off -powerdown 0
xset s off -dpms
xset r rate 500 60
redshift -l 59.9343:30.3351 &
btsync &
urxvtd &
# compton &
unclutter &
sxhkd &
~/dotfiles/scripts/status &
exec bspwm
