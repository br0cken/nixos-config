{ lib, homeDirectory, ... }:

{
  imports = [
    ../../modules/home
  ];

  home.username = "tobias";
  home.homeDirectory = lib.mkForce homeDirectory;
  home.stateVersion = "26.05";
}
