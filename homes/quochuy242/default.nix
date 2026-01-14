{ config, pkgs, ... }:

{

  programs.home-manager.enable = true;

  imports = [
    ../../modules/cli
    ../../modules/git/quochuy242.nix
    ../../modules/zsh
    ../../modules/gui
    ../../modules/dev
  ];
}
