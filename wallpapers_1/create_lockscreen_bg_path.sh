#!/usr/bin/env bash

# Default values
IMG_W=1920
IMG_H=1080
BLUR_W=800
BLUR_H=600
RADIUS=50

# Check if input file is provided
if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <input_file> [output_file]"
  echo "  input_file   : Path to the input image"
  echo "  output_file  : (Optional) Path for the output image (default: 'output.png')"
  exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="${2:-output.png}"

# Verify input file exists
if [[ ! -f "$INPUT_FILE" ]]; then
  echo "Error: Input file '$INPUT_FILE' does not exist."
  exit 1
fi

# Calculate position
X=$(((IMG_W - BLUR_W) / 2))
Y=$(((IMG_H - BLUR_H) / 2))

magick "$INPUT_FILE" \
  -filter Lanczos -resize "${IMG_W}x${IMG_H}\^" \
  \( +clone -crop "${BLUR_W}x${BLUR_H}+${X}+${Y}" +repage -blur 0x20 \
  \( -size "${BLUR_W}x${BLUR_H}" xc:black -fill white \
  -draw "roundrectangle 0,0 $((BLUR_W - 1)),$((BLUR_H - 1)) ${RADIUS},${RADIUS}" -morphology erode disk:2 \
  \) -alpha off -compose copy_opacity -composite \) \
  -geometry +${X}+${Y} -compose over -composite \
  "$OUTPUT_FILE"

echo "Processed '$INPUT_FILE' -> '$OUTPUT_FILE'"
