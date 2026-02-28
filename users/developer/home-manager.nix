{ config, pkgs, ... }:

{
  imports = [ ./../common.nix ];

  home.username = "developer";
  home.homeDirectory = "/home/developer";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    podman
    podman-compose
    net-snmp
  ];
}
