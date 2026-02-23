{ config, lib, pkgs, ... }:

{
  imports = [];

  environment.systemPackages = with pkgs; [
    ansible
    claude-code
    discord
    ghostty
    obsidian
    opentofu
    spotify
    syncthing
    vscode
  ];
}

