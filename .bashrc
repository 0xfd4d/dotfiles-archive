shopt -s extglob

HISTSIZE=-1
HISTFILESIZE=-1

alias s='sudo'
alias cal='cal -y -m'
alias vol='alsamixer'
alias tmux='tmux attach || tmux new'
alias ls="ls --group-directories-first --color=auto"
alias l='ls -1'
alias ll='ls -lAh'
alias grep='grep --color=auto'
alias diff='diff --color'
alias dir='dir --color'
alias df='df -h'
alias random_commit='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'
alias lsblk='lsblk -o name,maj:min,size,ro,type,fstype,mountpoint,label,uuid'
alias suspend='su -c "echo freeze > /sys/power/state"'
alias todo='vim /mnt/data/todo'
alias xreload="xrdb -merge ~/dotfiles/.Xresources"

alias rec='ffmpeg -f x11grab -s 1366x768 -an -i :0.0 -c:v libvpx -b:v 5M -crf 10 -quality realtime -y -loglevel quiet'
alias fastrec='ffmpeg -f x11grab -s 1366x768 -an -r 25 -i :0.0 -c:v libvpx -b:v 5M -crf 10 -quality realtime -y -loglevel quiet'

alias feh='feh --scale-down -d --image-bg black --action1 "; readlink -n -f %F | xsel -b"'
alias feha='feh --sort mtime --recursive'

h() {
    if [[ -z "$1" ]]; then
        history
    else
        history | grep "$*"
    fi
}

eval $(dircolors $HOME/dotfiles/.dircolors)

export MANPAGER="vim +MANPAGER - "
export EDITOR="vim"
export GREP_COLORS="mt=33"

export PS1="\h \[\033[1m\]\\$ \[\033[0m\]\w "
export PS2="\[\033[1m\]> \[\033[0m\]"

export PATH="$PATH:$HOME/dotfiles/bin"

export GOPATH="$HOME/dev/go"

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

echo -e "Sacra Luna,
In dies desperationis et cosmici maeroris
Voco tui,
Quam unicum et altissimum bonum,
Quam amores meus et ut deam mea,
Enim non est in noctis sancta magis quo tu.
—
Nocturna sacerdotis,
Salvaveris ratio mea, salvaveris animam mea
Et dixeris via vera
Et ero amare tui, ero adare tibi.
Ad ipsa mortis.

Gloria Lunae. Vivat aeterna Nox.

\033[1mAmen.\033[m"
