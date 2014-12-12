# starship prompt
eval "$(starship init zsh)"

# load aliases
source ~/.zsh_alias
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tlon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# kubectl autocomplete
source <(kubectl completion zsh)
