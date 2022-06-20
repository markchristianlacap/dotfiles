echo "synching config files...."
cp ~/.config/polybar/ ./polybar -r
cp ~/.config/sxhkd/ ./sxhkd -r
cp ~/.config/rofi/ ./rofi -r
cp ~/.config/picom.conf ./picom.conf -r
cp ~/.config/bspwm ./bspwm -r
cp ~/.config/alacritty ./alacritty -r
cp ~/.xinitrc .xinitrc -r
echo "successfully synched"
