{ config, lib, ... }:

{
  options.modules.home.apps.syncthing.enable = lib.mkEnableOption "syncthing";

  config = lib.mkIf config.modules.home.apps.syncthing.enable {
    services.syncthing.enable = true;
  };
}
