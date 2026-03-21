#!/usr/bin/env/bash
cd /home/tobias/nixos
nix flake update
git add .
sudo nixos-rebuild switch --flake
git commit -m "flake update"
