source ~/.secrets

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(archlinux bower bundler chruby common-aliases git gem node npm rails3 ruby sudo systemd tmux tmuxinator vi-mode)

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
alias subl='subl3'

## TMUX
# Start tmux on every shell login
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# Export 256colors
# if [ -n "$TMUX" ]; then
#     case $COLORTERM in
#         Terminal) export TERM=screen-256color ;;         # this is XFCE Terminal
#         gnome-terminal) export TERM=xterm-256color ;;   # this is gnome-terminal
#     esac
# fi

# alias tmux="tmux -2"