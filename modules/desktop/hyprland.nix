{ config, lib, pkgs, ... }:

{
  imports = [];

  environment.systemPackages = with pkgs; [
    wofi
    waybar
    hyprpaper
    dunst
    wl-clipboard
    grim
    slurp
  ];
}

