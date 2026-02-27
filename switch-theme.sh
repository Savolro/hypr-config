#!/bin/bash

HYPR_DIR="$HOME/.config/hypr"
THEMES_DIR="$HYPR_DIR/themes"
THEME="${1:-pick}"

# Get available themes from CSS files
available_themes() {
        find "$THEMES_DIR" -maxdepth 1 -name "*.css" -printf "%f\n" | sed 's/\.css$//' | sort
}

# Get current theme
current_theme() {
        grep -oP 'themes/\K[^.]+' "$HYPR_DIR/common.css"
}

if [[ "$THEME" == "pick" ]]; then
        CURRENT=$(current_theme)
        THEME=$(available_themes | walker -d -p "Theme")
        [[ -z "$THEME" ]] && exit 0
fi

# Validate theme exists
if [[ ! -f "$THEMES_DIR/${THEME}.css" ]]; then
        echo "Unknown theme: $THEME"
        echo "Available: $(available_themes | tr '\n' ' ')"
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
