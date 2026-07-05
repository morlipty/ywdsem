function fish_greeting
    if test "$KITTY_WINDOW_ID" = 1
        fastfetch --config examples/13
    end
end

function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert ctrl-z '__fish_echo fg 2>/dev/null'
end

if status is-interactive
    fzf --fish | source
    starship init fish | source
    zoxide init --cmd cd fish | source
end

fish_config theme choose default
