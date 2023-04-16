#!/bin/sh

IMG=$(readlink -f $1)
eval "feh --bg-fill $IMG"

