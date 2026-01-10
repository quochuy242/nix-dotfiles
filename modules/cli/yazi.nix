{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;

    # Optional nhưng nên bật
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
