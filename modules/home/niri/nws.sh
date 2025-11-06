#!/usr/bin/env bash

# Get list of windows (title + app-id)
windows=$(niri msg -j windows | jq -r '.[] | "\(.id) | \(.app_id // "unknown") - \(.title // "no title")"')

[ -z "$windows" ] && exit 0

# Pick one with wofi
chosen=$(echo "$windows" | wofi --dmenu --prompt "Switch to window:")

# Extract ID
id=$(echo "$chosen" | cut -d '|' -f1 | xargs)

# Focus window
[ -n "$id" ] && niri msg action focus-window --id "$id"

