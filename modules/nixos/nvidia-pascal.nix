{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.modules.nvidia-pascal.enable = lib.mkEnableOption "nvidia pascal";

  config = lib.mkIf config.modules.nvidia-pascal.enable {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.graphics.enable = true;

    hardware.nvidia = {
      modesetting.enable = true;
      open = false; # GTX 1080
      nvidiaSettings = true;
      powerManagement.enable = false;

      # Pascal (GTX 1080) is no longer supported by the stable/production
      # branch (595+). legacy_580 (580.142) is the last branch with Pascal
      # support.
      package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    };

    # claude suggested these
    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1"; # fix broken cursor
      NIXOS_OZONE_WL = "1"; # Electron apps run natively on Wayland
    };

    boot.kernelParams = [ "nvidia-drm.modeset=1" ];
  };
}
