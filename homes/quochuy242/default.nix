{ ... }:

{

  programs.home-manager.enable = true;

  imports = [
    ../../modules/home-manager/packages/cli
    ../../modules/home-manager/packages/gui
    ../../modules/home-manager/git/quochuy242.nix
  ];
}
