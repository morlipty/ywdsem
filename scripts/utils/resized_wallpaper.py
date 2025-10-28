#!/usr/bin/env python3

import os
import subprocess
import sys


def create_resized_wallpaper(
    input_file: str,
    output_file: str,
    IMG_W: int = 1920,
    IMG_H: int = 1080,
):
    _, ext = os.path.splitext(input_file)
    if ext.lower() == ".gif":
        input_file = f"{input_file}[0]"

    # fmt: off
    cmd = [
        "magick", input_file,
        "-filter", "Lanczos",
        "-resize", f"{IMG_W}x{IMG_H}^",
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
