function fish_greeting
  fastfetch --config examples/13
end

if status is-interactive
  fzf --fish | source
  atuin init fish | source
  starship init fish | source
  set ZELLIJ_AUTO_EXIT true
  eval (zellij setup --generate-auto-start fish | string collect)
end

thefuck --alias | source
mise activate fish | source
zoxide init --cmd cd fish | source
