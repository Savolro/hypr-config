#!/bin/bash

HYPR_DIR="$HOME/.config/hypr"
THEMES_DIR="$HYPR_DIR/themes"
THEME="${1:-pick}"

# Get available themes from CSS files
available_themes() {
	find "$THEMES_DIR" -maxdepth 1 -name "*.css" -printf "%f\n" | sed 's/\.css$//' | sort
}

if [[ "$THEME" == "pick" ]]; then
	THEME=$(available_themes | walker -d -p "Theme")
	[[ -z "$THEME" ]] && exit 0
fi

# Validate theme exists
if [[ ! -f "$THEMES_DIR/${THEME}.css" ]]; then
	echo "Unknown theme: $THEME"
	echo "Available: $(available_themes | tr '\n' ' ')"
	exit 1
fi

# Write gitignored intermediary files
echo "@import url(\"themes/${THEME}.css\");" > "$HYPR_DIR/theme.css"
echo "source = themes/hyprland/${THEME}.conf" > "$HYPR_DIR/theme.conf"
echo "source = themes/hyprlock/${THEME}.conf" > "$HYPR_DIR/hyprlock-theme.conf"
# Kitty: fall back to base theme (e.g. dark-red -> dark) if no exact match
KITTY_THEME="$THEME"
if [[ ! -f "$HYPR_DIR/kitty/themes/${KITTY_THEME}.conf" ]]; then
	KITTY_THEME="${THEME%%-*}"
fi
echo "include themes/${KITTY_THEME}.conf" > "$HYPR_DIR/kitty/theme.conf"

# Reload configs
hyprctl reload
killall -SIGUSR2 waybar
killall swaync; swaync &
killall walker; walker --gapplication-service &

echo "Switched to $THEME theme"
