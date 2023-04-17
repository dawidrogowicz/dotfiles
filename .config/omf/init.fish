bass source /etc/profile

set -g fish_greeting
set -g theme_color_scheme terminal2
set -gx PATH $HOME/.local/bin $PATH

alias rm='rm -I'
alias fetch='clear; neofetch'
alias source_omf='source $OMF_CONFIG/init.fish'
alias edit_omf='nvim $OMF_CONFIG/init.fish'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
alias config-status='config status -uno'
alias tmux-dev='bass ~/.scripts/tmux-dev.sh'
alias sudo=doas

if status is-interactive
  fetch
end

function load-dotenv --description 'Load environment variables from .env file'
  set -l envfile ".env"
  if [ (count $argv) -gt 0 ]
    set envfile $argv[1]
  end

  if test -e $envfile
    for line in (cat $envfile)
      set -xg (echo $line | cut -d = -f 1) (echo $line | cut -d = -f 2-)
    end
  end
end

starship init fish | source
