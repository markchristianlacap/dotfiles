export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_CONFIG_HOME="$HOME/.config"

xrandr &
~/.fehbg &
picom -b &
dunst &
dwmblocks &
nvidia-settings --load-config-only &
sxhkd &
flameshot &
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
exec dwm 
