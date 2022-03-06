#!/usr/bin/env bash

if [ $(yabai -m query --spaces --space |  jq '.type') = '"bsp"' ]; then yabai -m window --toggle float; fi; yabai -m window --grid 1:1:0:0:1:1