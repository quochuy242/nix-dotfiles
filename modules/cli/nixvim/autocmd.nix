{ ... }:

{
  programs.nixvim = {
    autoCmd = [
      # Highlight on yank
      {
        event = "TextYankPost";
        callback = {
          __raw = ''
            function()
              vim.highlight.on_yank({ timeout = 200 })
            end
          '';
        };
      }

      # Restore cursor position
      {
        event = "BufReadPost";
        callback = {
          __raw = ''
            function()
              local mark = vim.api.nvim_buf_get_mark(0, '"')
              local lcount = vim.api.nvim_buf_line_count(0)
              if mark[1] > 0 and mark[1] <= lcount then
                pcall(vim.api.nvim_win_set_cursor, 0, mark)
              end
            end
          '';
        };
      }

      # Disable auto comment on new line
      {
        event = "FileType";
        pattern = "*";
        command = "setlocal formatoptions-=cro";
      }

      # Enable wrap for markdown & text
      {
        event = "FileType";
        pattern = [ "markdown" "text" ];
        command = "setlocal wrap linebreak";
      }

      # Trim trailing whitespace on save
      {
        event = "BufWritePre";
        command = "%s/\\s\\+$//e";
      }

      # Set local settings for terminal buffers
      {
        event = "TermOpen";
        pattern = "term://*";
        callback = {
          __raw = ''
            function()
              if vim.opt.buftype:get() == "terminal" then
                  local set = vim.opt_local
                  set.number = false -- Don't show numbers
                  set.relativenumber = false -- Don't show relativenumbers
                  set.scrolloff = 0 -- Don't scroll when at the top or bottom of the terminal buffer
                  vim.opt.filetype = "terminal"

                  vim.cmd.startinsert() -- Start in insert mode
              end
            end
          '';
        };
      }
    ];
  };
}