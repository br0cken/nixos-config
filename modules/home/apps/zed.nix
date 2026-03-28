{ config, lib, pkgs, ... }:

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
      map (ext: {
        name = ext;
        value = true;
      }) extensions
    );
    agent_servers = {
      claude-acp = { type = "registry"; };
    };
  };

in
{
  options.modules.home.apps.zed.enable = lib.mkEnableOption "zed";

  config = lib.mkIf config.modules.home.apps.zed.enable {
    # On Linux: nix manages the package and writes the config
    programs.zed-editor = lib.mkIf (!pkgs.stdenv.isDarwin) {
      enable = true;
      inherit extensions;
      userSettings = settings;
    };

    # On Darwin: brew manages the app, nix copies the config (not symlink, so it stays writable)
    home.activation.zedConfig = lib.mkIf pkgs.stdenv.isDarwin (
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        $DRY_RUN_CMD cp -f ${pkgs.writeText "zed-settings.json" (builtins.toJSON darwinSettings)} \
          ${config.home.homeDirectory}/.config/zed/settings.json
        $DRY_RUN_CMD chmod 644 ${config.home.homeDirectory}/.config/zed/settings.json
      ''
    );
  };
}
