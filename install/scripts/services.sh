#!/usr/bin/env bash

echo -e "${GREEN}"
figlet -f smslant "Enable services"
echo -e "${NONE}"

Services=(
  "bluetooth"
  "dnscrypt-proxy"
  "firewalld"
  "keyd"
  "NetworkManager"
  "plasmalogin"
  "power-profiles-daemon"
  "thermald"
  "fstrim"
  "fwupd-refresh.timer"
  "paccache.timer"
  "pkgfile-update.timer"
)

systemctl enable "${Services[@]}"
