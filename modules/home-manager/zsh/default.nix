{ pkgs, ... }:

{
  home.sessionVariables = {
    SHELL = "${pkgs.zsh}/bin/zsh";
  };

  imports = [
    ./core.nix
    ./aliases.nix
    ./functions.nix
    ./fzf.nix
    ./tools.nix
  ];
}
