#!/bin/sh

IMG=$(readlink -f $1)
echo $IMG
SCRIPT="var allDesktops = desktops();print (allDesktops);for (i=0;i<allDesktops.length;i++) {d = allDesktops[i];d.wallpaperPlugin = \"org.kde.image\";d.currentConfigGroup = Array(\"Wallpaper\", \"org.kde.image\", \"General\");d.writeConfig(\"Image\", \"file://$IMG\")}"

eval "qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript '$SCRIPT'"
eval "plasma-apply-colorscheme WPG2 && plasma-apply-colorscheme WPG"
