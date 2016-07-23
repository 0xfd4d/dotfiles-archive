autoload -U add-zsh-hook
# autoload -Uz vcs_info
autoload -U compinit promptinit
autoload -U colors && colors

setopt extended_glob
setopt interactive_comments
setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt prompt_subst

compinit
promptinit
add-zsh-hook precmd vcs_info
_comp_options+=(globdots)

zstyle ':completion:*' menu select
# zstyle ':vcs_info:*'   enable git
# zstyle ':vcs_info:*:*' check-for-changes true
# zstyle ':vcs_info:*:*' unstagedstr '!'
# zstyle ':vcs_info:*:*' stagedstr '+'
# zstyle ':vcs_info:*:*' actionformats "%{$fg[blue]%}[%{$fg[cyan]%}%b%u%c %a%{$fg[blue]%}]"
# zstyle ':vcs_info:*:*' formats "%{$fg[blue]%}[%{$fg[cyan]%}%b%u%c%{$fg[blue]%}]"

if [ "$EUID" -eq 0 ]; then
    userprompt="#"
    usercolor="$fg_bold[red]"
else
    userprompt="$"
    usercolor="$fg_bold[blue]"
fi

PROMPT="%{$usercolor%}$userprompt %{$reset_color%}%~ "
HISTFILE=$HOME/.zsh_history
HISTSIZE=99999
SAVEHIST=99999

eval $(dircolors ~/dotfiles/.dircolors)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias s='sudo'
alias cal='cal -y -m'
alias tmux='tmux attach || tmux new'
alias ls="ls --color=auto --group-directories-first --time-style='+%d.%m.%y %H:%M'"
alias l='ls -lAh'
alias grep='grep --color=auto'
alias diff='colordiff'
alias dir='dir --color'
alias df='df -h'
alias du='du -h --max-depth=1 | sort -h'
alias random_commit='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'
alias lsblk='lsblk -o name,maj:min,size,ro,type,fstype,mountpoint,label,uuid'
alias suspend='su -c "echo disk > /sys/power/state"'
alias todo='nvim /mnt/data/todo'

h() {
  if [[ -z "$1" ]]; then
    history
  else
    history 0 | grep "$*"
  fi
}

bindkey '^[[1~' beginning-of-line
bindkey '^[[7~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[8~' end-of-line
bindkey '^[[3~' delete-char

export GOPATH="$HOME/dev/go"
export PATH="$PATH:$HOME/dev/go/bin"
export EDITOR="nvim"
export GREP_COLORS="mt=33"

export PATH="$PATH:/sbin"
export PATH="$PATH:/usr/sbin"

cat /mnt/data/things
