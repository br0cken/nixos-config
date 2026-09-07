{ pkgs, ... }:

{
  imports = [
    ../../modules/home
  ];

  modules.home.profiles.base.enable = true;

  home.username = "developer";
  home.homeDirectory = "/home/developer";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    lazygit
    podman
    podman-compose
    net-snmp
  ];
}
