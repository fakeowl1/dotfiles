#!/bin/bash

declare -A local_games
local_games=( ["Factorio"]="$HOME/.factorio" ["Terraria"]="$HOME/.local/share/Terraria" )

remote_games_path="Game Files"

for game in ${!local_games[@]}
do
  echo "${local_games[$game]} => $remote_games_path/$game"
  upload-to-nextcloud "${local_games[$game]}" "$remote_games_path/$game"
done
