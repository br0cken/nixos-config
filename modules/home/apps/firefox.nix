{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.modules.home.apps.firefox.enable = lib.mkEnableOption "firefox";

  config = lib.mkIf (config.modules.home.apps.firefox.enable && !pkgs.stdenv.hostPlatform.isDarwin) {
    programs.firefox = {
      enable = true;
      profiles.default = {
        settings = {
          "browser.startup.homepage" = "https://nixos.org";
        };
      };
    };
  };
}
