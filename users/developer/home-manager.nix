{ pkgs, ... }:

{
  imports = [
    ../../modules/home
  ];

  modules.home.profiles.base.enable = true;

  home.username = "developer";
  home.homeDirectory = "/home/developer";
  home.stateVersion = "26.05";

  # Standalone home-manager: no system-level nix.gc to rely on here, unlike
  # the NixOS and darwin hosts.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  home.packages = with pkgs; [
    lazygit
    podman
    podman-compose
    net-snmp
  ];
}
