function pkglist --description 'Package info with subcommands; use --full to include deps'
    set -l full 0
    set -l args
    for a in $argv
        switch $a
            case --full -f
                set full 1
            case --help -h
                set -l _help 1
            case '--*'
                echo "pkg: unknown flag '$a'" 1>&2
                return 2
            case '*'
                set args $args $a
        end
    end

    set -l sub (string lower -- (string trim -- $args[1]))
    set -l rest $args[2..-1]
    set -l fmt --timefmt="%Y-%m-%d %T" "%l\t%n %v"
    set -l log /var/log/pacman.log

    if test -n "$_help" -o -z "$sub"
        echo 'Usage:'
        echo '  pkglist all [--full]              # explicit (default) or all packages (incl. AUR)'
        echo '  pkglist pac [--full]              # official explicit or all official'
        echo '  pkglist aur [--full]              # AUR explicit or all AUR'
        echo '  pkglist installed [pkg/pattern]   # show pacman installs'
        echo '  pkglist updates [pkg/pattern]     # show pacman upgrades'
        echo '  pkglist removed [pkg/pattern]     # show pacman uninstalls'
        echo 'Flags:'
        echo '  -f, --full               # include dependencies'
        return 0
    end

    switch $sub
        case all
            if test $full -eq 1
                expac $fmt (pacman -Qq) | sort          # all installed (official + AUR)
            else
                expac $fmt (pacman -Qqe) | sort         # explicit (official + AUR)
            end
        case pac
            if test $full -eq 1
                expac $fmt (pacman -Qqn) | sort         # all official
            else
                expac $fmt (pacman -Qqne) | sort        # explicit official
            end
        case aur
            if test $full -eq 1
                expac $fmt (pacman -Qqm) | sort         # all AUR
            else
                expac $fmt (pacman -Qqme) | sort        # explicit AUR
            end
        case installed
            if test (count $rest) -gt 0
                set pattern (string join '|' -- $rest)
                rg 'installed' $log | rg -- "$pattern"
            else
                rg 'installed' $log
            end
        case updates
            if test (count $rest) -gt 0
                set pattern (string join '|' -- $rest)
                rg 'upgraded' $log | rg -- "$pattern[1]"
            else
                rg 'upgraded' $log
            end
        case removed
            if test (count $rest) -gt 0
                set pattern (string join '|' -- $rest)
                rg 'removed' $log | rg -- "$pattern[1]"
            else
                rg 'removed' $log
            end


        case '*'
            echo "pkglist: unknown subcommand '$sub' (try: pkglist --help)" 1>&2
            return 1
    end
end

