{ config, lib, pkgs, ... }:

let
  settings = {
    theme = "Catppuccin Macchiato";
    font-family = "JetBrains Mono Nerd Font";
    font-size = 14;
  };

  configText =
    lib.concatStringsSep "\n" (lib.mapAttrsToList (k: v: "${k} = ${toString v}") settings) + "\n";

in
{
  options.modules.home.apps.ghostty.enable = lib.mkEnableOption "ghostty";

  config = lib.mkIf config.modules.home.apps.ghostty.enable {
    # On Linux: nix manages the package and writes the config
    programs.ghostty = lib.mkIf (!pkgs.stdenv.isDarwin) {
      enable = true;
      inherit settings;
    };

    # On Darwin: brew manages the app, nix writes the config
    home.file.".config/ghostty/config" = lib.mkIf pkgs.stdenv.isDarwin {
      text = configText;
    };
  };
}
