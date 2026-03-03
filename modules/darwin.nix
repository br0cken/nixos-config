{ config, lib, pkgs, ... }:
{
  # Darwin sets the default shell per-user via `users.users.<name>.shell`
  # rather than a global `users.defaultUserShell`.

  environment.variables = {
    XDG_CONFIG_HOME = "$HOME/.config";
  };

  nixpkgs.config.allowUnfree = true;

  homebrew = {
    enable = true;
    onActivation.autoUpdate = false;
    onActivation.cleanup = "zap";
    casks = [
      "bartender"
      "bitwarden"
      "discord"
      "eurkey"
      "ghostty"
      "obsidian"
      "rectangle-pro"
      "scroll-reverser"
      "signal"
      "spotify"
      "zed"
    ];
  };
}
