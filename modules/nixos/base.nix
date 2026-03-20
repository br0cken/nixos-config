{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.modules.nixos-base.enable = lib.mkEnableOption "nixos base";

  config = lib.mkIf config.modules.nixos-base.enable {
    users.defaultUserShell = pkgs.zsh;

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    environment.systemPackages = with pkgs; [
      gptfdisk
    ];
  };
}
