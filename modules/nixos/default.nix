{ ... }:
{
  imports = [
    ../common.nix
    ./base.nix
    ./nvidia-pascal.nix
    ./hyprland.nix
    ./steam.nix
  ];
}
