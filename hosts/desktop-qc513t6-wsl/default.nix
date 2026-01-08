{ pkgs, ... }:

{
  home.sessionVariables = {
    IS_WSL = "1";
  };

  home.packages = with pkgs; [
    wslu
  ];
}
