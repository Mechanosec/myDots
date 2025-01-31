#!/usr/bin/env bash

current_datetime=$(date +"%Y-%m-%d %H:%M:%S")

rm -rf ~/.config/myNix/nixos
cp -r /etc/nixos/ ~/.config/myNix/

git pull
git add .
git commit -m "dot save ($current_datetime)"
git push
