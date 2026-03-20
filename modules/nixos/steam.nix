{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.modules.steam.enable = lib.mkEnableOption "steam";

  config = lib.mkIf config.modules.steam.enable {
    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      mangohud
      protonup-rs
    ];
  };
}
