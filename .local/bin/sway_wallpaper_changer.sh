#!/bin/bash

shift

if [ $# -lt 1 ]; then
  echo "./sway-wallpaper-changer [path]"
  exit 1
fi

swaymsg -s $SWAYSOCK output DP-3 bg $1 fill
