# -----------------------------
# Prompt + Title
# -----------------------------

# colors
#export TERM='xterm-256color'
autoload -U colors && colors

for color in red green yellow blue magenta cyan black white; do
    eval $color='%{$fg_no_bold[${color}]%}'
    #eval ${color}_bold='%{$fg_bold[${color}]%}'
done

reset="%{$reset_color%}"

# check if we are on SSH or not
if [[ -n "$SSH_CLIENT" || -n "$SSH2_CLIENT" ]]; then
  host="${black}[${blue}%m${black}] " #SSH
else
  unset host # no SSH
fi

# git
setopt prompt_subst
autoload -U add-zsh-hook
autoload -Uz vcs_info

add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*'   enable git
zstyle ':vcs_info:*:*' check-for-changes true # Can be slow on big repos.
zstyle ':vcs_info:*:*' unstagedstr '!'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' actionformats "${black}[${cyan}%b%u%c %a${black}]"
zstyle ':vcs_info:*:*' formats       "${black}[${cyan}%b%u%c${black}]"


# root / user
if [ "$EUID" -eq 0 ]; then
  bracket_o="${red}["
  bracket_c="${red}]"
else
  bracket_o="${black}["
  bracket_c="${black}]"
fi

PROMPT="${host}${bracket_o}${magenta}%2~${bracket_c}${reset} "
RPROMPT='$vcs_info_msg_0_'"$reset"

# title
case $TERM in
  xterm*|rxvt*|screen*)
    precmd() { print -Pn "\e]0;%m:%~\a" }
    preexec () { print -Pn "\e]0;$1\a" }
  ;;
esac

# -----------------------------
# Misc
# -----------------------------

# zsh
setopt extended_glob

setopt interactive_comments

# better word separators (ctrl-w will become much more useful)
WORDCHARS=''

# editor
export EDITOR="vim"

# grep colors
export GREP_COLORS="mt=33"

# disable speaker
unsetopt beep

# -----------------------------
# History
# -----------------------------

HISTFILE=$HOME/.zsh_history
HISTSIZE=9999
SAVEHIST=9999

setopt extended_history

setopt inc_append_history
setopt share_history

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks


# -----------------------------
# Completion
# -----------------------------

# Enable zsh auto-completion
autoload -U compinit && compinit

_comp_options+=(globdots) # completion fot dotfiles

zstyle ':completion:*' menu select


# -----------------------------
# Aliases
# -----------------------------

# tmux
alias tmux='tmux attach || tmux new'

# ssht
ssht () { ssh -t "$1" 'tmux attach || tmux new' }

# history
h() {
  if [[ -z "$1" ]]; then
    history
  else
    history 0 | grep "$*"
  fi
}

# search
ss() { find . | xargs grep "$1" -sl }

# sys
alias ping='ping -c 1'

alias l='ls -lAh --color=auto --group-directories-first'
alias ls='ls --color=auto --group-directories-first'
alias g='grep --color=auto'
alias se='sudoedit'

alias df='df -h'
alias du='du -h --max-depth=1 | sort -h'

# apt-get
alias apt-get='sudo apt-get'

# ssh
ssh_agent() {
  if [[ -z "$SSH_AUTH_SOCK" ]]; then
    pkill ssh-agent
    eval $(ssh-agent)
    ssh-add
  fi
}

# git
alias gc='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status --short --branch'
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

gf() {
  git add -A
  git commit -m "$*"
  git push
}

# what the commit
alias random_commit='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'
