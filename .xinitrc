setxkbmap -layout "us,ru"
setxkbmap -option "grp:alt_shift_toggle,grp_led:scroll"

xsetroot -cursor_name left_ptr

feh --bg-scale /storage/data/image/mlp/the_dawn_will_come_by_chio_kami-d9oaxty.jpg &
redshift &

urxvt &
chromium &

exec dbus-launch xmonad
