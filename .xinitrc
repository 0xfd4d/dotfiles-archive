setxkbmap -layout "us,ru"
setxkbmap -option "grp:alt_shift_toggle,grp_led:scroll"

xsetroot -cursor_name left_ptr

feh --bg-scale /storage/data/image/meteoric-rain.jpg &
redshift &

urxvt &
chromium &

exec dbus-launch xmonad
