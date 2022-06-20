echo "synching config files...."
cp ~/.config/polybar ./ -r
cp ~/.config/sxhkd ./ -r
cp ~/.config/rofi ./ -r
cp ~/.config/bspwm ./ -r
cp ~/.config/alacritty ./ -r
cp ~/.config/picom.conf ./picom.conf -r
cp ~/.xinitrc .xinitrc -r
echo "successfully synched"
