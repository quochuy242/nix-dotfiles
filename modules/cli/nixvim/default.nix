{ ... }:

{
  programs.nixvim.enable = true;
  imports = [
    ./option.nix
    ./editor.nix
    ./coding.nix
    ./keymap.nix
    ./autocmd.nix
  ];
}