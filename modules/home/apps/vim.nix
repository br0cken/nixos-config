{ config, lib, pkgs, ... }:

let
  vimConfig = ''
    syntax on
    set nocursorline
    set nobackup
    set autoread
    set number
    set relativenumber
    set showcmd
    set showmode
    set showmatch
    set autoindent smartindent
    set smarttab
    set scrolloff=5
    filetype on
    filetype indent on
    filetype plugin on

    " column-width visual indication
    " let &colorcolumn=join(range(81,999),",")
    highlight ColorColumn ctermbg=235 guibg=#001D2F

    " tabs and indenting
    set expandtab
    set tabstop=2
    set shiftwidth=2

    " bells
    set noerrorbells
    set novisualbell

    " search
    set hlsearch

    " other
    set guioptions=aAace

    " colorscheme
    colorscheme catppuccin_macchiato
  '';

in
{
  options.modules.home.apps.vim.enable = lib.mkEnableOption "vim";

  config = lib.mkIf config.modules.home.apps.vim.enable {
    # On Linux: nix builds a custom vim package with the config embedded
    programs.vim = lib.mkIf (!pkgs.stdenv.isDarwin) {
      enable = true;
      defaultEditor = true;
      extraConfig = vimConfig;
      plugins = [ pkgs.vimPlugins.catppuccin-vim ];
    };

    # On Darwin: system vim reads ~/.vimrc
    home.file.".vimrc" = lib.mkIf pkgs.stdenv.isDarwin {
      text = vimConfig;
    };

    # On Darwin: install the catppuccin plugin into ~/.vim/pack
    home.file.".vim/pack/plugins/start/catppuccin" = lib.mkIf pkgs.stdenv.isDarwin {
      source = "${pkgs.vimPlugins.catppuccin-vim}";
    };
  };
}
