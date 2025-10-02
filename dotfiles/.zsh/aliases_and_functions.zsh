#aliases
alias ...='cd ~'
alias clearhistory='rm ./.zsh_history'
alias c='clear'
alias ls='eza -a --icons=always'
alias ll='eza -al --icons=always'
alias shutdown='systemctl poweroff'
alias zsh-bench='~/.zsh/plugins/zsh-bench/zsh-bench'

#grub
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias grub-ebr='sudo grub-install --efi-directory=/efi --boot-directory=/boot --removable'

#package manager
alias reflector-update='sudo reflector --verbose --country Iran,Germany,France --latest 50 --sort rate --save /etc/pacman.d/mirrorlist'
alias pacunlock='sudo rm -i /var/lib/pacman/db.lck'

#pkg informations
alias yalist='expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" $(pacman -Qqe) | sort'
alias yafulllist='expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" $(pacman -Qq) | sort'
alias paclist='expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" $(pacman -Qqne) | sort'
alias pacfulllist='expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" $(pacman -Qqn) | sort'
alias aurlist='expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" $(pacman -Qqme) | sort'
alias aurfulllist='expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" $(pacman -Qqm) | sort'

#music
alias musicsampleratecheck='find ~/Music -type f -iname "*.flac" -exec ffprobe -v error -select_streams a:0 -show_entries stream=sample_rate,bit_depth -of csv=p=0 {} \; | sort | uniq -c'
alias musicalbumartrescheck='find ~/Music -type f -iname "*.flac" -exec ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 {} \; | sort | uniq -c'

#backup
alias ywdsem='~/ywdsem/upload_to_git.sh'

#functions
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
