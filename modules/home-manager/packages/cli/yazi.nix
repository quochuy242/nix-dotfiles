{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableFishIntegration = false;
  };

  home.packages = with pkgs; [
    yazi
    ffmpegthumbnailer
    unar
    jq
    poppler
    imagemagick
    exiftool
  ];
}
