{ ... }:

{
  programs.nixvim = {
    # =====================
    # Core options
    # =====================
    opts = {
      clipboard = "unnamedplus";
      mouse = "a";
      fileencoding = "utf-8";
      termguicolors = true;
      cmdheight = 1;
      showmode = false;
      showtabline = 0;
      backup = false;
      writebackup = false;
      swapfile = false;
      undofile = true;
      timeoutlen = 300;
      updatetime = 250;
      pumheight = 10;
      conceallevel = 0;
      completeopt = [ "menuone" "noselect" ];
      laststatus = 3;
      breakindent = true;
      wildmode = "noselect:lastused,full";
      wildoptions = "pum";

      # Search
      ignorecase = true;
      smartcase = true;
      hlsearch = false;

      # Line numbers
      number = true;
      relativenumber = true;
      numberwidth = 4;
      signcolumn = "yes";
      cursorline = true;

      # Splits
      splitbelow = true;
      splitright = true;

      # Indentation
      expandtab = true;
      smartindent = true;
      autoindent = true;
      shiftwidth = 4;
      tabstop = 4;
      softtabstop = 4;

      # Scrolling
      scrolloff = 4;
      sidescrolloff = 8;

      # Display
      wrap = false;
      linebreak = true;
      whichwrap = "bs<>[]hl";
    };
  };
}