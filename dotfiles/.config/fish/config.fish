function fish_greeting
  fastfetch --config examples/13
end

if status is-interactive

  function fish_user_key_bindings
    fish_vi_key_bindings
  end

  fzf --fish | source
  atuin init fish | source
  starship init fish | source
  mise activate fish | source
else 
  mise activate fish --shims | source
end

zoxide init --cmd cd fish | source
