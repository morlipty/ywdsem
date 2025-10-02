#!/bin/bash

Steam=(
  "vulkan-intel"
  "lib32-vulkan-intel"
  "steam"
)

Wine=(
  "wine"
  "wine-mono"
  "wine-gecko"
  "winetricks"
)

Libs=(
  "gamemode"
  "lib32-gamemode"
  "vkd3d"
  "lib32-vkd3d"
  "gvfs"
  "python-pefile"
  "python-protobuf"
  "umu-launcher"
)

Lutris=(
  "lutris"
  "gamescope"
  "mangohud"
)

Install=(
  "${Wine[@]}"
  "${Wine[@]}"
  "${Libs[@]}"
  "${Lutris[@]}"
)

yay -S --needed "${Install[@]}"
