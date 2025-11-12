#!/bin/bash

current_date=$(date +%Y:%m:%d-%H:%M)
cd ~/ywdsem

# Upload git
if gum confirm "Upload to git?"; then
  git add *
  git commit -m "Backup $current_date"
  git push
fi
