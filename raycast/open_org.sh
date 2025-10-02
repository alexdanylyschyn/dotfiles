#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Org Files
# @raycast.mode silent
#
# Optional parameters:
# @raycast.packageName emacs

emacsclient -c -n -a emacs "$HOME/org"
