if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
elif [[ $(tty) = /dev/tty2 ]]; then
  tmux attach || tmux new
  logout
fi
