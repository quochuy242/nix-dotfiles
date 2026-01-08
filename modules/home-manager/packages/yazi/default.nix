{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;

    # Optional nhưng nên bật
    enableZshIntegration = true;
    enableBashIntegration = false;
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
