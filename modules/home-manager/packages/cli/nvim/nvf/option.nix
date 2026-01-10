{
  luaConfigRC = ''
    local opt = vim.opt
    opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus" -- Sync with system clipboard
    opt.completeopt = "menu,menuone,noselect"
    opt.confirm = true -- Confirm to save changes before exiting modified buffer
    opt.cursorline = true -- Enable highlighting of the current line
    opt.smoothscroll = true
  '';
}
