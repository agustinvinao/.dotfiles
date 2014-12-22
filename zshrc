# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

source /usr/share/chruby/chruby.sh
source /usr/share/chruby/auto.sh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(archlinux bower bundler common-aliases git gem node npm rails ruby sudo systemd tmux tmuxinator) #vi-mode chruby

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG="es_AR"
export LANGUAGE="es_AR"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
alias subl='subl3'

zstyle ':omz:module:pacman' frontend 'yaourt'

zstyle ':omz:module:tmux' auto-start 'yes'
## TMUX
# Start tmux on every shell login
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

# Base16 Shell
# git clone git@github.com:chriskempson/base16-shell.git ~/.config/base16-shell
BASE16_SCHEME="tomorrow"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
