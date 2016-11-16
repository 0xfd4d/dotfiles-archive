shopt -s extglob

export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=ignoreboth:erasedups

alias cal='cal -y'
alias vol='alsamixer'
alias tmux='tmux attach || tmux new'
alias ls='ls --group-directories-first --color=auto'
alias l='ls --group-directories-first --color=auto -1'
alias ll='ls --group-directories-first --color=auto -lAh'
alias grep='grep --color=auto'
alias diff='diff --color'
alias dir='dir --color'
alias df='df -h'
alias random_commit='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'
alias lsblk='lsblk -o name,maj:min,size,ro,type,fstype,mountpoint,label,uuid'
alias todo='vim /mnt/data/todo'
alias xreload="xrdb -merge ~/dotfiles/.Xresources"

alias rec='ffmpeg -f x11grab -s 1366x768 -an -r 25 -i :0.0 -c:v libvpx -b:v 5M -crf 10 -quality realtime -y -loglevel quiet'

alias feh='feh --scale-down -d --image-bg black --action1 "; readlink -n -f %F | xsel -b" -C /usr/share/fonts/truetype/croscore -C /usr/share/fonts/TTF/ -e Arimo-Regular/10 -M Arimo-Regular/10'
alias feha='feh --sort mtime --recursive'

h() {
    if [[ -z "$1" ]]; then
        history
    else
        history | grep "$*"
    fi
}

eval $(dircolors $HOME/dotfiles/.dircolors)

export EDITOR="vim"
export GREP_COLORS="mt=33"

export PS1="\[\033[1m\]\\$ \[\033[0m\]\w "
export PS2="\[\033[1m\]> \[\033[0m\]"

export PATH="$PATH:$HOME/dotfiles/bin"

export GOPATH="$HOME/dev/go"

export MPD_HOST=/run/mpd/socket

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
