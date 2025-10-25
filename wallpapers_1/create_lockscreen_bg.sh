#!/usr/bin/env bash

IMG_W=1920
IMG_H=1080
BLUR_W=800
BLUR_H=600
RADIUS=50

# Calculate position
X=$(((IMG_W - BLUR_W) / 2))
Y=$(((IMG_H - BLUR_H) / 2))

magick input.png \
  -filter Lanczos \
  -resize "${IMG_W}x${IMG_H}\^" \
  \( +clone \
  -crop ${BLUR_W}x${BLUR_H}+${X}+${Y} +repage \
  -blur 0x20 \
  \( -size ${BLUR_W}x${BLUR_H} xc:black \
  -fill white \
  -draw "roundrectangle 0,0 $((BLUR_W - 1)),$((BLUR_H - 1)) ${RADIUS},${RADIUS}" \
  -morphology erode disk:2 \
  \) -alpha off -compose copy_opacity -composite \
  \) \
  -geometry +${X}+${Y} -compose over -composite \
  output.png
