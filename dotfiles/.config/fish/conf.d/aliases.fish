alias c 'clear'
alias ls 'eza -a --icons=always'
alias ll 'eza -al --icons=always'

#grub
alias grub-update 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias grub-ebr 'sudo grub-install --efi-directory=/efi --boot-directory=/boot --removable'

#package manager
alias reflector-update 'sudo reflector --verbose --country Iran,Germany,France --latest 50 --sort rate --save /etc/pacman.d/mirrorlist'
alias pacunlock 'sudo rm -i /var/lib/pacman/db.lck'

#music
alias musicsampleratecheck 'find ~/Music -type f -iname "*.flac" -exec ffprobe -v error -select_streams a:0 -show_entries stream=sample_rate,bit_depth -of csv=p=0 {} \; | sort | uniq -c'
alias musicalbumartrescheck 'find ~/Music -type f -iname "*.flac" -exec ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 {} \; | sort | uniq -c'

#backup
alias ywdsem '~/ywdsem/upload_to_git.sh'
