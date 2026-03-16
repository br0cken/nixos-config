{
  config,
  pkgs,
  lib,
  isDesktop,
  homeDirectory,
  ...
}:

{
  imports = [
    ../common.nix
    ../../modules/home/zed.nix
    ../../modules/home/ghostty.nix
    ../../modules/home/vim.nix
  ];

  home.username = "tobias";
  home.homeDirectory = lib.mkForce homeDirectory;
  home.stateVersion = "26.05";

  home.packages =
    with pkgs;
    []
    ++ lib.optionals isDesktop [
      # Desktop
      ansible
      claude-code
      go
      gopls
      hugo
      httpie
      kubectl
      nil
      nixd
      opentofu
      yubikey-manager
    ]
    ++ lib.optionals (!pkgs.stdenv.isDarwin) [
      # Not darwin
      netcat-openbsd
    ]
    ++ lib.optionals (isDesktop && !pkgs.stdenv.isDarwin) [
      # Desktop not darwin
      bitwarden-desktop
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

  programs.fzf.enable = true;

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
