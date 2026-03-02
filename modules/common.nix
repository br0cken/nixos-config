{ config, lib, pkgs, ... }:

{
  imports = [];

  # Enable experimental nix features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  environment.systemPackages = with pkgs; [
    bat
    btop
    curl
    fzf
    git
    killall
   # netcat-openbsd marked as broken on darwin
    ripgrep
    stow
    starship
    vim
    wget
    yazi
    zoxide
  ];

  # Install JetBrains Mono nerd font
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Setup ZSH
  programs.zsh.enable = true;

  # this does not exist on darwin. ToDo: check if we need this for NixOS
  # users.defaultUserShell = pkgs.zsh;
}
