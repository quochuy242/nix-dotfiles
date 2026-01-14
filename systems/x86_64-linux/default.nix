{ pkgs, ... }:

let
  isWayland = builtins.getEnv "WAYLAND_DISPLAY" != "";
  isX11 = builtins.getEnv "DISPLAY" != "" && !isWayland;
in
{
  home.sessionVariables = {
    WAYLAND = if isWayland then "1" else "0";
    X11 = if isX11 then "1" else "0";
  };

  home.packages =
    (with pkgs; [
      coreutils
      gnugrep
      gawk
      findutils
      curl
      wget
      unzip
      zip
      pciutils
      usbutils
      xclip
      nil
      nixfmt
    ])
    ++ (if isWayland then with pkgs; [ wl-clipboard ] else [ ]);
}
