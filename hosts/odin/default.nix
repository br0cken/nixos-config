{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/nixos
  ];

  modules.common.enable = true;
  modules.nixos-base.enable = true;
  modules.nvidia-pascal.enable = true;
  modules.hyprland.enable = true;
  modules.steam.enable = true;

  home-manager.users.tobias.modules.home.profiles.desktop.enable = true;
  home-manager.users.tobias.modules.home.apps.syncthing.enable = true;

  # Enable passwordless sudo
  security.sudo.wheelNeedsPassword = false;

  # lanzaboote currently replaces systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "odin"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.tobias = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "libvirtd"
      "kvm"
    ]; # extra groups
    packages = with pkgs; [
      sbctl
    ];
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu.package = pkgs.qemu_kvm; # use pkgs.qemu instead for foreign architecture emulation
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      UseDns = false;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };

  system.stateVersion = "25.11";
}
