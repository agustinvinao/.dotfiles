xhost +local:root > /dev/null 2>&1

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

alias $EDITOR='vim'
alias edit=$EDITOR

SDL_VIDEO_FULLSCREEN_HEAD=0

# prompt
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\ \[\e[1;32m\]\$ \[\e[m\]\[\e[m\]\[\e[1;37m\]'

#Remember current directory in new terminal
[[ -s "/etc/profile.d/vte.sh" ]] && . "/etc/profile.d/vte.sh"

if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
fi