#!/bin/bash

echo -e "${GREEN}"
figlet -f smslant "Enable services"
echo -e "${NONE}"

Services=(
  "keyd"
  "sddm"
  "bluetooth"
  "power-profiles-daemon"
  "dnscrypt-proxy"
  "firewalld"
  "thermald"
  "fstrim"
  "paccache.timer"
  "pkgfile-update.timer"
)

systemctl enable "${Services[@]}"
