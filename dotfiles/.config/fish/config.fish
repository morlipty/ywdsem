function fish_greeting
  fastfetch --config examples/13
end

if status is-interactive
  fzf --fish | source
  atuin init fish | source
  starship init fish | source
end

thefuck --alias | source
mise activate fish | source
zoxide init --cmd cd fish | source
