#!/usr/bin/env python3


import logging
import os
import sys

from utils.blurred_wallpaper import create_blurred_wallpaper
from utils.hyprlock_wallpaper import create_hyprlock_wallpaper
from utils.resized_wallpaper import create_resized_wallpaper
from utils.set_wallpaper import set_wallpaper

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)


IMG_W = 1920
IMG_H = 1080
BLUR_W = 800
BLUR_H = 600
RADIUS = 50
BLUR_SIGMA = 20


# Directories
main_dir = "~/.cache/wallpapers"
WALLPAPER_DIR = os.path.expanduser(main_dir)
RESIZED_WALLPAPER_DIR = os.path.expanduser(f"{main_dir}/resized")
HYPRLOCK_WALLPAPER_DIR = os.path.expanduser(f"{main_dir}/hyprlock")
BLURRED_WALLPAPER_DIR = os.path.expanduser(f"{main_dir}/blurred")

os.makedirs(WALLPAPER_DIR, exist_ok=True)
os.makedirs(RESIZED_WALLPAPER_DIR, exist_ok=True)
os.makedirs(HYPRLOCK_WALLPAPER_DIR, exist_ok=True)
os.makedirs(BLURRED_WALLPAPER_DIR, exist_ok=True)

HYPRLOCK_TYPE = "hyprlock"
RESIZED_TYPE = "resized"
BLURRED_TYPE = "blurred"


def derive_output_path(input_file: str, dir: str, output_type: str) -> str:
    basename = os.path.basename(input_file)
    name_part = os.path.splitext(basename)[0]
    return os.path.join(dir, f"{name_part}_{output_type}.png")


def main():
    if len(sys.argv) < 2:
        ("Usage: python3 blur_center.py <input_file> [output_file]")
        print("  input_file   : Path to input image")
        sys.exit(1)

    input_file = sys.argv[1]

    if not os.path.isfile(input_file):
        logging.error(f"Input file '{input_file}' does not exist.")
        sys.exit(1)

    resized_output = derive_output_path(input_file, RESIZED_WALLPAPER_DIR, RESIZED_TYPE)
    blurred_output = derive_output_path(input_file, BLURRED_WALLPAPER_DIR, BLURRED_TYPE)
    hyprlock_output = derive_output_path(
        input_file, HYPRLOCK_WALLPAPER_DIR, HYPRLOCK_TYPE
    )

    if not os.path.isfile(resized_output):
        logging.info(f"Creating Hyprlock wallpaper for {input_file}")
        create_resized_wallpaper(input_file=input_file, output_file=resized_output)
    else:
        logging.info("Resized wallpaper for this file already exists")

    if not os.path.isfile(hyprlock_output):
        logging.info(f"Creating resized wallpaper for {input_file}")
        create_hyprlock_wallpaper(
            input_file=resized_output, output_file=hyprlock_output
        )
    else:
        logging.info("Hyprlock wallpaper for this file already exists")

    if not os.path.isfile(blurred_output):
        logging.info(f"Creating blurred wallpaper for {input_file}")
        create_blurred_wallpaper(input_file=resized_output, output_file=blurred_output)
    else:
        logging.info("Hyprlock wallpaper for this file already exists")

    set_wallpaper(WALLPAPER_DIR, resized_output, blurred_output, hyprlock_output)


if __name__ == "__main__":
    main()
