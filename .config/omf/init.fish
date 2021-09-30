set -g -x WINEDLLPATH $WINEDLLPATH:/opt/discord-rpc/bin64:/opt/discord-rpc/bin32
set -g fish_greeting
set -x NVM_DIR $HOME/.nvm
set -x CONF $HOME/.config

set -g theme_nerd_fonts yes
set -g theme_color_scheme terminal2

alias rm='rm -I'
alias fetch='clear; neofetch'
alias source_omf='source $OMF_CONFIG/init.fish'
alias edit_omf='nvim $OMF_CONFIG/init.fish'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
alias config-status='config status -uno'

fetch
