#!/usr/bin/env bash
file="$1"
mime=$(xdg-mime query filetype "$file")

rg -l "MimeType=.*$mime" /usr/share/applications/*.desktop |
  sed 's|.*/||; s|\.desktop$||' |
  fzf --prompt="Open with: " |
  xargs -r -I{} gio launch /usr/share/applications/{}.desktop "$file"
