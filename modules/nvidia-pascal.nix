{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    open = false; # GTX 1080
    nvidiaSettings = true;
    powerManagement.enable = false;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # claude suggested these
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1"; # fix broken cursor
    NIXOS_OZONE_WL = "1";          # Electron apps run natively on Wayland
  };

  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

} 
