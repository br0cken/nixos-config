{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    glow
    hugo
    jq
    httpie
    tmux
    tree
    zoxide
  ] ++ lib.optionals (!pkgs.stdenv.isDarwin) [
    netcat-openbsd
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
