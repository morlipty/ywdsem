alias c 'clear'
alias ls 'eza -a --icons=always'
alias ll 'eza -al --icons=always'

#package manager
alias reflector-update 'sudo reflector --verbose --country Iran,Germany,France --latest 50 --sort rate --save /etc/pacman.d/mirrorlist'
alias pacunlock 'sudo rm -i /var/lib/pacman/db.lck'

#music
alias musicsampleratecheck 'find ~/Music -type f -iname "*.flac" -exec ffprobe -v error -select_streams a:0 -show_entries stream=sample_rate,bit_depth -of csv=p=0 {} \; | sort | uniq -c'
alias musicalbumartrescheck 'find ~/Music -type f -iname "*.flac" -exec ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 {} \; | sort | uniq -c'

#sddm theme
alias sddm-astronaut-theme 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"'
