{ lib, ... }:

let
  option = import ./option.nix;
  coding = import ./coding.nix;
  ui = import ./ui.nix;
  keymap = import ./keymap.nix;
  auto = import ./auto.nix;
  util = import ./util.nix;
in
{
  programs.nvf = {
    enable = true;
    settings.vim = lib.mkMerge [
      option
      coding
      ui
      auto
      util
      keymap
    ];
  };
}
