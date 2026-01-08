{ pkgs, ... }:
{
  home.packages = with pkgs; [
    networkmanager
    brightnessctl
    acpi
  ];
}
