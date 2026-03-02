# NixOS System Configurations

This repository contains my NixOS configurations. 

## NixOS Updates

```bash
sudo nix flake update --flake ~/.nixos-config
sudo nixos-rebuild switch --flake ~/.nixos-config
```
## Darwin updates

```bash
sudo darwin-rebuild switch --flake ~/.nixos-config
```
