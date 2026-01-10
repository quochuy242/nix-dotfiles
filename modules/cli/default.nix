{ pkgs, ... }:

{
  imports = [
    ./fastfetch
    ./bat
    ./tmux.nix
    ./yazi.nix
    ./lazygit.nix
    ./btop.nix
    ./nvim
  ];

  home.packages = with pkgs; [
    atuin
    bat
    btop
    eza
    fastfetch
    tmux
    yazi
    zsh
  ];
}
