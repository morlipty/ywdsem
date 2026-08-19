function fish_greeting
    fastfetch --config examples/13
end

function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert ctrl-z '__fish_echo fg 2>/dev/null'
    bind -M insert ctrl-\; y
end

if status is-interactive
    fzf --fish | source
    starship init fish | source
    zoxide init --cmd cd fish | source
    eval (zellij setup --generate-auto-start fish | string collect)
    fish_config theme choose catppuccin-mocha
end
