#general
abbr e 'eza -a'
abbr el 'eza -al'

#package manager
abbr pkglist 'paru -Qq | fzf --style full --preview "paru -Qi {}; rg \'(installed|upgraded|removed) {} \' /var/log/pacman.log"'
abbr pkghist 'tspin /var/log/pacman.log | rg "(installed|removed|upgraded)" | tac | fzf --ansi --no-sort'
abbr pacunlock 'sudo rm -i /var/lib/pacman/db.lck'

#grub
abbr grub-update 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
abbr grub-ebr 'sudo grub-install --efi-directory=/efi --boot-directory=/boot --removable'
