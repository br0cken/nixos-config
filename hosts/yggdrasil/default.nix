{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/darwin
  ];

  modules.common.enable = true;
  modules.darwin-base.enable = true;

  home-manager.users.tobias.modules.home.profiles.desktop.enable = true;

  networking.hostName = "yggdrasil";

  # needed for homebrew
  system.primaryUser = "tobias";

  # set during installation. Do not change.
  system.stateVersion = 6;
}
