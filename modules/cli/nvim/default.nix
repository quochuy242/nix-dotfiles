{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile."nvim".source = ./nvim;

  home.packages = with pkgs; [
    libgcc
  ];
}
