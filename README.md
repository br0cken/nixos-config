# NixOS System Configurations

This repository contains my NixOS configurations. 

## NixOS

```bash
# Update the flake

sudo nix flake update --flake ~/.nixos-config
# NixOS
sudo nixos-rebuild switch --flake ~/.nixos-config

# Darwin
sudo darwin-rebuild switch --flake ~/.nixos-config
```
