{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.modules.hyprland.enable = lib.mkEnableOption "hyprland";

  config = lib.mkIf config.modules.hyprland.enable {
    programs.hyprland.enable = true;
    programs.hyprland.xwayland.enable = true;
    programs.hyprland.withUWSM = true;

    services.greetd = {
      enable = true;
      settings.default_session.command = "${pkgs.tuigreet}/bin/tuigreet --cmd 'uwsm start hyprland-uwsm.desktop'";
    };

    environment.systemPackages = with pkgs; [
      hyprlauncher
      waybar
      hyprpaper
      dunst
      wl-clipboard
      grim
      slurp
    ];
  };
}
