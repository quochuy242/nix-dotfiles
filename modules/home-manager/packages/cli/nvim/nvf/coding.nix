{
  diagnostics = {
    enable = true;
  };

  git = {
    enable = true;
    git-conflict = {
      enable = true;
      mappings = {

      };
    };

    gitsigns = {
      enable = true;
    };
  };

  lsp = {
    enable = true;
    formatOnSave = true;
    mappings = {
      codeAction = "ga";
      documentHighlight = "gH";
      goToDefinition = "gd";
      goToDeclaration = "gD";
      goToType = "gt";
      hover = "gh";
      listDocumentSymbols = "gS";
      listImplementations = "gI";
      listReferences = "gR";
      openDiagnosticFloat = "ge";
      renameSymbol = "gr";
    };
  };

  languages = {
    python = {
      enable = true;
      format.enable = true;
      format.type = [ "ruff" ];
      lsp.enable = true;
      lsp.servers = [ "basedpyright" ];
      treesitter.enable = true;
    };
    nix = {
      enable = true;
      extraDiagnostics = {
        enable = true;
        types = [
          "statix"
          "deadnix"
        ];
      };
      format.enable = true;
      format.type = [ "nixfmt" ];
      lsp.enable = true;
      lsp.servers = [ "nil" ];
      treesitter.enable = true;
    };
    bash = {
      enable = true;
      extraDiagnostics = {
        enable = true;
        types = [ "shellcheck" ];
      };
      format.enable = true;
      format.type = [ "shfmt" ];
      lsp.enable = true;
      lsp.servers = [ "bash-ls" ];
      treesitter.enable = true;
    };
    yaml = {
      enable = true;
      lsp.enable = true;
      lsp.servers = [ "yaml-language-server" ];
      treesitter.enable = true;
    };
    markdown = {
      enable = true;
      extraDiagnostics = {
        enable = true;
        types = [ "markdownlint-cli2" ];
      };
      format.enable = true;
      format.type = [ "deno_fmt" ];
      lsp.enable = true;
      lsp.servers = [ "marksman" ];
      treesitter.enable = true;
      extensions.markview-nvim = {
        enable = true;
      };
    };
    html = {
      enable = true;
      extraDiagnostics = {
        enable = true;
        types = [ "htmlhint" ];
      };
      format.enable = true;
      format.type = [ "superhtml" ];
      lsp.enable = true;
      lsp.servers = [ "superhtml" ];
      treesitter.enable = true;
      treesitter.autotagHtml = true;
    };
    sql = {
      enable = true;
      extraDiagnostics = {
        enable = true;
        types = [ "sqlfluff" ];
      };
      format.enable = true;
      format.type = [ "sqlfluff" ];
      lsp.enable = true;
      lsp.servers = [ "sqls" ];
      treesitter.enable = true;
    };
  };

  treesitter = {
    enable = true;
    addDefaultGrammars = true;
    autotagHtml = true;
    context = {
      enable = true;
    };
    highlight.enable = true;
    indent.enable = true;
    mappings = {

    };
    textobjects = {
      enable = true;
    };
  };
}
