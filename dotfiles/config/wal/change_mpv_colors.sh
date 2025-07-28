#!/bin/bash

# Check for 4 arguments
# if [ "$#" -ne 4 ]; then
#     echo "Usage: $0 <bg_line> <primary_line> <accent_line> <held_line>"
#     echo "Each argument is a line number (1–16) from ~/.cache/wal/colors"
#     exit 1
# fi
# Assign args
# bg_line=$1
# primary_line=$2
# accent_line=$3
# held_line=$4

bg_line=1
primary_line=2
accent_line=4
held_line=6
# File paths
WAL_COLORS="$HOME/.cache/wal/colors"
OSC_CONF="$HOME/.config/mpv/script-opts/osc.conf"

# Ensure WAL colors file exists
if [ ! -f "$WAL_COLORS" ]; then
    echo "Error: $WAL_COLORS not found."
    exit 1
fi

# Get colors
bg_color=$(sed -n "${bg_line}p" "$WAL_COLORS")
primary_color=$(sed -n "${primary_line}p" "$WAL_COLORS")
accent_color=$(sed -n "${accent_line}p" "$WAL_COLORS")
held_color=$(sed -n "${held_line}p" "$WAL_COLORS")

# Create target directory
mkdir -p "$(dirname "$OSC_CONF")"

# Write the config
cat > "$OSC_CONF" <<EOF
background_color=$bg_color
timecode_color=$primary_color
title_color=$primary_color
time_pos_color=$primary_color
buttons_color=$accent_color
small_buttonsL_color=$accent_color
small_buttonsR_color=$accent_color
top_buttons_color=$accent_color
held_element_color=$held_color
time_pos_outline_color=$bg_color
EOF

echo "Generated: $OSC_CONF"

# Path to mpv.conf
MPV_CONF="$HOME/.config/mpv/mpv.conf"
COLOR="\"$primary_color\""

# If osd-color exists, replace it; otherwise append it
if grep -q "^osd-color=" "$MPV_CONF" 2>/dev/null; then
    sed -i "s/^osd-color=.*/osd-color=$COLOR/" "$MPV_CONF"
else
    echo "osd-color=$COLOR" >> "$MPV_CONF"
fi

echo "Changed osd-color to $COLOR at: $MPV_CONF"
