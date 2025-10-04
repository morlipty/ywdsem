#fastfetch and color sceme
(fastfetch --config examples/13 &)

#setopts
setopt autocd
setopt autopushd

#enable history
#HISTFILE=~/.zsh_history
#HISTSIZE=10000
#SAVEHIST=10000
#setopt sharehistory
#setopt appendhistory
#setopt histignorealldups

#prompt
eval "$(starship init zsh)"

#inits
fuck() {
  eval "$(thefuck --alias)"
  fuck "$@"
}
source <(fzf --zsh)
eval "$(atuin init zsh)"
eval "$(thefuck --alias)"

#plugins
source ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.zsh/plugins/sudo.zsh
zstyle ':autocomplete:*' delay 0.25

#aliases and functions
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
