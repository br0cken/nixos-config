{ config, pkgs, lib, isDesktop ? false, ... }:

{
  home.username = "tobias";
  home.homeDirectory = "/home/tobias";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    glow
  ] ++ lib.optionals isDesktop [
    ansible
    bitwarden-desktop
    claude-code
    discord
    ghostty
    go
    gopls
    hugo
    httpie
    kubectl
    obsidian
    opentofu
    spotify
    virt-manager
    yubikey-manager # provides ykman
  ];

  programs.firefox = lib.mkIf isDesktop {
    enable = true;
    profiles.default = {
      settings = {
        "browser.startup.homepage" = "https://nixos.org";
      };
    };
  };

  programs.zed-editor = lib.mkIf isDesktop {
    enable = true;
    extensions = [
      "catppuccin"
      "git-firefly"
      "go"
      "nix"
      "python"
      "toml"
      "yaml"
    ];

    userSettings = {
      theme = {
        mode = "dark";
        dark = "Catppuccin Macchiato";
      };
      vim_mode = true;
      ui_font_family = "JetBrainsMono Nerd Font";
      buffer_font_family = "JetBrainsMono Nerd Font";
    };
  };


  programs.vscode.enable = lib.mkIf isDesktop true;

  services.syncthing.enable = lib.mkIf isDesktop true;

  programs.home-manager.enable = true;
}
