#!/bin/sh

tmux new-session \; \
  send-keys 'nvim .' C-m \; \
  split-window -h -p 25 \; \
  send-keys 'cmatrix' C-m \; \
  split-window -v -p 75 \; \
  select-pane -t 0 \; \
  split-window -v -p 35\; \
  split-window -h -p 50 \; \
  send-keys 'htop' C-m \;
