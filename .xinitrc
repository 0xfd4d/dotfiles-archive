setxkbmap -layout "us,ru"
setxkbmap -option "grp:alt_shift_toggle,grp_led:scroll"

xsetroot -cursor_name left_ptr

./.fehbg

redshift &
mpd &


urxvt &
subl3 &

exec xmonad