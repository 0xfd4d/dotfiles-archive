setxkbmap -layout "us,ru"
setxkbmap -option "grp:caps_toggle,grp_led:scroll"

#xxkb & 

xsetroot -cursor_name left_ptr

feh --bg-scale /storage/data/image/meteoric-rain.jpg &
redshift &

urxvt &
chromium &

exec dbus-launch xmonad
