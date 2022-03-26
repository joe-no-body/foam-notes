#!/usr/bin/env bash
# 2022-03-20 - A quick script to display custom VS Code bindings as a nice table

sed -e 's|//.*||g' ~/.config/Code/User/keybindings.json \
  | jq -r '.[] | select(.command[0:1] != "-") | [.key, .command, .when] | @tsv' \
  | sort -t $'\t' -k 2 \
  | column -s $'\t' -t