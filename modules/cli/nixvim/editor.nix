{ lib, pkgs, ... }:

{
  programs.nixvim = {

    # =========================
    # Colorscheme
    # =========================
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
        transparent = false;
        styles = {
          sidebars = "dark";
          floats = "dark";
        };
      };
    };

    # =========================
    # Icons
    # =========================
    plugins.web-devicons.enable = true;

    # =========================
    # Statusline
    # =========================
    plugins.lualine = {
      enable = true;
      settings = {
        options = {
          globalstatus = true;
          theme = "tokyonight";
          section_separators = "";
          component_separators = "";
        };
      };
    };

    # =========================
    # Bufferline
    # =========================
    plugins.bufferline = {
      enable = true;
      settings = {
        options = {
          diagnostics = "nvim_lsp";
          separator_style = [
            "|"
            "|"
          ];
          show_buffer_close_icons = false;
          show_close_icon = false;
        };
      };
    };

    # =========================
    # File Explorer
    # =========================
    plugins.neo-tree = {
      enable = true;
      settings = {
        close_if_last_window = true; 
        filesystem = {
          follow_current_file = {
            enable = true; 
            leave_dirs_open = true;
          };
        };
      };
    };

    # =========================
    # Git signs
    # =========================
    plugins.gitsigns = {
      enable = true;
      settings = {
        signs = {
          add.text = "┃";
          change.text = "┃";
          delete.text = "_";
          topdelete.text = "‾";
          changedelete.text = "~";
          untracked.text = "┆";
        };
      };
    };

    # =========================
    # Indent guides
    # =========================
    plugins.indent-blankline = {
      enable = true;
      settings = {
        indent.char = "│";
        scope.enabled = false;
      };
    };

    # =========================
    # Notifications
    # =========================
    plugins.notify = {
      enable = true;
      settings = {
        stages = "fade_in_slide_out";
        timeout = 3000;
        background_colour = "#000000";
      };
    };

    # =========================
    # Better UI (cmdline, messages)
    # =========================
    plugins.noice = {
      enable = true;
      settings = {
        lsp = {
          progress.enabled = true;
          hover.enabled = true;
          signature.enabled = true;
          message.enabled = true;
        };
        presets = {
          bottom_search = true;
          command_palette = true;
          long_message_to_split = true;
        };
        cmdline.enabled = true;
      };
    };

    # =========================
    # Startup screen
    # =========================
    plugins.dashboard = {
      enable = true;
      settings = {
        change_to_vcs_root = true;
        config = {
          footer = [
            "Made with ❤️"
          ];
          header = [
            "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
            "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
            "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
            "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
            "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
            "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
          ];
          mru = {
            limit = 20;
          };
          project = {
            enable = false;
          };
          shortcut = [
            {
              desc = "󰈞  Find file";
              key = "f";
              action.__raw = "function() vim.cmd('FzfLua files') end";
            }
            {
              desc = "  Recent files";
              key = "r";
              action.__raw = "function() vim.cmd('FzfLua oldfiles') end";
            }
            {
              desc = "󰈬  Live grep";
              key = "g";
              action.__raw = "function() vim.cmd('FzfLua live_grep') end";
            }
            {
              desc = "﬘  Buffers";
              key = "b";
              action.__raw = "function() vim.cmd('FzfLua buffers') end";
            }
            {
              desc = "  Config (by Nix)";
              key = "c";
              action.__raw = "function() vim.cmd('FzfLua files cwd=$HOME/nix-dotfiles') end";
            }
            {
              desc = "󰅚  Quit";
              key = "q";
              action.__raw = "function() vim.cmd('qa') end";
            }
          ];
        };
        theme = "hyper";
      };
    };


    # =========================
    # fzf-lua
    # =========================
    plugins.fzf-lua = {
      enable = true; 

      keymaps = {
        "<leader>ff" = {
          action = "files";
          options.desc = "Find Files";
        };
        # =========================
        # Search / Grep
        # =========================
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Live grep";
        };

        "<leader>fw" = {
          action = "grep_cword";
          options.desc = "Grep word under cursor";
        };

        "<leader>fW" = {
          action = "grep_cWORD";
          options.desc = "Grep WORD under cursor";
        };

        "<leader>f/" = {
          action = "lgrep_curbuf";
          options = {
            desc = "Grep in current buffer";
          };
          settings = {
            winopts = {
              preview = { hidden = true; };
              height = 0.5;
              width = 0.5;
            };
          };
        };


        # =========================
        # LSP (rất nên có)
        # =========================
        "<leader>lr" = {
          action = "lsp_references";
          options.desc = "(Fzf) LSP references";
        };

        "<leader>ld" = {
          action = "lsp_definitions";
          options.desc = "(Fzf) LSP definitions";
        };

        "<leader>lD" = {
          action = "lsp_declarations";
          options.desc = "(Fzf) LSP declarations";
        };

        "<leader>li" = {
          action = "lsp_implementations";
          options.desc = "(Fzf) LSP implementations";
        };

        "<leader>ls" = {
          action = "lsp_document_symbols";
          options.desc = "(Fzf) LSP document symbols";
        };

        "<leader>lS" = {
          action = "lsp_workspace_symbols";
          options.desc = "(Fzf) LSP workspace symbols";
        };

        "<leader>le" = {
          action = "lsp_diagnostics_document";
          options.desc = "(Fzf) LSP diagnostics (buffer)";
        };

        "<leader>lE" = {
          action = "lsp_diagnostics_workspace";
          options.desc = "(Fzf) LSP diagnostics (workspace)";
        };
      };
    };

    # Others
    plugins = {
      which-key.enable = true;
      trouble = {
        enable = true;
        settings.use_diagnostic_signs = true;
      };
    };
  };
}
