{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ../../modules/cli
    ../../modules/git/huytq1.nix
    ../../modules/zsh
    ../../modules/dev
  ];
}
