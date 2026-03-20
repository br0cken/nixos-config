{ config, lib, pkgs, ... }:

{
  options.modules.home.profiles.devops.enable = lib.mkEnableOption "devops profile";

  config = lib.mkIf config.modules.home.profiles.devops.enable {
    modules.home.profiles.base.enable = true;

    home.packages = with pkgs; [
      ansible
      claude-code
      go
      gopls
      kubectl
      nil
      nixd
      opentofu
      yubikey-manager
    ];
  };
}
