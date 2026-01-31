#!/usr/bin/env bash

# Query windows, sort by app_id, and format for wofi with icons
win=$(niri msg -j windows | jq -r '.[] | "\(.app_id)\t\(.title)\t\(.id)"' \
    | sort -k1,1 \
    | awk -F'\t' '{print $1 " - " $2 "\t" $3}' \
    | wofi  -d --prompt "Switch window:")

# Extract ID (second tab field)
id=$(echo "$win" | awk -F'\t' '{print $2}')

# Focus window
if [ -n "$id" ]; then
    niri msg action focus-window --id "$id"
fi
