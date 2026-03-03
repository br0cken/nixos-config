{ config, pkgs, lib, isDesktop ? false, homeDirectory ? "/Users/tobias", ... }:

{
  imports = [
    ../../modules/home/zed.nix
  ];

  home.username = "tobias";
  home.homeDirectory = lib.mkForce homeDirectory;
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    glow
    # Desktop
  ] ++ lib.optionals isDesktop [
    ansible
    claude-code
    go
    gopls
    hugo
    httpie
    kubectl
    nil
    opentofu
    yubikey-manager
    # Not darwin
  ] ++ lib.optionals (!pkgs.stdenv.isDarwin) [
    netcat-openbsd
    # Desktop not darwin
  ] ++ lib.optionals (isDesktop && !pkgs.stdenv.isDarwin) [
    bitwarden-desktop
    ghostty
    obsidian
    spotify
    virt-manager
  ];

  programs.firefox = lib.mkIf (isDesktop && !pkgs.stdenv.isDarwin) {
    enable = true;
    profiles.default = {
      settings = {
        "browser.startup.homepage" = "https://nixos.org";
      };
    };
  };

  programs.vscode.enable = isDesktop && !pkgs.stdenv.isDarwin;

  services.syncthing.enable = lib.mkIf isDesktop true;

  programs.home-manager.enable = true;
}
