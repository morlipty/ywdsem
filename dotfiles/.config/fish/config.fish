function fish_greeting
  fastfetch --config examples/13
end

if status is-interactive
  fzf --fish | source
  atuin init fish | source
  starship init fish | source
  function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
  end
end


thefuck --alias | source
mise activate fish | source
zoxide init --cmd cd fish | source
