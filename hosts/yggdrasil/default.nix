{ config, lib, pkgs, ... }:

{
imports = [];

nix.settings.experimental-features = [ "nix-command" "flakes" ];

networking.hostName = "yggdrasil";

nixpkgs.config.allowUnfree = true;

programs.zsh.enable = true;

# set during installation. Do not change.
system.stateVersion = 6;
}
