export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_CONFIG_HOME="$HOME/.config"

xrandr --output HDMI-0 --mode 1920x1080 --rate 60 --output DP-0 --primary --mode 1920x1080 --left-of HDMI-0 &
dunst &
~/.fehbg &
picom -b &
dwmblocks &
sxhkd &
#nvidia-settings --load-config-only &
flameshot &
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
exec dwm > ~/dwm.log 2>&1
