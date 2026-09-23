#!/usr/bin/env bash

LC_ALL=C pacman -Qi | awk '
  /^Name/ { name = $3 }
  /^Installed Size/ { print name, $4$5 }
' | sort -k2 -hr
