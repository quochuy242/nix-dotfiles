{ lib, ... }:

{
  augroups = [
    { name = "UserSetup"; }
    { name = "FormatOnSave"; }
    { name = "UIEnhance"; }
    { name = "DevDefaults"; }
  ];

  autocmds = [

    # ============================================================
    # UI / UX
    # ============================================================

    {
      event = [ "TextYankPost" ];
      group = "UIEnhance";
      desc = "Highlight yanked text";
      callback = lib.generators.mkLuaInline ''
        function()
          vim.highlight.on_yank { timeout = 150 }
        end
      '';
    }

    {
      event = [ "BufEnter" ];
      pattern = [ "*.log" ];
      group = "UIEnhance";
      desc = "Disable line numbers in log files";
      command = "setlocal nonumber norelativenumber";
    }

    {
      event = [
        "WinEnter"
        "BufEnter"
      ];
      group = "UIEnhance";
      desc = "Enable cursorline only in active window";
      command = "setlocal cursorline";
    }

    {
      event = [ "WinLeave" ];
      group = "UIEnhance";
      desc = "Disable cursorline in inactive window";
      command = "setlocal nocursorline";
    }

    # ============================================================
    # Formatting / Whitespace
    # ============================================================

    {
      event = [ "BufWritePre" ];
      pattern = [ "*" ];
      group = "FormatOnSave";
      desc = "Remove trailing whitespace on save";
      command = "%s/\\s\\+$//e";
    }

    # ============================================================
    # Filetype defaults
    # ============================================================

    {
      event = [ "FileType" ];
      pattern = [ "markdown" ];
      group = "DevDefaults";
      desc = "Markdown defaults";
      command = "setlocal wrap linebreak spell conceallevel=2";
    }

    {
      event = [ "FileType" ];
      pattern = [ "gitcommit" ];
      group = "DevDefaults";
      desc = "Git commit message settings";
      command = "setlocal spell textwidth=72";
    }

    {
      event = [ "FileType" ];
      pattern = [ "nix" ];
      group = "DevDefaults";
      desc = "Nix indentation";
      command = "setlocal tabstop=2 shiftwidth=2 expandtab";
    }

    {
      event = [ "FileType" ];
      pattern = [ "lua" ];
      group = "DevDefaults";
      desc = "Lua indentation";
      command = "setlocal tabstop=2 shiftwidth=2 expandtab";
    }

    # ============================================================
    # Restore cursor position
    # ============================================================

    {
      event = [ "BufReadPost" ];
      group = "UserSetup";
      desc = "Restore cursor position when reopening file";
      callback = lib.generators.mkLuaInline ''
        function()
          local mark = vim.api.nvim_buf_get_mark(0, '"')
          local lcount = vim.api.nvim_buf_line_count(0)
          if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
          end
        end
      '';
    }

    # ============================================================
    # Performance / Large files
    # ============================================================

    {
      event = [ "BufReadPre" ];
      pattern = [ "*" ];
      group = "UserSetup";
      desc = "Disable features for large files";
      callback = lib.generators.mkLuaInline ''
        function()
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
          if ok and stats and stats.size > 1024 * 1024 then
            vim.opt_local.foldmethod = "manual"
            vim.opt_local.syntax = "off"
            vim.opt_local.swapfile = false
            vim.opt_local.undofile = false
          end
        end
      '';
    }

    # ============================================================
    # LSP niceties (safe, non-intrusive)
    # ============================================================

    {
      event = [ "LspAttach" ];
      group = "UserSetup";
      desc = "LSP attach notification";
      callback = lib.generators.mkLuaInline ''
        function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client then
            vim.notify(
              "LSP attached: " .. client.name,
              vim.log.levels.INFO,
              { title = "LSP" }
            )
          end
        end
      '';
    }

  ];
}
