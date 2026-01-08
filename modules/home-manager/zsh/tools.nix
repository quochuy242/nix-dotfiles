{ pkgs, ... }:

{
  programs.zoxide.enable = true;
  programs.atuin.enable = true;

  home.packages = with pkgs; [
    eza
    fastfetch
    fd
    ripgrep
    pure-prompt
    rsync
  ];
}
