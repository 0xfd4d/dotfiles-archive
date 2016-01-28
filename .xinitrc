setxkbmap -layout "us,ru"
setxkbmap -option "grp:alt_shift_toggle,grp_led:scroll"

xsetroot -cursor_name left_ptr

./.fehbg

redshift &
mpd &

chromium &
urxvt &

exec dbus-launch xmonad
