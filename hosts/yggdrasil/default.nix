{ config, lib, pkgs, ... }:

{
imports = [
  ../../modules/common.nix
];

nix.settings.experimental-features = [ "nix-command" "flakes" ];

networking.hostName = "yggdrasil";

# this is needed for hombrew
system.primaryUser = "tobias";

nixpkgs.config.allowUnfree = true;

programs.zsh.enable = true;

homebrew = {
  enable = true;
  onActivation.autoUpdate = false;
  onActivation.cleanup = "zap";
};

# set during installation. Do not change.
system.stateVersion = 6;
}
