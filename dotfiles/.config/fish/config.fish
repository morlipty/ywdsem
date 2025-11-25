function fish_greeting
  fastfetch --config examples/13
end

if status is-interactive
  fzf --fish | source
  atuin init fish | source
  starship init fish | source
  mise activate fish | source
  function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
  end
else 
  mise activate fish --shims | source
end

zoxide init --cmd cd fish | source
