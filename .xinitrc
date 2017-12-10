#!/bin/sh

xrdb -merge ~/dotfiles/.Xresources
xset +fp /usr/share/fonts/local
xset r off

redshift -l 60.84:31.56 -o &
hsetroot -solid "#000000"
bar &
notify -d &
mailwatch &
bspwm &
btpd &

export WM=bspwm
while :; do
    wm
done
