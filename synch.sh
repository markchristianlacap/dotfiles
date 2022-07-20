echo "synching config files...."
cp ~/.config/polybar ./config/ -r
cp ~/.config/sxhkd ./config/ -r
cp ~/.config/rofi ./config/ -r
cp ~/.config/bspwm ./config/ -r
cp ~/.config/kitty ./config/ -r
cp ~/.config/picom.conf ./config/picom.conf -r
cp ~/Pictures/wallpaper.jpg ./Pictures/wallpaper.jpg -r
cp ~/.config/fish/config.fish ./config/fish/config.fish -r
echo "successfully synched"
