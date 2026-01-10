{
  luaConfigRC = ''
    local o = vim.o
    local opt = vim.opt
    local wo = vim.wo

    -- [[ Options ]]
    -- General settings
    o.clipboard = "unnamedplus" -- Use system clipboard
    o.mouse = "a" -- Enable mouse support
    o.fileencoding = "utf-8" -- File encoding
    o.termguicolors = true -- Enable true color support
    o.cmdheight = 1 -- Height of the command line
    o.showmode = false -- Hide -- INSERT -- and similar messages
    o.showtabline = 0 -- Always hide tabline
    o.backup = false -- Disable backup file
    o.writebackup = false -- Disable write backup
    o.swapfile = false -- Disable swap file
    o.undofile = true -- Enable persistent undo
    o.timeoutlen = 300 -- Timeout length for mappings (ms)
    o.updatetime = 250 -- Faster completion (ms)
    o.pumheight = 10 -- Max height of the popup menu
    o.conceallevel = 0 -- Make `` visible in markdown files
    o.completeopt = "menuone,noselect" -- Completion menu options
    o.laststatus = 3 -- Use global statusline
    o.breakindent = true -- Enable break indent
    o.wildmode = "noselect:lastused,full"
    o.wildoptions = "pum"

    -- Search settings
    o.ignorecase = true -- Ignore case in search
    o.smartcase = true -- Override ignorecase if search contains uppercase
    o.hlsearch = false -- Disable search highlight

    -- Line number settings
    wo.number = true -- Show absolute line number
    o.relativenumber = true -- Show relative line numbers
    o.numberwidth = 4 -- Width of line number column
    o.signcolumn = "yes" -- Always show sign column
    o.cursorline = true -- Highlight current line

    -- Split window behavior
    o.splitbelow = true -- Horizontal splits open below
    o.splitright = true -- Vertical splits open to the right

    -- Indentation settings
    o.expandtab = true -- Convert tabs to spaces
    o.smartindent = true -- Smart indentation
    o.autoindent = true -- Copy indent from current line
    o.shiftwidth = 2 -- Number of spaces per indent
    o.tabstop = 2 -- Number of spaces a tab counts for
    o.softtabstop = 2 -- Number of spaces for <Tab>/<BS>

    -- Scrolling behavior
    o.scrolloff = 4 -- Keep 4 lines visible above/below cursor
    o.sidescrolloff = 8 -- Keep 8 columns visible beside cursor

    -- Display settings
    opt.fillchars = { eob = " " } -- Hide ~ at end of buffer
    o.wrap = false -- Disable line wrapping
    o.linebreak = true -- Wrap lines at word boundary
    o.whichwrap = "bs<>[]hl" -- Allow certain keys to wrap lines

    -- Terminal-builtin
    vim.g.terminal_emulator = "/usr/bin/zsh"

    -- Highlighting and UI tweaks
    vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" }) -- Style for indent guides
    opt.shortmess:append("c") -- Shorten completion messages
    opt.iskeyword:append("-") -- Treat hyphenated-words as one word
    opt.formatoptions:remove({ "c", "r", "o" }) -- Don’t auto-insert comment leader
    opt.runtimepath:remove("/usr/share/vim/vimfiles") -- Remove Vim-only runtime path

    local map = vim.keymap.set
    local map_opt = { noremap = true, silent = true }

    -- [[ Global keymaps ]]
    vim.g.mapleader = " "
    map({ "i", "v" }, "jk", "<Esc>") -- Quick exit from insert and visual mode
    map({ "i", "v" }, "kj", "<Esc>") -- Quick exit from insert and visual mode
    map({ "n", "v" }, "<space>", "<Nop>", { silent = true }) -- Disable the space key
    map("n", "<C-c>", "<cmd> %y+ <CR>") -- copy whole filecontent
    map({ "n", "v" }, "<leader>q", "<cmd> q <CR>", { desc = "Close the current window" }) -- close the current window
    map({ "n", "v" }, "<leader>Q", "<cmd> qa <CR>", { desc = "Quit neovim" })
    map("n", "<leader>a", "ggVG") -- select all
    map("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "[L]ine [W]rap", silent = true }) -- toggle line wrap

    -- Fuzzy search in current buffer using fzf-lua
    map("n", "<leader>/", function()
      require("fzf-lua").lgrep_curbuf({ winopts = { preview = { hidden = true }, height = 0.5, width = 0.5 } })
    end, { desc = "[/] Fuzzily search in current buffer (fzf-lua)" })

    -- auto format while saving
    local function format_on_save()
      -- 1. Formatting
      require("conform").format({ async = true })
      -- 2. Save
      vim.cmd("w")
    end

    map("n", "<C-S>", format_on_save, { desc = "Format, save and optionally apply chezmoi" })
    map("i", "<C-S>", function()
      vim.cmd("stopinsert") -- Exit insert mode
      format_on_save()
    end, { desc = "Format, save and optionally apply chezmoi" })

    -- Delete single character without copying into register
    map("n", "x", '"_x', map_opt)

    -- Replace by pasting without copy
    map("x", "p", [["_dP]])

    -- Clear highlights on search when pressing <Esc> in normal mode
    --  See `:help hlsearch`
    map("n", "<Esc>", "<cmd>nohlsearch<CR>")

    -- Move focus between splits
    map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
    map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
    map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
    map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
  '';
}
