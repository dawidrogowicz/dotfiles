#!/bin/sh

BG_DIR=$1
RANDOM=$2
NO_IMAGES=$(ls $BG_DIR | wc -l)
IMG_INDEX=$[ ($RANDOM % $NO_IMAGES) + 1]
FILENAME=$(ls $BG_DIR | sed -n ${IMG_INDEX}p)
FULL_PATH=$(realpath $BG_DIR)/$FILENAME
feh --bg-fill $FULL_PATH
