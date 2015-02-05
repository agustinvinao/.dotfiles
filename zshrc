# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh

source ~/.secrets
source /etc/profile.d/vte.sh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"
# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"
# Which plugins would you like to load?
plugins=(git vi-mode common_aliases rvm battery docker tmux) #rails

export PATH=$HOME/bin:/usr/local/bin:$PATH
# You may need to manually set your language environment
#export LANG="es_AR"
#export LANGUAGE="es_AR"
export TERM=gnome-256color

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

source $ZSH/oh-my-zsh.sh

function __current_branch_action {
  echo  "git $1`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`"
  eval  "git $1`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`"
}

alias subl='subl3'
alias tmux="TERM=screen-256color-bce tmux"
alias be="bundle exec"
alias rake="bundle exec rake"

# Base16 Shell
# git clone git@github.com:chriskempson/base16-shell.git ~/.config/base16-shell
BASE16_SCHEME="eighties"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# Start tmux automatically
case $- in *i*)
  if [ -z "$TMUX" ]; then exec tmux; fi;;
esac
