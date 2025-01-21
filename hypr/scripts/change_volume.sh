#!/usr/bin/env bash

param=$1

if [ "$param" = "up" ]; then
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
fi
if [ "$param" = "down" ]; then
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
fi
volume=$(wpctl get-volume @DEFAULT_SINK@)
notify-send -t 400 "Change volume" "$volume"
