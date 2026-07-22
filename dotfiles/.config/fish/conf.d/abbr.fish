#general
abbr -a -- nv nvim
abbr -a -- lg lazygit
abbr -a --set-cursor='%' -- e 'eza --icons -a%'
abbr -a --set-cursor='%' -- el 'eza --icons --header --git --loc -al%'

#package manager
abbr -a -- yu 'yay -Pw && yay'
abbr -a --set-cursor='%' -- pkglist 'pacman -Qq% | fzf --style full --preview "pacman -Qi {}"'
abbr -a -- pkghist 'tspin /var/log/pacman.log | rg "(installed|removed|upgraded)" | tac | fzf --ansi --no-sort'
abbr -a -- pacunlock 'sudo rm -i /var/lib/pacman/db.lck'
