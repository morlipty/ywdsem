import argparse
from collections.abc import Sequence
from typing import Literal, get_args

NAME = "pyhyprshot"

Target = Literal["multi", "active", "screen", "window", "area"]


class NS(argparse.Namespace):
    target: Target = "multi"
    notify: bool = False
    copy: bool = False


def build_parser():
    p = argparse.ArgumentParser(
        prog=NAME, description="Screenshot taking tool", epilog=""
    )
    _ = p.add_argument(
        "-t",
        "--target",
        choices=list(get_args(Target)),
        default="multi",
        help="What to capture",
    )
    _ = p.add_argument("-n", "--notify", action="store_true", help="Show notification")
    _ = p.add_argument("-c", "--copy", action="store_true", help="Copy to clipboard")

    return p


def parse(argv: Sequence[str] | None = None) -> NS:
    ns: NS = NS()
    _ = build_parser().parse_args(argv, namespace=ns)
    return ns


def main():
    args = parse()
    print(args.target)
    print(args.notify)
    print(args.copy)


if __name__ == "__main__":
    main()
