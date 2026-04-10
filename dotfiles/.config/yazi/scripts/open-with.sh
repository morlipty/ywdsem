#!/usr/bin/env bash

file="$1"
mime=$(xdg-mime query filetype "$file")
apps=()

while IFS= read -r desktop; do
  apps+=("$(basename "$desktop" .desktop)")
done < <(rg -l "MimeType=.*$mime" /usr/share/applications/*.desktop)

chosen=$(printf '%s\n' "${apps[@]}" | sort | fzf --prompt="Open with: ")
[ -n "$chosen" ] || exit 0

gio launch "/usr/share/applications/$chosen.desktop" "$file"
