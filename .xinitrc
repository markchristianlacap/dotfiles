export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_CONFIG_HOME="$HOME/.config"

.scripts/extend.sh &
dunst &
~/.fehbg &
picom -b &
slstatus &
sxhkd &
flameshot &
exec dwm 
