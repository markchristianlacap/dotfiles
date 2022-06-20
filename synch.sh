echo "synching config files...."
cp ~/.config/polybar ./config/ -r
cp ~/.config/sxhkd ./config/ -r
cp ~/.config/rofi ./config/ -r
cp ~/.config/bspwm ./config/ -r
cp ~/.config/alacritty ./config/ -r
cp ~/.config/picom.conf ./config/picom.conf -r
cp ~/.xinitrc .xinitrc -r
echo "successfully synched"
