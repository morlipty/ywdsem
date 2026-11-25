function fcd
    set -l p_type 'file -b -- {}'
    set -l p_ls 'eza -ld --git --extended --color=always -- {}'
    set -l p_pkg "pacman -Qo -- {} 2>/dev/null || echo 'not owned by any package'"

    set -l preview (string join '; echo; ' $p_type $p_ls $p_pkg)

    set -l sel (fd -H . / | fzf --style full --preview-window=wrap-word --preview $preview)
    or return

    if test -d "$sel"
        cd "$sel"
    else
        cd (dirname "$sel")
    end
end
