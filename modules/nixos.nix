{
  config,
  lib,
  pkgs,
  ...
}:
{
  users.defaultUserShell = pkgs.zsh;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  environment.systemPackages = with pkgs; [
    gptfdisk
  ];
}
