{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.modules.home.profiles.base.enable = lib.mkEnableOption "base profile";

  config = lib.mkIf config.modules.home.profiles.base.enable {
    programs.home-manager.enable = true;

    programs.fzf.enable = true;

    programs.direnv.enable = true;
    programs.direnv.nix-direnv.enable = true;

    home.packages =
      with pkgs;
      [
        gh
        glow
        hugo
        jq
        httpie
        tmux
        tree
        zoxide
      ]
      ++ lib.optionals (!pkgs.stdenv.hostPlatform.isDarwin) [
        netcat-openbsd
      ];
  };
}
