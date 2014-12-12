xhost +local:root > /dev/null 2>&1

source /usr/share/chruby/chruby.sh
source /usr/share/chruby/auto.sh
source /usr/share/git/completion/git-completion.bash
source /usr/share/git/completion/git-prompt.sh

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export JAVA_FONTS=/usr/share/fonts/TTF
export EDITOR='vim'
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export GMAIL_USERNAME='smarquez@devspark.com'
export TERM="xterm-256color"

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'
alias fixit='sudo rm -f /var/lib/pacman/db.lck && sudo pacman-mirrors -g && sudo pacman -Syyuu  && sudo pacman -Suu'
alias pacman-orphans='sudo pacman -Rns $(pacman -Qtdq)'

alias $EDITOR='vim'
alias edit=$EDITOR
alias subl='subl3'

SDL_VIDEO_FULLSCREEN_HEAD=0

# prompt
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[m\]\[\e[1;37m\] $(__git_ps1 "(%s)") \[\e[1;32m\]\$ \[\e[m\]\[\e[m\]\[\e[1;37m\]'

#Remember current directory in new terminal
[[ -s "/etc/profile.d/vte.sh" ]] && . "/etc/profile.d/vte.sh"

# ?
if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
fi

## TMUX
# Start tmux on every shell login
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux

# Export 256colors
if [ -n "$TMUX" ]; then
    case $COLORTERM in
        Terminal) export TERM=screen-256color ;;         # this is XFCE Terminal
        gnome-terminal) export TERM=xterm-256color ;;   # this is gnome-terminal
    esac
fi

# ?
alias tmux="tmux -2"

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
