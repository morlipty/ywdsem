#general
abbr e 'eza -a'
abbr el 'eza -al'

#package manager
abbr pkglist 'paru -Qq | fzf --style full --preview "paru -Qi {}; rg \'(installed|upgraded|removed) {} \' /var/log/pacman.log"'
abbr pkghist 'rg "(installed|upgraded|removed)" /var/log/pacman.log | fzf'
abbr reflector-update 'sudo reflector --verbose --country Iran,Germany,France --latest 50 --sort rate --save /etc/pacman.d/mirrorlist'
abbr pacunlock 'sudo rm -i /var/lib/pacman/db.lck'

#grub
abbr grub-update 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
abbr grub-ebr 'sudo grub-install --efi-directory=/efi --boot-directory=/boot --removable'
