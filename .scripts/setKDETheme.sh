#!/bin/sh

IMG=$(readlink -f $1)
eval "plasma-apply-wallpaperimage $IMG"
eval "plasma-apply-colorscheme WPG2 && plasma-apply-colorscheme WPG"
