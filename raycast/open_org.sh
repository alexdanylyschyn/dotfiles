#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Org Files
# @raycast.mode silent
#
# Optional parameters:
# @raycast.packageName nvim

# emacsclient -c -n -a emacs "$HOME/org"
# kitten @ --to=unix:/tmp/kitty launch --type=os-window --title=Org nvim "$HOME/org"
export LANG=en_US.UTF-8
/Applications/kitty.app/Contents/MacOS/kitty --single-instance zsh -c "nvim $HOME/org" &
