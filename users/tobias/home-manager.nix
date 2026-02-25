{ config, pkgs, ... }:

{
  home.username = "tobias";
  home.homeDirectory = "/home/tobias";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    glow
    hugo
    httpie
    kubectl
    yubikey-manager # provides ykman
  ];

  programs.home-manager.enable = true;
}
