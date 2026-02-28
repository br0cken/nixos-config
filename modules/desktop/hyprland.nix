{ config, lib, pkgs, ... }:

{
  imports = [];

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;

  services.greetd = {
    enable = true;
    settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --cmd Hyprland";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  environment.systemPackages = with pkgs; [
    hyprlauncher
    waybar
    hyprpaper
    dunst
    wl-clipboard
    grim
    slurp
  ];
}
