{ pkgs, ... }:

{
  programs.nixvim = {
    # =======================
    # LSP
    # =======================
    plugins.lsp = {
      enable = true;

      servers = {
        # Python
        basedpyright.enable = true;

        # Nix
        nixd = {
          enable = true;
          settings = {
            nixpkgs.expr = "import <nixpkgs> {}";
            formatting = {
              command = [ "alejandra" ];
            };
          };
        };

        # Lua
        lua_ls = {
          enable = true;
          settings = {
            diagnostics.globals = [ "vim" ]; # For neovim config
          };
        };

        # YAML
        yamlls.enable = true;

        # Markdown
        marksman.enable = true;

        # Go
        gopls = {
          enable = true;
          settings = {
            gopls = {
              gofumpt = true;
              usePlaceholders = true;
              staticcheck = true;
            };
          };
        };

        # Rust
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
          installRustfmt = false;
          settings = {
            cargo.allFeatures = true;
            checkOnSave = true;
          };
        };

        # TOML
        taplo = {
          enable = true;

          settings = {
            evenBetterToml = {
              enable = true;
            };
          };
        };

        # C & C++
        clangd = {
          enable = true;
          settings = {
            cmd = [
              "clangd"
              "--background-index" # Index big projects
              "--clang-tidy" # Enable clang-tidy - linting
              "--completion-style=detailed" # Completion style
              "--header-insertion=iwyu" # Include what you use
              "--pch-storage=memory" # Store precompiled headers in memory
            ];
          };
        };
      };
    };

    # =======================
    # Formatting
    # =======================
    plugins.conform-nvim = {
      enable = true;

      settings = {
        format_on_save = {
          timeoutMs = 1000;
          lspFallback = true;
        };

        formatters_by_ft = {
          python = [ "ruff" ];
          nix = [ "alejandra" ];
          lua = [ "stylua" ];
          yaml = [ "yamlfmt" ];
          markdown = [ "prettier" ];
          c = [ "clang_format" ];
          cpp = [ "clang_format" ];
          go = [ "gofmt" ];
          rust = [ "rustfmt" ];
          toml = [ "taplo" ];
        };
      };
    };

    # =======================
    # CMP
    # =======================
    plugins = {
      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          snippet.expand = "luasnip";
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "nvim-lsp-signature-help"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "cmdline"; }
            { name = "treesitter"; }
          ];
        };
      };
      luasnip.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lsp-signature-help.enable = true;
      cmp-path.enable = true;
      cmp-buffer.enable = true;
      cmp-cmdline.enable = true;
      cmp-treesitter.enable = true;
    };

    # =======================
    # Tree-sitter
    # =======================
    plugins.treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
        ensure_installed = [
          "python"
          "yaml"
          "markdown"
          "lua"
          "markdown_inline"
          "nix"
          "c"
          "cpp"
          "rust"
          "go"
        ];
      };
    };

    plugins.treesitter-context = {
      enable = true;

      settings = {
        max_lines = 3;
        multiline_threshold = 20;
        mode = "cursor";
        separator = null;
      };
    };

    plugins.treesitter-textobjects = {
      enable = true;

      settings = {
        select = {
          enable = true;
          lookahead = true;

          keymaps = {
            "af" = "@function.outer";
            "if" = "@function.inner";
            "ac" = "@class.outer";
            "ic" = "@class.inner";
            "aa" = "@parameter.outer";
            "ia" = "@parameter.inner";
          };
        };

        move = {
          enable = true;
          setJumps = true;

          goto_next_start = [
            {
              query = "@function.outer";
              desc = "Next function start";
            }
          ];

          goto_previous_start = [
            {
              query = "@function.outer";
              desc = "Previous function start";
            }
          ];
        };
      };
    };
    # =======================
    # Others
    # =======================
    plugins = {
      nvim-autopairs.enable = true;
      nvim-surround.enable = true;
      git-conflict.enable = true;
      comment.enable = true;
      todo-comments.enable = true;
    };
  };
}
