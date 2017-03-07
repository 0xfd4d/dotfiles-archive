export XDG_CACHE_HOME=$HOME/.cache
export __GL_SHADER_DISK_CACHE_PATH=$XDG_CACHE_HOME/.nv

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
