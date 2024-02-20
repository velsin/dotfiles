# Dotfile sync repo
Symlink the files into the user `.config` directory

Target locations:

i3:
```
ln -s /home/$USER/dotfiles/i3/* /home/$USER/.config/i3/
```

picom:
```
ln -s /home/$USER/dotfiles/picom/* /home/$USER/.config/picom/
```

polybar:
```
ln -s /home/$USER/dotfiles/polybar/* /home/$USER/.config/polybar/
```

alacritty:
```
ln -s /home/$USER/dotfiles/alacritty/* /home/$USER/.config/alacritty/
```