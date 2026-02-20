#grub
abbr grub-update 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
abbr grub-ebr 'sudo grub-install --efi-directory=/efi --boot-directory=/boot --removable'

#package manager
abbr reflector-update 'sudo reflector --verbose --country Iran,Germany,France --latest 50 --sort rate --save /etc/pacman.d/mirrorlist'
abbr pacunlock 'sudo rm -i /var/lib/pacman/db.lck'
