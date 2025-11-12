#!/bin/bash

echo -e "${GREEN}"
figlet -f smslant "Enable services"
echo -e "${NONE}"

Services=(
  "sddm"
  "power-profiles-daemon"
  "thermald"
  "paccache.timer"
)

systemctl enable "${Services[@]}"
