#!/usr/bin/env bash

# dest_dir="$HOME/.local/share/plasma/desktoptheme/"
dest_dir="$HOME/.cache/wal/"
dest_file="mytheme.colors"
origin="$HOME/.cache/wal/colors-kitty.conf"

[[ -d "$dest_dir" ]] || mkdir -pv "$dest_dir"

get_xres_rgb() {
	hex=$(cat $origin | grep "$1" | awk '{print $2}' | cut -d# -f2)
	printf "%d,%d,%d\n" "0x${hex:0:2}" "0x${hex:2:2}" "0x${hex:4:2}"
}

darken_color() {
  local hex=$(cat $origin | grep "$1" | awk '{print $2}' | cut -d# -f2)
  local factor=${2:-0.8}  # default to 80% brightness

  local r=$((0x${hex:0:2}))
  local g=$((0x${hex:2:2}))
  local b=$((0x${hex:4:2}))

  # Darken each component
  r=$(printf "%.0f" "$(echo "$r * $factor" | bc -l)")
  g=$(printf "%.0f" "$(echo "$g * $factor" | bc -l)")
  b=$(printf "%.0f" "$(echo "$b * $factor" | bc -l)")

  # Ensure within bounds
  r=$(( r < 0 ? 0 : (r > 255 ? 255 : r) ))
  g=$(( g < 0 ? 0 : (g > 255 ? 255 : g) ))
  b=$(( b < 0 ? 0 : (b > 255 ? 255 : b) ))
 
  printf "$r,$g,$b"
}

fg=$(get_xres_rgb cursor)
bg=$(darken_color color4 0.2)
hl=$(get_xres_rgb color1)

printf $fg
printf "\n\n"
printf $bg
printf "\n\n"
printf $hl

output="$(cat << THEME
[ColorEffects:Disabled]
ColorAmount=0
ColorEffect=0
ContrastAmount=0.0
ContrastEffect=0
IntensityAmount=0.0
IntensityEffect=0

[ColorEffects:Inactive]
ColorAmount=0
ColorEffect=0
ContrastAmount=0.0
ContrastEffect=0
IntensityAmount=0.0
IntensityEffect=0

[Colors:Disabled]
Foreground=$hl

[Colors:Button]
ForegroundNormal=$fg
BackgroundNormal=$bg
DecorationFocus=$hl
DecorationHover=$hl

[Colors:Complementary]
DecorationFocus=$hl
DecorationHover=$hl

[Colors:Selection]
ForegroundNormal=$fg
ForegorundAlternate=$fg
BackgroundNormal=$hl
BackgroundAlternate=$hl
DecorationFocus=$hl
DecorationHover=$hl

[Colors:Tooltip]
ForegroundNormal=$fg
ForegorundAlternate=$fg
BackgroundNormal=$bg
BackgroundAlternate=$bg
DecorationFocus=$hl
DecorationHover=$hl

[Colors:View]
ForegroundNormal=$fg
ForegorundAlternate=$fg
BackgroundNormal=$bg
BackgroundAlternate=$bg
DecorationFocus=$hl
DecorationHover=$hl

[Colors:Window]
ForegroundNormal=$fg
ForegorundAlternate=$fg
BackgroundNormal=$bg
BackgroundAlternate=$bg
DecorationFocus=$hl
DecorationHover=$hl

[Colors:Decoration]
DecorationFocus=$hl
DecorationHover=$hl

[General]
ColorScheme=BreezeDark
Name=MyTheme
shadeSortColumn=true
TintFactor=0

[KDE]
contrast=4

[WM]
activeForeground=$fg
inactiveForeground=$fg
activeBackground=$bg
inactiveBackground=$bg
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"

echo "Generated KDE theme: ${dest_dir}${dest_file}"
