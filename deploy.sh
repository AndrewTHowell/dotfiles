#!/usr/bin/env bash

# clone_or_pull <repo> <dir>
# Checks if repo exists already. If not, clone it. If it does, pull it.
clone_or_pull() {
  if [ ! -d "$2" ]; then
    git clone --depth 1 "$1" "$2"
  else
    git -C "$2" pull
  fi
}



