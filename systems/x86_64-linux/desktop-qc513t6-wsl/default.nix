{ pkgs, ... }:

let
  isWSL = pkgs.stdenv.isLinux && builtins.pathExists "/proc/sys/fs/binfmt_misc/WSLInterop";
in
{
  home.sessionVariables = {
    WSL = "1";
  };

  home.packages = with pkgs; [
    wslu # wslview, wslpath, wl-copy wrapper
    socat
    procps
  ];
}
