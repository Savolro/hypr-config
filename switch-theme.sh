#!/bin/bash

HYPR_DIR="$HOME/.config/hypr"
THEME="${1:-}"

if [[ "$THEME" != "dark" && "$THEME" != "light" ]]; then
        echo "Usage: $0 <dark|light>"
        exit 1
fi

# CSS apps (waybar, swaync, swayosd, wlogout, walker)
sed -i "s|@import url(\"themes/.*\.css\");|@import url(\"themes/${THEME}.css\");|" "$HYPR_DIR/common.css"

# kitty
sed -i "s|^include themes/.*\.conf|include themes/${THEME}.conf|" "$HYPR_DIR/kitty/kitty.conf"

# hyprland
sed -i "s|^source = themes/hyprland/.*\.conf|source = themes/hyprland/${THEME}.conf|" "$HYPR_DIR/hyprland.conf"

# hyprlock
sed -i "s|^source = themes/hyprlock/.*\.conf|source = themes/hyprlock/${THEME}.conf|" "$HYPR_DIR/hyprlock.conf"

# Reload configs
hyprctl reload
killall -SIGUSR2 waybar
killall swaync && swaync &

echo "Switched to $THEME theme"
