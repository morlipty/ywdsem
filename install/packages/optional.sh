#!/bin/bash

VirtualBox=(
  "virtualbox"
  "virtualbox-guest-iso"
  "virtualbox-guest-utils-nox"
  "virtualbox-host-modules-arch"
)

if gum confirm "Do you want to install VirtualBox"; then
  echo -e "${GREEN}"
  figlet -f smslant "VirtualBox"
  echo -e "${NONE}"
  yay -S --needed "${VirtualBox[@]}"
fi
