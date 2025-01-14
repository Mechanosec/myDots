#!/usr/bin/env bash

STYLE="$HOME/.config/wofi/style.css"

if [[ ! $(pidof wofi) ]]; then
  wofi --style "${STYLE}" --show drun
else
  pkill wofi
fi
