if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
   exec startx
fi


# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
