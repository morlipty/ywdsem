#general
abbr -a -- nv 'nvim'
abbr -a -- lg 'lazygit'
abbr -a --set-cursor='%' -- e 'eza -a%'
abbr -a --set-cursor='%' -- el 'eza -al%'

#package manager
abbr -a --set-cursor='%' -- pkglist 'paru -Qq% | fzf --style full --preview "paru -Qi {}; rg \'(installed|upgraded|removed) {} \' /var/log/pacman.log"'
abbr -a -- pkghist 'tspin /var/log/pacman.log | rg "(installed|removed|upgraded)" | tac | fzf --ansi --no-sort'
abbr -a -- pacunlock 'sudo rm -i /var/lib/pacman/db.lck'

#grub
abbr -a -- grub-update 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
abbr -a -- grub-ebr 'sudo grub-install --efi-directory=/efi --boot-directory=/boot --removable'
