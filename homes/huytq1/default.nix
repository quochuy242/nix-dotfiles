{ config, pkgs, ... }:

{
  home.username = "huytq1";
  home.homeDirectory = "/home/${config.home.username}";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  imports = [
    ../../modules/home-manager/packages
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/git/huytq1.nix
    ../../modules/home-manager/zsh
    ../../modules/home-manager/zsh/huytq1.nix
  ];
}
