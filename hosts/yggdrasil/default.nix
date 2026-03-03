{ config, lib, pkgs, ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/darwin.nix
  ];

  networking.hostName = "yggdrasil";

  # needed for homebrew
  system.primaryUser = "tobias";

  # set during installation. Do not change.
  system.stateVersion = 6;
}
