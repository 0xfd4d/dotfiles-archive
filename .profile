EDITOR=vi
LANG=en_US.UTF-8
MAIL=/var/spool/mail/$USER
PATH=$PATH:/sbin:/usr/sbin:$HOME/dotfiles/bin:$HOME/bin
VISUAL=vi

export EDITOR LANG MAIL PATH VISUAL

test -e /tmp/cache-$USER || ( mkdir /tmp/cache-$USER && ln -s /tmp/cache-$USER $HOME/.cache )

test -z "$DISPLAY" && test `tty` = /dev/tty1 && startx
