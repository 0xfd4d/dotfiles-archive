if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx -- vt1 -keeptty
elif [[ $(tty) = /dev/tty2 ]]; then
  tmux attach || tmux new
  logout
fi
