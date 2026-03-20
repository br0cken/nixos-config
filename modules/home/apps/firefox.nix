{ config, lib, pkgs, ... }:

{
  options.modules.home.apps.firefox.enable = lib.mkEnableOption "firefox";

  config = lib.mkIf config.modules.home.apps.firefox.enable {
    programs.firefox =  lib.mkIf (!pkgs.stdenv.isDarwin) {
    enable = true;
    profiles.default = {
      settings = {
        "browser.startup.homepage" = "https://nixos.org";
      };
    };
  };
};
}
