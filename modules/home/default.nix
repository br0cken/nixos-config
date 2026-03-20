{ ... }:
{
  imports = [
    ./apps/firefox.nix
    ./apps/ghostty.nix
    ./apps/syncthing.nix
    ./apps/vim.nix
    ./apps/zed.nix
    ./profiles/base.nix
    ./profiles/devops.nix
    ./profiles/desktop.nix
  ];
}
