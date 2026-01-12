{ pkgs, ... }:

{
  imports = [
    ./fastfetch
    ./bat
    ./tmux.nix
    ./yazi.nix
    ./lazygit.nix
    ./btop.nix
    ./nixvim
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
