#!/usr/bin/env python3

import os


def set_wallpaper(WALLPAPER_DIR: str, resized_output: str, hyprlock_output: str):
    resized_symlink = f"{WALLPAPER_DIR}/resized_wallpaper.png"
    hyprlock_symlink = f"{WALLPAPER_DIR}/hyprlock_wallpaper.png"

    if os.path.islink(resized_symlink) or os.path.exists(resized_symlink):
        os.remove(resized_symlink)
    os.symlink(resized_output, resized_symlink)

    if os.path.islink(hyprlock_symlink) or os.path.exists(hyprlock_symlink):
        os.remove(hyprlock_symlink)
    os.symlink(hyprlock_output, hyprlock_symlink)
