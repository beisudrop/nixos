#!/usr/bin/env bash
WALLPAPER_DIR="$HOME/Bilder/Lockscreen"
while true; do
    swww img "$(find "$WALLPAPER_DIR" -type f -maxdepth 1 2>/dev/null | shuf -n 1)"
    sleep 300
done
