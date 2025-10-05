function pkgupdates --description 'Show pacman upgrades; optionally filter by pattern'
    set -l log /var/log/pacman.log
    set -l pattern $argv[1]

    if test -n "$pattern"
        grep -E 'upgraded' $log | grep -E -- "$pattern"
    else
        grep -E 'upgraded' $log
    end
end
