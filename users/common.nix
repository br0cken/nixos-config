{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fzf
    glow
    hugo
    jq
    netcat-openbsd
    httpie
    tmux
    zoxide
  ];

  programs.home-manager.enable = true;
}
