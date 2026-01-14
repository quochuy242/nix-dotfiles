{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Python
    uv
    pipx
    ruff
    python312
    basedpyright # LSP

    # Node
    nodejs_20
    corepack
    bun
    prettier # Formatter

    # Nix
    nixd # LSP
    alejandra # Nix formatter

    # Lua
    stylua
    lua-language-server # LSP

    # YAML
    yaml-language-server # LSP
    yamlfmt

    # Markdown
    marksman # LSP

    # Go
    go
    gopls # LSP
    gotools

    # Rust
    rust-analyzer # LSP
    rust-bin.stable.latest.default # rustc, cargo, etc.

    # C & C++
    clang
    clang-tools

    # TOML
    taplo
  ];
}
