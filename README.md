# Hypr config

This repository contains configuration files related to my desktop environment.

## Prerequisites
### Hyprland specifics
- hyprland
- hyprlock
- hyprpaper

### Additional tools
- kitty
- swaync
- swayosd
- waybar
- wlogout
- wofi
- dolphin
- hyprshot

### Fonts
- JetBrains Mono Nerd Font
- Space Grotesk

### Themes
For both QT and GTK I am using Yaru-Blue-Dark theme

## Installation
After all of the prerequisites are installed, execute the following:

```sh
echo hello
git clone https://github.com/Savolro/hypr-config.git ~/.config/hypr
ln -s ~/.config/hypr/kitty ~/.config/kitty
ln -s ~/.config/hypr/swaync ~/.config/swaync
ln -s ~/.config/hypr/swayosd ~/.config/swayosd
ln -s ~/.config/hypr/waybar ~/.config/waybar
ln -s ~/.config/hypr/wlogout ~/.config/wlogout
ln -s ~/.config/hypr/wofi ~/.config/wofi
```

Then ,apply themes manually.
