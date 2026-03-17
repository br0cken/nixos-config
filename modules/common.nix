{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ];

  # Enable experimental nix features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  environment.systemPackages = with pkgs; [
    bat
    btop
    curl
    fzf
    git
    killall
    lazygit
    restic
    ripgrep
    stow
    starship
    vim
    wget
    yazi
    zsh-history-substring-search
  ];

  # Install JetBrains Mono nerd font
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Setup ZSH
  programs.zsh.enable = true;

  nixpkgs.config.allowUnfree = true;
}
