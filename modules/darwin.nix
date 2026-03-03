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
    masApps = {
      "Amphetamine" = 937984704;
      "Anybox" = 1593408455;
      "Drafts" = 1435957248;
      "GarageBand" = 682658836;
      "Home Assistant" = 1099568401;
      "iMovie" = 408981434;
      "Keynote" = 409183694;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Parcel" = 375589283;
      "StopTheMadness Pro" = 6471380298;
      "Things" = 904280696;
      "Vidimote" = 1585702412;
      "WhatsApp" = 310633997;
      "WireGuard" = 1451685025;
      "Xcode" = 497799835;
      "xSearch" = 1579902068;
    };
  };
}
