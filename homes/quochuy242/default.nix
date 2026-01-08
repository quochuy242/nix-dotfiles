{ config, pkgs, ... }:

{
  home.username = "quochuy242";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  imports = [
    ../../modules/home-manager/packages
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/git/quochuy242.nix
    ../../modules/home-manager/zsh
    ../../modules/home-manager/zsh/quochuy242.nix
  ];
}
