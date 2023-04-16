bass source /etc/profile

set -gx PATH $HOME/.cargo/bin:$HOME/.local/bin:$NVM_BIN $PATH

alias rm='rm -I'
alias fetch='clear; neofetch'
alias source_omf='source $OMF_CONFIG/init.fish'
alias edit_omf='nvim $OMF_CONFIG/init.fish'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
alias config_status='config status -uno'
alias tmux-dev='bass ~/.scripts/tmux-dev.sh'
alias compile_kernel='sudo make -j30 && sudo make -j30 modules_install && sudo make -j30 install && sudo grub-mkconfig -o /boot/grub/grub.cfg'

if status is-interactive
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    exec startx
  else
    fetch
  end
end

starship init fish | source
