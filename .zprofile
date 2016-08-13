if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx -- vt7
elif [[ $(tty) = /dev/tty2 ]]; then
  tmux attach || tmux new
  logout
fi
