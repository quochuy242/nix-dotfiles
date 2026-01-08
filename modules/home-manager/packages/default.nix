{ pkgs, ... }:

{
  imports = [
    ./fastfetch
    ./bat
    ./tmux
    ./yazi
  ];

  home.packages = with pkgs; [
    atuin
    bat
    btop
    eza
    fastfetch
    neovim
    tmux
    yazi
    zsh
  ];
}
