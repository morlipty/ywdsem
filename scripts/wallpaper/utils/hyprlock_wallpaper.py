#!/usr/bin/env python3

import subprocess
import sys


def create_hyprlock_wallpaper(
    input_file: str,
    output_file: str,
    IMG_W: int = 1920,
    IMG_H: int = 1080,
    ratio: float = 2.4,
    RADIUS: int = 50,
    BLUR_SIGMA: int = 20,
):
    BLUR_W = IMG_W // ratio
    BLUR_H = IMG_H // ratio

    x = (IMG_W - BLUR_W) // 2
    y = (IMG_H - BLUR_H) // 2

    # fmt: off
    cmd = [
        "magick", input_file,
        "(",
            "+clone", "-crop", f"{BLUR_W}x{BLUR_H}+{x}+{y}", "+repage", "-blur", f"0x{BLUR_SIGMA}",
                "(",
                    "-size", f"{BLUR_W}x{BLUR_H}", "xc:black", "-fill", "white", 
                    "-draw", f"roundrectangle 0,0 {BLUR_W - 1},{BLUR_H - 1} {RADIUS},{RADIUS}",
                    "-morphology", "erode", "disk:2",
                ")",
            "-alpha", "off", "-compose", "copy_opacity", "-composite",
        ")", 
        "-geometry", f"+{x}+{y}",
        "-compose", "over", "-composite",
        output_file,
    ]
    # fmt: on

    try:
        # Run the command
        _ = subprocess.run(cmd, check=True, capture_output=True, text=True)
        print(f"Processed: '{input_file}' → '{output_file}'")
    except subprocess.CalledProcessError as e:
        print(f"ImageMagick failed with return code {e.returncode}", file=sys.stderr)
        print(f"Command: {' '.join(cmd)}", file=sys.stderr)
        print(f"stderr: {e.stderr or ''}", file=sys.stderr)
        sys.exit(1)
    except FileNotFoundError:
        print(
            "'magick' command not found. Please install ImageMagick 7+.",
            file=sys.stderr,
        )
        sys.exit(1)
