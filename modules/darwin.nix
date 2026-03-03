{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Needed for GUI applications on darwin to respect ~/.config
  environment.variables = {
    XDG_CONFIG_HOME = "$HOME/.config";
  };

  nixpkgs.config.allowUnfree = true;

  homebrew = {
    enable = true;
    onActivation.autoUpdate = false;
    onActivation.cleanup = "zap";
    brews = [
      "mas"
      "zsh-history-substring-search"
    ];
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
