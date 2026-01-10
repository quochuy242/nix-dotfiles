{ pkgs, ... }:

{
  imports = [ ./nvf ];

  # Extra binaries needed by Neovim (outside NVF)
  home.packages = with pkgs; [
    # Nix
    nil
    nixfmt-rfc-style

    # Python
    pyright
    ruff

    # Bash
    bash-language-server
    shfmt

    # Utils
    ripgrep
    fd
    tree-sitter
  ];
}
