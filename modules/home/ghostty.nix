{ config, lib, pkgs, isDesktop ? false, ... }:

let
  settings = {
    theme = "Catppuccin Macchiato";
    font-family = "JetBrains Mono Nerd Font";
    font-size = 14;
  };

  configText = lib.concatStringsSep "\n" (
    lib.mapAttrsToList (k: v: "${k} = ${toString v}") settings
  ) + "\n";

in
{
  # On Linux: nix manages the package and writes the config
  programs.ghostty = lib.mkIf (isDesktop && !pkgs.stdenv.isDarwin) {
    enable = true;
    inherit settings;
  };

  # On Darwin: brew manages the app, nix writes the config
  home.file.".config/ghostty/config" = lib.mkIf (isDesktop && pkgs.stdenv.isDarwin) {
    text = configText;
  };
}
