{ ... }:

{
  programs.home-manager.enable = true;

  imports = [
    ../../modules/home-manager/packages/cli
    ../../modules/home-manager/git/huytq1.nix
  ];
}
