{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    glow
    hugo
    jq
    httpie
    tmux
    zoxide
  ] ++ lib.optionals (!pkgs.stdenv.isDarwin) [
    netcat-openbsd
  ];

  programs.home-manager.enable = true;
}
