{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  luaConfigRC = ''
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- ======================================================
    -- Find (fzf-lua)
    -- ======================================================
    map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find files" })
    map("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Live grep" })
    map("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", { desc = "Buffers" })
    map("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", { desc = "Help tags" })
    map("n", "<leader>fr", "<cmd>FzfLua oldfiles<CR>", { desc = "Recent files" })

    -- ======================================================
    -- Git (fzf-lua)
    -- ======================================================
    map("n", "<leader>gs", "<cmd>FzfLua git_status<CR>", { desc = "Git status" })
    map("n", "<leader>gc", "<cmd>FzfLua git_commits<CR>", { desc = "Git commits" })
    map("n", "<leader>gb", "<cmd>FzfLua git_branches<CR>", { desc = "Git branches" })

    -- ======================================================
    -- LSP (fzf-lua)
    -- ======================================================
    map("n", "<leader>ld", "<cmd>FzfLua lsp_definitions<CR>", { desc = "LSP definitions (Fzf)" })
    map("n", "<leader>lr", "<cmd>FzfLua lsp_references<CR>", { desc = "LSP references (Fzf)" })
    map("n", "<leader>li", "<cmd>FzfLua lsp_implementations<CR>", { desc = "LSP implementations (Fzf)" })
    map("n", "<leader>ls", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "LSP symbols (Fzf)" })

    -- ======================================================
    -- Neo-tree
    -- ======================================================
    map({ "n", "v", "i" }, "<leader>e",
      "<cmd>Neotree filesystem reveal right<CR>",
      { desc = "Open Neo-tree" }
    )

    -- ======================================================
    -- Other
    -- ======================================================
    map("n", "<leader>mt", "<cmd>Markview toggle<CR>", { desc = "Toggle preview for buffer" })
  '';
}
