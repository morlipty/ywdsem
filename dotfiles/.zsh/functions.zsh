pkgupdates() {
  grep -E "upgraded" /var/log/pacman.log | grep "$1"
}

lt() {
  eza -a --tree --level=${1:-1} --icons=always
}

y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
