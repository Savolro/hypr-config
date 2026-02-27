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

#### Switching between dark and light mode
- CSS apps (waybar, swaync, swayosd, wlogout, walker): change the import in `common.css` to `themes/dark.css` or `themes/light.css`
- kitty: change the include in `kitty/kitty.conf` to `themes/dark.conf` or `themes/light.conf`

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

Then, apply themes manually.
