fastfetch --config examples/13 &

if status is-interactive
  fzf --fish | source
  atuin init fish | source
end

thefuck --alias | source
zoxide init --cmd cd fish | source
starship init fish | source
