#!/bin/sh

wpg -m
IMG=$(wpg -c)
IMG_DIR="$HOME/Pictures/wallpapers/"

sh $HOME/.scripts/setKDETheme.sh $IMG_DIR$IMG
