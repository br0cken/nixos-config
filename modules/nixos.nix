{
  config,
  lib,
  pkgs,
  ...
}:
{
  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    gptfdisk
  ];
}
