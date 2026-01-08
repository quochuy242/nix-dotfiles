{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;

    extraConfig = builtins.readFile ./tmux.conf;
  };

  home.packages = with pkgs; [
    tmux
    fzf
    lazygit
    btop
    sesh
  ];

}
