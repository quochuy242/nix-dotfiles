{ config, pkgs, ... }:

{
  home.username = "huytq1";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  imports = [
    ../../modules/home-manager/cli
    ../../modules/home-manager/git
    ../../modules/home-manager/zsh
  ];
}
