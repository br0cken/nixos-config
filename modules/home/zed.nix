{ config, lib, pkgs, isDesktop ? false, ... }:

let
  extensions = [
    "catppuccin"
    "git-firefly"
    "go"
    "nix"
    "python"
    "terraform"
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

  darwinSettings = settings // {
    auto_install_extensions = builtins.listToAttrs (
      map (ext: { name = ext; value = true; }) extensions
    );
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
    text = builtins.toJSON darwinSettings;
  };
}
