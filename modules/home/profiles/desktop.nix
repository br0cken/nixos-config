{ config, lib, pkgs, ... }:

{
  options.modules.home.profiles.desktop.enable = lib.mkEnableOption "desktop profile";

  config = lib.mkIf config.modules.home.profiles.desktop.enable {
    modules.home.profiles.devops.enable = true;

    modules.home.apps.firefox.enable = true;
    modules.home.apps.ghostty.enable = true;
    modules.home.apps.vim.enable = true;
    modules.home.apps.zed.enable = true;

    programs.vscode.enable = !pkgs.stdenv.isDarwin;
    programs.opencode.enable = true;

    home.packages = lib.optionals (!pkgs.stdenv.isDarwin) (with pkgs; [
      bitwarden-desktop
      discord
      obsidian
      opencode-desktop
      signal-desktop
      spotify
      virt-manager
    ]);
  };
}
