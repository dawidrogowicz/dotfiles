#!/bin/sh

wpg -m
IMG=$(wpg -c)
IMG_DIR="$HOME/Pictures/wallpapers/"

$HOME/.scripts/setDWMTheme.sh $IMG_DIR$IMG
