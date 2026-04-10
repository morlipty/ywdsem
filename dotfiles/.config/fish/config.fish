function fish_greeting
  fastfetch --config examples/13
end

function fish_user_key_bindings
  fish_vi_key_bindings
end

if status is-interactive
  fzf --fish | source
  atuin init fish | source
  starship init fish | source
  zoxide init --cmd cd fish | source
  mise activate fish | source
end
