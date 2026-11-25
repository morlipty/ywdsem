# general
abbr -a -- n nvim
abbr -a -- s systemctl
abbr -a -- j journalctl
abbr -a --set-cursor -- e 'eza --icons -a%'
abbr -a --set-cursor -- el 'eza --icons --header --git -al%'

# git
abbr -a -- g git
abbr -ac git -- s status
abbr -ac git -- a add
abbr -ac git -- c commit
abbr -ac git -- ca 'commit --amend'
abbr -ac git -- pu push
abbr -ac git -- pl pull
abbr -ac git -- co checkout

# package manager
abbr -a -- yu 'yay -Pw && yay'
abbr -a -- pacunlock 'sudo rm -i /var/lib/pacman/db.lck'
abbr -a --set-cursor -- pkglist 'pacman -Qq% | fzf --style full --preview "pacman -Qi {}"'
abbr -a --set-cursor -- pkghist 'tspin /var/log/pacman.log | rg --color=always "(installed|removed|upgraded%)" | tac | fzf --ansi --no-sort'
