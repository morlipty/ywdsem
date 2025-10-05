function fish_greeting
  fastfetch --config examples/13
end

if status is-interactive
  fish_config theme choose Tomorrow\ Night\ Bright
  fzf --fish | source
  atuin init fish | source
  starship init fish | source
end

thefuck --alias | source
direnv hook fish | source
zoxide init --cmd cd fish | source
