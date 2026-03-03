{ config, lib, pkgs, isDesktop ? false, ... }:

let
  extensions = [
    "catppuccin"
    "git-firefly"
    "go"
    "nix"
    "python"
    "toml"
    "yaml"
  ];

  settings = {
    theme = {
      mode = "dark";
      dark = "Catppuccin Macchiato";
      light = "Catppuccin Frappé";
    };
    vim_mode = true;
    ui_font_family = "JetBrainsMono Nerd Font";
    buffer_font_family = "JetBrainsMono Nerd Font";
  };

in
{
  # On Linux: nix manages the package and writes the config
  programs.zed-editor = lib.mkIf (isDesktop && !pkgs.stdenv.isDarwin) {
    enable = true;
    inherit extensions;
    userSettings = settings;
  };

  # On Darwin: brew manages the app, nix writes the config
  home.file.".config/zed/settings.json" = lib.mkIf (isDesktop && pkgs.stdenv.isDarwin) {
    text = builtins.toJSON settings;
  };
}
