set -g fish_greeting

set -g theme_color_scheme terminal2

alias rm='rm -I'
alias fetch='clear; neofetch'
alias source_omf='source $OMF_CONFIG/init.fish'
alias edit_omf='nvim $OMF_CONFIG/init.fish'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
alias config-status='config status -uno'

if status is-interactive
  fetch
end

