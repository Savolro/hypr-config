# Hypr config

This repository contains configuration files related to my desktop environment.

Disclaimer: This is largely vibe-coded

## Prerequisites
### Hyprland specifics
- hyprland
- hyprlock

### Additional tools
- kitty
- awww
- swaync
- swayosd
- waybar
- wlogout
- walker
- dolphin
- hyprshot
- playerctl
- pavucontrol

### Fonts
- JetBrains Mono Nerd Font
- Space Grotesk
- Commit Mono

### Themes
For both QT and GTK I am using Yaru-Blue-Dark theme

#### Switching themes
Press `SUPER+T` to open a theme picker, or run:
```sh
~/.config/hypr/switch-theme.sh <theme>  # e.g. dark, light
```

This switches all apps at once: hyprland, hyprlock, kitty, waybar, swaync, swayosd, wlogout, and walker.

## Installation
After all of the prerequisites are installed, execute the following:

```sh
git clone https://github.com/Savolro/hypr-config.git ~/.config/hypr
ln -s ~/.config/hypr/kitty ~/.config/kitty
ln -s ~/.config/hypr/swaync ~/.config/swaync
ln -s ~/.config/hypr/swayosd ~/.config/swayosd
ln -s ~/.config/hypr/waybar ~/.config/waybar
ln -s ~/.config/hypr/wlogout ~/.config/wlogout
ln -s ~/.config/hypr/walker ~/.config/walker
```

Then, set the initial theme:
```sh
~/.config/hypr/switch-theme.sh dark
```
