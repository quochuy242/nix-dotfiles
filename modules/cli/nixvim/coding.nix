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
        nil_ls = {
          enable = true;
          settings.formatting.command = [ "nixfmt "];
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
          nix = [ "nixfmt" ];
          lua = [ "stylua" ];
          yaml = [ "yamlfmt" ];
          markdown = [ "prettier" ];
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
            { name = "path"; }
            { name = "buffer"; }
            { name = "cmdline"; }
            { name = "treesitter"; }
          ];
        };
      };
      luasnip.enable = true;
      cmp-nvim-lsp.enable = true;
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

    

  home.packages = with pkgs; [
    ruff
    nixfmt
    stylua
    prettier
    yamlfmt
  ];
}