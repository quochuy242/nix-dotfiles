{ ... }:

{
  programs.nixvim = {
    # =========================
    # Leader key
    # =========================
    globals.mapleader = " ";

    # =========================
    # Keymaps (declarative)
    # =========================
    keymaps = [
      # ---- Quick exit insert / visual
      {
        mode = [
          "i"
          "v"
        ];
        key = "jk";
        action = "<Esc>";
      }
      {
        mode = [
          "i"
          "v"
        ];
        key = "kj";
        action = "<Esc>";
      }

      # ---- Disable space
      {
        mode = [
          "n"
          "v"
        ];
        key = "<space>";
        action = "<Nop>";
        options.silent = true;
      }

      # ---- Copy whole file
      {
        mode = "n";
        key = "<C-c>";
        action = "<cmd>%y+<CR>";
      }

      # ---- Quit
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>q";
        action = "<cmd>q<CR>";
        options.desc = "Close the current window";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>Q";
        action = "<cmd>qa<CR>";
        options.desc = "Quit neovim";
      }

      # ---- Select all
      {
        mode = "n";
        key = "<leader>a";
        action = "ggVG";
      }

      # ---- Toggle line wrap
      {
        mode = "n";
        key = "<leader>lw";
        action = "<cmd>set wrap!<CR>";
        options = {
          desc = "[L]ine [W]rap";
          silent = true;
        };
      }

      # ---- Delete without yanking
      {
        mode = "n";
        key = "x";
        action = "\"_x";
        options = {
          noremap = true;
          silent = true;
        };
      }

      # ---- Paste replace without yanking
      {
        mode = "x";
        key = "p";
        action = "\"_dP";
      }

      # ---- Clear search highlight
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }

      # ---- Move between splits
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w><C-h>";
        options.desc = "Move focus to the left window";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w><C-l>";
        options.desc = "Move focus to the right window";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w><C-j>";
        options.desc = "Move focus to the lower window";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w><C-k>";
        options.desc = "Move focus to the upper window";
      }

      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree filesystem toggle right<CR>";
        options.desc = "Open Neotree";
      }
    ];

    # =========================
    # Lua-only keymaps & logic
    # =========================
    extraConfigLua = ''
      -- Format on save helper
      local function format_on_save()
        require("conform").format({ async = true })
        vim.cmd("w")
      end

      vim.keymap.set(
          { "n", "i" }, "<C-s>",
          function() format_on_save() end, { desc = "Format and save file" }
      )
    '';
  };
}
