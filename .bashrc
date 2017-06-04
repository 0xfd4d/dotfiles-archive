#!/bin/bash
shopt -s extglob

export HISTSIZE=-1
export HISTFILESIZE=-1

alias cal='cal -y'
alias df='df -h'
alias l='ls -1'
alias ll='ls -lAh'
alias ls='ls --group-directories-first --color=auto -b'
alias lsblk='lsblk -o name,maj:min,size,ro,type,fstype,mountpoint,label,uuid'
alias random_commit='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'
alias tb="proxychains nc termbin.com 9999"
alias tmux='tmux a'
alias todo='vim /storage/todo'
alias vol='alsamixer -g'
alias xreload="xrdb -merge ~/dotfiles/.Xresources"

alias rec='ffmpeg -f x11grab -s 1366x768 -an -r 25 -i :0.0 -c:v libvpx -b:v 5M -crf 10 -quality realtime -y -loglevel quiet'

h() {
    if [[ -z "$1" ]]; then
        history
    else
        history | grep "$*"
    fi
}

export EDITOR="vi"
export GREP_COLORS="mt=33"

export PS1="\W \[\033[1m\]\\$\[\033[0m\] "
export PS2="\[\033[1m\]> \[\033[0m\]"

export GOPATH="$HOME/go"

export PATH="$PATH:$HOME/dotfiles/bin:$GOPATH/bin:$HOME/.config/composer/vendor/bin"

export XDG_CACHE_HOME="/tmp/${USER}/.cache"
