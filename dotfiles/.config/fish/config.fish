function fish_greeting
  fastfetch --config examples/13
end

if status is-interactive
  fzf --fish | source
  atuin init fish | source
  starship init fish | source
end

mise activate fish | source
thefuck --alias | source
zoxide init --cmd cd fish | source
