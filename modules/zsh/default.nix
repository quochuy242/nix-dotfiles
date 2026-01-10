{ pkgs, ... }:

{
  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  imports = [
    ./aliases.nix
    ./core.nix
    ./functions.nix
    ./tools.nix
  ];
}
