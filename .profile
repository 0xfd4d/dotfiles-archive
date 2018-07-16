EDITOR=vi
ENV=$HOME/.kshrc
LANG=en_US.UTF-8
MAIL=/var/spool/mail/$USER
PATH=$PATH:/sbin:/usr/sbin:$HOME/dotfiles/bin:$HOME/bin
VISUAL=$EDTIOR

MESA_GLSL_CACHE_ENABLE=1

mkdir -p /tmp/neovim
NVIM_LISTEN_ADDRESS=/tmp/neovim/neovim

mkdir -p /tmp/cache-$USER

export EDITOR ENV LANG MAIL PATH VISUAL MESA_GLSL_CACHE_ENABLE NVIM_LISTEN_ADDRESS
