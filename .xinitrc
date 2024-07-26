export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_CONFIG_HOME="$HOME/.config"

xrandr --output HDMI-0 --mode 1920x1080 --rate 75 --output DP-0 --primary --mode 1920x1080 --right-of HDMI-0 &
~/.fehbg &
picom -b &
slstatus &
sxhkd &
nvidia-settings --load-config-only &
flameshot &
exec dwm 
