fastfetch --config examples/13 &

if status is-interactive
  atuin init fish | source
end

thefuck --alias | source
zoxide init --cmd cd fish | source
starship init fish | source
