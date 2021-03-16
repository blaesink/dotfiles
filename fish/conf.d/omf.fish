# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

set fish_greeting

alias sudo='sudo '

# navigation
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
#alias mkcd='_(){mkdir $1; cd $1;};_'

# Adding some flags to extra files
alias cp="cp -i"
alias df="df -h"
alias duh="du -sh"
alias mv="mv -i"

# utilities
alias brightness="xrandr --output eDP1 --brightness"
alias cputemp="sensors | grep -A 2 Package"
alias view='viewnior'
alias xup="xrdb -merge ~/.Xresources"
# alias rg="ranger"
#alias gogo="go build $1 && ./$1"
alias config="cd ~/.config"

# ls commands
alias ls="exa --color="auto" --group-directories-first"
alias la="exa -a --color="auto" --group-directories-first"

# a few qol things
alias rxp="rustc --explain"
alias crr="cargo run --release"
alias i3conf="nvim ~/.i3/config"
alias wfsc="nmcli device wifi list"

# vim specific
alias vimconf="vim ~/.vimrc"
alias nvimconf="nvim ~/.config/nvim/init.vim"
alias nv="nvim"
alias vim="nvim"

# pacman commands
alias pacsyu="sudo pacman -Syu"
alias pacsyy="sudo pacman -Syyu"
alias pacss="pacman -Ss"

# git commands
alias addall="git add ."
alias commit="git commit -m"
alias push="git push origin"
alias diff="git diff"

alias qute="qutebrowser"
alias rm="rm -i"

# Some more config stuff
alias fishsrc="source ~/.config/fish/conf.d/omf.fish"
alias fishconf="nvim ~/.config/fish/conf.d/omf.fish"

alias battery="bat /sys/class/power_supply/BAT*/capacity"

alias please="sudo"
# Color in tree
alias tree="tree -C"

# Use starship.rs
starship init fish | source
